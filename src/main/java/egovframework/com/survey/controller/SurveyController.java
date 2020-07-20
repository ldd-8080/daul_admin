package egovframework.com.survey.controller;

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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import egovframework.com.cmmn.interceptor.cmmnInterceptor;
import egovframework.com.survey.service.SurveyService;
import egovframework.com.survey.vo.SurveyVo;
import egovframework.com.user.vo.UserVo;

@Controller
@RequestMapping(value="/survey")
public class SurveyController {
	protected Log log = LogFactory.getLog(cmmnInterceptor.class);
	
	@Resource(name="surveyService")
	private SurveyService surveyService;
	
	@RequestMapping(value="/surveyList", method = RequestMethod.GET)
	public String surveyList(ModelMap model) throws Exception{
		try {
			List<Map<String, String>> surveyList = surveyService.selectSurveyList();
			model.addAttribute("surveyList",surveyList);
		}catch(Exception e) {
			
		}
		return "survey/surveyList";
	}
	
	@RequestMapping(value="/surveyRegistPage")
	public String surveyRegist(ModelMap model) {
		model.addAttribute("surveyVo", new SurveyVo());
		return "survey/surveyRegist";
	}
	
	@RequestMapping(value="/registSurvey.do", method=RequestMethod.POST)
	public ResponseEntity registSurvey(HttpSession session, @ModelAttribute SurveyVo vo,ModelMap model ,HttpServletRequest request, HttpServletResponse response, MultipartFile[] file) throws Exception{

		try {
			
			UserVo userVo = (UserVo) session.getAttribute("login");
		    vo.setCreate_user(userVo.getUser_id());		    

			System.out.println(vo);
			
			String question_content = vo.getQuestion_content();
			String[] questionArr = question_content.split(",");
			
			/*
			 * 1.survey_idx 를 가져오기
			 * 2.survey_main,survey_file 넣기
			 * 3.questionArr 길이만큼 반복문 돌리
			 * 4.qustion_idx뽑아서 survey_idx, question_idx, 항목내용 넣기
			 * 
			 */
			
			surveyService.registSurvey(vo,file);
			for(int j = 0; j < questionArr.length ;j++) {
				System.out.println(questionArr[j]);
			}
			
	        for(int i=0; i<file.length; i++) {
	            log.debug("================== file start ==================");
	            log.debug("파일 이름: "+file[i].getName());
	            log.debug("파일 실제 이름: "+file[i].getOriginalFilename());
	            log.debug("파일 크기: "+file[i].getSize());
	            log.debug("content type: "+file[i].getContentType());
	            log.debug("================== file   END ==================");
	        }
	        
			return new ResponseEntity<>("success", HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			return new ResponseEntity<>("error.", HttpStatus.OK);
		}
	}
	
	
}
