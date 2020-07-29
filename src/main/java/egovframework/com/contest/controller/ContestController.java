package egovframework.com.contest.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import egovframework.com.cmmn.util.FileUtil;
import egovframework.com.cmmn.util.FileVo;
import egovframework.com.contest.service.ContestService;
import egovframework.com.contest.vo.ContestOpinionVo;
import egovframework.com.contest.vo.ContestVo;
import egovframework.com.user.vo.UserVo;

@Controller
@RequestMapping(value="/contest")
public class ContestController {
	protected Log log = LogFactory.getLog(ContestController.class);
	
	@Resource(name="contestService")
	private ContestService contestService;
	
	@Resource(name="fileUtil")
	private FileUtil fileUtil;
	
	@RequestMapping(value="/contestList.do")
	public String contestList(ModelMap model) throws Exception{
		
		List<ContestVo> contestList = null;
		
		try {
			contestList = contestService.selectContestList();
		}catch(Exception e) {
			
		}
		
		model.addAttribute("contestList",contestList);
		return "contest/contestList";
	}
	
	@RequestMapping(value="/contestRegistPage.do")
	public String contestRegistPage(ModelMap model) {
		model.addAttribute("contestVo",new ContestVo());
		
		return "contest/contestRegist";
	}
	
	@RequestMapping(value="/contestRegist.do", method=RequestMethod.POST)
	public String contestRegist(HttpSession session, ContestVo vo,MultipartFile[] repFile, MultipartFile[] noticeFile
			, MultipartFile[] propFile) throws Exception{
		
		UserVo userVo = (UserVo) session.getAttribute("login");
	    vo.setCreate_user(userVo.getUser_id());		    
	    vo.setAdmin_contest_idx(contestService.selectAdminContestIdx());
	    
		System.out.println(vo);
		
		log.debug("[나눔공모] 나눔공모 등록");
		int result = contestService.registContest(vo);
		
		
		if(result > 0) {
			FileVo fileVo = new FileVo();
			
			fileVo.setCreate_user(vo.getCreate_user());
			fileVo.setIdx(vo.getAdmin_contest_idx());
			
			List<FileVo> fileList = fileUtil.parseFileInfo(fileVo, repFile, propFile, noticeFile);
			
			log.debug("[나눔공모] 나눔공모 파일 등록");
			for(int i = 0; i<fileList.size(); i++) {
				contestService.insertFile(fileList.get(i));
			}
			
		}
		return "redirect:/contest/contestList.do";
	}
	
	@RequestMapping(value="contestDetail.do")
	public String contestDetail(@RequestParam("admin_contest_idx") String admin_contest_idx, ModelMap model ) throws Exception{
		
		ContestVo vo = new ContestVo();
		FileVo fileVo = new FileVo();
		List<Map<String, String>> fileList = null;
		List<ContestOpinionVo> contestOpinionList = null;
		

		
		try {
			vo.setAdmin_contest_idx(admin_contest_idx);
			vo = contestService.selectContest(vo);
			
			contestOpinionList = contestService.selectContestOpinionList(vo);			
			
			fileList = contestService.selectContestFile(vo);
			
			
		}catch(Exception e) {
			
		}
		
		System.out.println(" ##################  " + contestOpinionList);
		model.addAttribute("contestVo", vo);
		model.addAttribute("contestFile", fileList);
		model.addAttribute("contestOpinionList",contestOpinionList);
		
		
		return "contest/contestDetail";
	}
	
	@RequestMapping(value="deleteAttachFile")
	public ResponseEntity<?> deleteAttachFile(ContestVo vo,HttpServletRequest request) throws Exception{
		String s_file_name = request.getParameter("file_name");
		
		FileVo fileVo = new FileVo();
		try {
		fileVo.setSave_file_name(s_file_name);
		
		contestService.deleteFile(fileVo);
		}catch(Exception e) {
			return new ResponseEntity<>("error", HttpStatus.OK);
		}
		return new ResponseEntity<>("success", HttpStatus.OK);
	}
	
	
	@RequestMapping(value="contestModify")
	public String contestModify(HttpSession session, ContestVo vo,MultipartFile[] repFile, MultipartFile[] noticeFile
			, MultipartFile[] propFile ) throws Exception{
		
		System.out.println(vo);			
		log.debug("[나눔공모] 나눔공모 수정");
		
		UserVo userVo = (UserVo) session.getAttribute("login");
	    vo.setUpdate_user(userVo.getUser_id());		    
	    
		int result = contestService.updateContest(vo);
		if(result > 0) {
			FileVo fileVo = new FileVo();
			
			fileVo.setCreate_user(userVo.getUser_id());
			fileVo.setIdx(vo.getAdmin_contest_idx());
			
			List<FileVo> fileList = fileUtil.parseFileInfo(fileVo, repFile, propFile, noticeFile);
			
			log.debug("[나눔공모] 나눔공모 파일 등록" + fileList.size());
			
			for(int i = 0; i<fileList.size(); i++) {
				System.out.println("노노노 오오오 ");
				contestService.insertFile(fileList.get(i));
			}
			
		
		}
		
		
		
		return "redirect:/contest/contestList.do";
	}
}
