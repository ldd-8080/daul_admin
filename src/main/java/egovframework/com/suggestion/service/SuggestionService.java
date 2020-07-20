package egovframework.com.suggestion.service;

import java.util.Map;

import egovframework.com.suggestion.vo.SuggestionVo;

public interface SuggestionService {

	String selectSuggestionIdx() throws Exception;

	int registSuggestion(SuggestionVo vo) throws Exception;

	void insertFile(Map<String, Object> map) throws Exception;

}
