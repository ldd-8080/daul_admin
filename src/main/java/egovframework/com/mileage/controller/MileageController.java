package egovframework.com.mileage.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import egovframework.com.mileage.service.MileageService;
import egovframework.com.mileage.vo.MileageVo;

@Controller
@RequestMapping(value="/mileage")
public class MileageController {
	protected Log log = LogFactory.getLog(MileageController.class);
	
	@Resource(name="mileageService")
	private MileageService mileageService;
	
	@RequestMapping(value = "mileagePage.do")
	public String notificationTalkPage(ModelMap model) throws  Exception{
		List<MileageVo> mileageList = null;
		List<MileageVo> sgstMList = new ArrayList<>();
		List<MileageVo> surveyMList = new ArrayList<>();
		List<MileageVo> contestMList = new ArrayList<>();
		
		try {
			log.debug("[마일리지] 마일리지 목록 조회");
			mileageList = mileageService.selectMileageList();
			
			for (int i = 0; i < mileageList.size(); i++) {
				MileageVo vo = mileageList.get(i);
				
				if (vo.getAction_id().indexOf("SG") > -1) {
					sgstMList.add(vo);
				} else if (vo.getAction_id().indexOf("SV") > -1) {
					surveyMList.add(vo);
				} else if (vo.getAction_id().indexOf("CT") > -1) {
					contestMList.add(vo);
				}
			}
		} catch (Exception e) {
			log.debug("[마일리지] 마일리지 목록 조회 실패");
			e.printStackTrace();
		}
		
		log.debug("[마일리지] 마일리지 목록 조회 완료");
		model.addAttribute("sgstMList", sgstMList);
		model.addAttribute("surveyMList", surveyMList);
		model.addAttribute("contestMList", contestMList);
		
		return "mileage/mileagePage";
	}
	
	@RequestMapping(value="/modifyMileage.do", method=RequestMethod.POST)
	public ResponseEntity<?> modifyMileage(@RequestBody Map<String, Object> params) throws Exception {
		try {
			List<Map<String, String>> mileageList = (List<Map<String, String>>) params.get("data");
			
			for (Map<String, String> map : mileageList) {
				if (!map.containsKey("on_off")) {
					map.put("on_off", "N");
				}
				
				if (map.get("mileage_value").isEmpty()) {
					map.put("mileage_value", "0");
				}
				log.debug("[마일리지] 마일리지 수정");
				mileageService.updateMileage(map);
			}
		} catch (Exception e) {
			log.debug("[마일리지] 마일리지 수정 실패");
			e.printStackTrace();
		}
		
		log.debug("[마일리지] 마일리지 수정 완료");
		return new ResponseEntity<>("success", HttpStatus.OK);
	}
}
