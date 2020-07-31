package egovframework.com.suggestion.mapper;

import java.util.List;
import java.util.Map;

import egovframework.com.cmmn.util.FileVo;
import egovframework.com.suggestion.vo.SuggestionOpinionVo;
import egovframework.com.suggestion.vo.SuggestionVo;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("suggestionMapper")
public interface SuggestionMapper {

	String selectSuggestionIdx() throws Exception;

	int registSuggestion(SuggestionVo vo) throws Exception;

	void insertFile(FileVo fileVo) throws Exception;

	List<SuggestionVo> selectSuggestionList(SuggestionVo vo) throws Exception;

	SuggestionVo selectSuggestion(SuggestionVo vo) throws Exception;

	List<Map<String, String>> selectSuggestionFile(FileVo fileVo) throws Exception;

	void deleteFile(FileVo fileVo) throws Exception;

	void updateSuggestion(SuggestionVo vo) throws Exception;

	void deleteSuggestion(SuggestionVo vo) throws Exception;

	String selectSuggestionOpinionIdx() throws Exception;

	void insertSuggestionOpinion(SuggestionOpinionVo vo) throws Exception;

	List<SuggestionOpinionVo> selectSuggestionOpinionList(SuggestionVo vo) throws Exception;

	SuggestionOpinionVo selectParentSuggestionOpinion(SuggestionOpinionVo vo) throws Exception;

	void updateChildSuggestionOpinion(SuggestionOpinionVo topOpnVo) throws Exception;

	void updateSuggestionOpinion(SuggestionOpinionVo vo) throws Exception;

	void deleteSuggestionOpinion(SuggestionOpinionVo vo) throws Exception;

}
