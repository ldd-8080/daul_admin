package egovframework.com.survey.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import egovframework.com.cmmn.util.FileUtils;
import egovframework.com.cmmn.util.FileVo;
import egovframework.com.survey.mapper.SurveyMapper;
import egovframework.com.survey.service.SurveyService;
import egovframework.com.survey.vo.SurveyVo;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("surveyService")
public class SurveyServiceImpl extends EgovAbstractServiceImpl implements SurveyService  {

	@Resource(name="surveyMapper")
	private SurveyMapper surveyMapper;
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	
	@Override
	public List<Map<String, String>> selectSurveyList() throws Exception {
		
		List<Map<String,String>> list = new ArrayList();
		
		list = surveyMapper.selectSurveyList();
		return list;
	}
	
	@Override
	public void registSurvey(SurveyVo vo, MultipartFile[] file ) throws Exception {
		
		
		surveyMapper.registSurvey(vo);
		
//		FileVo fileVo = new FileVo();
//		
//		fileVo.setCreate_user(vo.getCreate_user());
//		fileVo.setIdx(vo.getSurvey_idx());
//		
//		List<FileVo> fileList = fileUtils.parseFileInfo(fileVo, file);
//		System.out.println("fileList == " + fileList);
//		for(int i = 0; i<fileList.size(); i++) {
//			surveyMapper.insertFile(fileList.get(i));
//		}		
	}

	@Override
	public void updateSurvey(SurveyVo vo, MultipartFile[] file) throws Exception {
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


	
	

	
}
