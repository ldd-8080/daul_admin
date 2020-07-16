package egovframework.com.faq.service;

import java.util.List;
import java.util.Map;

import egovframework.com.faq.vo.FaqVo;

public interface FaqService {
	
	public List<Map<String,String>> selectFaqList() throws Exception;
	void insertFaq(FaqVo vo) throws Exception;
	void updateFaq(FaqVo vo) throws Exception;
	void deleteFaq(FaqVo vo) throws Exception;
}
