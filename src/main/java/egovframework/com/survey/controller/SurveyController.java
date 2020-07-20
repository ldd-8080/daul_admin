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
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import egovframework.com.cmmn.interceptor.cmmnInterceptor;
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
	
	@RequestMapping(value="/registSurvey.do", method=RequestMethod.POST)
	public String registSurvey(HttpSession session, @ModelAttribute @Valid SurveyVo vo,ModelMap model ,HttpServletRequest request, 
							   HttpServletResponse response, MultipartFile[] file, BindingResult bindingResult) throws Exception{

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
			
			surveyService.registSurvey(vo,file);
			
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
			e.printStackTrace();
			return "common/error.jsp";
		}
	}
	
	
}
