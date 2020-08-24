package egovframework.com.chatbot.controller;

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
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.com.chatbot.service.ChatbotService;
import egovframework.com.chatbot.vo.InputVo;
import egovframework.com.chatbot.vo.IntentVo;
import egovframework.com.user.vo.UserVo;

@Controller
@RequestMapping(value="/chatbot")
public class ChatbotController {
	protected Log log = LogFactory.getLog(ChatbotController.class);
	
	@Resource(name = "chatbotService")
	private ChatbotService chatbotService;
	
	@RequestMapping(value="/intentListPage.do")
	public String intentsListPage(ModelMap model) {
		model.addAttribute("inputVo", new InputVo());
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
	public ResponseEntity<?> deleteCategory(HttpSession session, @RequestParam("intent_id") String intent_idx) throws Exception{
		IntentVo vo = new IntentVo();
		vo.setId(intent_idx);
		chatbotService.deleteCategory(vo);

		return  new ResponseEntity<>("success", HttpStatus.OK);		
	}
	
	@RequestMapping(value="/deleteIntent.do")
	public ResponseEntity<?> deleteIntent(HttpSession session, InputVo vo) throws Exception{
		IntentVo intentVo = new IntentVo();
		intentVo.setId(vo.getIntent_id());
		chatbotService.deleteCategory(intentVo);

		return  new ResponseEntity<>("success", HttpStatus.OK);		
	}
	
	
	
	@RequestMapping(value="/renameCategory.do")
	public ResponseEntity<?> renameCategory(@RequestParam("intent_id") String intent_id,@RequestParam("title") String title) throws Exception{
		IntentVo vo = new IntentVo();
		vo.setId(intent_id);
		vo.setText(title);
		chatbotService.renameCategory(vo);
		
		return  new ResponseEntity<>("success", HttpStatus.OK);
	}

	@RequestMapping(value="/addBlock.do")
	public ResponseEntity<?> addBlock(HttpSession session,@RequestParam("intent_id") String intent_id) throws Exception{
		UserVo userVo = (UserVo) session.getAttribute("login");
		IntentVo vo = new IntentVo();
		vo.setCreate_user(userVo.getUser_id());
		vo.setId(intent_id);
		chatbotService.addBlock(vo);
		
		return  new ResponseEntity<>("success", HttpStatus.OK);		
	}
	
	@RequestMapping(value="/registInputText.do")
	public ResponseEntity<?> insertInputText(HttpSession session,InputVo vo , BindingResult bindingResult, HttpServletRequest request, HttpServletResponse response) throws Exception{
		UserVo userVo = (UserVo) session.getAttribute("login");
		vo.setCreate_user(userVo.getUser_id());
		vo.setUpdate_user(userVo.getUser_id());
		int cnt = chatbotService.check(vo);
		
		if(cnt > 0) {
			chatbotService.updateInputText(vo);
		}else {
			chatbotService.registInputText(vo);
		}
		
		return  new ResponseEntity<>("success", HttpStatus.OK);
	
	}
	
	@RequestMapping(value="/serializedObj.do", method=RequestMethod.POST)
	public ResponseEntity<?> getInputText(@RequestBody Map<Object, Object> params) throws Exception{
		System.out.println(params);
		
		List<Map<Object, Object>> list = (List<Map<Object, Object>>) params.get("cardList");
		for(int i = 0; i < list.size(); i++) {
			list.get(i).put("intent_id",params.get("intent_id"));
		}
		System.out.println(" >>>list = "  + list);
		
		chatbotService.registResponeList(list);
		
		return  new ResponseEntity<>("success", HttpStatus.OK);
	}
}
