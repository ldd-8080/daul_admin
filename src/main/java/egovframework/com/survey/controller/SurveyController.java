package egovframework.com.survey.controller;

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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import egovframework.com.cmmn.interceptor.cmmnInterceptor;
import egovframework.com.survey.service.SurveyService;
import egovframework.com.survey.vo.SurveyVo;

@Controller
@RequestMapping(value="/survey")
public class SurveyController {
	protected Log log = LogFactory.getLog(cmmnInterceptor.class);
	
	@Resource(name="surveyService")
	private SurveyService surveyService;
	
	@RequestMapping(value="/surveyList.do", method = RequestMethod.GET)
	public String surveyList(ModelMap model) throws Exception{
		try {
			List<Map<String, String>> surveyList = surveyService.selectSurveyList();
			model.addAttribute("surveyList",surveyList);
		}catch(Exception e) {
			
		}
		return "survey/surveyList";
	}
	
	@RequestMapping(value="/surveyRegistPage.do")
	public String surveyRegist(ModelMap model) {
		model.addAttribute("surveyVo", new SurveyVo());
		return "survey/surveyRegist";
	}
	
	@RequestMapping(value="/registSurvey.do", method=RequestMethod.POST)
	public ResponseEntity registSurvey(HttpSession session, @ModelAttribute SurveyVo vo, HttpServletRequest request, HttpServletResponse response) throws Exception{
		try {
			System.out.println(vo);
			
	
			return new ResponseEntity<>("success", HttpStatus.OK);
		}catch(Exception e) {
			return new ResponseEntity<>("error.", HttpStatus.OK);
		}
	}
	
	
}
