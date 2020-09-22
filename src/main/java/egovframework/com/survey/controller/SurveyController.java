package egovframework.com.survey.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.com.cmmn.util.FileUtil;
import egovframework.com.cmmn.util.FileVo;
import egovframework.com.survey.service.SurveyService;
import egovframework.com.survey.vo.SurveyOpinionVo;
import egovframework.com.survey.vo.SurveyQuestionVo;
import egovframework.com.survey.vo.SurveyVo;
import egovframework.com.user.vo.UserVo;

@Controller
@RequestMapping(value="/survey")
public class SurveyController {
	protected Log log = LogFactory.getLog(SurveyController.class);
	
	@Resource(name="surveyService")
	private SurveyService surveyService;
	
	@Resource(name="fileUtil")
	private FileUtil fileUtil;
	
	@RequestMapping(value="/surveyList", method = RequestMethod.GET)
	public String surveyList(){
		return "survey/surveyList";
	}
	
	@RequestMapping(value="/getSurveyList.do")
	public ResponseEntity<?> getSurveyList(SurveyVo vo) throws Exception {
		List<Map<String, String>> surveyList = null;
		
		try {
			log.debug("[설문조사] 설문조사 목록 조회");
			surveyList = surveyService.selectSurveyList(vo);
		} catch (Exception e) {
			log.debug("[설문조사] 설문조사 목록 조회 실패");
			e.printStackTrace();
		}
		
		log.debug("[설문조사] 설문조사 목록 완료");
		return new ResponseEntity<>(surveyList, HttpStatus.OK);
	}
	
	@RequestMapping(value="/surveyRegistPage")
	public String surveyRegist(ModelMap model) {
		model.addAttribute("surveyVo", new SurveyVo());
		return "survey/surveyRegist";
	}
	@Transactional
	@RequestMapping(value="/registSurvey.do", method=RequestMethod.POST)
	public String registSurvey(HttpSession session, @ModelAttribute  SurveyVo vo, BindingResult bindingResult, HttpServletRequest request) throws Exception{
		log.debug("registSurvey.do vo" + vo);
		SurveyValidator surveyValidator = new SurveyValidator();
		surveyValidator.validate(vo, bindingResult);
		
		if(bindingResult.hasErrors()) {
			return "survey/surveyRegist";
		}
		try {

			UserVo userVo = (UserVo) session.getAttribute("login");
		    vo.setCreate_user(userVo.getUser_id());		    
			
			vo.setSurvey_idx(surveyService.selectSurveyIdx());
			
			surveyService.registSurvey(vo);
			
			FileVo fileVo = new FileVo();
			
			fileVo.setCreate_user(vo.getCreate_user());
			fileVo.setIdx(vo.getSurvey_idx());
			
			List<FileVo> fileList = fileUtil.parseFileInfo(fileVo, request);
			System.out.println("fileList == " + fileList);
			
			for(int i = 0; i<fileList.size(); i++) {
				fileVo = fileList.get(i);
				surveyService.insertFile(fileVo);
			}		
			
			List<SurveyQuestionVo> questionList = vo.getQuestionList();
			
			String parent_qes_idx;
			
			List<Map<String, String>> resQuestionList = new ArrayList<Map<String, String>>();
			int idx = 1;
			
			for (int j = 0; j < questionList.size(); j++) {
				
				parent_qes_idx = vo.getSurvey_idx() + '-' + String.format("%02d", idx++);
				SurveyQuestionVo qesVo = questionList.get(j);
				
				Map<String, String> qesMap = new HashMap<>();
				qesMap.put("question_idx", parent_qes_idx);
				qesMap.put("survey_idx", vo.getSurvey_idx());
				qesMap.put("ref", parent_qes_idx);
				qesMap.put("question_content", qesVo.getTitle());
				qesMap.put("select_type", qesVo.getType());
				
				resQuestionList.add(qesMap);
				
				List<String> qes_content_list = qesVo.getQuestion_content();
				
				if (qes_content_list != null) {
					for (int k = 0; k < qes_content_list.size(); k++) {
						String qes_content = qes_content_list.get(k);
						
						Map<String, String> qesMap2 = new HashMap<>();
						qesMap2.put("question_idx", vo.getSurvey_idx() + '-' + String.format("%02d", idx++));
						qesMap2.put("survey_idx", vo.getSurvey_idx());
						qesMap2.put("ref", parent_qes_idx);
						qesMap2.put("question_content", qes_content);
						qesMap2.put("select_type", qesVo.getType());
						
						resQuestionList.add(qesMap2);
					}
				}
			}
			
			for (int l = 0; l < resQuestionList.size(); l++) {
				surveyService.registQuestion(resQuestionList.get(l));
			}
			
			return "redirect:/survey/surveyList.do";
		}catch(Exception e) {
			return "common/error.jsp";
		}
	}
	
	@Transactional
	@RequestMapping(value="/updateSurvey.do", method=RequestMethod.POST)
	public String updateSurvey(HttpSession session, @ModelAttribute @Valid SurveyVo vo,ModelMap model ,HttpServletRequest request, 
							   HttpServletResponse response, BindingResult bindingResult) throws Exception{
		log.debug("updateSurvey.do vo" + vo);
		SurveyValidator surveyValidator = new SurveyValidator();
		surveyValidator.validate(vo, bindingResult);
		
		
		if(bindingResult.hasErrors()) {
			return "survey/surveyDetail";
		}
		try {
			UserVo userVo = (UserVo) session.getAttribute("login");
		    vo.setUpdate_user(userVo.getUser_id());		    

			surveyService.updateSurvey(vo);
			
			FileVo fileVo = new FileVo();
			
			fileVo.setCreate_user(vo.getCreate_user());
			fileVo.setIdx(vo.getSurvey_idx());
			
			List<FileVo> fileList = fileUtil.parseFileInfo(fileVo, request);
			
			if(fileList.size() > 0) {

				System.out.println("fileList == " + fileList);
				for(int i = 0; i<fileList.size(); i++) {
					fileVo = fileList.get(i);

					log.debug("FileVo : " + fileVo);
					log.debug("[설문조사] 대표이미지 파일 삭제");
					surveyService.deleteFile(fileVo);
					log.debug("[설문조사] 대표이미지 파일 등록");
					surveyService.insertFile(fileVo);
				}		
			}
			
			surveyService.deleteSurveyQuestion(vo);
			
		 	List<SurveyQuestionVo> questionList = vo.getQuestionList();
			
			String parent_qes_idx;
			
			List<Map<String, String>> resQuestionList = new ArrayList<Map<String, String>>();
			int idx = 1;
			
			for (int j = 0; j < questionList.size(); j++) {
				
				parent_qes_idx = vo.getSurvey_idx() + '-' + String.format("%02d", idx++);
				SurveyQuestionVo qesVo = questionList.get(j);
				
				Map<String, String> qesMap = new HashMap<>();
				qesMap.put("question_idx", parent_qes_idx);
				qesMap.put("survey_idx", vo.getSurvey_idx());
				qesMap.put("ref", parent_qes_idx);
				qesMap.put("question_content", qesVo.getTitle());
				qesMap.put("select_type", qesVo.getType());
				
				resQuestionList.add(qesMap);
				
				List<String> qes_content_list = qesVo.getQuestion_content();
				
				if (qes_content_list != null) {
					for (int k = 0; k < qes_content_list.size(); k++) {
						String qes_content = qes_content_list.get(k);
						
						Map<String, String> qesMap2 = new HashMap<>();
						qesMap2.put("question_idx", vo.getSurvey_idx() + '-' + String.format("%02d", idx++));
						qesMap2.put("survey_idx", vo.getSurvey_idx());
						qesMap2.put("ref", parent_qes_idx);
						qesMap2.put("question_content", qes_content);
						qesMap2.put("select_type", qesVo.getType());
						
						resQuestionList.add(qesMap2);
					}
				}
			}
			
			for (int l = 0; l < resQuestionList.size(); l++) {
				surveyService.registQuestion(resQuestionList.get(l));
			}
			
			return "redirect:/survey/surveyList.do";
		}catch(Exception e) {
			return "common/error.jsp";
		}
	}
	
	@RequestMapping(value="/surveyDetail.do", method=RequestMethod.GET)
	public String surveyDetail(ModelMap model, @RequestParam("survey_idx") String survey_idx) throws Exception{
		SurveyVo surveyVo = new SurveyVo();

		List<Map<String, String>> surveyResult = new ArrayList<Map<String, String>>();
		List<SurveyOpinionVo> surveyOpinionList = null;
		
		try {
			surveyVo.setSurvey_idx(survey_idx);
			surveyVo = surveyService.selectSurveyDetail(surveyVo);
			
			//설문조사 결과count가져오기
			surveyResult = surveyService.selectSurveyResult(surveyVo);
			
			surveyOpinionList = surveyService.selectSurveyOpinionList(surveyVo);
		}catch(Exception e) {
			
		}
		model.addAttribute("surveyResult", surveyResult);
		model.addAttribute("surveyVo",surveyVo);
		model.addAttribute("surveyOpinionList",surveyOpinionList);
		model.addAttribute("surveyOpinionListSize",surveyOpinionList.size());
		
		return "survey/surveyDetail";
	}
	
	@RequestMapping(value="/getSurveyQuestionList.do")
	public ResponseEntity<?> getSurveyQuestionList(@RequestParam("survey_idx") String survey_idx) throws Exception {
		List<Map<String, Object>> surveyQuestionList = new ArrayList<Map<String, Object>>();
		
		try {
			SurveyVo surveyVo = new SurveyVo();
			surveyVo.setSurvey_idx(survey_idx);
			surveyVo = surveyService.selectSurveyDetail(surveyVo);
			
			surveyQuestionList = surveyService.selectSurveyQuestion(surveyVo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return new ResponseEntity<>(surveyQuestionList, HttpStatus.OK);
	}
	
	@RequestMapping(value="/getSurveyOpinionList.do")
	public ResponseEntity<?> getSurveyOpinionList(@RequestParam("survey_idx") String survey_idx) throws Exception {
		List<SurveyOpinionVo> surveyOpinionList = null;
		SurveyVo surveyVo = new SurveyVo();
		
		try {
			surveyVo.setSurvey_idx(survey_idx);
			
			log.debug("[설문조사] 댓글 조회");
			surveyOpinionList = surveyService.selectSurveyOpinionList(surveyVo);
		} catch (Exception e) {
			log.debug("[설문조사] 댓글 조회 실패");
			e.printStackTrace();
		}
		
		log.debug("[설문조사] 댓글 조회 완료");
		return new ResponseEntity<>(surveyOpinionList, HttpStatus.OK);
	}
	
	@RequestMapping(value="/getParticipationList.do")
	public ResponseEntity<?> getParticipationList( @RequestParam("survey_idx") String survey_idx) throws Exception{
		
		List<Map<String,String>> surveyParticipation = new ArrayList<Map<String, String>>();
		SurveyVo surveyVo = new SurveyVo();
		surveyVo.setSurvey_idx(survey_idx);
		surveyParticipation = surveyService.selectParticipation(surveyVo);
		
		return new ResponseEntity<>(surveyParticipation, HttpStatus.OK);
	}
	@RequestMapping(value="/getImg.do")
	public void getImage(@RequestParam("survey_idx") String surveyIdx, HttpServletResponse response) throws Exception {
		List<Map<String, String>> fileList = null;
		
		try {
			FileVo fileVo = new FileVo();
			fileVo.setIdx(surveyIdx);
			fileVo.setAttach_type("repFile");
			
			fileList = surveyService.selectSurveyFile(fileVo);
			
			String saveFileName = "";
			
			if (!fileList.isEmpty() && fileList.size() > 0) {
				saveFileName = fileList.get(0).get("save_file_name");
				fileUtil.getImgFile(response, saveFileName);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="/surveyOpinionRegist.do", method=RequestMethod.POST, produces = "application/text; charset=utf8")
	public ResponseEntity<?> surveyOpinionRegist(SurveyOpinionVo vo, BindingResult bindingResult) throws Exception {
		try {
			
			SurveyOpinionValidator surveyOpinionValidator = new SurveyOpinionValidator();
			surveyOpinionValidator.validate(vo, bindingResult);
			
			if(bindingResult.hasErrors()) {
				return new ResponseEntity<>(bindingResult.getFieldError().getDefaultMessage(), HttpStatus.OK);
			}
			
			log.debug("SurveyOpinionVo : " + vo);
			String opinionIdx = vo.getOpinion_idx();
			
			if (!"".equals(opinionIdx) && opinionIdx != null) {
				// opinionIdx가 있는 경우 -> 댓글의 댓글~~~들을 등록
				// 등록하고자 하는 댓글의 최상위 댓글 ref, indent, step 정보
				SurveyOpinionVo topOpnVo = surveyService.selectParentSurveyOpinion(vo);
				log.debug("[설문조사] 설문조사 상위댓글 indent 수정");
				// 등록하고자 하는 댓글과 최상위 댓글 사이에 있는 댓글들의 indent를 수정하여 depth 설정
				surveyService.updateChildSurveyOpinion(topOpnVo);
				
				opinionIdx = surveyService.selectSurveyOpinionIdx();
				vo.setOpinion_idx(opinionIdx);
				vo.setSurvey_ref(topOpnVo.getSurvey_ref());
				vo.setSurvey_indent(topOpnVo.getSurvey_indent() + 1);
				vo.setSurvey_step(topOpnVo.getSurvey_step() + 1);
				
				log.debug("[설문조사] 설문조사 대댓글 등록");
				surveyService.insertSurveyOpinion(vo);
			} else {
				// opinionIdx가 없는 경우 -> 제안의 댓글을 등록
				opinionIdx = surveyService.selectSurveyOpinionIdx();
				vo.setOpinion_idx(opinionIdx);
				vo.setSurvey_ref(opinionIdx);
				
				log.debug("[설문조사] 설문조사 댓글 등록");
				surveyService.insertSurveyOpinion(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ResponseEntity<>("success", HttpStatus.OK);
	}
	
	@RequestMapping(value="/surveyOpinionModify.do", method=RequestMethod.POST, produces = "application/text; charset=utf8")
	public ResponseEntity<?> surveyOpinionModify(SurveyOpinionVo vo, BindingResult bindingResult) throws Exception {
		try {
			
			SurveyOpinionValidator surveyOpinionValidator = new SurveyOpinionValidator();
			surveyOpinionValidator.validate(vo, bindingResult);
			
			if(bindingResult.hasErrors()) {
				return new ResponseEntity<>(bindingResult.getFieldError().getDefaultMessage(), HttpStatus.OK);
			}
			
			
			log.debug("[설문조사] 설문조사 댓글 수정");
			log.debug("SurveyOpinionVo : " + vo);
			surveyService.updateSurveyOpinion(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return new ResponseEntity<>("success", HttpStatus.OK);
	}
	
	@RequestMapping(value="/surveyOpinionDelete.do", method=RequestMethod.POST)
	public ResponseEntity<?> surveyOpinionDelete(SurveyOpinionVo vo) throws Exception {
		try {
			log.debug("[설문조사] 설문조사 댓글 삭제");
			surveyService.deleteSurveyOpinion(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return new ResponseEntity<>("success", HttpStatus.OK);
	}
	
	@RequestMapping(value = "/serializedObj.do", method = RequestMethod.POST)
	public ResponseEntity<?> serializedObj(HttpSession session, @RequestBody Map<Object, Object> params) throws Exception {
		System.out.println("params === " + params);
		try {
//			//저장전에 해당 intent_id가 있으면 다 지움
//			if(chatbotService.checkIntentId((String)params.get("intent_id")) != 0) {
//				chatbotService.deleteIntentId((String)params.get("intent_id"));
//			}
//			List<Map<Object, Object>> list = (List<Map<Object, Object>>) params.get("cardList");
//			if(list != null) {
//				for (int i = 0; i < list.size(); i++) {
//					if(list.get(i) != null) {
//						list.get(i).put("intent_id", params.get("intent_id"));
//					}
//				}
//				chatbotService.registResponeList(session, list);
//			}
		}catch(Exception e){
			log.debug("ChatbotController - serializedObj.do - Exception");

		}
		return new ResponseEntity<>("success", HttpStatus.OK);
	}
}
