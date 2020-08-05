package egovframework.com.board.controller;

import java.io.File;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.commons.io.FileUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.com.board.service.BoardService;
import egovframework.com.board.vo.BoardVo;
import egovframework.com.cmmn.util.FileUtil;
import egovframework.com.cmmn.util.FileVo;
import egovframework.com.user.vo.UserVo;
@Controller
@RequestMapping(value = "/board")
public class BoardController {
	protected Log log = LogFactory.getLog(BoardController.class);
	
	@Resource(name = "boardService")
	private BoardService boardService;
	
	@Value("${file.downloadpath}")
	private String filePath;
	
	@Resource(name="fileUtil")
	private FileUtil fileUtil;

	@RequestMapping(value = "/boardListPage.do")
	public String boardListPage() {
		return "board/boardList";
	}
		
	@RequestMapping(value="/getBoardList.do")
	public ResponseEntity<?> boardList(ModelMap model, BoardVo vo) throws Exception{
		List<BoardVo> noticeList =null;
		try {
			 noticeList = boardService.selectBoardList(vo);
			
		}catch(Exception e){
			log.debug("BoardController > /boardList.do > Exception");
		}
		return new ResponseEntity<>(noticeList, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/boardDetail.do", method=RequestMethod.GET)
	public String boardDetail(ModelMap model, @RequestParam("notice_idx") String notice_idx) throws Exception{
		BoardVo vo = new BoardVo();
		vo.setNotice_idx(notice_idx);
		System.out.println(vo.getNotice_idx());
		BoardVo result = boardService.selectBoard(vo);
		System.out.println(result);
		
		List<Map<String, String>> boardFile  = boardService.selectBoardFile(vo);
		System.out.println(boardFile);
		model.addAttribute("boardVo", result);
		model.addAttribute("boardFile", boardFile);
		return "board/boardDetail";
	}
	
	
	
	@RequestMapping(value = "/boardWrite.do", method = RequestMethod.GET)
	public String boardWrite(ModelMap model) throws Exception {
		model.addAttribute("boardVo", new BoardVo());
		return "board/boardWrite";
	}
	
	
	@RequestMapping(value ="/boardInsert.do", method=RequestMethod.POST)
	public String boardInsert(HttpSession session,@ModelAttribute @Valid BoardVo vo,ModelMap model, HttpServletRequest request) 
    		throws Exception {

       UserVo userVo = (UserVo) session.getAttribute("login");
       
       vo.setNotice_idx(boardService.selectNoticeIdx());
         
       FileVo fileVo = new FileVo();
		
		fileVo.setCreate_user(vo.getCreate_user());
		fileVo.setIdx(vo.getNotice_idx());
		
		List<FileVo> fileList = fileUtil.parseFileInfo(fileVo, request);
		System.out.println("fileList == " + fileList);
		
		for(int i = 0; i<fileList.size(); i++) {
			fileVo = fileList.get(i);
			boardService.insertFile(fileVo);
		}		
        //vo.setReg_user(userVo.getUser_seq());
        boardService.insertBoard(vo);
       
        //boardService.insertBoard(commandMap);
         
        try {
			List<BoardVo> boardList = boardService.selectBoardList(vo);
			model.addAttribute("resultList",boardList);
		}catch(Exception e){
			log.debug("BoardController > /boardList.do > Exception");
		}
        
        return "redirect:/board/boardListPage.do";
    }
	
	@RequestMapping(value = "noticeModify",method = RequestMethod.POST)
	public ResponseEntity<?> noticeModify(HttpSession session, BoardVo vo, HttpServletRequest request) throws Exception {
		try {
			UserVo userVo = (UserVo) session.getAttribute("login");
			vo.setUpdate_user(userVo.getUser_id());
			
			log.debug("[공지사항] 공지사항 수정");
			int result = boardService.updateNotice(vo);
			
			if (result > 0) {
				FileVo fileVo = new FileVo();
				
				fileVo.setCreate_user(userVo.getUser_id());
				fileVo.setIdx(vo.getNotice_idx());
				
				List<FileVo> fileList = fileUtil.parseFileInfo(fileVo, request);
				
				log.debug("[공지사항] 공지사항 파일 등록" + fileList.size());
				
				for (int i = 0; i < fileList.size(); i++) {
					boardService.insertFile(fileList.get(i));
				}
			}
		}catch(Exception e){
			log.debug("[공지사항] 공지사항 수정 실패");
		}
		
		log.debug("[공지사항] 공지사항 수정 성공");
		return new ResponseEntity<>(vo.getNotice_idx(), HttpStatus.OK);
	}
	
	@RequestMapping(value="/noticeDelete.do", method=RequestMethod.POST)
	public String noticeDelete(BoardVo vo) throws Exception{
		System.out.println(vo);
		
		boardService.deleteNotice(vo);
		
		return "redirect:/board/boardListPage.do";
	}
	
	@RequestMapping(value="/noticeAttachFileDelete.do", method=RequestMethod.POST)
	public ResponseEntity<?> noticeAttachFileDelete(HttpServletRequest request) throws Exception {
		String s_file_name = request.getParameter("file_name");
		
		FileVo fileVo = new FileVo();
		
		try {
			fileVo.setSave_file_name(s_file_name);
			
			boardService.deleteFile(fileVo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return new ResponseEntity<>("success", HttpStatus.OK);
	}
	
	@RequestMapping(value="/downloadFile.do",method = RequestMethod.GET)
	public void downloadFile(HttpServletRequest requeset, HttpServletResponse response, @RequestParam("save_file_name") String save_file_name) throws Exception{
		System.out.println("2222 =  " + requeset.getParameter("save_file_name") );
		FileVo fileVo = new FileVo();
		fileVo.setIdx(save_file_name);
		fileVo = boardService.selectDownloadFile(fileVo);
		String stored_File_Name = fileVo.getSave_file_name();
		String original_File_Name = fileVo.getOrg_file_name();
		System.out.println("stored_File_Name = " + stored_File_Name + ", original_File_Name = " + original_File_Name);
		
		byte[] fileByte = FileUtils.readFileToByteArray(new File(filePath+ stored_File_Name));
	         
        response.setContentType("application/octet-stream");
        response.setContentLength(fileByte.length);
        response.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(original_File_Name,"UTF-8")+"\";");
        response.setHeader("Content-Transfer-Encoding", "binary");
        response.getOutputStream().write(fileByte);	          
        response.getOutputStream().flush();
        response.getOutputStream().close();
	 }
	
}
