package egovframework.com.user.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.user.mapper.UserMapper;
import egovframework.com.user.service.UserService;
import egovframework.com.user.vo.UserVo;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("userService")
public class UserServiceImpl  extends EgovAbstractServiceImpl implements UserService{

	@Resource(name = "userMapper")
	private UserMapper userMapper;
	
	@Override
	public void updateUser(UserVo vo) throws Exception {
		userMapper.updateUser(vo);
		
	}

	@Override
	public void createUser(UserVo vo) throws Exception {
		userMapper.createUser(vo);
	}

	@Override
	public List<Map<String, String>> selectUserList() throws Exception {
		return userMapper.selectUserList();
	}

	@Override
	public UserVo selectUser(UserVo vo) throws Exception {
		return userMapper.selectUser(vo);
	}

	@Override
	public void deleteUser(UserVo vo) throws Exception {
		userMapper.deleteUser(vo);
	}

	@Override
	public List<Map<String, String>> selectPublicUserList() throws Exception {
		return userMapper.selectPublicUserList();
	}

	@Override
	public List<Map<String, String>> selectAdminUserList() throws Exception {
		return userMapper.selectAdminUserList();
	}

	@Override
	public void updateUserPw(UserVo vo) throws Exception {
		userMapper.updateUserPw(vo);
	}

	@Override
	public List<Map<String, String>> selectUserList(String auth_type) throws Exception {
		return userMapper.selectUserList(auth_type);
	}

}
