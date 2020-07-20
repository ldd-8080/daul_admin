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
	@Override
	public List<Map<String, String>> selectSurveyList() throws Exception {
		
		List<Map<String,String>> list = new ArrayList();
		
		list = surveyMapper.selectSurveyList();
		return list;
	}
	
	@Override
	public void registSurvey(SurveyVo vo, MultipartFile[] file ) throws Exception {
		
		System.out.println("surveyMapper.selectSurveyIdx() === " + surveyMapper.selectSurveyIdx() );
		vo.setSurvey_idx(surveyMapper.selectSurveyIdx());
		surveyMapper.registSurvey(vo);
		
		FileVo fileVo = new FileVo();
		
		fileVo.setCreate_user(vo.getCreate_user());
		fileVo.setIdx(vo.getSurvey_idx());
		
		FileUtils fileUtils = new FileUtils();
		List<Map<String, Object>> fileList = fileUtils.parseFileInfo(fileVo, file);
		System.out.println("fileList == " + fileList);
		for(int i = 0; i<fileList.size(); i++) {
			surveyMapper.insertFile(fileList.get(i));
		}
		
		
	}
	

	
}
