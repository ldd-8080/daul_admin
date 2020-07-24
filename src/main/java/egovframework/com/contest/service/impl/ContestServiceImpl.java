package egovframework.com.contest.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.contest.mapper.ContestMapper;
import egovframework.com.contest.service.ContestService;
import egovframework.com.contest.vo.ContestVo;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;


@Service("contestService")
public class ContestServiceImpl extends EgovAbstractServiceImpl implements ContestService {
	@Resource(name="contestMapper")
	private ContestMapper contestMapper;

	@Override
	public List<ContestVo> selectContestList() throws Exception {
		return contestMapper.selectContestList();
	}

}
