package egovframework.com.contest.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import egovframework.com.cmmn.util.FileUtil;
import egovframework.com.cmmn.util.FileVo;
import egovframework.com.contest.service.ContestService;
import egovframework.com.contest.vo.ContestVo;
import egovframework.com.suggestion.vo.SuggestionOpinionVo;
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
		List<SuggestionOpinionVo> suggestionOpinionList = null;
		
		try {
			vo.setAdmin_contest_idx(admin_contest_idx);
			vo = contestService.selectContest(vo);
			
			fileList = contestService.selectContestFile(vo);
			
			
		}catch(Exception e) {
			
		}
		
		model.addAttribute("contestVo", vo);
		model.addAttribute("contestFile", fileList);
		
		
		return "contest/contestDetail";
	}
	
}
