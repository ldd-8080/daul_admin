package egovframework.com.survey.mapper;

import java.util.List;
import java.util.Map;

import egovframework.com.cmmn.util.FileVo;
import egovframework.com.survey.vo.SurveyVo;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("surveyMapper")
public interface SurveyMapper {
	public List<Map<String,String>> selectSurveyList() throws Exception;
	public String selectSurveyIdx() throws Exception;
	public void registSurvey(SurveyVo vo) throws Exception;
	public void registQuestion(Map<String,Object> map) throws Exception;
	public SurveyVo selectSurveyDetail(SurveyVo vo) throws Exception;	
	public List<Map<String,String>> selectSurveyQuestionList(SurveyVo vo) throws Exception;
	public void updateSurvey(SurveyVo vo) throws Exception;
	public void deleteSurveyQuestion(SurveyVo vo) throws Exception;
	public List<Map<String,String>> selectSurveyResult(SurveyVo vo) throws Exception;
	public List<Map<String,String>> selectParticipation(SurveyVo vo) throws Exception;
	public void deleteParticipation(SurveyVo vo) throws Exception;
	public List<Map<String, String>> selectSurveyFile(FileVo vo) throws Exception;

	public void insertFile(FileVo fileVo) throws Exception;
	public void deleteFile(FileVo fileVo) throws Exception;
}
