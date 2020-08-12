package egovframework.com.chatbot.vo;

public class InputVo {
	private String input_id;
	private String intent_id;
	private String input_text;
	
	
	public String getInput_id() {
		return input_id;
	}
	public void setInput_id(String input_id) {
		this.input_id = input_id;
	}
	public String getIntent_id() {
		return intent_id;
	}
	public void setIntent_id(String intent_id) {
		this.intent_id = intent_id;
	}
	public String getInput_text() {
		return input_text;
	}
	public void setInput_text(String input_text) {
		this.input_text = input_text;
	}
	@Override
	public String toString() {
		return "InputVo [input_id=" + input_id + ", intent_id=" + intent_id + ", input_text=" + input_text + "]";
	}
	
	
}
