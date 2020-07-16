package egovframework.com.faq.service.Impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.faq.mapper.FaqMapper;
import egovframework.com.faq.service.FaqService;
import egovframework.com.faq.vo.FaqVo;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("faqService")
public class FaqServiceImpl extends EgovAbstractServiceImpl implements FaqService{

	@Resource(name="faqMapper")
	private FaqMapper faqMapper;
	
	@Override
	public List<Map<String, String>> selectFaqList() throws Exception {
		List<Map<String,String>> list = new ArrayList();
		
		list = faqMapper.selectFaqList();
				
		return list;
	}

	@Override
	public void insertFaq(FaqVo vo) throws Exception {
		vo.setFaq_idx(faqMapper.selectFaqIdx());
		faqMapper.insertFaq(vo);		
	}
	
	@Override
	public void updateFaq(FaqVo vo) throws Exception{
		faqMapper.updateFaq(vo);
	}
	
	@Override
	public void deleteFaq(FaqVo vo) throws Exception{
		faqMapper.deleteFaq(vo);
	}
}
