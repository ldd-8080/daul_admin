package egovframework.com.main.service;

import java.util.List;
import java.util.Map;

import egovframework.com.main.vo.MainVo;

public interface MainService {

	public List<Map<String, String>> selectDummyList() throws Exception;
	
	public MainVo getMemberCount() throws Exception;
}
