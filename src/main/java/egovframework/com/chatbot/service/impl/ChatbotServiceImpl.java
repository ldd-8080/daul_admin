package egovframework.com.chatbot.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.chatbot.mapper.ChatbotMapper;
import egovframework.com.chatbot.service.ChatbotService;
import egovframework.com.chatbot.vo.InputVo;
import egovframework.com.chatbot.vo.IntentVo;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("chatbotService")
public class ChatbotServiceImpl extends EgovAbstractServiceImpl implements ChatbotService{

	@Resource(name="chatbotMapper")
	private ChatbotMapper chatbotMapper;
	
	@Override
	public List<IntentVo> getIntentList() throws Exception {
		return chatbotMapper.getIntentList();
	}

	@Override
	public void addScenario(IntentVo vo) throws Exception {
		chatbotMapper.addScenario(vo);
	}
	
	@Override
	public void addBlock(IntentVo vo) throws Exception {
		chatbotMapper.addBlock(vo);
	}

	@Override
	public void deleteCategory(IntentVo vo) throws Exception {
		chatbotMapper.deleteCategory(vo);
		
	}

	@Override
	public void renameCategory(IntentVo vo) throws Exception {
		chatbotMapper.renameCategory(vo);
		
	}

	@Override
	public void registInputText(InputVo vo) throws Exception {
		chatbotMapper.registInputText(vo);
	}

	@Override
	public int check(InputVo vo) throws Exception {
		
		return chatbotMapper.check(vo);
	}

	@Override
	public void updateInputText(InputVo vo) throws Exception {
		chatbotMapper.updateInputText(vo);
	}

	@Override
	public List<InputVo> getInputText(InputVo vo) throws Exception {
		return chatbotMapper.getInputText(vo);
	}

}
