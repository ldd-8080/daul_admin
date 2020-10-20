package egovframework.com.mileage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/mileage")
public class MileageController {
	@RequestMapping(value = "mileagePage.do")
	public String notificationTalkPage(ModelMap model) throws  Exception{
		
		return "mileage/mileagePage";
	}
}
