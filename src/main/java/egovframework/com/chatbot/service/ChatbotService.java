package egovframework.com.chatbot.service;

import java.util.List;
import java.util.Map;

import egovframework.com.chatbot.vo.InputVo;
import egovframework.com.chatbot.vo.IntentVo;

public interface ChatbotService {
	List<IntentVo> getIntentList() throws Exception;
	void addScenario(IntentVo vo) throws Exception;
	void addBlock(IntentVo vo) throws Exception;
	void deleteCategory(IntentVo vo) throws Exception;
	void renameCategory(IntentVo vo) throws Exception;
	void registInputText(InputVo vo) throws Exception;
	void updateInputText(InputVo vo) throws Exception;
	int check(InputVo vo) throws Exception;
	List<InputVo> getInputText(InputVo vo) throws Exception;
	void registResponeList(List<Map<Object, Object>> list) throws Exception;

}
