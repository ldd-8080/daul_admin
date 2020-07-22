package egovframework.com.survey.controller;

import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.commons.io.IOUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import egovframework.com.survey.service.SurveyService;
import egovframework.com.survey.vo.SurveyVo;
import egovframework.com.user.vo.UserVo;

@Controller
@RequestMapping(value="/survey")
public class SurveyController {
	protected Log log = LogFactory.getLog(SurveyController.class);
	
	@Resource(name="surveyService")
	private SurveyService surveyService;
	
	@RequestMapping(value="/surveyList", method = RequestMethod.GET)
	public String surveyList(ModelMap model) throws Exception{
		try {
			List<Map<String, String>> surveyList = surveyService.selectSurveyList();
			model.addAttribute("surveyList",surveyList);
		}catch(Exception e) {
			
		}
		return "survey/surveyList";
	}
	
	@RequestMapping(value="/surveyRegistPage")
	public String surveyRegist(ModelMap model) {
		model.addAttribute("surveyVo", new SurveyVo());
		return "survey/surveyRegist";
	}
	@Transactional
	@RequestMapping(value="/registSurvey.do", method=RequestMethod.POST)
	public String registSurvey(HttpSession session, @ModelAttribute @Valid SurveyVo vo,ModelMap model ,HttpServletRequest request, 
							   HttpServletResponse response, MultipartFile[] repFile, BindingResult bindingResult) throws Exception{

		SurveyValidator surveyValidator = new SurveyValidator();
		surveyValidator.validate(vo, bindingResult);
		
		if(bindingResult.hasErrors()) {
			return "survey/surveyRegist";
		}
		try {

			UserVo userVo = (UserVo) session.getAttribute("login");
		    vo.setCreate_user(userVo.getUser_id());		    
			
			String question_content_arr = vo.getQuestion_content();
			String[] questionArr = question_content_arr.split(",");
			
			vo.setSurvey_idx(surveyService.selectSurveyIdx());
			
			surveyService.registSurvey(vo,repFile);
			
			List<Map<String, Object>> questionList = new ArrayList<Map<String, Object>>();
			
			for(int j = 0; j < questionArr.length ;j++) {
				String question_idx; 
				String question_content;
				
				question_idx = vo.getSurvey_idx()+'-'+String.format("%02d",j+1);
				question_content = questionArr[j];
				
				Map<String, Object> questionInfo = new HashMap<String, Object>();
				
				questionInfo.put("survey_idx", vo.getSurvey_idx());
				questionInfo.put("question_idx", question_idx);
				questionInfo.put("question_content", question_content);
				questionList.add(questionInfo);			
			}
			
			for(int i=0; i<questionList.size(); i++) {
				surveyService.registQuestion(questionList.get(i));
			}
	        
			return "redirect:/survey/surveyList.do";
		}catch(Exception e) {
			return "common/error.jsp";
		}
	}
	@Transactional
	@RequestMapping(value="/updateSurvey.do", method=RequestMethod.POST)
	public String updateSurvey(HttpSession session, @ModelAttribute @Valid SurveyVo vo,ModelMap model ,HttpServletRequest request, 
							   HttpServletResponse response, MultipartFile[] repFile, BindingResult bindingResult) throws Exception{

		SurveyValidator surveyValidator = new SurveyValidator();
		surveyValidator.validate(vo, bindingResult);
		
		System.out.println(vo);
		
		if(bindingResult.hasErrors()) {
			return "survey/surveyDetail";
		}
		try {

			UserVo userVo = (UserVo) session.getAttribute("login");
		    vo.setUpdate_user(userVo.getUser_id());		    

			String question_content_arr = vo.getQuestion_content();
			String[] questionArr = question_content_arr.split(",");
	
			surveyService.updateSurvey(vo,repFile);
//			
//			surveyService.registSurvey(vo,repFile);
//			
			List<Map<String, Object>> questionList = new ArrayList<Map<String, Object>>();
			
			surveyService.deleteSurveyQuestion(vo);
		
			
			for(int j = 0; j < questionArr.length ;j++) {
				String question_idx; 
				String question_content;
				
				question_idx = vo.getSurvey_idx()+'-'+String.format("%02d",j+1);
				question_content = questionArr[j];
				
				Map<String, Object> questionInfo = new HashMap<String, Object>();
				
				questionInfo.put("survey_idx", vo.getSurvey_idx());
				questionInfo.put("question_idx", question_idx);
				questionInfo.put("question_content", question_content);
				questionList.add(questionInfo);			
			}
			
			for(int i=0; i<questionList.size(); i++) {
				surveyService.registQuestion(questionList.get(i));
			}
	        
			return "redirect:/survey/surveyList.do";
		}catch(Exception e) {
			return "common/error.jsp";
		}
	}
	
	@RequestMapping(value="/surveyDetail.do", method=RequestMethod.GET)
	public String surveyDetail(ModelMap model, @RequestParam("survey_idx") String survey_idx) throws Exception{
		SurveyVo surveyVo = new SurveyVo();
		List<Map<String,String>> surveyQuestionList = new ArrayList();
		List<Map<String,String>> surveyResult = new ArrayList();
		List<Map<String,String>> surveyParticipation = new ArrayList();
		try {
			surveyVo.setSurvey_idx(survey_idx);
			surveyVo = surveyService.selectSurveyDetail(surveyVo);
			
			surveyQuestionList = surveyService.selectSurveyQuestion(surveyVo);
			
			//설문조사 결과count가져오기
			surveyResult = surveyService.selectSurveyResult(surveyVo);
			System.out.println("surveyResult = " + surveyResult + ",surveyResult.size() = " + surveyResult.size());
			
			surveyParticipation = surveyService.selectParticipation(surveyVo);
			
		}catch(Exception e) {
			
		}
		model.addAttribute("surveyParticipation", surveyParticipation);
		model.addAttribute("surveyResult", surveyResult);
		model.addAttribute("surveyVo",surveyVo);
		model.addAttribute("surveyQuestionList",surveyQuestionList);
		
		return "survey/surveyDetail";
	}
	
	
	@RequestMapping(value="/getImg.do")
	public void getImage( HttpServletRequest request, HttpServletResponse response)
	throws Exception {
	// TODO Auto-generated method stub
	response.setContentType("application/png");
	String url = "file:///Users/a2/attach/";
	String filename = "1e0a4d203dd64e138f17906a5f1a4b63.png";
	URL fileUrl = new URL(url+filename);
	IOUtils.copy( fileUrl.openStream(), response.getOutputStream());
	}
			
}
