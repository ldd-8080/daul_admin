package egovframework.com.contest.vo;

public class ContestOpinionVo {
	private String user_contest_idx;
	private String admin_contest_idx;
	private String title;
	private String content;
	private String create_date;
	private String create_user;
	private String update_date;
	private String update_user;
	private String del_chk;
	private String attach_cnt;
	private int num;
	
	
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getAttach_cnt() {
		return attach_cnt;
	}
	public void setAttach_cnt(String attach_cnt) {
		this.attach_cnt = attach_cnt;
	}
	public String getUser_contest_idx() {
		return user_contest_idx;
	}
	public void setUser_contest_idx(String user_contest_idx) {
		this.user_contest_idx = user_contest_idx;
	}
	public String getAdmin_contest_idx() {
		return admin_contest_idx;
	}
	public void setAdmin_contest_idx(String admin_contest_idx) {
		this.admin_contest_idx = admin_contest_idx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCreate_date() {
		return create_date;
	}
	public void setCreate_date(String create_date) {
		this.create_date = create_date;
	}
	public String getCreate_user() {
		return create_user;
	}
	public void setCreate_user(String create_user) {
		this.create_user = create_user;
	}
	public String getUpdate_date() {
		return update_date;
	}
	public void setUpdate_date(String update_date) {
		this.update_date = update_date;
	}
	public String getUpdate_user() {
		return update_user;
	}
	public void setUpdate_user(String update_user) {
		this.update_user = update_user;
	}
	public String getDel_chk() {
		return del_chk;
	}
	public void setDel_chk(String del_chk) {
		this.del_chk = del_chk;
	}
	@Override
	public String toString() {
		return "contestOpinionVo [user_contest_idx=" + user_contest_idx + ", admin_contest_idx=" + admin_contest_idx
				+ ", title=" + title + ", content=" + content + ", create_date=" + create_date + ", create_user="
				+ create_user + ", update_date=" + update_date + ", update_user=" + update_user + ", del_chk=" + del_chk
				+ "]";
	}
	
	
}
