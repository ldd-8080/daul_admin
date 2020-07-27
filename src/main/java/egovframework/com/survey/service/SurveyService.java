package egovframework.com.survey.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import egovframework.com.cmmn.util.FileVo;
import egovframework.com.survey.vo.SurveyOpinionVo;
import egovframework.com.survey.vo.SurveyVo;

public interface SurveyService {
	public List<Map<String,String>> selectSurveyList() throws Exception;
	public void registSurvey(SurveyVo vo, MultipartFile[] file) throws Exception;
	public String selectSurveyIdx() throws Exception;
	public void registQuestion(Map<String,Object> map) throws Exception;
	public SurveyVo selectSurveyDetail(SurveyVo vo) throws Exception;
	public List<Map<String,String>> selectSurveyQuestion(SurveyVo vo) throws Exception;
	public void updateSurvey(SurveyVo vo, MultipartFile[] file) throws Exception;
	public void deleteSurveyQuestion(SurveyVo vo) throws Exception;
	public List<Map<String,String>> selectSurveyResult(SurveyVo vo) throws Exception;
	public List<Map<String,String>> selectParticipation(SurveyVo vo) throws Exception;
	public void deleteParticipation(SurveyVo vo) throws Exception;
	public List<Map<String,String>> selectSurveyFile(FileVo vo) throws Exception;
	public void insertFile(FileVo fileVo) throws Exception ;	
	public void deleteFile(FileVo vo) throws Exception;
	public List<SurveyOpinionVo> selectSurveyOpinionList(SurveyVo surveyVo) throws Exception;
	public SurveyOpinionVo selectParentSurveyOpinion(SurveyOpinionVo vo) throws Exception;
	public void updateChildSurveyOpinion(SurveyOpinionVo topOpnVo) throws Exception;
	public String selectSurveyOpinionIdx() throws Exception;
	public void insertSurveyOpinion(SurveyOpinionVo vo) throws Exception;
}
