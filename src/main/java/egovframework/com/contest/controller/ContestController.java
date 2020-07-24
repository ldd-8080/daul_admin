package egovframework.com.contest.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import egovframework.com.cmmn.util.FileUtil;
import egovframework.com.cmmn.util.FileVo;
import egovframework.com.contest.service.ContestService;
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
		return "contest/contestList";
	}
	
	@RequestMapping(value="/contestRegistPage.do")
	public String contestRegistPage(ModelMap model) {
		model.addAttribute("contestVo",new ContestVo());
		
		return "contest/contestRegist";
	}
	
	@RequestMapping(value="/contestRegist.do", method=RequestMethod.POST)
	public String contestRegist(HttpSession session, ContestVo vo,MultipartFile[] noticeFile, MultipartFile[] repFile
			, MultipartFile[] propFile) throws Exception{
		
		UserVo userVo = (UserVo) session.getAttribute("login");
	    vo.setCreate_user(userVo.getUser_id());		    
	    vo.setSurvey_idx(contestService.selectSurveyIdx());
	    
		System.out.println(vo);

		FileVo fileVo = new FileVo();
		
		fileVo.setCreate_user(vo.getCreate_user());
		fileVo.setIdx(vo.getcontest_idx());
		
		List<FileVo> fileList = fileUtil.parseFileInfo(fileVo, publicFile, repFile);

		return "redirect:/contest/contestList.do";
	}
}
