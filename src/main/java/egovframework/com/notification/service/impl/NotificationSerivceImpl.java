package egovframework.com.notification.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.notification.mapper.NotificationMapper;
import egovframework.com.notification.service.NotificationService;
import egovframework.com.notification.vo.NotificationVo;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("notificationService")
public class NotificationSerivceImpl extends EgovAbstractServiceImpl implements NotificationService {

	@Resource(name="notificationMapper")
	private NotificationMapper notificationMapper;

	@Override
	public List<NotificationVo> selectNotificationList() throws Exception {
		return notificationMapper.selectNotificationList();
	}

	@Override
	public void updateNotification(Map<String, String> map) throws Exception {
		notificationMapper.updateNotification(map);
	}
}
