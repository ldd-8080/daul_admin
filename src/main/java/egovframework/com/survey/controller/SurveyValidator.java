package egovframework.com.survey.controller;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import egovframework.com.survey.vo.SurveyVo;

public class SurveyValidator implements Validator {
	
	@Override
	public boolean supports(Class<?> arg0) {
		return SurveyVo.class.isAssignableFrom(arg0);
	}

	@Override
	public void validate(Object obj, Errors errors) {
		SurveyVo surveyVo = (SurveyVo) obj;
		
		String title = surveyVo.getTitle();
		String s_date = surveyVo.getS_date();
		String e_date = surveyVo.getE_date();
		String content = surveyVo.getContent();
		
		if(title == null || title.trim().isEmpty()) {
			errors.rejectValue("title","title","이 항목은 필수값 입니다.");
		}
		if((s_date == null || s_date.trim().isEmpty()) || (e_date == null || e_date.trim().isEmpty())) {
			errors.rejectValue("s_date","s_date","이 항목은 필수값 입니다.");
		}
		if(e_date == null || e_date.trim().isEmpty()) {
			errors.rejectValue("e_date","e_date","이 항목은 필수값 입니다.");
		}
		if(content == null || content.trim().isEmpty()) {
			errors.rejectValue("content","content","이 항목은 필수값 입니다.");
		}
		
		if(title.length() > 100) {
			errors.rejectValue("title","title","제목은 100자 이내로 작성해주세요.");
		}
		if(content.length() > 5000) {
			errors.rejectValue("content","content","설명은 5000자 이내로 작성해주세요.");
		}
		
		
	}
}
