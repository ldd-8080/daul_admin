package egovframework.com.notification.service;

import java.util.List;

import egovframework.com.notification.vo.NotificationVo;

public interface NotificationService {

	List<NotificationVo> selectNotificationList() throws Exception;

}
