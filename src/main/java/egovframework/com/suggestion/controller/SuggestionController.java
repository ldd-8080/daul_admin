package egovframework.com.suggestion.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
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
		//List<SuggestionVo> suggestionList = null;
		
		try {
			//seggestionList = suggestionService.selectSuggestionList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		//model.addAttribute("suggestionList", suggestionList);
		
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
}
