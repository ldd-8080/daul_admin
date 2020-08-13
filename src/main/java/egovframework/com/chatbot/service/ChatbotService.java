package egovframework.com.chatbot.service;

import java.util.List;

import egovframework.com.chatbot.vo.IntentVo;

public interface ChatbotService {
	List<IntentVo> getIntentList() throws Exception;
	void addScenario(IntentVo vo) throws Exception;
	void addBlock(IntentVo vo) throws Exception;
	void deleteCategory(IntentVo vo) throws Exception;
	void renameCategory(IntentVo vo) throws Exception;
	

}
