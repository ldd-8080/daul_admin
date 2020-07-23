package egovframework.com.board.service;

import java.util.List;
import java.util.Map;

import egovframework.com.board.vo.BoardVo;
import egovframework.com.cmmn.util.FileVo;

public interface BoardService {
	
	public List<Map<String,String>> selectBoardList() throws Exception;
	public BoardVo selectBoard(BoardVo vo) throws Exception;
	void insertBoard(BoardVo vo)throws Exception;
	public List<Map<String,String>> selectBoardFile(BoardVo vo) throws Exception;
	public FileVo selectDownloadFile(FileVo vo) throws Exception;
	public void insertFile(FileVo fileVo) throws Exception ;	
	public String selectNoticeIdx() throws Exception;
}
