package egovframework.com.suggestion.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.com.cmmn.util.CmmnUtil;
import egovframework.com.cmmn.util.FileUtil;
import egovframework.com.cmmn.util.FileVo;
import egovframework.com.suggestion.service.SuggestionService;
import egovframework.com.suggestion.vo.SuggestionOpinionVo;
import egovframework.com.suggestion.vo.SuggestionVo;
import egovframework.com.user.vo.UserVo;

@Controller
@RequestMapping(value="/suggestion")
public class SuggestionController {
	protected Log log = LogFactory.getLog(SuggestionController.class);
	
	@Resource(name="suggestionService")
	private SuggestionService suggestionService;
	
	@Resource(name="fileUtil")
	private FileUtil fileUtil;
	
	@Resource(name = "cmmnUtil")
	private CmmnUtil cmmnUtil;

	@RequestMapping(value="/suggestionListPage.do")
	public String suggestionListPage() {
		return "suggestion/suggestionList";
	}
	
	@RequestMapping(value="/getSuggestionList.do")
	public ResponseEntity<?> getSuggestionList(SuggestionVo vo) throws Exception {
		List<SuggestionVo> suggestionList = null;
		
		try {
			log.debug("[열린제안] 열린제안 목록 조회");
			suggestionList = suggestionService.selectSuggestionList(vo);
		} catch (Exception e) {
			log.debug("[열린제안] 열린제안 목록 조회 실패");
			e.printStackTrace();
		}
		
		log.debug("[열린제안] 열린제안 목록 조회 완료");
		return new ResponseEntity<>(suggestionList, HttpStatus.OK);
	}
	
	@RequestMapping(value="/suggestionRegistPage.do")
	public String suggestionRegistPage(ModelMap model) {
		model.addAttribute("suggestionVo", new SuggestionVo());
		
		return "suggestion/suggestionRegist";
	}
	
	@RequestMapping(value="/suggestionRegist.do", method=RequestMethod.POST)
	public String createSuggestion(SuggestionVo vo, HttpServletRequest request, BindingResult bindingResult) throws Exception{
		try {
			
			SuggestionValidator suggestionValidator = new SuggestionValidator();
			suggestionValidator.validate(vo, bindingResult);
			
			if(bindingResult.hasErrors()) {
				return "suggestion/suggestionRegist";
			}
			
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
				
				//List<FileVo> fileList = fileUtil.parseFileInfo(fileVo, publicFile, repFile);
				List<FileVo> fileList = fileUtil.parseFileInfo(fileVo, request);

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
			
			suggestionOpinionList = suggestionService.selectSuggestionOpinionList(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("suggestionVo", vo);
		model.addAttribute("fileList", fileList);
		model.addAttribute("suggestionOpinionSize", suggestionOpinionList.size());
		
		return "suggestion/suggestionDetail";
	}
	
	@RequestMapping(value="/getSuggestionOpinionList.do")
	public  ResponseEntity<?> getSuggestionOpinionList(@RequestParam("suggestion_idx") String suggestion_idx) throws Exception{
		List<SuggestionOpinionVo> suggestionOpinionList = null;
		SuggestionVo vo = new SuggestionVo();
		
		try {
			vo.setSuggestion_idx(suggestion_idx);
			vo = suggestionService.selectSuggestion(vo);
			
			suggestionOpinionList = suggestionService.selectSuggestionOpinionList(vo);
		}catch(Exception e){
			
		}
		
		return new ResponseEntity<>(suggestionOpinionList, HttpStatus.OK);
	}
	
	
	@RequestMapping(value="/suggestionModify.do", method=RequestMethod.POST)
	public ResponseEntity<?> suggestionModify(SuggestionVo vo, HttpSession session, HttpServletRequest request, BindingResult bindingResult) throws Exception{
		try {
			log.debug("SuggestionVo : " + vo);
			
			SuggestionValidator suggestionValidator = new SuggestionValidator();
			suggestionValidator.validate(vo, bindingResult);
			
			if(bindingResult.hasErrors()) {
				return new ResponseEntity<>(cmmnUtil.getValid(bindingResult), HttpStatus.OK);
			}			
			
			UserVo userVo = (UserVo) session.getAttribute("login");
			vo.setUpdate_user(userVo.getUser_id());
			
			log.debug("[열린제안] 열린제안 수정");
			int result = suggestionService.updateSuggestion(vo);
			
			if (result > 0) {
				FileVo fileVo = new FileVo();
				fileVo.setIdx(vo.getSuggestion_idx());
				fileVo.setCreate_user(vo.getUpdate_user());
				
				List<FileVo> fileList = fileUtil.parseFileInfo(fileVo, request);
				
				for (int i = 0; i < fileList.size(); i++) {
					log.debug("[열린제안] 열린제안 파일 등록");
					suggestionService.insertFile(fileList.get(i));
				}
			}
		} catch (Exception e) {
			log.debug("[열린제안] 열린제안 수정 실패");
			e.printStackTrace();
		}
		
		log.debug("[열린제안] 열린제안 수정 완료");
		return new ResponseEntity<>(vo.getSuggestion_idx(), HttpStatus.OK);
	}
	
	@RequestMapping(value="/suggestionAttachFileDelete.do", method=RequestMethod.POST)
	public ResponseEntity<?> suggestionAttachFileDelete(@RequestBody Map<String, String> param) throws Exception {
		System.out.println(param);
		FileVo fileVo = new FileVo();
		
		try {
			fileVo.setSave_file_name(param.get("file_name"));
			
			log.debug("[열린제안] 열린제안 파일 삭제");
			suggestionService.deleteFile(fileVo);
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
				fileUtil.getImgFile(response, saveFileName);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="/suggestionDelete.do", method=RequestMethod.POST)
	public String suggestionDelete(SuggestionVo vo, HttpSession session) throws Exception {
		try {
			UserVo userVo = (UserVo) session.getAttribute("login");
			vo.setUpdate_user(userVo.getUser_id());
			
			log.debug("[열린제안] 열린제안 삭제");
			int result = suggestionService.deleteSuggestion(vo);
			
			if (result > 0) {
				log.debug("[열린제안] 열린제안 댓글 삭제");
				suggestionService.deleteAllOpinion(vo);
				
				log.debug("[열린제안] 열린제안 첨부파일 삭제");
				suggestionService.deleteAllFile(vo);
			}
		} catch (Exception e) {
			log.debug("[열린제안] 열린제안 삭제 실패");
			e.printStackTrace();
		}
		
		log.debug("[열린제안] 열린제안 삭제 완료");
		return "redirect:/suggestion/suggestionListPage.do";
	}
	
	@RequestMapping(value="/suggestionOpinionRegist.do", method=RequestMethod.POST, produces = "application/text; charset=utf8")
	public ResponseEntity<?> suggestionOpinionRegist(SuggestionOpinionVo vo, BindingResult bindingResult) throws Exception {
		try {
			
			SuggestionOpinionValidator suggestionOpinionValidator = new SuggestionOpinionValidator();
			suggestionOpinionValidator.validate(vo, bindingResult);
			
			
			if(bindingResult.hasErrors()) {
				return new ResponseEntity<>(bindingResult.getFieldError().getDefaultMessage(), HttpStatus.OK);
			}
			
			log.debug("SuggestionOpinionVo : " + vo);
			String opinionIdx = vo.getOpinion_idx();
			
			if (!"".equals(opinionIdx) && opinionIdx != null) {
				// opinionIdx가 있는 경우 -> 댓글의 댓글~~~들을 등록
				// 등록하고자 하는 댓글의 최상위 댓글 ref, indent, step 정보
				SuggestionOpinionVo topOpnVo = suggestionService.selectParentSuggestionOpinion(vo);
				log.debug("[열린제안] 열린제안 상위댓글 indent 수정");
				// 등록하고자 하는 댓글과 최상위 댓글 사이에 있는 댓글들의 indent를 수정하여 depth 설정
				suggestionService.updateChildSuggestionOpinion(topOpnVo);
				
				opinionIdx = suggestionService.selectSuggestionOpinionIdx();
				vo.setOpinion_idx(opinionIdx);
				vo.setSuggestion_ref(topOpnVo.getSuggestion_ref());
				vo.setSuggestion_indent(topOpnVo.getSuggestion_indent() + 1);
				vo.setSuggestion_step(topOpnVo.getSuggestion_step() + 1);
				
				log.debug("[열린제안] 열린제안 대댓글 등록");
				suggestionService.insertSuggestionOpinion(vo);
			} else {
				// opinionIdx가 없는 경우 -> 제안의 댓글을 등록
				opinionIdx = suggestionService.selectSuggestionOpinionIdx();
				vo.setOpinion_idx(opinionIdx);
				vo.setSuggestion_ref(opinionIdx);
				
				log.debug("[열린제안] 열린제안 댓글 등록");
				suggestionService.insertSuggestionOpinion(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return new ResponseEntity<>("success", HttpStatus.OK);
	}
	
	@RequestMapping(value="/suggestionOpinionModify.do", method=RequestMethod.POST, produces = "application/text; charset=utf8")
	public ResponseEntity<?> suggestionOpinionModify(SuggestionOpinionVo vo, BindingResult bindingResult) throws Exception {
		try {
			
			SuggestionOpinionValidator suggestionOpinionValidator = new SuggestionOpinionValidator();
			suggestionOpinionValidator.validate(vo, bindingResult);
			
			
			if(bindingResult.hasErrors()) {
				return new ResponseEntity<>(bindingResult.getFieldError().getDefaultMessage(), HttpStatus.OK);
			}
			
			log.debug("[열린제안] 열린제안 댓글 수정");
			log.debug("SuggestionOpinionVo : " + vo);
			suggestionService.updateSuggestionOpinion(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return new ResponseEntity<>("success", HttpStatus.OK);
	}
	
	@RequestMapping(value="/suggestionOpinionDelete.do", method=RequestMethod.POST)
	public ResponseEntity<?> suggestionOpinionDelete(SuggestionOpinionVo vo) throws Exception {
		try {
			log.debug("[열린제안] 열린제안 댓글 삭제");
			suggestionService.deleteSuggestionOpinion(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return new ResponseEntity<>("success", HttpStatus.OK);
	}
	
	@RequestMapping(value="/downloadFile.do")
	public void downloadFile(HttpServletResponse response, @RequestParam("save_file_name") String save_file_name) throws Exception {
		try {
			FileVo fileVo = new FileVo();
			fileVo.setSave_file_name(save_file_name);
			
			fileVo = suggestionService.selectDownloadFile(fileVo);
			
			log.debug("[열린제안] 열린제안 첨부파일 다운로드");
			fileUtil.downloadFile(response, fileVo);
		} catch (Exception e) {
			log.debug("[열린제안] 열린제안 첨부파일 다운로드 실패");
			e.printStackTrace();
		}
	}
}
