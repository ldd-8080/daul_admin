package egovframework.com.survey.service;

import java.util.List;
import java.util.Map;

import egovframework.com.cmmn.util.FileVo;
import egovframework.com.survey.vo.SurveyOpinionVo;
import egovframework.com.survey.vo.SurveyVo;

public interface SurveyService {
	 List<Map<String,String>> selectSurveyList(SurveyVo vo) throws Exception;
	 void registSurvey(SurveyVo vo) throws Exception;
	 String selectSurveyIdx() throws Exception;
	 void registQuestion(Map<String,Object> map) throws Exception;
	 SurveyVo selectSurveyDetail(SurveyVo vo) throws Exception;
	 List<Map<String,String>> selectSurveyQuestion(SurveyVo vo) throws Exception;
	 void updateSurvey(SurveyVo vo) throws Exception;
	 void deleteSurveyQuestion(SurveyVo vo) throws Exception;
	 List<Map<String,String>> selectSurveyResult(SurveyVo vo) throws Exception;
	 List<Map<String,String>> selectParticipation(SurveyVo vo) throws Exception;
	 void deleteParticipation(SurveyVo vo) throws Exception;
	 List<Map<String,String>> selectSurveyFile(FileVo vo) throws Exception;
	 void insertFile(FileVo fileVo) throws Exception ;	
	 void deleteFile(FileVo vo) throws Exception;
	 List<SurveyOpinionVo> selectSurveyOpinionList(SurveyVo surveyVo) throws Exception;
	 SurveyOpinionVo selectParentSurveyOpinion(SurveyOpinionVo vo) throws Exception;
	 void updateChildSurveyOpinion(SurveyOpinionVo topOpnVo) throws Exception;
	 String selectSurveyOpinionIdx() throws Exception;
	 void insertSurveyOpinion(SurveyOpinionVo vo) throws Exception;
	 void updateSurveyOpinion(SurveyOpinionVo vo) throws Exception;
	 void deleteSurveyOpinion(SurveyOpinionVo vo) throws Exception;
}
