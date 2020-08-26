package egovframework.com.chatbot.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import egovframework.com.chatbot.mapper.ChatbotMapper;
import egovframework.com.chatbot.service.ChatbotService;
import egovframework.com.chatbot.vo.BtnVo;
import egovframework.com.chatbot.vo.InputVo;
import egovframework.com.chatbot.vo.IntentVo;
import egovframework.com.chatbot.vo.ItemVo;
import egovframework.com.chatbot.vo.ResponeListVo;
import egovframework.com.chatbot.vo.ResponeVo;
import egovframework.com.user.vo.UserVo;
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

	@Override
	public void registResponeList(HttpSession session, List<Map<Object, Object>> list) throws Exception {
		
		UserVo userVo = (UserVo) session.getAttribute("login");
	
		
		for(int listCnt = 0 ; listCnt < list.size() ; listCnt++) {
			String type = (String) list.get(listCnt).get("type");
			
			ResponeListVo vo = new ResponeListVo();
			
			String list_id = chatbotMapper.getListId();
			vo.setIntent_id((String)list.get(listCnt).get("intent_id"));
			vo.setTrans_type((String)list.get(listCnt).get("trans_type"));
			vo.setType((String)list.get(listCnt).get("type"));
			vo.setPosition((String)list.get(listCnt).get("position"));
			vo.setList_id(list_id);
			vo.setCreate_user(userVo.getUser_id());
			int num = chatbotMapper.registResponeList(vo);
			
			switch(type) {
				case "text":
										
					List<Map<Object, Object>> textTypeList =  (List<Map<Object, Object>>) list.get(listCnt).get("card");
					for(int textTypeCnt = 0; textTypeCnt < textTypeList.size(); textTypeCnt++) {
						System.out.println(textTypeList.get(textTypeCnt));
						ResponeVo textResponeVo = new ResponeVo();
						
						String text_id = chatbotMapper.getTextId();
						textResponeVo.setList_id(list_id);
						textResponeVo.setText_id((text_id));
						textResponeVo.setContent((String)textTypeList.get(textTypeCnt).get("content"));
						textResponeVo.setPosition((String)textTypeList.get(textTypeCnt).get("position"));
						
						chatbotMapper.registTextTypeList(textResponeVo);
						
						List<Map<Object, Object>> textTypeBtnList =   (List<Map<Object, Object>>) textTypeList.get(textTypeCnt).get("button");
						System.out.println("****textTypeBtnList = " + textTypeBtnList);
						
						for(int textTypeBtnCnt = 0; textTypeBtnCnt < textTypeBtnList.size(); textTypeBtnCnt++ ) {
							BtnVo textTypeBtnVo = new BtnVo();
							String textTypeBtnId = chatbotMapper.getBtnId();
						
							textTypeBtnVo.setBtn_id(textTypeBtnId);
							textTypeBtnVo.setParent_id(text_id);
							textTypeBtnVo.setName((String)textTypeBtnList.get(textTypeBtnCnt).get("name"));
							textTypeBtnVo.setPosition((String)textTypeBtnList.get(textTypeBtnCnt).get("position"));
							
							chatbotMapper.registBtn(textTypeBtnVo);
						}
					}
					break;
					
				case "list":
					
					List<Map<Object, Object>> listTypeList =   (List<Map<Object, Object>>) list.get(listCnt).get("card");
					for(int listTypeCnt = 0; listTypeCnt < listTypeList.size(); listTypeCnt ++) {
						ResponeVo listResponeVo = new ResponeVo();
						
						String listType_id = chatbotMapper.getListTypeId();
						listResponeVo.setList_id(list_id);
						listResponeVo.setList_type_id(listType_id);
						listResponeVo.setTitle((String)listTypeList.get(listTypeCnt).get("title"));
						listResponeVo.setPosition((String)listTypeList.get(listTypeCnt).get("position"));
						
						chatbotMapper.registListTypeList(listResponeVo);
						
						List<Map<Object, Object>> listTypeItemList =   (List<Map<Object, Object>>) listTypeList.get(listTypeCnt).get("list");
						System.out.println("****listTypeItemList = " + listTypeList);
						System.out.println("****listTypeItemList = " + listTypeItemList);
						
						for(int listTypeItemCnt = 0; listTypeItemCnt < listTypeItemList.size(); listTypeItemCnt++) {
							ItemVo listTypeItemVo = new ItemVo();
							
							String ListItem_id = chatbotMapper.getListTypeItemId();
							listTypeItemVo.setList_item_id(ListItem_id);
							listTypeItemVo.setList_type_id(listType_id);
							listTypeItemVo.setTitle((String)listTypeItemList.get(listTypeItemCnt).get("title"));
							listTypeItemVo.setContent((String)listTypeItemList.get(listTypeItemCnt).get("content"));
							listTypeItemVo.setPosition((String)listTypeItemList.get(listTypeItemCnt).get("position"));
							
							chatbotMapper.registListTypeItemList(listTypeItemVo);
						}
						List<Map<Object, Object>> listTypeBtnList =   (List<Map<Object, Object>>) listTypeList.get(listTypeCnt).get("button");
						for(int listTypeBtnCnt = 0; listTypeBtnCnt < listTypeBtnList.size(); listTypeBtnCnt++ ) {
							BtnVo listTypeBtnVo = new BtnVo();
							String listTypeBtnId = chatbotMapper.getBtnId();
						
							listTypeBtnVo.setBtn_id(listTypeBtnId);
							listTypeBtnVo.setParent_id(listType_id);
							listTypeBtnVo.setName((String)listTypeBtnList.get(listTypeBtnCnt).get("name"));
							listTypeBtnVo.setPosition((String)listTypeBtnList.get(listTypeBtnCnt).get("position"));
							
							chatbotMapper.registBtn(listTypeBtnVo);
						}
					}
					break;
				case "img":
					
					List<Map<Object, Object>> imgTypeList =   (List<Map<Object, Object>>) list.get(listCnt).get("card");
					for(int imgTypeCnt = 0; imgTypeCnt < imgTypeList.size(); imgTypeCnt ++) {
						ResponeVo imgTypeVo = new ResponeVo();
						
						String imgTypeId = chatbotMapper.getImgTypeId();
						imgTypeVo.setList_id(list_id);
						imgTypeVo.setImg_id(imgTypeId);
						imgTypeVo.setPosition((String)imgTypeList.get(imgTypeCnt).get("position"));
						
						chatbotMapper.registImgTypeList(imgTypeVo);
					}
					
					
					break;
				case "card":
					
					List<Map<Object, Object>> cardTypeList =   (List<Map<Object, Object>>) list.get(listCnt).get("card");
					for(int cardTypeCnt = 0; cardTypeCnt < cardTypeList.size(); cardTypeCnt ++) {
						ResponeVo cardTypeVo = new ResponeVo();
						
						String cardTypeId = chatbotMapper.getCardTypeId();
						cardTypeVo.setList_id(list_id);
						cardTypeVo.setCard_id(cardTypeId);
						cardTypeVo.setTitle((String)cardTypeList.get(cardTypeCnt).get("title"));
						cardTypeVo.setContent((String)cardTypeList.get(cardTypeCnt).get("content"));
						cardTypeVo.setPosition((String)cardTypeList.get(cardTypeCnt).get("position"));
						
						chatbotMapper.registCardTypeList(cardTypeVo);
						List<Map<Object, Object>> cardTypeBtnList =   (List<Map<Object, Object>>) cardTypeList.get(cardTypeCnt).get("button");
						
						for(int cardTypeBtnCnt = 0; cardTypeBtnCnt < cardTypeBtnList.size(); cardTypeBtnCnt++ ) {
							BtnVo cardTypeBtnVo = new BtnVo();
							String cardTypeBtnId = chatbotMapper.getBtnId();
						
							cardTypeBtnVo.setBtn_id(cardTypeBtnId);
							cardTypeBtnVo.setParent_id(cardTypeId);
							cardTypeBtnVo.setName((String)cardTypeBtnList.get(cardTypeBtnCnt).get("name"));
							cardTypeBtnVo.setPosition((String)cardTypeBtnList.get(cardTypeBtnCnt).get("position"));
							
							chatbotMapper.registBtn(cardTypeBtnVo);
						}
					}
					
					break;
				case "skill":
					List<Map<Object, Object>> skillTypeList =   (List<Map<Object, Object>>) list.get(listCnt).get("card");
					ResponeVo skillTypeVo = new ResponeVo();
					for(int skillTypeCnt = 0; skillTypeCnt < skillTypeList.size(); skillTypeCnt ++) {
						String skillTypeId = chatbotMapper.getSkillTypeId();
						
						skillTypeVo.setSkill_id(skillTypeId);
						skillTypeVo.setList_id(list_id);
						skillTypeVo.setPosition((String)skillTypeList.get(skillTypeCnt).get("position"));
						skillTypeVo.setSkill_item_id((String)skillTypeList.get(skillTypeCnt).get("skill_item_id"));
						chatbotMapper.registSkillTypeList(skillTypeVo);
					}
					break;
				case "direct":
					
					List<Map<Object, Object>> directTypeList =   (List<Map<Object, Object>>) list.get(listCnt).get("card");
					
					ResponeVo directTypeVo = new ResponeVo();
					for(int directTypeCnt = 0; directTypeCnt < directTypeList.size(); directTypeCnt ++) {
						String directTypeId = chatbotMapper.getDirectTypeId();
						
						directTypeVo.setDirect_btn_id(directTypeId);
						directTypeVo.setList_id(list_id);
						directTypeVo.setPosition((String)directTypeList.get(directTypeCnt).get("position"));
						chatbotMapper.registDirectTypeList(directTypeVo);
						List<Map<Object, Object>> directTypeBtnList =   (List<Map<Object, Object>>) directTypeList.get(directTypeCnt).get("button");
						
						for(int directTypeBtnCnt = 0; directTypeBtnCnt < directTypeBtnList.size(); directTypeBtnCnt++ ) {
							BtnVo buttonTypeBtnVo = new BtnVo();
							String directTypeBtnId = chatbotMapper.getBtnId();
						
							buttonTypeBtnVo.setBtn_id(directTypeBtnId);
							buttonTypeBtnVo.setParent_id(directTypeId);
							buttonTypeBtnVo.setName((String)directTypeBtnList.get(directTypeBtnCnt).get("name"));
							buttonTypeBtnVo.setPosition((String)directTypeBtnList.get(directTypeBtnCnt).get("position"));
							buttonTypeBtnVo.setFunction1((String)directTypeBtnList.get(directTypeBtnCnt).get("function1"));
							buttonTypeBtnVo.setFunction2((String)directTypeBtnList.get(directTypeBtnCnt).get("function2"));
							chatbotMapper.registBtn(buttonTypeBtnVo);
						}
					}
				default:
					System.out.println("모두해당안");
			}
		}
	}

	@Override
	public List<Map<String,Object>> getResponeListVoList(ResponeListVo vo) throws Exception {
		return chatbotMapper.getResponeListVoList(vo);
	}

	@Override
	public List<Map<String,Object>> getTextTypeCardList(String list_id) throws Exception {
		return chatbotMapper.getTextTypeCardList(list_id);
	}

	@Override
	public List<Map<String, Object>> getTextTypeCardBtnList(String text_id) throws Exception {
		return chatbotMapper.getTextTypeCardBtnList(text_id);
	}

	@Override
	public List<Map<String, Object>> getImgTypeCardList(String list_id) throws Exception {
		return chatbotMapper.getImgTypeCardList(list_id);
	}

	@Override
	public List<Map<String, Object>> getCardTypeCardList(String list_id) throws Exception {
		return chatbotMapper.getCardTypeCardList(list_id);
	}

	@Override
	public List<Map<String, Object>> getCardTypeCardBtnList(String card_id) throws Exception {
		return chatbotMapper.getCardTypeCardBtnList(card_id);
	}

	@Override
	public List<Map<String, Object>> getListTypeCardList(String list_id) throws Exception {
		return chatbotMapper.getListTypeCardList(list_id);
	}

	@Override
	public List<Map<String, Object>> getListTypeCardItemList(String list_type_id) throws Exception {
		return chatbotMapper.getListTypeCardItemList(list_type_id);
	}

	@Override
	public List<Map<String, Object>> getListTypeCardBtnList(String list_type_id) throws Exception {
		return chatbotMapper.getListTypeCardBtnList(list_type_id);
	}

	@Override
	public List<Map<String, Object>> getSkillTypeCardList(String list_id) throws Exception {
		return chatbotMapper.getSkillTypeCardList(list_id);
	}

	@Override
	public List<Map<String, Object>> getDirectTypeCardList(String list_id) throws Exception {
		return chatbotMapper.getDirectTypeCardList(list_id);
	}

	@Override
	public List<Map<String, Object>> getSkillTypeCardItemList(String skill_id) throws Exception {
		return chatbotMapper.getSkillTypeCardItemList(skill_id);	
	}

	@Override
	public List<Map<String, Object>> getDirectTypeCardBtnList(String direct_id) throws Exception {
		return chatbotMapper.getDirectTypeCardBtnList(direct_id);
	}
}
