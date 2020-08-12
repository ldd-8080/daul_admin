package egovframework.com.chatbot.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.com.chatbot.service.ChatbotService;
import egovframework.com.chatbot.vo.IntentVo;
import egovframework.com.user.vo.UserVo;

@Controller
@RequestMapping(value="/chatbot")
public class ChatbotController {
	protected Log log = LogFactory.getLog(ChatbotController.class);
	
	@Resource(name = "chatbotService")
	private ChatbotService chatbotService;
	
	@RequestMapping(value="/intentListPage.do")
	public String intentsListPage() {
		return "chatbot/intentList";
	}
	
	@RequestMapping(value="/getIntentList.do")
	public  ResponseEntity<?> getIntentList() throws Exception{
		List<IntentVo> intentList = null;
		intentList = chatbotService.getIntentList();
		
		return new ResponseEntity<>(intentList, HttpStatus.OK);		
	}
	
	@RequestMapping(value="/addScenario.do")
	public ResponseEntity<?> addScenario(HttpSession session) throws Exception{
		UserVo userVo = (UserVo) session.getAttribute("login");
		IntentVo vo = new IntentVo();
		vo.setCreate_user(userVo.getUser_id());
		
		chatbotService.addScenario(vo);
		
		return  new ResponseEntity<>("success", HttpStatus.OK);		
	}
	
	@RequestMapping(value="/deleteCategory.do")
	public ResponseEntity<?> deleteCategory(HttpSession session, @RequestParam("intent_idx") String intent_idx) throws Exception{
		IntentVo vo = new IntentVo();
		vo.setId(intent_idx);
		chatbotService.deleteCategory(vo);

		return  new ResponseEntity<>("success", HttpStatus.OK);		
	}

}
