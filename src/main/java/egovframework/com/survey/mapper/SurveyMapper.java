package egovframework.com.survey.mapper;

import java.util.List;
import java.util.Map;

import egovframework.com.survey.vo.SurveyVo;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("surveyMapper")
public interface SurveyMapper {
	List<Map<String,String>> selectSurveyList() throws Exception;
	public String selectSurveyIdx() throws Exception;
	void registSurvey(SurveyVo vo) throws Exception;
	void insertFile(Map<String,Object> map) throws Exception;
	void registQuestion(Map<String,Object> map) throws Exception;

}
