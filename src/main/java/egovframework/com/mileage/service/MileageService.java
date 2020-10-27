package egovframework.com.mileage.service;

import java.util.List;
import java.util.Map;

import egovframework.com.mileage.vo.MileageVo;

public interface MileageService {

	List<MileageVo> selectMileageList() throws Exception;

	void updateMileage(Map<String, String> map) throws Exception;
}
