package egovframework.com.board.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import egovframework.com.board.service.BoardService;
import egovframework.com.board.vo.BoardVo;
import egovframework.com.cmmn.util.CmmnUtil;
import egovframework.com.cmmn.util.FileUtil;
import egovframework.com.cmmn.util.FileVo;
import egovframework.com.cmmn.util.ProfileCls;
import egovframework.com.user.vo.UserVo;
@Controller
@RequestMapping(value = "/board")
public class BoardController {
	
	@Autowired(required=false)
	private ProfileCls profileCls;
	protected Log log = LogFactory.getLog(BoardController.class);

	@Resource(name = "boardService")
	private BoardService boardService;
	
	@Resource(name="fileUtil")
	private FileUtil fileUtil;

	@Resource(name = "cmmnUtil")
	private CmmnUtil cmmnUtil;
	
	
	@RequestMapping(value = "/boardListPage.do")
	public String boardListPage() {
		return "board/boardList";
	}
		
	@RequestMapping(value="/getBoardList.do")
	public ResponseEntity<?> boardList(ModelMap model, BoardVo vo) throws Exception{
		List<BoardVo> noticeList =null;
		log.debug(profileCls.getRootPath()); // C:/home/profile 라는 문자열이 나옵니다.
		
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
		BoardVo vo = new BoardVo();
		vo.setNotice_idx(boardService.selectNoticeIdx());
		
		model.addAttribute("boardVo", vo);
		return "board/boardWrite";
	}
	
	
	@RequestMapping(value ="/boardInsert.do", method=RequestMethod.POST)
	public String boardInsert(HttpSession session,BoardVo vo, BindingResult bindingResult, HttpServletRequest request) 
    		throws Exception {
		try {
			BoardValidator boardValidator = new BoardValidator();
			boardValidator.validate(vo, bindingResult);
			List<Map<String, Object>> imgNameList = new ArrayList<Map<String, Object>>();
			   
			if(bindingResult.hasErrors()) {
				return "board/boardWrite";
			}
			
			if(vo.getImgFileName() != null) {
				String imgFileName_arr = vo.getImgFileName();
				String[] imgFileNameArr = imgFileName_arr.split(",");
				
				for(int imgFileNameArrCnt = 0; imgFileNameArrCnt < imgFileNameArr.length; imgFileNameArrCnt++) {
					Map<String,Object> imgName = new HashMap<String,Object>();
					imgName.put("notice_idx", vo.getNotice_idx());
					imgName.put("save_file_name", imgFileNameArr[imgFileNameArrCnt]);
					imgNameList.add(imgName);
					
				}
		
				boardService.deleteImgFile(imgNameList);
			}	
			UserVo userVo = (UserVo) session.getAttribute("login");
			   
			//vo.setNotice_idx(boardService.selectNoticeIdx());
			vo.setCreate_user(userVo.getUser_id());
			
			FileVo fileVo = new FileVo();
				
			fileVo.setCreate_user(vo.getCreate_user());
			fileVo.setIdx(vo.getNotice_idx());
		
			List<FileVo> fileList = fileUtil.parseFileInfo(fileVo, request);
			System.out.println("fileList == " + fileList);
			
			for(int i = 0; i<fileList.size(); i++) {
				fileVo = fileList.get(i);
				System.out.println("attach_type = " + fileVo.getAttach_type());
				try {
					if(!fileVo.getAttach_type().equals("files")) {
						boardService.insertFile(fileList.get(i));
					}
				}catch(NullPointerException e) {
					System.out.println("nullPoint PASS");
				}
			}		
			//vo.setReg_user(userVo.getUser_seq());
		    boardService.insertBoard(vo);
		}catch(Exception e){
			log.debug("BoardController > /boardList.do > Exception");
			e.printStackTrace();
			return "common/error.jsp";
		}
		
		return "redirect:/board/boardListPage.do";
    }
	
	@RequestMapping(value = "noticeModify",method = RequestMethod.POST)
	public ResponseEntity<?> noticeModify(HttpSession session, BoardVo vo, BindingResult bindingResult, HttpServletRequest request) throws Exception {
		try {
			
			BoardValidator boardValidator = new BoardValidator();
			boardValidator.validate(vo, bindingResult);
			List<Map<String, Object>> imgNameList = new ArrayList<Map<String, Object>>();
			
			if(vo.getImgFileName() != null) {
				String imgFileName_arr = vo.getImgFileName();
				String[] imgFileNameArr = imgFileName_arr.split(",");
				
				for(int imgFileNameArrCnt = 0; imgFileNameArrCnt < imgFileNameArr.length; imgFileNameArrCnt++) {
					Map<String,Object> imgName = new HashMap<String,Object>();
					imgName.put("notice_idx", vo.getNotice_idx());
					imgName.put("save_file_name", imgFileNameArr[imgFileNameArrCnt]);
					imgNameList.add(imgName);
				}
					
				boardService.deleteImgFile(imgNameList);
			}
			UserVo userVo = (UserVo) session.getAttribute("login");
			vo.setUpdate_user(userVo.getUser_id());
			
			if(bindingResult.hasErrors()) {
				return new ResponseEntity<>(cmmnUtil.getValid(bindingResult), HttpStatus.OK);
			}
			
			log.debug("[공지사항] 공지사항 수정");
			int result = boardService.updateNotice(vo);
			
			if (result > 0) {
				FileVo fileVo = new FileVo();
				
				fileVo.setCreate_user(userVo.getUser_id());
				fileVo.setIdx(vo.getNotice_idx());
				
				List<FileVo> fileList = fileUtil.parseFileInfo(fileVo, request);
				
				log.debug("[공지사항] 공지사항 파일 등록" + fileList.size() + "," + fileVo.getAttach_type());
				System.out.println("attach_type = " + fileVo.getAttach_type());
				for (int i = 0; i < fileList.size(); i++) {
					fileVo = fileList.get(i);
					try {
						if(!fileVo.getAttach_type().equals("files")) {
							boardService.insertFile(fileList.get(i));
						}
					}catch(NullPointerException e) {
						System.out.println("nullPoint PASS");
					}
				
				}
			}
		}catch(Exception e){
			log.debug("[공지사항] 공지사항 수정 실패");
			e.printStackTrace();
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
	public void downloadFile(HttpServletResponse response, @RequestParam("save_file_name") String save_file_name) throws Exception{
		try {
			FileVo fileVo = new FileVo();
			fileVo.setIdx(save_file_name);
			
			fileVo = boardService.selectDownloadFile(fileVo);

			log.debug("[공지사항] 공지사항 첨부파일 다운로드");
			fileUtil.downloadFile(response, fileVo);
		} catch (Exception e) {
			log.debug("[공지사항] 공지사항 첨부파일 다운로드 실패");
			e.printStackTrace();
		}
	 }
	
	@RequestMapping(value="/uploadSummernoteImageFile.do",method = RequestMethod.POST)
	public ResponseEntity<?> uploadSummernoteImageFile(HttpSession session, @RequestParam("files") MultipartFile multipartFile, @RequestParam("idx") String idx) throws Exception {
		System.out.println(multipartFile);
		
		String fileRoot = profileCls.getRootPath();	//저장될 외부 파일 경로
		String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
		
		String savedFileName = UUID.randomUUID().toString().replaceAll("-", "") + extension;
		
		File targetFile = new File(fileRoot + savedFileName);	
		
		try {	
			UserVo userVo = (UserVo) session.getAttribute("login");
			FileVo fileVo = new FileVo();
			
			
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
		
			fileVo.setIdx(idx);
    		fileVo.setOrg_file_name(originalFileName);
    		fileVo.setSave_file_name(savedFileName);
    		fileVo.setFile_size((int)multipartFile.getSize());
    		fileVo.setCreate_user(userVo.getUser_id());
    		fileVo.setAttach_type(multipartFile.getName());
    		
    		boardService.insertFile(fileVo);
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
			e.printStackTrace();
		}
		
		//이미지를 저장하고 return값으로 save_file_name을 넘긴다
		return new ResponseEntity<>("/cmmn/getImg.do?save_file_name=" + savedFileName, HttpStatus.OK);
	}
	
}
