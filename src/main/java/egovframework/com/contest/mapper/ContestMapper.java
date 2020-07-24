package egovframework.com.contest.mapper;

import java.util.List;

import egovframework.com.contest.vo.ContestVo;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("contestMapper")
public interface ContestMapper {
	List<ContestVo> selectContestList() throws Exception;
}
