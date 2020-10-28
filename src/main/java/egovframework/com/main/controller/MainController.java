package egovframework.com.main.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import egovframework.com.contest.vo.ContestVo;
import egovframework.com.main.service.MainService;
import egovframework.com.main.vo.MainVo;
import egovframework.com.suggestion.vo.SuggestionOpinionVo;
import egovframework.com.suggestion.vo.SuggestionVo;
import egovframework.com.survey.vo.SurveyVo;

@Controller
@RequestMapping(value = "/main/*")
public class MainController {

	protected Log log = LogFactory.getLog(MainController.class);
	
	@Resource(name = "mainService")
	private MainService mainService;
	
	@RequestMapping(value = "/main.do")
	public String home(ModelMap model) throws Exception{
		List<SuggestionVo> mainSuggestionList = null;
		List<ContestVo> mainContestList = null;
		List<SurveyVo> mainSurveyList = null;
		try {
			MainVo mainVo = mainService.getDashboardCount();
			mainSuggestionList = mainService.selectMainSuggestionList();
			mainContestList = mainService.selectMainContestList();
			mainSurveyList = mainService.selectMainSurveyList();
			
			model.addAttribute("mainVo", mainVo);
			model.addAttribute("mainSuggestionList", mainSuggestionList);
			model.addAttribute("mainContestList", mainContestList);
			model.addAttribute("mainSurveyList", mainSurveyList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "main/main";
	}
	

	@RequestMapping(value = "/main2.do")
	public String home2(ModelMap model) throws Exception{
		System.out.println("main controller2");
		
		try {

			
			List<Map<String, String>> dummyList = mainService.selectDummyList();
			System.out.println("dummyList >>> " + dummyList);
			
			model.addAttribute("resultList", dummyList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "main/main";
	}
	
	
	@RequestMapping(value="/selectVisitorCnt.do", method=RequestMethod.POST)
	public ResponseEntity<?> selectVisitorCnt(MainVo vo) throws Exception {
		List<MainVo> visitorCntList =  null;
		try {
			//시작일,종료일 vo에 넣어서 불러
			
			visitorCntList = mainService.selectVisitorCnt(vo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return new ResponseEntity<>(visitorCntList, HttpStatus.OK);
	}
	
}
