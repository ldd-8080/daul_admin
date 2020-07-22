package egovframework.com.board.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import egovframework.com.board.mapper.BoardMapper;
import egovframework.com.board.service.BoardService;
import egovframework.com.board.vo.BoardVo;
import egovframework.com.cmmn.util.FileUtils;
import egovframework.com.cmmn.util.FileVo;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("boardService")
public class BoardServiceImpl extends EgovAbstractServiceImpl implements BoardService {
	
	@Resource(name="boardMapper")
	private BoardMapper boardMapper;
	
	@Override
	public List<Map<String,String>> selectBoardList() throws Exception{
		List<Map<String,String>> list = new ArrayList();
		
		list = boardMapper.selectBoardList();
		
		return list;
		
	}
	
	@Override
	public List<Map<String,String>> selectBoardFile(BoardVo vo) throws Exception{
		List<Map<String,String>> list = new ArrayList();
		
		list = boardMapper.selectBoardFile(vo);
		
		return list;
		
	}
	

	@Override
	public BoardVo selectBoard(BoardVo vo) throws Exception{
		return boardMapper.selectBoard(vo);
	}
	
	@Override
	public void insertBoard(BoardVo vo, MultipartFile[] file) throws Exception{
		vo.setBoard_idx(boardMapper.selectBoardIdx());
		boardMapper.insertBoard(vo);
		
		FileVo fileVo = new FileVo();
		fileVo.setCreate_user(vo.getReg_user());
		fileVo.setIdx(vo.getBoard_idx());
		FileUtils fileUtils = new FileUtils();
		List<FileVo> fileList = fileUtils.parseFileInfo(fileVo, file);
		for(int i = 0; i<fileList.size(); i++) {
			boardMapper.insertFile(fileList.get(i));
		}
		
	}
	
	@Override
	public BoardVo selectDownloadFile(BoardVo vo) throws Exception{
		return boardMapper.selectDownloadFile(vo);
	}
	
	
}
























