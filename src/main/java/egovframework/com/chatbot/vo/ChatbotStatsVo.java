package egovframework.com.chatbot.vo;

import egovframework.com.cmmn.util.SearchVo;

public class ChatbotStatsVo extends SearchVo {
	private String kakaochannel_key;
	private String utterance;
	private String intent_id;
	private String intent_title;
	private String module;
	private String create_date;
	private String name;
	private String total_count;
	private String success_count;
	private String fail_count;
	private String date;
	
	
	
	
	
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getTotal_count() {
		return total_count;
	}
	public void setTotal_count(String total_count) {
		this.total_count = total_count;
	}
	public String getSuccess_count() {
		return success_count;
	}
	public void setSuccess_count(String success_count) {
		this.success_count = success_count;
	}
	public String getFail_count() {
		return fail_count;
	}
	public void setFail_count(String fail_count) {
		this.fail_count = fail_count;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getKakaochannel_key() {
		return kakaochannel_key;
	}
	public void setKakaochannel_key(String kakaochannel_key) {
		this.kakaochannel_key = kakaochannel_key;
	}
	public String getUtterance() {
		return utterance;
	}
	public void setUtterance(String utterance) {
		this.utterance = utterance;
	}
	public String getIntent_id() {
		return intent_id;
	}
	public void setIntent_id(String intent_id) {
		this.intent_id = intent_id;
	}
	public String getIntent_title() {
		return intent_title;
	}
	public void setIntent_title(String intent_title) {
		this.intent_title = intent_title;
	}
	public String getModule() {
		return module;
	}
	public void setModule(String module) {
		this.module = module;
	}
	public String getCreate_date() {
		return create_date;
	}
	public void setCreate_date(String create_date) {
		this.create_date = create_date;
	}

}
