package egovframework.com.contest.controller;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import egovframework.com.contest.vo.ContestVo;


public class ContestValidator implements Validator{
	@Override
	public boolean supports(Class<?> arg0) {
		return ContestVo.class.isAssignableFrom(arg0);
	}

	@Override
	public void validate(Object obj, Errors errors) {
		ContestVo contestVo = (ContestVo) obj;
		
		String title = contestVo.getTitle();
		String content = contestVo.getContent();
		String submit_s_date = contestVo.getSubmit_s_date();
		String submit_e_date = contestVo.getSubmit_e_date();
		String contest_s_date = contestVo.getContest_s_date();
		String contest_e_date = contestVo.getContest_e_date();
		
		if(title == null || title.trim().isEmpty()) {
			errors.rejectValue("title","title","이 항목은 필수값 입니다.");			
		}
		if((submit_s_date == null || submit_s_date.trim().isEmpty()) || (submit_e_date == null || submit_e_date.trim().isEmpty())) {
			errors.rejectValue("submit_s_date","submit_s_date","이 항목은 필수값 입니다.");
		}
		if((contest_s_date == null || contest_s_date.trim().isEmpty()) || (contest_e_date == null || contest_e_date.trim().isEmpty())) {
			errors.rejectValue("contest_s_date","contest_s_date","이 항목은 필수값 입니다.");
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
