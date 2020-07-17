package egovframework.com.survey.service;

import java.util.List;
import java.util.Map;

public interface SurveyService {
	public List<Map<String,String>> selectSurveyList() throws Exception;
}
