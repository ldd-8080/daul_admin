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
	public int insertSuggestion(SuggestionVo vo) throws Exception {
		return suggestionMapper.insertSuggestion(vo);
	}

	@Override
	public void insertFile(FileVo fileVo) throws Exception {
		suggestionMapper.insertFile(fileVo);
	}

	@Override
	public List<SuggestionVo> selectSuggestionList(SuggestionVo vo) throws Exception {
		return suggestionMapper.selectSuggestionList(vo);
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
	public int updateSuggestion(SuggestionVo vo) throws Exception {
		return suggestionMapper.updateSuggestion(vo);
	}

	@Override
	public int deleteSuggestion(SuggestionVo vo) throws Exception {
		return suggestionMapper.deleteSuggestion(vo);
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
	public List<SuggestionOpinionVo> selectSuggestionOpinionList(SuggestionVo vo) throws Exception {
		return suggestionMapper.selectSuggestionOpinionList(vo);
	}

	@Override
	public SuggestionOpinionVo selectParentSuggestionOpinion(SuggestionOpinionVo vo) throws Exception {
		return suggestionMapper.selectParentSuggestionOpinion(vo);
	}

	@Override
	public void updateChildSuggestionOpinion(SuggestionOpinionVo topOpnVo) throws Exception {
		suggestionMapper.updateChildSuggestionOpinion(topOpnVo);
	}

	@Override
	public void updateSuggestionOpinion(SuggestionOpinionVo vo) throws Exception {
		suggestionMapper.updateSuggestionOpinion(vo);
	}

	@Override
	public void deleteSuggestionOpinion(SuggestionOpinionVo vo) throws Exception {
		suggestionMapper.deleteSuggestionOpinion(vo);
	}

	@Override
	public void deleteAllFile(SuggestionVo vo) throws Exception {
		suggestionMapper.deleteAllFile(vo);
	}

	@Override
	public void deleteAllOpinion(SuggestionVo vo) throws Exception {
		suggestionMapper.deleteAllOpinion(vo);
	}

	@Override
	public FileVo selectDownloadFile(FileVo fileVo) throws Exception {
		return suggestionMapper.selectDownloadFile(fileVo);
	}

}
