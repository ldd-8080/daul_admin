package egovframework.com.survey.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.survey.mapper.SurveyMapper;
import egovframework.com.survey.service.SurveyService;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("surveyService")
public class SurveyServiceImpl extends EgovAbstractServiceImpl implements SurveyService  {

	@Resource(name="surveyMapper")
	private SurveyMapper surveyMapper;
	@Override
	public List<Map<String, String>> selectSurveyList() throws Exception {
		
		List<Map<String,String>> list = new ArrayList();
		
		list = surveyMapper.selectSurveyList();
		return list;
	}
	

	
}
