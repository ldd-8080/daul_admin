package egovframework.com.message.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/message")
public class MessageController {
	
	@RequestMapping(value = "notificaionTalkPage.do")
	public String notificationTalkPage(ModelMap model) throws  Exception{
		
		return "message/notificationTalkPage";
	}

}
