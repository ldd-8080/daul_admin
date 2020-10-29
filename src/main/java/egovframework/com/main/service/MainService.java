package egovframework.com.main.service;

import java.util.List;
import java.util.Map;

import egovframework.com.contest.vo.ContestVo;
import egovframework.com.main.vo.MainVo;
import egovframework.com.suggestion.vo.SuggestionVo;
import egovframework.com.survey.vo.SurveyVo;

public interface MainService {

	public List<Map<String, String>> selectDummyList() throws Exception;
	
	public MainVo getDashboardCount() throws Exception;
	
	List<SuggestionVo> selectMainSuggestionList() throws Exception;

	List<ContestVo> selectMainContestList() throws Exception;

	List<SurveyVo> selectMainSurveyList() throws Exception;
	
	List<MainVo> selectVisitorCnt(MainVo vo) throws Exception;
	
	List<MainVo> selectMileageRank(MainVo vo) throws Exception;

	public List<Map<String, String>> selectKeywordList(MainVo vo) throws Exception;
}
