package egovframework.com.cmmn.util;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import egovframework.com.board.vo.BoardVo;

@Component("fileUtils")
public class FileUtils {
    
    private Log log = LogFactory.getLog(this.getClass());
    
    @Resource(name="uploadPath")
    String uploadPath;
 
	@Value("${file.uploadpath}")
	private String filePath;
    public List<Map<String, Object>> parseFileInfo(FileVo vo, MultipartFile[] file) throws Exception {

        String IDX = String.valueOf(vo.getIdx());
        String creaID = (String) vo.getCreate_user();
        
        List<Map<String, Object>> fileList = new ArrayList<Map<String, Object>>();

        File target = new File("/Users/a2/attach");
        if(!target.exists()) target.mkdirs();

        for(int i=0; i<file.length; i++) {
 
            String orgFileName = file[i].getOriginalFilename();
            String orgFileExtension = orgFileName.substring(orgFileName.lastIndexOf("."));
            String saveFileName = UUID.randomUUID().toString().replaceAll("-", "") + orgFileExtension;
            Long saveFileSize = file[i].getSize();
            
            log.debug("================== file start ==================");
            log.debug("파일 실제 이름: "+orgFileName);
            log.debug("파일 저장 이름: "+saveFileName);
            log.debug("파일 크기: "+saveFileSize);
            log.debug("content type: "+file[i].getContentType());
            log.debug("================== file   END ==================");
 
            target = new File("/Users/a2/attach", saveFileName);
            file[i].transferTo(target);
         
            Map<String, Object> fileInfo = new HashMap<String, Object>();
 
            fileInfo.put("idx", IDX);
            fileInfo.put("org_file_name", orgFileName);
            fileInfo.put("save_file_name", saveFileName);
            fileInfo.put("file_size", saveFileSize);
            fileInfo.put("create_user", creaID);
            fileList.add(fileInfo);
        
        }
        return fileList;
    }
}