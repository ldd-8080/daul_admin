package egovframework.com.notification.controller;

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

import egovframework.com.notification.service.NotificationService;
import egovframework.com.notification.vo.NotificationVo;

@Controller
@RequestMapping(value="/notification")
public class NotificationController {
	protected Log log = LogFactory.getLog(NotificationController.class);
	
	@Resource(name="notificationService")
	private NotificationService notificationService;
	
	@RequestMapping(value = "/notificaionTalkPage.do")
	private String notificationTalkPage(ModelMap model) throws Exception {
		List<NotificationVo> notificationList = null;
		List<NotificationVo> sgstNotiList = new ArrayList<>();
		List<NotificationVo> surveyNotiList = new ArrayList<>();
		List<NotificationVo> contestNotiList = new ArrayList<>();
		List<NotificationVo> userNotiList = new ArrayList<>();
		
		try {
			log.debug("[알림톡] 알림톡 목록 조회");
			notificationList = notificationService.selectNotificationList();
			
			for (int i = 0; i < notificationList.size(); i++) {
				NotificationVo vo = notificationList.get(i);
				
				if (vo.getAction_id().indexOf("SG") > -1) {
					sgstNotiList.add(vo);
				} else if (vo.getAction_id().indexOf("SV") > -1) {
					surveyNotiList.add(vo);
				} else if (vo.getAction_id().indexOf("CT") > -1) {
					contestNotiList.add(vo);
				}else if (vo.getAction_id().indexOf("U") > -1 || vo.getAction_id().indexOf("QA") > -1) {
					userNotiList.add(vo);
				}
			}
		} catch (Exception e) {
			log.debug("[알림톡] 알림톡 목록 조회 실패");
			e.printStackTrace();
		}
		
		log.debug("[알림톡] 알림톡 목록 조회 완료");
		model.addAttribute("sgstNotiList", sgstNotiList);
		model.addAttribute("surveyNotiList", surveyNotiList);
		model.addAttribute("contestNotiList", contestNotiList);
		model.addAttribute("userNotiList", userNotiList);
		
		return "notification/notificationTalkPage";
	}
	
	@RequestMapping(value="/modifyNotification.do", method=RequestMethod.POST)
	public ResponseEntity<?> modifyNotification(@RequestBody Map<String, Object> params) throws Exception {
		try {
			List<Map<String, String>> notificationList = (List<Map<String, String>>) params.get("data");
			
			for (Map<String, String> map : notificationList) {
				if (!map.containsKey("on_off")) {
					map.put("on_off", "N");
				}
				
				log.debug("[알림톡] 알림톡 수정");
				notificationService.updateNotification(map);
			}
		} catch (Exception e) {
			log.debug("[알림톡] 알림톡 수정 실패");
			e.printStackTrace();
		}
		
		log.debug("[알림톡] 알림톡 수정 완료");
		return new ResponseEntity<>("success", HttpStatus.OK);
	}
}
