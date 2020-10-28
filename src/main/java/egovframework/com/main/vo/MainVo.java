package egovframework.com.main.vo;

import egovframework.com.cmmn.util.SearchVo;

public class MainVo extends SearchVo{
	private int memberCount;
	private int daysMemberCount;
	private int suggestionCount;
	private int daysSuggestionCount;
	private int surveyCount;
	private int daysSurveyCount;
	private int contestCount;
	private int daysContestCount;
	private int opinionCount;
	private int daysOpinionCount;
	
	private String visitor_cnt;
	private String reg_date;
	

	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

	public String getVisitor_cnt() {
		return visitor_cnt;
	}

	public void setVisitor_cnt(String visitor_cnt) {
		this.visitor_cnt = visitor_cnt;
	}

	public int getDaysMemberCount() {
		return daysMemberCount;
	}

	public void setDaysMemberCount(int daysMemberCount) {
		this.daysMemberCount = daysMemberCount;
	}

	public int getSuggestionCount() {
		return suggestionCount;
	}

	public void setSuggestionCount(int suggestionCount) {
		this.suggestionCount = suggestionCount;
	}

	public int getDaysSuggestionCount() {
		return daysSuggestionCount;
	}

	public void setDaysSuggestionCount(int daysSuggestionCount) {
		this.daysSuggestionCount = daysSuggestionCount;
	}

	public int getSurveyCount() {
		return surveyCount;
	}

	public void setSurveyCount(int surveyCount) {
		this.surveyCount = surveyCount;
	}

	public int getDaysSurveyCount() {
		return daysSurveyCount;
	}

	public void setDaysSurveyCount(int daysSurveyCount) {
		this.daysSurveyCount = daysSurveyCount;
	}

	public int getContestCount() {
		return contestCount;
	}

	public void setContestCount(int contestCount) {
		this.contestCount = contestCount;
	}

	public int getDaysContestCount() {
		return daysContestCount;
	}

	public void setDaysContestCount(int daysContestCount) {
		this.daysContestCount = daysContestCount;
	}

	public int getOpinionCount() {
		return opinionCount;
	}

	public void setOpinionCount(int opinionCount) {
		this.opinionCount = opinionCount;
	}

	public int getDaysOpinionCount() {
		return daysOpinionCount;
	}

	public void setDaysOpinionCount(int daysOpinionCount) {
		this.daysOpinionCount = daysOpinionCount;
	}

	public int getMemberCount() {
		return memberCount;
	}

	public void setMemberCount(int memberCount) {
		this.memberCount = memberCount;
	}

	
}
