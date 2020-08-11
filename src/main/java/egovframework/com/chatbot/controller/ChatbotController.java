package egovframework.com.chatbot.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.com.chatbot.vo.TextVo;

@Controller
@RequestMapping(value="/chatbot")
public class ChatbotController {
	protected Log log = LogFactory.getLog(ChatbotController.class);
	
	@RequestMapping(value="/intentListPage.do")
	public String intentsListPage() {
		return "chatbot/intentList";
	}

}
