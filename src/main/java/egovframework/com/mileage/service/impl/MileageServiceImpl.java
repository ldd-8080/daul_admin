package egovframework.com.mileage.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.mileage.mapper.MileageMapper;
import egovframework.com.mileage.service.MileageService;
import egovframework.com.mileage.vo.MileageVo;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("mileageService")
public class MileageServiceImpl extends EgovAbstractServiceImpl implements MileageService {
	@Resource(name="mileageMapper")
	private MileageMapper mileageMapper;

	@Override
	public List<MileageVo> selectMileageList() throws Exception {
		return mileageMapper.selectMileageList();
	}

	@Override
	public void updateMileage(Map<String, String> map) throws Exception {
		mileageMapper.updateMileage(map);
	}
}
