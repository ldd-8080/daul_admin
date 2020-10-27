package egovframework.com.main.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.contest.vo.ContestVo;
import egovframework.com.main.mapper.MainMapper;
import egovframework.com.main.service.MainService;
import egovframework.com.main.vo.MainVo;
import egovframework.com.suggestion.vo.SuggestionVo;
import egovframework.com.survey.vo.SurveyVo;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("mainService")
public class MainServiceImpl extends EgovAbstractServiceImpl implements MainService {

	@Resource(name = "mainMapper")
	private MainMapper mainMapper;
	
	@Override
	public List<Map<String, String>> selectDummyList() throws Exception{
		List<Map<String, String>> list = new ArrayList();
		
		list = mainMapper.selectDummyList();
		
		return list;
	}

	@Override
	public MainVo getDashboardCount() throws Exception {
		return mainMapper.getDashboardCount();
	}

	@Override
	public List<SuggestionVo> selectMainSuggestionList() throws Exception {
		return mainMapper.selectMainSuggestionList();
	}

	@Override
	public List<ContestVo> selectMainContestList() throws Exception {
		return mainMapper.selectMainContestList();
	}

	@Override
	public List<SurveyVo> selectMainSurveyList() throws Exception {
		return mainMapper.selectMainSurveyList();
	}

}
