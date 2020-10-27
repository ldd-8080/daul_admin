package egovframework.com.notification.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

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
		
		return "notification/notificationTalkPage";
	}
}
