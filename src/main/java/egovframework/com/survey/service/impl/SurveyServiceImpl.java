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
	public List<Map<String, String>> selectSurveyList(SurveyVo vo) throws Exception {
		List<Map<String,String>> list = new ArrayList<Map<String,String>>();
		
		list = surveyMapper.selectSurveyList(vo);
		return list;
	}
	
	@Override
	public void registSurvey(SurveyVo vo) throws Exception {
		surveyMapper.registSurvey(vo);
	}

	@Override
	public void updateSurvey(SurveyVo vo) throws Exception {
		surveyMapper.updateSurvey(vo);
	}
	
	
	@Override
	public String selectSurveyIdx() throws Exception {
		String surveyIdx = surveyMapper.selectSurveyIdx();
		return surveyIdx;
	}

	@Override
	public void registQuestion(Map<String, String> map) throws Exception {
		surveyMapper.registQuestion(map);
		
	}

	@Override
	public SurveyVo selectSurveyDetail(SurveyVo vo) throws Exception {
		return surveyMapper.selectSurveyDetail(vo);
	}

	@Override
	public List<Map<String, Object>> selectSurveyQuestion(SurveyVo vo) throws Exception {
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		List<Map<String, Object>> titleList = new ArrayList<>();
		List<Map<String, Object>> contentList = new ArrayList<>();
		
		try {
			list = surveyMapper.selectSurveyQuestionList(vo);
			
			for (int i = 0; i < list.size(); i++) {
				Map<String, Object> qesMap = list.get(i);
				
				if (qesMap.get("ref").equals(qesMap.get("question_idx"))) {
					titleList.add(qesMap);
				} else {
					contentList.add(qesMap);
				}
			}
			
			for (int j = 0; j < titleList.size(); j++) {
				Map<String, Object> titleMap = titleList.get(j);
				titleMap.put("title", titleMap.get("question_content"));
				
				List<Map<String, Object>> content = new ArrayList<>();
				
				for (int k = 0; k < contentList.size(); k++) {
					Map<String, Object> contentMap = contentList.get(k);
					
					if (titleMap.get("ref").equals(contentMap.get("ref"))) {
						content.add(contentMap);
					}
				}
				
				titleMap.put("question_content", content);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return titleList;
	}

	@Override
	public void deleteSurveyQuestion(SurveyVo vo) throws Exception {
		surveyMapper.deleteSurveyQuestion(vo);
		
	}

	@Override
	public List<Map<String, String>> selectSurveyResult(SurveyVo vo) throws Exception {
		List<Map<String,String>> list = new ArrayList<Map<String,String>>();
		
		list = surveyMapper.selectSurveyResult(vo);
		return list;
	}

	@Override
	public List<Map<String, String>> selectParticipation(SurveyVo vo) throws Exception {
		List<Map<String,String>> list = new ArrayList<Map<String,String>>();
		
		list = surveyMapper.selectParticipation(vo);
		return list;
	}

	@Override
	public void deleteParticipation(SurveyVo vo) throws Exception {
		surveyMapper.deleteParticipation(vo);
		
	}

	@Override
	public List<Map<String, String>> selectSurveyFile(FileVo vo) throws Exception {
		return surveyMapper.selectSurveyFile(vo);
	}

	@Override
	public void insertFile(FileVo fileVo) throws Exception {
		surveyMapper.insertFile(fileVo);
		
	}

	@Override
	public void deleteFile(FileVo vo) throws Exception {
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
