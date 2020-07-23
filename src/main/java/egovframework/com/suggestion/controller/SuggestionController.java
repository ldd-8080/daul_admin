package egovframework.com.suggestion.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

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
import egovframework.com.suggestion.vo.SuggestionOpinionVo;
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
	
	@RequestMapping(value="/suggestionRegist.do", method=RequestMethod.POST)
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
				
				List<FileVo> fileList = fileUtils.parseFileInfo(fileVo, publicFile, repFile);

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
		List<SuggestionOpinionVo> suggestionOpinionList = null;
		
		try {
			vo.setSuggestion_idx(suggestionIdx);
			vo = suggestionService.selectSuggestion(vo);
			
			fileVo.setIdx(suggestionIdx);
			fileList = suggestionService.selectSuggestionFile(fileVo);
			
			suggestionOpinionList = suggestionService.selectSuggestionOpinionList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("suggestionVo", vo);
		model.addAttribute("fileList", fileList);
		model.addAttribute("suggestionOpinionList", suggestionOpinionList);
		
		return "suggestion/suggestionDetail";
	}
	
	@RequestMapping(value="/suggestionModify.do", method=RequestMethod.POST)
	public String suggestionModify(SuggestionVo vo, MultipartFile[] publicFile, MultipartFile[] repFile) throws Exception{
		try {
			log.debug("SuggestionVo : " + vo);
			log.debug("[열린제안] 열린제안 수정");
			suggestionService.updateSuggestion(vo);
			
			FileVo fileVo = new FileVo();
			fileVo.setIdx(vo.getSuggestion_idx());
			fileVo.setCreate_user(vo.getUpdate_user());
			List<FileVo> fileList = fileUtils.parseFileInfo(fileVo, publicFile, repFile);
			
			if (!fileList.isEmpty() && fileList.size() > 0) {
				for (int i = 0; i < fileList.size(); i++) {
					fileVo = fileList.get(i); 
					
					log.debug("FileVo : " + fileVo);
					log.debug("[열린제안] 열린제안 파일 삭제");
					suggestionService.deleteFile(fileVo);
					
					log.debug("[열린제안] 열린제안 파일 등록");
					suggestionService.insertFile(fileVo);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/suggestion/suggestionListPage.do";
	}
	
	@RequestMapping(value="/suggestionAttachFileDelete.do", method=RequestMethod.POST)
	public ResponseEntity<?> suggestionAttachFileDelete(@RequestBody Map<String, String> param) throws Exception {
		System.out.println(param);
		try {
			if ("N".equals(param.get("del_chk"))) {
				FileVo fileVo = new FileVo();
				fileVo.setIdx(param.get("suggestion_idx"));
				fileVo.setAttach_type(param.get("attach_type"));
				//fileVo.setSave_file_name(param.get("save_file_name"));
				
				log.debug("[열린제안] 열린제안 파일 삭제");
				suggestionService.deleteFile(fileVo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return new ResponseEntity<>("success", HttpStatus.OK);
	}
	
	@RequestMapping(value="/getImg.do")
	public void getImage(@RequestParam("suggestion_idx") String suggestionIdx, HttpServletResponse response) throws Exception {
		List<Map<String, String>> fileList = null;
		
		try {
			FileVo fileVo = new FileVo();
			fileVo.setIdx(suggestionIdx);
			fileVo.setAttach_type("repFile");
			
			fileList = suggestionService.selectSuggestionFile(fileVo);
			
			String saveFileName = "";
			
			if (!fileList.isEmpty() && fileList.size() > 0) {
				saveFileName = fileList.get(0).get("save_file_name");
				fileUtils.getImgFile(response, saveFileName);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="/suggestionDelete.do", method=RequestMethod.POST)
	public String suggestionDelete(SuggestionVo vo) throws Exception {
		try {
			log.debug("[열린제안] 열린제안 삭제");
			suggestionService.deleteSuggestion(vo);
			
			log.debug("[열린제안] 열린제안 파일 삭제");
			FileVo fileVo = new FileVo();
			fileVo.setIdx(vo.getSuggestion_idx());
			suggestionService.deleteFile(fileVo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/suggestion/suggestionListPage.do";
	}
	
	@RequestMapping(value="/suggestionOpinionRegist.do", method=RequestMethod.POST)
	public ResponseEntity<?> suggestionOpinionRegist(SuggestionOpinionVo vo) throws Exception {
		try {
			log.debug("SuggestionOpinionVo : " + vo);
			String opinionIdx = vo.getOpinion_idx();
			if (!"".equals(opinionIdx) && opinionIdx != null) {
				// opinionIdx가 있는 경우 -> 댓글의 댓글~~~들을 등
				// select suggestion_ref, suggestion_indent, suggestion_step
				// update step = step + 1 where ref = topRef and step > topStep
				// insert
				// 최상위 댓글 ref, indent, step 정보
				SuggestionOpinionVo topOpnVo = suggestionService.selectParentSuggestionOpinion(vo);
				suggestionService.updateChildSuggestionOpinion(topOpnVo);
				
				opinionIdx = suggestionService.selectSuggestionOpinionIdx();
				vo.setOpinion_idx(opinionIdx);
				vo.setSuggestion_ref(topOpnVo.getSuggestion_ref());
				vo.setSuggestion_indent(topOpnVo.getSuggestion_indent() + 1);
				vo.setSuggestion_step(topOpnVo.getSuggestion_step() + 1);
				
				suggestionService.insertSuggestionOpinion(vo);
			} else {
				// opinionIdx가 없는 경우 -> 제안의 댓글을 등록
				opinionIdx = suggestionService.selectSuggestionOpinionIdx();
				vo.setOpinion_idx(opinionIdx);
				vo.setSuggestion_ref(opinionIdx);
				
				suggestionService.insertSuggestionOpinion(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return new ResponseEntity<>("success", HttpStatus.OK);
	}
}
