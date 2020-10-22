package egovframework.com.main.mapper;

import java.util.List;
import java.util.Map;

import egovframework.com.main.vo.MainVo;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("mainMapper")
public interface MainMapper {

	List<Map<String, String>> selectDummyList() throws Exception;
	
	MainVo getMemberCount() throws Exception;
}
