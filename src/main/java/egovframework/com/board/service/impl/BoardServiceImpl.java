package egovframework.com.board.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.board.mapper.BoardMapper;
import egovframework.com.board.service.BoardService;
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

}
