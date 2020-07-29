package egovframework.com.contest.service;

import java.util.List;
import java.util.Map;

import egovframework.com.cmmn.util.FileVo;
import egovframework.com.contest.vo.ContestVo;
import egovframework.com.contest.vo.ContestOpinionVo;

public interface ContestService {
	List<ContestVo> selectContestList() throws Exception;
	String	selectAdminContestIdx() throws Exception;
	int registContest(ContestVo vo) throws Exception;
	void insertFile(FileVo vo) throws Exception;
	ContestVo selectContest(ContestVo vo) throws Exception;
	List<Map<String,String>> selectContestFile(ContestVo vo) throws Exception;
	void deleteFile(FileVo vo) throws Exception;
	int updateContest(ContestVo vo) throws Exception;
	List<ContestOpinionVo> selectContestOpinionList(ContestVo vo) throws Exception;
}
