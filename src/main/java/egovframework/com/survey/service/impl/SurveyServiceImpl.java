package egovframework.com.survey.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.cmmn.util.FileUtil;
import egovframework.com.cmmn.util.FileVo;
import egovframework.com.survey.mapper.SurveyMapper;
import egovframework.com.survey.service.SurveyService;
import egovframework.com.survey.vo.SurveyOpinionVo;
import egovframework.com.survey.vo.SurveyVo;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("surveyService")
public class SurveyServiceImpl extends EgovAbstractServiceImpl implements SurveyService  {

	@Resource(name="surveyMapper")
	private SurveyMapper surveyMapper;
	
	@Resource(name="fileUtil")
	private FileUtil fileUtil;
	
	@Override
	public List<Map<String, String>> selectSurveyList() throws Exception {
		
		List<Map<String,String>> list = new ArrayList();
		
		list = surveyMapper.selectSurveyList();
		return list;
	}
	
	@Override
	public void registSurvey(SurveyVo vo) throws Exception {
		surveyMapper.registSurvey(vo);
	}

	@Override
	public void updateSurvey(SurveyVo vo) throws Exception {
		// TODO Auto-generated method stub
		surveyMapper.updateSurvey(vo);
	}
	
	
	@Override
	public String selectSurveyIdx() throws Exception {
		String surveyIdx = surveyMapper.selectSurveyIdx();
		return surveyIdx;
	}

	@Override
	public void registQuestion(Map<String, Object> map) throws Exception {
		surveyMapper.registQuestion(map);
		
	}

	@Override
	public SurveyVo selectSurveyDetail(SurveyVo vo) throws Exception {
		// TODO Auto-generated method stub
		return surveyMapper.selectSurveyDetail(vo);
	}

	@Override
	public List<Map<String, String>> selectSurveyQuestion(SurveyVo vo) throws Exception {
		
		List<Map<String,String>> list = new ArrayList();
		
		list = surveyMapper.selectSurveyQuestionList(vo);
		return list;
	}

	@Override
	public void deleteSurveyQuestion(SurveyVo vo) throws Exception {
		// TODO Auto-generated method stub
		surveyMapper.deleteSurveyQuestion(vo);
		
	}

	@Override
	public List<Map<String, String>> selectSurveyResult(SurveyVo vo) throws Exception {
		List<Map<String,String>> list = new ArrayList();
		
		list = surveyMapper.selectSurveyResult(vo);
		return list;
	}

	@Override
	public List<Map<String, String>> selectParticipation(SurveyVo vo) throws Exception {
		List<Map<String,String>> list = new ArrayList();
		
		list = surveyMapper.selectParticipation(vo);
		return list;
	}

	@Override
	public void deleteParticipation(SurveyVo vo) throws Exception {
		// TODO Auto-generated method stub
		surveyMapper.deleteParticipation(vo);
		
	}

	@Override
	public List<Map<String, String>> selectSurveyFile(FileVo vo) throws Exception {
		// TODO Auto-generated method stub
		return surveyMapper.selectSurveyFile(vo);
	}

	@Override
	public void insertFile(FileVo fileVo) throws Exception {
		surveyMapper.insertFile(fileVo);
		
	}

	@Override
	public void deleteFile(FileVo vo) throws Exception {
		// TODO Auto-generated method stub
		surveyMapper.deleteFile(vo);
		
	}

	@Override
	public List<SurveyOpinionVo> selectSurveyOpinionList(SurveyVo surveyVo) throws Exception {
		return surveyMapper.selectSurveyOpinionList(surveyVo);
	}

	@Override
	public SurveyOpinionVo selectParentSurveyOpinion(SurveyOpinionVo vo) throws Exception {
		return surveyMapper.selectParentSurveyOpinion(vo);
	}

	@Override
	public void updateChildSurveyOpinion(SurveyOpinionVo topOpnVo) throws Exception {
		surveyMapper.updateChildSurveyOpinion(topOpnVo);
	}

	@Override
	public String selectSurveyOpinionIdx() throws Exception {
		return surveyMapper.selectSurveyOpinionIdx();
	}

	@Override
	public void insertSurveyOpinion(SurveyOpinionVo vo) throws Exception {
		surveyMapper.insertSurveyOpinion(vo);
	}

	@Override
	public void updateSurveyOpinion(SurveyOpinionVo vo) throws Exception {
		surveyMapper.updateSurveyOpinion(vo);
	}

	@Override
	public void deleteSurveyOpinion(SurveyOpinionVo vo) throws Exception {
		surveyMapper.deleteSurveyOpinion(vo);
	}


	
	

	
}
