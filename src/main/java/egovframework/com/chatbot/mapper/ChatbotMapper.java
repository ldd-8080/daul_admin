package egovframework.com.chatbot.mapper;

import java.util.List;

import egovframework.com.chatbot.vo.IntentVo;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("chatbotMapper")
public interface ChatbotMapper {
	List<IntentVo> getIntentList() throws Exception;
	void addScenario(IntentVo vo) throws Exception;
	void deleteCategory(IntentVo vo) throws Exception;
}
