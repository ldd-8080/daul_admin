package egovframework.com.chatbot.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import egovframework.com.chatbot.vo.TextVo;

@RestController
@RequestMapping(value="/chat")
public class ChatbotController {
	protected Log log = LogFactory.getLog(ChatbotController.class);
	
	@RequestMapping(value="/simpleText")
	public TextVo keyboard() {
		TextVo text = new TextVo("심플텍스트 예제입니다");
		
		return text;
	}

}
