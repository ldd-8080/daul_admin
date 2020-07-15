package egovframework.com.user.mapper;

import java.util.List;
import java.util.Map;

import egovframework.com.user.vo.UserVo;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("userMapper")
public interface UserMapper {
	void userUpdate(UserVo vo) throws Exception;

	void createUser(UserVo vo) throws Exception;

	List<Map<String, String>> selectUserList() throws Exception;

	UserVo selectUser(UserVo vo) throws Exception;

	void deleteUser(UserVo vo) throws Exception;

	List<Map<String, String>> selectPublicUserList() throws Exception;

	List<Map<String, String>> selectAdminUserList() throws Exception;
}
