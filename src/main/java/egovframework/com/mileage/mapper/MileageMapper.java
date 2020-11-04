package egovframework.com.mileage.mapper;

import java.util.List;
import java.util.Map;

import egovframework.com.mileage.vo.MileageVo;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("mileageMapper")
public interface MileageMapper {

	List<MileageVo> selectMileageList() throws Exception;

	void updateMileage(Map<String, String> map) throws Exception;
	
	void deleteMileage(String idx) throws Exception;

}
