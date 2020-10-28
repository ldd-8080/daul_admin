package egovframework.com.main.mapper;

import java.util.List;
import java.util.Map;

import egovframework.com.contest.vo.ContestVo;
import egovframework.com.main.vo.MainVo;
import egovframework.com.suggestion.vo.SuggestionVo;
import egovframework.com.survey.vo.SurveyVo;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("mainMapper")
public interface MainMapper {

	List<Map<String, String>> selectDummyList() throws Exception;
	
	MainVo getDashboardCount() throws Exception;
	
	List<SuggestionVo> selectMainSuggestionList() throws Exception;
	
	List<ContestVo> selectMainContestList() throws Exception;

	List<SurveyVo> selectMainSurveyList() throws Exception;
	
	List<MainVo> selectVisitorCnt(MainVo vo) throws Exception;
	
	List<MainVo> selectMileageRank(MainVo vo) throws Exception;
}
