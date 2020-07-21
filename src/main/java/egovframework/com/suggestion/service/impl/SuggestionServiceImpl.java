package egovframework.com.suggestion.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.cmmn.util.FileVo;
import egovframework.com.suggestion.mapper.SuggestionMapper;
import egovframework.com.suggestion.service.SuggestionService;
import egovframework.com.suggestion.vo.SuggestionVo;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("suggestionService")
public class SuggestionServiceImpl extends EgovAbstractServiceImpl implements SuggestionService {
	@Resource(name="suggestionMapper")
	private SuggestionMapper suggestionMapper;

	@Override
	public String selectSuggestionIdx() throws Exception {
		return suggestionMapper.selectSuggestionIdx();
	}

	@Override
	public int registSuggestion(SuggestionVo vo) throws Exception {
		return suggestionMapper.registSuggestion(vo);
	}

	@Override
	public void insertFile(Map<String, Object> map) throws Exception {
		suggestionMapper.insertFile(map);
	}

	@Override
	public List<SuggestionVo> selectSuggestionList() throws Exception {
		return suggestionMapper.selectSuggestionList();
	}

	@Override
	public SuggestionVo selectSuggestion(SuggestionVo vo) throws Exception {
		return suggestionMapper.selectSuggestion(vo);
	}

	@Override
	public List<Map<String, String>> selectSuggestionAttach(FileVo fileVo) throws Exception {
		return suggestionMapper.selectSuggestionAttach(fileVo);
	}

	@Override
	public void deleteFile(FileVo fileVo) throws Exception {
		suggestionMapper.deleteFile(fileVo);
	}

}
