package egovframework.com.board.mapper;

import java.util.List;
import java.util.Map;

import egovframework.com.board.vo.BoardVo;
import egovframework.com.cmmn.util.FileVo;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("boardMapper")
public interface BoardMapper {
	
	List<Map<String,String>> selectBoardList();
	BoardVo selectBoard(BoardVo vo) throws Exception;
	void insertBoard(BoardVo vo) throws Exception;
	void insertFile(FileVo vo) throws Exception;
	String selectBoardIdx() throws Exception;
	List<Map<String,String>> selectBoardFile(BoardVo vo);
	BoardVo selectDownloadFile(BoardVo vo) throws Exception;
}
