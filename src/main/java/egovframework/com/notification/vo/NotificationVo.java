package egovframework.com.notification.vo;

public class NotificationVo {
	private String idx;
	private String on_off;
	private String action_id;
	private String template_id;
	private String action_name;
	
	public String getIdx() {
		return idx;
	}
	public void setIdx(String idx) {
		this.idx = idx;
	}
	public String getOn_off() {
		return on_off;
	}
	public void setOn_off(String on_off) {
		this.on_off = on_off;
	}
	public String getAction_id() {
		return action_id;
	}
	public void setAction_id(String action_id) {
		this.action_id = action_id;
	}
	public String getTemplate_id() {
		return template_id;
	}
	public void setTemplate_id(String template_id) {
		this.template_id = template_id;
	}
	public String getAction_name() {
		return action_name;
	}
	public void setAction_name(String action_name) {
		this.action_name = action_name;
	}
	
	@Override
	public String toString() {
		return "NotificationVo [idx=" + idx + ", on_off=" + on_off + ", action_id=" + action_id + ", template_id="
				+ template_id + ", action_name=" + action_name + "]";
	}
}
