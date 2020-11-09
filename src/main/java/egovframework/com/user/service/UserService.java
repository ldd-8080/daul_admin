package egovframework.com.user.service;

import java.util.List;

import egovframework.com.cmmn.NotificationVo;
import egovframework.com.suggestion.vo.SuggestionOpinionVo;
import egovframework.com.user.vo.UserVo;


public interface UserService {
	void updateUser(UserVo vo) throws Exception;

	void createUser(UserVo vo) throws Exception;

	UserVo selectUser(UserVo vo) throws Exception;

	void deleteUser(UserVo vo) throws Exception;

	void updateUserPw(UserVo vo) throws Exception;

	List<UserVo> selectUserList(UserVo vo) throws Exception;

	int selectUserIdCheck(String user_id) throws Exception;
	
	UserVo selectUserCnt(UserVo vo) throws Exception;
	
	String getUserNotificationYN(UserVo vo) throws Exception;
	
	String getActionYN(NotificationVo vo) throws Exception;
	
	NotificationVo getNotificationVo(UserVo vo) throws Exception;
	
	String getTmpNum(String action_id) throws Exception;
}
