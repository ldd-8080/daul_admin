package egovframework.com.user.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.com.cmmn.SecurityUtil;
import egovframework.com.user.service.UserService;
import egovframework.com.user.vo.UserVo;

@Controller
@RequestMapping(value = "/user")
public class UserController {
	
	protected Log log = LogFactory.getLog(UserController.class);
	
	@Resource(name = "userService")
	private UserService userService;
	
	@RequestMapping(value="/userListPage.do")
	public String userListPage(ModelMap model, @RequestParam("auth_type") String auth_type) throws Exception{
		List<Map<String, String>> userList = null;
		
		try {
			userList = userService.selectUserList(auth_type);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("userList", userList);
		
		if ("admin".equals(auth_type)) {
			return "user/adminUserList";
		} else {
			return "user/publicUserList";
		}
		
	}
	
	@RequestMapping(value="userDetailPage.do")
	public String publicUserDetailPage(ModelMap model, @RequestParam("id") String id) throws Exception{
		UserVo vo = new UserVo();
		
		try {
			vo.setUser_id(id);
			vo = userService.selectUser(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("userVo", vo);
		
		if ("admin".equals(vo.getAuth_type()) ) {
			return "user/adminUserDetail";
		} else {
			return "user/publicUserDetail";
		}
	}
	
	@RequestMapping(value="/update.do", method = RequestMethod.POST)
	public String userUpdate(@ModelAttribute UserVo vo) throws Exception {
		log.debug("UserVo : " + vo);
		try {
			userService.updateUser(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/user/userListPage.do?auth_type=" + vo.getAuth_type();
	}
	
	@RequestMapping(value="/delete.do", method=RequestMethod.POST)
	public String userDelete(UserVo vo) throws Exception {
		try {
			userService.deleteUser(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/user/userListPage.do?auth_type=" + vo.getAuth_type();
	}
	
	@RequestMapping(value="/userRegistPage.do")
	public String userRegistPage(ModelMap model, @RequestParam("auth_type") String auth_type) {
		model.addAttribute("userVo", new UserVo());
		
		if ("admin".equals(auth_type)) {
			return "user/adminUserRegist";
		} else {
			return "user/publicUserRegist";
		}
	}
	
	@RequestMapping(value="/create.do", method=RequestMethod.POST)
	public String createUser(@Valid UserVo vo) throws Exception {
		try {
			SecurityUtil securityUtil = new SecurityUtil();
			String encryptPw = securityUtil.encryptSHA256(vo.getPwKey());
			vo.setPw(encryptPw);
			
			userService.createUser(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/user/userListPage.do?auth_type=" + vo.getAuth_type();
	}
	
	@RequestMapping(value="/updateUserPw.do", method=RequestMethod.POST)
	public ResponseEntity<?> updateUserPw(UserVo vo) throws Exception{
		try {
			System.out.println(vo);
			if (vo.getPw() != null && !"".equals(vo.getPw())) {
				SecurityUtil securityUtil = new SecurityUtil();
				String encryptPw = securityUtil.encryptSHA256(vo.getPwKey());
				vo.setPw(encryptPw);
			}
			
			userService.updateUserPw(vo);
			
			return new ResponseEntity<>("success update user password", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return new ResponseEntity<>("success", HttpStatus.OK);
	}
	
//	@RequestMapping(value="/signUpPage.do")
//	public String userSignUpPage(ModelMap model) {
//		model.addAttribute("userVo", new UserVo());
//		
//		return "user/signUp";
//	}
//	
//	@RequestMapping(value="/signUp.do", method=RequestMethod.POST)
//	public String userSignUp(@Valid UserVo vo, BindingResult result) throws Exception {
//		System.out.println(vo);
//		if (result.hasErrors()) {
//			log.debug("userSignUp Valid Error : " + result.getFieldError().getDefaultMessage());
//			return "user/signUp";
//		}
//		
//		SecurityUtil securityUtil = new SecurityUtil();
//		String EncryptPw = securityUtil.encryptSHA256(vo.getPwKey());
//		vo.setPw(EncryptPw);
//		
//		userService.createUser(vo);
//		
//		return "redirect:/main/main.do";
//	}
}
