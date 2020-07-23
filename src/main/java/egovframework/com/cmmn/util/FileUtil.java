package egovframework.com.cmmn.util;

import java.io.File;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component("fileUtil")
public class FileUtil {
    
    private Log log = LogFactory.getLog(this.getClass());
    
    @Resource(name="uploadPath")
    String uploadPath;
 
	@Value("${file.uploadpath}")
	private String filePath;
	
    public List<FileVo> parseFileInfo(FileVo vo, MultipartFile[] file) throws Exception {
    	return parseFileInfo(vo, file, null);
    }
    
    public List<FileVo> parseFileInfo(FileVo vo, MultipartFile[] file, MultipartFile[] file2) throws Exception {
    	System.out.println("================== filePath :: " + filePath);
    	String IDX = String.valueOf(vo.getIdx());
    	String creaID = (String) vo.getCreate_user();
    	
    	List<FileVo> fileList = new ArrayList<FileVo>();
    	
    	File target = new File(filePath);
    	if(!target.exists()) target.mkdirs();
    	
    	// 첫번째 파일
    	if (file != null) {
    		for(int i=0; i<file.length; i++) {
    			int saveFileSize = (int) file[i].getSize();
    			if (saveFileSize == 0) continue;
    			
    			String orgFileName = file[i].getOriginalFilename();
    			String orgFileExtension = orgFileName.substring(orgFileName.lastIndexOf("."));
    			String saveFileName = UUID.randomUUID().toString().replaceAll("-", "") + orgFileExtension;
    			
    			log.debug("================== file start ==================");
    			log.debug("파일 실제 이름: "+orgFileName);
    			log.debug("파일 저장 이름: "+saveFileName);
    			log.debug("파일 크기: "+saveFileSize);
    			log.debug("content type: "+file[i].getContentType());
    			log.debug("================== file   END ==================");
    			
    			target = new File(filePath, saveFileName);
    			file[i].transferTo(target);
    			
    			FileVo fileVo = new FileVo();
    			fileVo.setIdx(IDX);
    			fileVo.setOrg_file_name(orgFileName);
    			fileVo.setSave_file_name(saveFileName);
    			fileVo.setFile_size(saveFileSize);
    			fileVo.setCreate_user(creaID);
    			fileVo.setAttach_type(file[i].getName());
    			fileList.add(fileVo);
    		}
    	}
    	
    	// 두번째 파일
    	if (file2 != null) {
    		for(int i=0; i<file2.length; i++) {
    			int saveFileSize = (int) file2[i].getSize();
    			if (saveFileSize == 0) continue;
    			
    			String orgFileName = file2[i].getOriginalFilename();
    			String orgFileExtension = orgFileName.substring(orgFileName.lastIndexOf("."));
    			String saveFileName = UUID.randomUUID().toString().replaceAll("-", "") + orgFileExtension;
    			
    			log.debug("================== file2 start ==================");
    			log.debug("파일 실제 이름: "+orgFileName);
    			log.debug("파일 저장 이름: "+saveFileName);
    			log.debug("파일 크기: "+saveFileSize);
    			log.debug("content type: "+file2[i].getContentType());
    			log.debug("================== file2   END ==================");
    			
    			target = new File(filePath, saveFileName);
    			file2[i].transferTo(target);
    			
    			FileVo fileVo = new FileVo();
    			fileVo.setIdx(IDX);
    			fileVo.setOrg_file_name(orgFileName);
    			fileVo.setSave_file_name(saveFileName);
    			fileVo.setFile_size(saveFileSize);
    			fileVo.setCreate_user(creaID);
    			fileVo.setAttach_type(file2[i].getName());
    			fileList.add(fileVo);
    		}
    	}
    	
    	return fileList;
    }
    
    public void getImgFile(HttpServletResponse response, String filename) throws Exception {
		try {
			response.setContentType("application/png");
			String url = "file://" + filePath;
			URL fileUrl = new URL(url + filename);
			log.debug("getRepImgFile : " + fileUrl);
			IOUtils.copy(fileUrl.openStream(), response.getOutputStream());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}