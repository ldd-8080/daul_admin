package egovframework.com.user.service;

import java.util.List;
import java.util.Map;

import egovframework.com.user.vo.UserVo;


public interface UserService {
	void updateUser(UserVo vo) throws Exception;

	void createUser(UserVo vo) throws Exception;

	UserVo selectUser(UserVo vo) throws Exception;

	void deleteUser(UserVo vo) throws Exception;

	void updateUserPw(UserVo vo) throws Exception;

	List<UserVo> selectUserList(UserVo vo) throws Exception;
}
