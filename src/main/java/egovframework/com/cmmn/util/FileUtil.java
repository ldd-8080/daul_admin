package egovframework.com.cmmn.util;

import java.io.File;
import java.net.URL;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.util.MultiValueMap;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Component("fileUtil")
public class FileUtil {
    
    private Log log = LogFactory.getLog(this.getClass());
    
    @Resource(name="uploadPath")
    String uploadPath;
 
	@Value("${file.uploadpath}")
	private String filePath;
	
	@Autowired(required=false)
	private ProfileCls profileCls;
	
    public List<FileVo> parseFileInfo(FileVo vo, HttpServletRequest request) throws Exception {
    	log.debug(profileCls.getRootPath());
    	List<FileVo> fileList = new ArrayList<FileVo>();
    	List<MultipartFile> totalFile = new ArrayList<MultipartFile>();
    	
    	String IDX = String.valueOf(vo.getIdx());
    	String creaID = (String) vo.getCreate_user();
    	
    	File target = new File(filePath);
    	if(!target.exists()) target.mkdirs();
    	
		MultipartHttpServletRequest multi = (MultipartHttpServletRequest) request;
		MultiValueMap<String, MultipartFile> file = multi.getMultiFileMap();
		
		Iterator<String> keys = file.keySet().iterator();
		
		while (keys.hasNext()) {
			String key = keys.next();
			
			List<MultipartFile> f = file.get(key);

			for (MultipartFile ff : f) {
				//System.out.println(String.format("키 : %s ------ 파일이름 : %s", key, ff.getOriginalFilename()));
				totalFile.add(ff);
			}
		}
		
		if (totalFile != null && totalFile.size() > 0) {
    		setFileInfo(totalFile, target, IDX, creaID, fileList);
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

    private void setFileInfo(List<MultipartFile> totalFile, File target, String IDX, String creaID, List<FileVo> fileList) throws Exception {
    	for (MultipartFile file : totalFile) {
    		int saveFileSize = (int) file.getSize();
    		if (saveFileSize == 0) continue;
    		
    		String orgFileName = file.getOriginalFilename();
    		String orgFileExtension = orgFileName.substring(orgFileName.lastIndexOf("."));
    		String saveFileName = UUID.randomUUID().toString().replaceAll("-", "") + orgFileExtension;
    		
    		log.debug("================== file start ==================");
    		log.debug("파일 실제 이름: "+orgFileName);
    		log.debug("파일 저장 이름: "+saveFileName);
    		log.debug("파일 크기: "+saveFileSize);
    		log.debug("content type: "+file.getContentType());
    		log.debug("================== file   END ==================");
    		
    		target = new File(filePath, saveFileName);
    		file.transferTo(target);
    		
    		FileVo fileVo = new FileVo();
    		fileVo.setIdx(IDX);
    		fileVo.setOrg_file_name(orgFileName);
    		fileVo.setSave_file_name(saveFileName);
    		fileVo.setFile_size(saveFileSize);
    		fileVo.setCreate_user(creaID);
    		fileVo.setAttach_type(file.getName());
    		fileList.add(fileVo);
    	}
    }
}