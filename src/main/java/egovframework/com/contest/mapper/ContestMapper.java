package egovframework.com.contest.mapper;

import java.util.List;
import java.util.Map;

import egovframework.com.cmmn.util.FileVo;
import egovframework.com.contest.vo.ContestOpinionVo;
import egovframework.com.contest.vo.ContestVo;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("contestMapper")
public interface ContestMapper {
	List<ContestVo> selectContestList(ContestVo vo) throws Exception;
	String selectAdminContestIdx() throws Exception;
	int registContest(ContestVo vo) throws Exception;
	void insertFile(FileVo vo) throws Exception;
	ContestVo selectContest(ContestVo vo) throws Exception;
	List<Map<String,String>> selectContestFile(ContestVo vo) throws Exception;
	void deleteFile(FileVo vo) throws Exception;
	int updateContest(ContestVo vo) throws Exception;
	List<ContestOpinionVo> selectContestOpinionList(ContestVo vo) throws Exception;
	FileVo selectDownloadFile2(FileVo vo) throws Exception;
	List<FileVo> selectContestOpinionFileList(ContestOpinionVo vo) throws Exception;
	FileVo selectDownloadFile(FileVo vo) throws Exception;
	void deleteContestOpinion(ContestOpinionVo vo) throws Exception;
	int deleteContest(ContestVo vo) throws Exception;
	void deleteAllAdminFile(ContestVo vo) throws Exception;
	void deleteAllUserContest(ContestVo vo) throws Exception;
	void deleteAllUserFile(ContestVo vo) throws Exception;
}
