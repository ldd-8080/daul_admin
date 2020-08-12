package egovframework.com.chatbot.vo;

public class ItemVo {
	private String skill_item_id;
	private String skill_id;
	private String condition_item_id;
	private String condition_id;
	
	private String name;
	private String function_name;
	
	
	public String getSkill_item_id() {
		return skill_item_id;
	}
	public void setSkill_item_id(String skill_item_id) {
		this.skill_item_id = skill_item_id;
	}
	public String getSkill_id() {
		return skill_id;
	}
	public void setSkill_id(String skill_id) {
		this.skill_id = skill_id;
	}
	public String getCondition_item_id() {
		return condition_item_id;
	}
	public void setCondition_item_id(String condition_item_id) {
		this.condition_item_id = condition_item_id;
	}
	public String getCondition_id() {
		return condition_id;
	}
	public void setCondition_id(String condition_id) {
		this.condition_id = condition_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getFunction_name() {
		return function_name;
	}
	public void setFunction_name(String function_name) {
		this.function_name = function_name;
	}
	@Override
	public String toString() {
		return "ItemVo [skill_item_id=" + skill_item_id + ", skill_id=" + skill_id + ", condition_item_id="
				+ condition_item_id + ", condition_id=" + condition_id + ", name=" + name + ", function_name="
				+ function_name + "]";
	}
	
}
