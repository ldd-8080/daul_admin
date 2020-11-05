package egovframework.com.chatbot.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	@RequestMapping(value = "/chatbotStatsPage.do")
	public String notificationTalkPage(ModelMap model) throws  Exception{
		
		return "chatbot/chatbotStatsPage";
	}

	
	@RequestMapping(value="/getChatbotStatsList.do")
	public ResponseEntity<?> getChatbotStatsList(ChatbotStatsVo vo) throws Exception{
		List<ChatbotStatsVo> chatbotStatsList = null;
		List<ChatbotStatsVo> chatbotStatsCountList = null;
		Map<String, Object> resMap = new HashMap<>();
		
		try {
			chatbotStatsList = chatbotService.getChatbotStatsList(vo);
			chatbotStatsCountList = chatbotService.getChatbotStatsCount(vo);
			
			resMap.put("list", chatbotStatsList);
			resMap.put("countList", chatbotStatsCountList);
		}catch(Exception e) {
			
		}
		return new ResponseEntity<>(resMap, HttpStatus.OK);
	}
	
	@RequestMapping(value="/getChatbotStatsCount.do")
	public ResponseEntity<?> getChatbotStatsCount(ChatbotStatsVo vo) throws Exception{
		List<ChatbotStatsVo> chatbotStatsCountList = null;
		
		try {
			chatbotStatsCountList = chatbotService.getChatbotStatsCount(vo);
			System.out.println("chatbotStatsCountList = " + chatbotStatsCountList);
			
		}catch(Exception e) {
			
		}
		return new ResponseEntity<>(chatbotStatsCountList, HttpStatus.OK);
	}
}
