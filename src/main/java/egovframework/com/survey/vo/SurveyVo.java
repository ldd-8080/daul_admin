package egovframework.com.survey.vo;

import java.util.List;


public class SurveyVo {
	
	private String survey_idx;
	private String title;
	private String content;
	private String survey_type;
	private String s_date;
	private String e_date;
	private String create_user;
	private String create_date;
	private String update_user;
	private String update_date;
	private String del_chk;

	private String question_content;

	private String surveyFile;
	
	private List<String> question_contentList;
	
	
	
	public String getSurveyFile() {
		return surveyFile;
	}
	public void setSurveyFile(String surveyFile) {
		this.surveyFile = surveyFile;
	}
	public List<String> getQuestion_contentList() {
		return question_contentList;
	}
	public void setQuestion_contentList(List<String> question_contentList) {
		this.question_contentList = question_contentList;
	}
	public String getQuestion_content() {
		return question_content;
	}
	public void setQuestion_content(String question_content) {
		this.question_content = question_content;
	}
	public String getSurvey_idx() {
		return survey_idx;
	}
	public void setSurvey_idx(String survey_idx) {
		this.survey_idx = survey_idx;
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
	public String getSurvey_type() {
		return survey_type;
	}
	public void setSurvey_type(String survey_type) {
		this.survey_type = survey_type;
	}
	public String getS_date() {
		return s_date;
	}
	public void setS_date(String s_date) {
		this.s_date = s_date;
	}
	public String getE_date() {
		return e_date;
	}
	public void setE_date(String e_date) {
		this.e_date = e_date;
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
		return "SurveyVo [survey_idx=" + survey_idx + ", title=" + title + ", content=" + content + ", survey_type="
				+ survey_type + ", s_date=" + s_date + ", e_date=" + e_date + ", create_user=" + create_user
				+ ", create_date=" + create_date + ", update_user=" + update_user + ", update_date=" + update_date
				+ ", del_chk=" + del_chk + ", question_content=" + question_content + ", question_contentList="
				+ question_contentList + ", surveyFile= " + surveyFile +"]";
	}

	
}
