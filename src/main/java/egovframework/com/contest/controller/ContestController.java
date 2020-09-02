package egovframework.com.contest.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.com.cmmn.util.CmmnUtil;
import egovframework.com.cmmn.util.FileUtil;
import egovframework.com.cmmn.util.FileVo;
import egovframework.com.contest.service.ContestService;
import egovframework.com.contest.vo.ContestOpinionVo;
import egovframework.com.contest.vo.ContestVo;
import egovframework.com.user.vo.UserVo;

@Controller
@RequestMapping(value = "/contest")
public class ContestController {
	protected Log log = LogFactory.getLog(ContestController.class);

	@Resource(name = "contestService")
	private ContestService contestService;

	@Resource(name = "fileUtil")
	private FileUtil fileUtil;

	@Resource(name = "cmmnUtil")
	private CmmnUtil cmmnUtil;

	@RequestMapping(value = "/contestListPage.do")
	public String suggestionListPage() {
		
		return "contest/contestList";
	}

	@RequestMapping(value = "/getContestList.do")
	public ResponseEntity<?> contestList(ModelMap model, ContestVo vo) throws Exception {
		List<ContestVo> contestList = null;

		try {
			log.debug("[열린제안] 열린제안 목록 조회");
			contestList = contestService.selectContestList(vo);
		} catch (Exception e) {
			log.debug("[열린제안] 열린제안 목록 조회 실패");
		}

		log.debug("[열린제안] 열린제안 목록 조회 완료");
		return new ResponseEntity<>(contestList, HttpStatus.OK);
	}


	@RequestMapping(value = "/contestRegistPage.do")
	public String contestRegistPage(ModelMap model) {
		model.addAttribute("contestVo", new ContestVo());

		return "contest/contestRegist";
	}

	@RequestMapping(value = "/contestRegist.do", method = RequestMethod.POST)
	public String contestRegist(HttpSession session, ContestVo vo, BindingResult bindingResult, HttpServletRequest request) throws Exception {
		
		ContestValidator contestValidator = new ContestValidator();
		contestValidator.validate(vo, bindingResult);
		
		if(bindingResult.hasErrors()) {
			return "contest/contestRegist";
		}
		
		try {
		
			UserVo userVo = (UserVo) session.getAttribute("login");
			vo.setCreate_user(userVo.getUser_id());
			vo.setAdmin_contest_idx(contestService.selectAdminContestIdx());
	
			System.out.println(vo);
	
			log.debug("[나눔공모] 나눔공모 등록");
			int result = contestService.registContest(vo);
	
			if (result > 0) {
				FileVo fileVo = new FileVo();
	
				fileVo.setCreate_user(vo.getCreate_user());
				fileVo.setIdx(vo.getAdmin_contest_idx());
	
				List<FileVo> fileList = fileUtil.parseFileInfo(fileVo, request);
	
				log.debug("[나눔공모] 나눔공모 파일 등록");
				for (int i = 0; i < fileList.size(); i++) {
					contestService.insertFile(fileList.get(i));
				}
	
			}
			return "redirect:/contest/contestListPage.do";
		}catch(Exception e){
			e.printStackTrace();
			return "common/error.jsp";
		}
	}

	@RequestMapping(value = "contestDetail.do")
	public String contestDetail(@RequestParam("admin_contest_idx") String admin_contest_idx, ModelMap model)
			throws Exception {

		ContestVo vo = new ContestVo();
		List<Map<String, String>> fileList = null;

		List<ContestOpinionVo> contestOpinionList = null;

		try {
			vo.setAdmin_contest_idx(admin_contest_idx);
			vo = contestService.selectContest(vo);

			fileList = contestService.selectContestFile(vo);
			contestOpinionList = contestService.selectContestOpinionList(vo);

		} catch (Exception e) {

		}

		System.out.println(" ##################  " + contestOpinionList);
		model.addAttribute("contestVo", vo);
		model.addAttribute("contestFile", fileList);
		model.addAttribute("contestOpinionList", contestOpinionList);

		return "contest/contestDetail";
	}

	@RequestMapping(value = "/getContestOpinionList.do", method = RequestMethod.GET)
	public ResponseEntity<?> getContestOpinionList(@RequestParam("admin_contest_idx") String admin_contest_idx,
			ModelMap model) throws Exception {

		List<ContestOpinionVo> contestOpinionList = null;
		ContestVo vo = new ContestVo();
		vo.setAdmin_contest_idx(admin_contest_idx);

		try {
			contestOpinionList = contestService.selectContestOpinionList(vo);
		} catch (Exception e) {
			log.debug("[열린제안] 열린제안 목록 조회 실패");
		}

		return new ResponseEntity<>(contestOpinionList, HttpStatus.OK);
	}

	@RequestMapping(value="/contestOpinionDelete.do",method=RequestMethod.GET)
	public ResponseEntity<?>  contestOpinionDelete(@RequestParam("user_contest_idx") String user_contest_idx) throws Exception{
		
		System.out.println("user_contest_idx = " + user_contest_idx);
		ContestOpinionVo vo = new ContestOpinionVo();
		vo.setUser_contest_idx(user_contest_idx);
		contestService.deleteContestOpinion(vo);
		
		
		return new ResponseEntity<>("success", HttpStatus.OK);
	}
	
	
	
	@RequestMapping(value = "/getContestOpinionFileList.do", method = RequestMethod.GET)
	public ResponseEntity<?> getContestOpinionFileList(@RequestParam("user_contest_idx") String user_contest_idx,
			ModelMap model) throws Exception {

		List<FileVo> contestOpinionFileList = null;
		ContestOpinionVo vo = new ContestOpinionVo();
		vo.setUser_contest_idx(user_contest_idx);

		try {
			contestOpinionFileList = contestService.selectContestOpinionFileList(vo);
		} catch (Exception e) {
			log.debug("[열린제안] 열린제안 목록 조회 실패");
		}

		return new ResponseEntity<>(contestOpinionFileList, HttpStatus.OK);
	}
	
	@RequestMapping(value = "deleteAttachFile")
	public ResponseEntity<?> deleteAttachFile(ContestVo vo, HttpServletRequest request) throws Exception {
		
		String s_file_name = request.getParameter("file_name");
		FileVo fileVo = new FileVo();
		
		try {
			fileVo.setSave_file_name(s_file_name);

			contestService.deleteFile(fileVo);
		} catch (Exception e) {
			return new ResponseEntity<>("error", HttpStatus.OK);
		}

		return new ResponseEntity<>("success", HttpStatus.OK);
	}

	
	@RequestMapping(value = "contestModify")
	public ResponseEntity<?> contestModify(HttpSession session, ContestVo vo, HttpServletRequest request, BindingResult bindingResult) throws Exception {
		try {
			
			ContestValidator contestValidator = new ContestValidator();
			contestValidator.validate(vo, bindingResult);
			
			if(bindingResult.hasErrors()) {
				return new ResponseEntity<>(cmmnUtil.getValid(bindingResult), HttpStatus.OK);
			}
			
			UserVo userVo = (UserVo) session.getAttribute("login");
			vo.setUpdate_user(userVo.getUser_id());
			log.debug("[나눔공모] 나눔공모 수정");
			int result = contestService.updateContest(vo);
			
			if (result > 0) {
				FileVo fileVo = new FileVo();
				
				fileVo.setCreate_user(userVo.getUser_id());
				fileVo.setIdx(vo.getAdmin_contest_idx());
				
				List<FileVo> fileList = fileUtil.parseFileInfo(fileVo, request);
				
				for (int i = 0; i < fileList.size(); i++) {
					log.debug("[나눔공모] 나눔공모 파일 등록");
					contestService.insertFile(fileList.get(i));
				}
			}
		} catch (Exception e) {
			log.debug("[나눔공모] 나눔공모 수정 실패");
			e.printStackTrace();
		}
		
		log.debug("[나눔공모] 나눔공모 수정 완료");
		return new ResponseEntity<>(vo.getAdmin_contest_idx(), HttpStatus.OK);
	}

	@RequestMapping(value = "/downloadFile.do", method = RequestMethod.GET)
	public void downloadFile(HttpServletResponse response, @RequestParam("save_file_name") String save_file_name, @RequestParam("type") String type) throws Exception {
		try {
			FileVo fileVo = new FileVo();
			fileVo.setIdx(save_file_name);
			
			if ("admin".equals(type)) {
				fileVo = contestService.selectDownloadFile(fileVo);
			} else {
				fileVo = contestService.selectDownloadFile2(fileVo);
			}
			
			log.debug("[나눔공모] 나눔공모 첨부파일 다운로드");
			fileUtil.downloadFile(response, fileVo);
		} catch (Exception e) {
			log.debug("[나눔공모] 나눔공모 첨부파일 다운로드 실패");
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = "getSaveFileName.do")
	public ResponseEntity<?> getSaveFileName(HttpServletRequest requeset, HttpServletResponse response,
			@RequestParam("user_contest_idx") String user_contest_idx) throws Exception {
		ContestOpinionVo vo = new ContestOpinionVo();
		vo.setUser_contest_idx(user_contest_idx);
		List<FileVo> opinionFileList = null;
		opinionFileList = contestService.selectContestOpinionFileList(vo);
		
		return new ResponseEntity<>(opinionFileList, HttpStatus.OK);
	}
	
	@RequestMapping(value="/contestDelete.do", method=RequestMethod.POST)
	public String contestDelete(ContestVo vo, HttpSession session) throws Exception {
		try {
			UserVo userVo = (UserVo) session.getAttribute("login");
			vo.setUpdate_user(userVo.getUser_id());
			
			log.debug("[나눔공모] 나눔공모 삭제");
			int result = contestService.deleteContest(vo);
			
			if (result > 0) {
				log.debug("[나눔공모] 나눔공모 admin 첨부파일 삭제");
				contestService.deleteAllAdminFile(vo);
				
				log.debug("[나눔공모] 나눔공모 user 제안 삭제");
				contestService.deleteAllUserContest(vo);
				
				log.debug("[나눔공모] 나눔공모 user 첨부파일 삭제");
				//contestService.deleteAllUserFile(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		log.debug("[나눔공모] 나눔공모 삭제 완료");
		return "redirect:/contest/contestListPage.do";
	}
}
