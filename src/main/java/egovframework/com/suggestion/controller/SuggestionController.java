package egovframework.com.suggestion.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import egovframework.com.cmmn.util.FileUtils;
import egovframework.com.cmmn.util.FileVo;
import egovframework.com.suggestion.service.SuggestionService;
import egovframework.com.suggestion.vo.SuggestionVo;

@Controller
@RequestMapping(value="/suggestion")
public class SuggestionController {
	protected Log log = LogFactory.getLog(SuggestionController.class);
	
	@Resource(name="suggestionService")
	private SuggestionService suggestionService;
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;

	@RequestMapping(value="/suggestionListPage.do")
	public String suggestionListPage(ModelMap model) throws Exception{
		List<SuggestionVo> suggestionList = null;
		
		try {
			suggestionList = suggestionService.selectSuggestionList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("suggestionList", suggestionList);
		
		return "suggestion/suggestionList";
	}
	
	@RequestMapping(value="/suggestionRegistPage.do")
	public String suggestionRegistPage(ModelMap model) {
		model.addAttribute("suggestionVo", new SuggestionVo());
		
		return "suggestion/suggestionRegist";
	}
	
	@RequestMapping(value="/suggestionRegist.do")
	public String createSuggestion(SuggestionVo vo, MultipartFile[] publicFile, MultipartFile[] repFile) throws Exception{
		try {
			log.debug("SuggestionVo : " + vo);
			String suggestionIdx = suggestionService.selectSuggestionIdx();
			vo.setSuggestion_idx(suggestionIdx);
			
			log.debug("[열린제안] 열린제안 등록");
			int result = suggestionService.registSuggestion(vo);
			log.debug("suggestion insert result : " + result);
			if (result > 0) {
				FileVo fileVo = new FileVo();
				
				fileVo.setCreate_user(vo.getCreate_user());
				fileVo.setIdx(vo.getSuggestion_idx());
				
				List<Map<String, Object>> fileList = fileUtils.parseFileInfo(fileVo, publicFile, repFile);

				log.debug("[열린제안] 열린제안 파일 등록");
				for(int i = 0; i<fileList.size(); i++) {
					suggestionService.insertFile(fileList.get(i));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:/suggestion/suggestionListPage.do";
		}
		
		return "redirect:/suggestion/suggestionListPage.do";
	}
	
	@RequestMapping(value="/suggestionDetailPage.do")
	public String suggestionDetailPage(@RequestParam("suggestion_idx") String suggestionIdx, ModelMap model) throws Exception{
		SuggestionVo vo = new SuggestionVo();
		FileVo fileVo = new FileVo();
		List<Map<String, String>> fileList = null;
		
		try {
			vo.setSuggestion_idx(suggestionIdx);
			vo = suggestionService.selectSuggestion(vo);
			
			fileVo.setIdx(suggestionIdx);
			fileList = suggestionService.selectSuggestionAttach(fileVo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("suggestionVo", vo);
		model.addAttribute("fileList", fileList);
		
		return "suggestion/suggestionDetail";
	}
	
	@RequestMapping(value="/suggestionModify.do")
	public String suggestionModify(SuggestionVo vo, MultipartFile[] publicFile, MultipartFile[] repFile) throws Exception{
		log.debug("SuggestionVo : " + vo);
		log.debug("publicFile : " + publicFile);
		for(int i=0; i<publicFile.length; i++) {
            log.debug("================== publicFile start ==================");
            log.debug("파일 이름: "+publicFile[i].getName());
            log.debug("파일 실제 이름: "+publicFile[i].getOriginalFilename());
            log.debug("파일 크기: "+publicFile[i].getSize());
            log.debug("content type: "+publicFile[i].getContentType());
            log.debug("================== publicFile   END ==================");
        }
		log.debug("repFile : " + repFile);
		for(int i=0; i<repFile.length; i++) {
            log.debug("================== repFile start ==================");
            log.debug("파일 이름: "+repFile[i].getName());
            log.debug("파일 실제 이름: "+repFile[i].getOriginalFilename());
            log.debug("파일 크기: "+repFile[i].getSize());
            log.debug("content type: "+repFile[i].getContentType());
            log.debug("================== repFile   END ==================");
        }
		
		// MultipartFile의 사이즈가 0이면 파일이 없는것 (첨부파일을 수정하지 않았거나 OR 삭제했거나)
		// 수정들어오면 첨부파일은 무조건 삭제시키고 들고온 파일을 insert
		
		
		return "redirect:/suggestion/suggestionListPage.do";
	}
	
	@RequestMapping(value="/suggestionAttachFileDelete.do", method=RequestMethod.POST)
	public ResponseEntity<?> suggestionAttachFileDelete(@RequestBody Map<String, String> param) throws Exception {
		System.out.println(param);
		try {
			if ("N".equals(param.get("del_chk"))) {
				FileVo fileVo = new FileVo();
				fileVo.setIdx(param.get("suggestion_idx"));
				fileVo.setSave_file_name(param.get("save_file_name"));
				
				suggestionService.deleteFile(fileVo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return new ResponseEntity<>("success", HttpStatus.OK);
	}
}
