package egovframework.com.notification.service;

import java.util.List;
import java.util.Map;

import egovframework.com.notification.vo.NotificationVo;

public interface NotificationService {

	List<NotificationVo> selectNotificationList() throws Exception;

	void updateNotification(Map<String, String> map) throws Exception;

}
