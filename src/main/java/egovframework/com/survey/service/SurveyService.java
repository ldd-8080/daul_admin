package egovframework.com.survey.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import egovframework.com.survey.vo.SurveyVo;

public interface SurveyService {
	public List<Map<String,String>> selectSurveyList() throws Exception;
	public void registSurvey(SurveyVo vo, MultipartFile[] file) throws Exception;
}