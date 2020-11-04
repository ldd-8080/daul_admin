package egovframework.com.main.controller;

import java.util.HashMap;
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
	
	@RequestMapping(value="/selectMileageRank.do", method=RequestMethod.POST)
	public ResponseEntity<?> selectMileageRank(MainVo vo) throws Exception {
		List<MainVo> mileageRankList =  null;
		try {
			//days에 조회할 일수 넣어서 조회 ex)이전7일이면 days = 7
			mileageRankList = mainService.selectMileageRank(vo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return new ResponseEntity<>(mileageRankList, HttpStatus.OK);
	}
	
	@RequestMapping(value="/selectKeywordList.do", method=RequestMethod.POST)
	public ResponseEntity<?> selectKeywordList(MainVo vo) throws Exception {
		List<Map<String, String>> keywordList = null;
		
		try {
			keywordList = mainService.selectKeywordList(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return new ResponseEntity<> (keywordList, HttpStatus.OK);
	}
	
	@RequestMapping(value="/selectEmotionOpinionList.do", method=RequestMethod.POST)
	public ResponseEntity<?> selectEmotionOpinionList(MainVo vo) throws Exception {
		List<Map<String, String>> opinionList = null;
		
		try {
			opinionList = mainService.selectEmotionOpinionList(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return new ResponseEntity<>(opinionList, HttpStatus.OK);
	}
	
	@RequestMapping(value="/selectUserMileageList.do", method=RequestMethod.POST)
	public ResponseEntity<?> selectUserMileageList(MainVo vo) throws Exception {
		List<Map<String, String>> userMileageList = null;
		
		try {
			userMileageList = mainService.selectUserMileageList(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return new ResponseEntity<>(userMileageList, HttpStatus.OK);
	}
	
	@RequestMapping(value="/selectVisitorCnt.do", method=RequestMethod.POST)
	public ResponseEntity<?> selectVisitorCnt(MainVo vo) throws Exception {
		List<MainVo> visitorCntList =  null;
		Map<String, Object> resMap = new HashMap<>();
		
		try {
			visitorCntList = mainService.selectVisitorCnt(vo);
			
			resMap.put("visitorCnt", visitorCntList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return new ResponseEntity<>(resMap, HttpStatus.OK);
	}
	
	@RequestMapping(value="/selectSuggestionCnt.do", method=RequestMethod.POST)
	public ResponseEntity<?> selectSuggestionCnt(MainVo vo) throws Exception {
		List<MainVo> suggestionCntList = null;
		Map<String, Object> resMap = new HashMap<>();
		
		try {
			suggestionCntList = mainService.selectSuggestionCnt(vo);
			
			resMap.put("suggestionCnt", suggestionCntList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return new ResponseEntity<>(resMap, HttpStatus.OK);
	}
	
	@RequestMapping(value="/selectSurveyContestCnt.do", method=RequestMethod.POST)
	public ResponseEntity<?> selectSurveyContestCnt(MainVo vo) throws Exception {
		List<MainVo> surveyCntList = null;
		List<MainVo> contestCntList = null;
		Map<String, Object> resMap = new HashMap<>();
		
		try {
			surveyCntList = mainService.selectSurveyCnt(vo);
			contestCntList = mainService.selectContestCnt(vo);
			
			resMap.put("surveyCnt", surveyCntList);
			resMap.put("contestCnt", contestCntList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return new ResponseEntity<>(resMap, HttpStatus.OK);
	}
}
