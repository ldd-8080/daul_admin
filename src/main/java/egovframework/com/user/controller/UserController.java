package egovframework.com.user.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import egovframework.com.cmmn.SecurityUtil;
import egovframework.com.user.service.UserService;
import egovframework.com.user.vo.UserVo;

@Controller
@RequestMapping(value = "/user")
public class UserController {
	
	protected Log log = LogFactory.getLog(UserController.class);
	
	@Resource(name = "userService")
	private UserService userService;
	
	@RequestMapping(value="/update.do", method = RequestMethod.POST)
	public String userUpdate(@ModelAttribute @Valid UserVo vo, BindingResult result) throws Exception {
		if (result.hasErrors()) {
			log.debug("userUpdate Valid Error : " + result.getFieldError().getDefaultMessage());
			return "user/userModify";
		}
		
		userService.userUpdate(vo);
		return "user/userList";
	}
	
	@RequestMapping(value="/signUpPage.do")
	public String userSignUpPage(ModelMap model) {
		model.addAttribute("userVo", new UserVo());
		
		return "user/signUp";
	}
	
	@RequestMapping(value="/userListPage.do")
	public String userListPage(ModelMap model) throws Exception{
		List<Map<String, String>> userList = userService.selectUserList();
		
		model.addAttribute("userList", userList);
		
		return "user/userList";
	}
	
	@RequestMapping(value="/signUp.do", method=RequestMethod.POST)
	public String userSignUp(@Valid UserVo vo, BindingResult result) throws Exception {
		System.out.println(vo);
		if (result.hasErrors()) {
			log.debug("userSignUp Valid Error : " + result.getFieldError().getDefaultMessage());
			return "user/signUp";
		}
		
		SecurityUtil securityUtil = new SecurityUtil();
		String EncryptPw = securityUtil.encryptSHA256(vo.getPwKey());
		vo.setPw(EncryptPw);
		
		userService.createUser(vo);
		
		return "redirect:/main/main.do";
	}
	
	@RequestMapping(value="/userDetailPage.do")
	public String userDetailPage(ModelMap model, @RequestParam("Nickname") String nickname) throws Exception {
		UserVo user = selectUser(nickname);
		
		model.addAttribute("userVo", user);
		
		return "user/userDetail";
	}
	
	@RequestMapping(value="/userModifyPage.do")
	public String userModifyPage(ModelMap model, @RequestParam("Nickname") String nickname) throws Exception {
		UserVo user = selectUser(nickname);
		
		model.addAttribute("userVo", user);
		
		return "user/userModify";
	}
	
	private UserVo selectUser(String nickname) throws Exception {
		UserVo vo = new UserVo();
		vo.setNickname(nickname);
		
		UserVo user = userService.selectUser(vo);
		
		return user;
	}
	
	@RequestMapping(value="/delete.do", method=RequestMethod.POST)
	public String userDelete(UserVo vo) throws Exception {
		try {
			userService.deleteUser(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/user/userListPage.do";
	}
	
	@RequestMapping(value="/userPwChkPage.do")
	public String userPwChkPage(ModelMap model, @RequestParam("Nickname") String nickname) {
		UserVo userVo = new UserVo();
		userVo.setNickname(nickname);
		model.addAttribute("userVo", userVo);
		
		return "user/userPwChk";
	}
	
	@RequestMapping(value="/pwChk.do")
	public String userPwCheck(UserVo vo, RedirectAttributes redirectAttributes) throws Exception {
		try {
			SecurityUtil securityUtil = new SecurityUtil();
			String EncryptPw = securityUtil.encryptSHA256(vo.getPwKey());
			vo.setPw(EncryptPw);
			
			UserVo user = userService.selectUserPwCheck(vo);
			
			if (user != null) {
				redirectAttributes.addAttribute("Nickname", vo.getNickname());
				return "redirect:/user/userModifyPage.do";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/user/userListPage.do";
	}
}
