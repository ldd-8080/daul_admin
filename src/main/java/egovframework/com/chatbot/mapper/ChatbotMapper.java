package egovframework.com.chatbot.mapper;

import java.util.List;
import java.util.Map;

import egovframework.com.chatbot.vo.BtnVo;
import egovframework.com.chatbot.vo.InputVo;
import egovframework.com.chatbot.vo.IntentVo;
import egovframework.com.chatbot.vo.ItemVo;
import egovframework.com.chatbot.vo.ResponeListVo;
import egovframework.com.chatbot.vo.ResponeVo;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("chatbotMapper")
public interface ChatbotMapper {
	List<IntentVo> getIntentList() throws Exception;
	void addScenario(IntentVo vo) throws Exception;
	void addBlock(IntentVo vo) throws Exception;
	void deleteCategory(IntentVo vo) throws Exception;
	void renameCategory(IntentVo vo) throws Exception;
	void registInputText(InputVo vo) throws Exception;
	void updateInputText(InputVo vo) throws Exception;
	int check(InputVo vo) throws Exception;
	List<InputVo> getInputText(InputVo vo) throws Exception;
	int registResponeList(ResponeListVo vo) throws Exception;
	int registTextTypeList(ResponeVo vo) throws Exception;
	void registListTypeList(ResponeVo vo) throws Exception;
	void registListTypeItemList(ItemVo vo) throws Exception;
	void registBtn(BtnVo vo) throws Exception;
	void registImgTypeList(ResponeVo vo) throws Exception;
	void registCardTypeList(ResponeVo vo) throws Exception;
	void registSkillTypeList(ResponeVo vo) throws Exception;
	void registDirectTypeList(ResponeVo vo) throws Exception;
	String getTextTypeCnt() throws Exception;
	String getListId() throws Exception;
	String getTextId() throws Exception;
	String getDirectTypeId() throws Exception;
	String getImgTypeId() throws Exception;
	String getCardTypeId() throws Exception;
	String getSkillTypeId() throws Exception;
	String getListTypeId() throws Exception;
	String getListTypeItemId() throws Exception;
	String getBtnId() throws Exception;
	
	List<Map<String,Object>> getResponeListVoList(ResponeListVo vo) throws Exception;
	//textTyp[e
	List<Map<String,Object>> getTextTypeCardList(String list_id) throws Exception;
	List<Map<String,Object>> getTextTypeCardBtnList(String text_id) throws Exception;
	//imgType
	List<Map<String,Object>> getImgTypeCardList(String list_id) throws Exception;
	//cardType
	List<Map<String,Object>> getCardTypeCardList(String list_id) throws Exception;
	List<Map<String,Object>> getCardTypeCardBtnList(String card_id) throws Exception;
	//listType
	List<Map<String,Object>> getListTypeCardList(String list_id) throws Exception;
	List<Map<String,Object>> getListTypeCardItemList(String list_type_id) throws Exception;
	List<Map<String,Object>> getListTypeCardBtnList(String list_type_id) throws Exception;
	//skillType
	List<Map<String,Object>> getSkillTypeCardList(String list_id) throws Exception;
	List<Map<String,Object>> getSkillTypeCardItemList(String skill_id) throws Exception; 
	//directType
	List<Map<String,Object>> getDirectTypeCardList(String list_id) throws Exception;
	List<Map<String,Object>> getDirectTypeCardBtnList(String direct_id) throws Exception;

}
