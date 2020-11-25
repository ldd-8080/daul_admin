package egovframework.com.user.mapper;

import java.util.List;

import egovframework.com.cmmn.NotificationVo;
import egovframework.com.suggestion.vo.SuggestionOpinionVo;
import egovframework.com.user.vo.UserVo;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("userMapper")
public interface UserMapper {
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

	String getAuth(NotificationVo vo) throws Exception;
}
