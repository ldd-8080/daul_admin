package egovframework.com.contest.controller;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.com.cmmn.util.FileUtil;
import egovframework.com.contest.service.ContestService;
import egovframework.com.contest.vo.ContestVo;

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
}
