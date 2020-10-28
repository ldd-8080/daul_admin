package egovframework.com.notification.mapper;

import java.util.List;
import java.util.Map;

import egovframework.com.notification.vo.NotificationVo;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("notificationMapper")
public interface NotificationMapper {

	List<NotificationVo> selectNotificationList() throws Exception;

	void updateNotification(Map<String, String> map) throws Exception;

}
