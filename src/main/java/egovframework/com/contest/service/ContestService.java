package egovframework.com.contest.service;

import java.util.List;

import egovframework.com.contest.vo.ContestVo;

public interface ContestService {
	List<ContestVo> selectContestList() throws Exception;
}
