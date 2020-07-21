package egovframework.com.suggestion.service;

import java.util.List;
import java.util.Map;

import egovframework.com.cmmn.util.FileVo;
import egovframework.com.suggestion.vo.SuggestionVo;

public interface SuggestionService {

	String selectSuggestionIdx() throws Exception;

	int registSuggestion(SuggestionVo vo) throws Exception;

	void insertFile(Map<String, Object> map) throws Exception;

	List<SuggestionVo> selectSuggestionList() throws Exception;

	SuggestionVo selectSuggestion(SuggestionVo vo) throws Exception;

	List<Map<String, String>> selectSuggestionAttach(FileVo fileVo) throws Exception;

	void deleteFile(FileVo fileVo) throws Exception;

}
