package egovframework.com.mileage.vo;

public class MileageVo {
	private String idx;
	private String on_off;
	private String action_id;
	private String mileage_value;
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
	public String getMileage_value() {
		return mileage_value;
	}
	public void setMileage_value(String mileage_value) {
		this.mileage_value = mileage_value;
	}
	public String getAction_name() {
		return action_name;
	}
	public void setAction_name(String action_name) {
		this.action_name = action_name;
	}
	
	@Override
	public String toString() {
		return "MileageVo [idx=" + idx + ", on_off=" + on_off + ", action_id=" + action_id + ", mileage_value="
				+ mileage_value + ", action_name=" + action_name + "]";
	}
}
