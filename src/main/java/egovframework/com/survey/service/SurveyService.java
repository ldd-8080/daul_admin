package egovframework.com.survey.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import egovframework.com.survey.vo.SurveyVo;

public interface SurveyService {
	public List<Map<String,String>> selectSurveyList() throws Exception;
	public void registSurvey(SurveyVo vo, MultipartFile[] file) throws Exception;
	public String selectSurveyIdx() throws Exception;
	public void registQuestion(Map<String,Object> map) throws Exception;
	public SurveyVo selectSurveyDetail(SurveyVo vo) throws Exception;
	public List<Map<String,String>> selectSurveyQuestion(SurveyVo vo) throws Exception;
}
