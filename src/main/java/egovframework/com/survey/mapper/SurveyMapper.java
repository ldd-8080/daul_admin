package egovframework.com.survey.mapper;

import java.util.List;
import java.util.Map;

import egovframework.com.cmmn.util.FileVo;
import egovframework.com.survey.vo.SurveyVo;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("surveyMapper")
public interface SurveyMapper {
	List<Map<String,String>> selectSurveyList() throws Exception;
	public String selectSurveyIdx() throws Exception;
	void registSurvey(SurveyVo vo) throws Exception;
	void insertFile(FileVo vo) throws Exception;
	void registQuestion(Map<String,Object> map) throws Exception;
	public SurveyVo selectSurveyDetail(SurveyVo vo) throws Exception;
	public List<Map<String,String>> selectSurveyQuestionList(SurveyVo vo) throws Exception;
	void updateSurvey(SurveyVo vo) throws Exception;
	public void deleteSurveyQuestion(SurveyVo vo) throws Exception;
	public List<Map<String,String>> selectSurveyResult(SurveyVo vo) throws Exception;
	public List<Map<String,String>> selectParticipation(SurveyVo vo) throws Exception;
	public void deleteParticipation(SurveyVo vo) throws Exception;
	public List<Map<String, String>> selectSurveyFile(FileVo vo) throws Exception;
	
}
