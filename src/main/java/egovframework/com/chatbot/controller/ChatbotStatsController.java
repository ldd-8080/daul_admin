package egovframework.com.chatbot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/chatbotStats")
public class ChatbotStatsController {
	
	@RequestMapping(value = "chatbotStatsPage.do")
	public String notificationTalkPage(ModelMap model) throws  Exception{
		
		return "chatbot/chatbotStatsPage";
	}

}
