package egovframework.com.suggestion.vo;

public class SuggestionVo {

	private String 	suggestion_idx;
	private String 	title;
	private String 	content;
	private int 	view_count;
	private int 	like_count;
	private String 	create_user;
	private String 	create_date;
	private String 	update_user;
	private String 	update_date;
	private String 	del_chk;
	
	public String getSuggestion_idx() {
		return suggestion_idx;
	}
	public void setSuggestion_idx(String suggestion_idx) {
		this.suggestion_idx = suggestion_idx;
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
	public int getView_count() {
		return view_count;
	}
	public void setView_count(int view_count) {
		this.view_count = view_count;
	}
	public int getLike_count() {
		return like_count;
	}
	public void setLike_count(int like_count) {
		this.like_count = like_count;
	}
	public String getCreate_user() {
		return create_user;
	}
	public void setCreate_user(String create_user) {
		this.create_user = create_user;
	}
	public String getCreate_date() {
		return create_date;
	}
	public void setCreate_date(String create_date) {
		this.create_date = create_date;
	}
	public String getUpdate_user() {
		return update_user;
	}
	public void setUpdate_user(String update_user) {
		this.update_user = update_user;
	}
	public String getUpdate_date() {
		return update_date;
	}
	public void setUpdate_date(String update_date) {
		this.update_date = update_date;
	}
	public String getDel_chk() {
		return del_chk;
	}
	public void setDel_chk(String del_chk) {
		this.del_chk = del_chk;
	}
	
	@Override
	public String toString() {
		return "SuggestionVo [suggestion_idx=" + suggestion_idx + ", title=" + title + ", content=" + content
				+ ", view_count=" + view_count + ", like_count=" + like_count + ", create_user=" + create_user
				+ ", create_date=" + create_date + ", update_user=" + update_user + ", update_date=" + update_date
				+ ", del_chk=" + del_chk + "]";
	}
}