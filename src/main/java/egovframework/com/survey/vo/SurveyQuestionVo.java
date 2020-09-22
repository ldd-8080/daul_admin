package egovframework.com.survey.vo;

import java.util.List;

public class SurveyQuestionVo {
	private String type;
	private String title;
	private List<String> question_content;
	
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public List<String> getQuestion_content() {
		return question_content;
	}
	public void setQuestion_content(List<String> question_content) {
		this.question_content = question_content;
	}
	@Override
	public String toString() {
		return "SurveyQuestionVo [type=" + type + ", title=" + title + ", question_content=" + question_content + "]";
	}
}
