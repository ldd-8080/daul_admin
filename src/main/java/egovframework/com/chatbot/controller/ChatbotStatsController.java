package egovframework.com.chatbot.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.com.chatbot.service.ChatbotService;
import egovframework.com.chatbot.vo.ChatbotStatsVo;

@Controller
@RequestMapping(value="/chatbotStats")
public class ChatbotStatsController {
	
	@Resource(name="chatbotService")
	private ChatbotService chatbotService;
	
	@RequestMapping(value = "chatbotStatsPage.do")
	public String notificationTalkPage(ModelMap model) throws  Exception{
		
		return "chatbot/chatbotStatsPage";
	}

	
	@RequestMapping(value="/getChatbotStatsList.do")
	public ResponseEntity<?> getChatbotStatsList(ChatbotStatsVo vo) throws Exception{
		List<ChatbotStatsVo> chatbotStatsList = null;
		
		try {
			chatbotStatsList = chatbotService.getChatbotStatsList(vo);
			
		}catch(Exception e) {
			
		}
		return new ResponseEntity<>(chatbotStatsList, HttpStatus.OK);
	}
	
	
}
