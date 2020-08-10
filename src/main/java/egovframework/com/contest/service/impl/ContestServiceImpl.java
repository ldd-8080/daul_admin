package egovframework.com.contest.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.cmmn.util.FileVo;
import egovframework.com.contest.mapper.ContestMapper;
import egovframework.com.contest.service.ContestService;
import egovframework.com.contest.vo.ContestOpinionVo;
import egovframework.com.contest.vo.ContestVo;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;


@Service("contestService")
public class ContestServiceImpl extends EgovAbstractServiceImpl implements ContestService {
	@Resource(name="contestMapper")
	private ContestMapper contestMapper;

	@Override
	public List<ContestVo> selectContestList(ContestVo vo) throws Exception {
		return contestMapper.selectContestList(vo);
	}

	@Override
	public String selectAdminContestIdx() throws Exception {
		String adminContestIdx = contestMapper.selectAdminContestIdx();
		return adminContestIdx;
	}

	@Override
	public int registContest(ContestVo vo) throws Exception {
		return contestMapper.registContest(vo);
	}

	@Override
	public void insertFile(FileVo vo) throws Exception {
		contestMapper.insertFile(vo);
	}

	@Override
	public ContestVo selectContest(ContestVo vo) throws Exception {
		return contestMapper.selectContest(vo);
	}

	@Override
	public List<Map<String, String>> selectContestFile(ContestVo vo) throws Exception {
		List<Map<String,String>> list = new ArrayList<Map<String, String>>();
		list = contestMapper.selectContestFile(vo);
		return list;
	}

	@Override
	public void deleteFile(FileVo vo) throws Exception {
		contestMapper.deleteFile(vo);
		
	}

	@Override
	public int updateContest(ContestVo vo) throws Exception {
		// TODO Auto-generated method stub
		return contestMapper.updateContest(vo);
	}

	@Override
	public List<ContestOpinionVo> selectContestOpinionList(ContestVo vo) throws Exception {
		
		return contestMapper.selectContestOpinionList(vo);
	}

	@Override
	public FileVo selectDownloadFile(FileVo vo) throws Exception {
		return contestMapper.selectDownloadFile(vo);
	}

	@Override
	public FileVo selectDownloadFile2(FileVo vo) throws Exception {
		return contestMapper.selectDownloadFile2(vo);
	}
	
	@Override
	public List<FileVo> selectContestOpinionFileList(ContestOpinionVo vo) throws Exception {
		
		return contestMapper.selectContestOpinionFileList(vo);
	}

	@Override
	public void deleteContestOpinion(ContestOpinionVo vo) throws Exception {
		contestMapper.deleteContestOpinion(vo);
		
	}

	@Override
	public int deleteContest(ContestVo vo) throws Exception {
		return contestMapper.deleteContest(vo);
	}

	@Override
	public void deleteAllAdminFile(ContestVo vo) throws Exception {
		contestMapper.deleteAllAdminFile(vo);
	}

	@Override
	public void deleteAllUserContest(ContestVo vo) throws Exception {
		contestMapper.deleteAllUserContest(vo);
	}

	@Override
	public void deleteAllUserFile(ContestVo vo) throws Exception {
		contestMapper.deleteAllUserFile(vo);
	}



}
