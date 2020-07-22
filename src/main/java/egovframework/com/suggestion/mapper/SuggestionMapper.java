package egovframework.com.suggestion.mapper;

import java.util.List;
import java.util.Map;

import egovframework.com.cmmn.util.FileVo;
import egovframework.com.suggestion.vo.SuggestionVo;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("suggestionMapper")
public interface SuggestionMapper {

	String selectSuggestionIdx() throws Exception;

	int registSuggestion(SuggestionVo vo) throws Exception;

	void insertFile(FileVo fileVo) throws Exception;

	List<SuggestionVo> selectSuggestionList() throws Exception;

	SuggestionVo selectSuggestion(SuggestionVo vo) throws Exception;

	List<Map<String, String>> selectSuggestionFile(FileVo fileVo) throws Exception;

	void deleteFile(FileVo fileVo) throws Exception;

	void updateSuggestion(SuggestionVo vo) throws Exception;

	void deleteSuggestion(SuggestionVo vo) throws Exception;

}
