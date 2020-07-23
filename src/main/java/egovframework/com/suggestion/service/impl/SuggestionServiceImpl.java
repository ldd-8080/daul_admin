package egovframework.com.suggestion.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.cmmn.util.FileVo;
import egovframework.com.suggestion.mapper.SuggestionMapper;
import egovframework.com.suggestion.service.SuggestionService;
import egovframework.com.suggestion.vo.SuggestionOpinionVo;
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
	public void insertFile(FileVo fileVo) throws Exception {
		suggestionMapper.insertFile(fileVo);
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
	public List<Map<String, String>> selectSuggestionFile(FileVo fileVo) throws Exception {
		return suggestionMapper.selectSuggestionFile(fileVo);
	}

	@Override
	public void deleteFile(FileVo fileVo) throws Exception {
		suggestionMapper.deleteFile(fileVo);
	}

	@Override
	public void updateSuggestion(SuggestionVo vo) throws Exception {
		suggestionMapper.updateSuggestion(vo);
	}

	@Override
	public void deleteSuggestion(SuggestionVo vo) throws Exception {
		suggestionMapper.deleteSuggestion(vo);
	}

	@Override
	public String selectSuggestionOpinionIdx() throws Exception {
		return suggestionMapper.selectSuggestionOpinionIdx();
	}

	@Override
	public void insertSuggestionOpinion(SuggestionOpinionVo vo) throws Exception {
		suggestionMapper.insertSuggestionOpinion(vo);
	}

	@Override
	public List<SuggestionOpinionVo> selectSuggestionOpinionList() throws Exception {
		return suggestionMapper.selectSuggestionOpinionList();
	}

	@Override
	public SuggestionOpinionVo selectParentSuggestionOpinion(SuggestionOpinionVo vo) throws Exception {
		return suggestionMapper.selectParentSuggestionOpinion(vo);
	}

	@Override
	public void updateChildSuggestionOpinion(SuggestionOpinionVo topOpnVo) throws Exception {
		suggestionMapper.updateChildSuggestionOpinion(topOpnVo);
	}

}
