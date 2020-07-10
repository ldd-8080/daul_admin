package egovframework.com.cmmn.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import egovframework.com.user.vo.UserVo;

public class cmmnInterceptor extends HandlerInterceptorAdapter {

	protected Log log = LogFactory.getLog(cmmnInterceptor.class);
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		
		if(log.isDebugEnabled()) {
		
			log.debug(" ============= start ==============");
			log.debug("Request URI \t :" + request.getRequestURI());
		}
		
		return super.preHandle(request, response, handler);
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		
		if(log.isDebugEnabled()) {
			log.debug(" ============= end ==============");
			if (modelAndView != null) {
				log.debug("Response viewName : " + modelAndView.getViewName());
			}
		}
		if (modelAndView == null) {
			modelAndView = new ModelAndView();
			modelAndView.addObject("userVo", new UserVo());
		}
		
		ModelMap model = modelAndView.getModelMap();
		
		if (!model.containsAttribute("userVo")) {
//			ModelMap userModel = new ModelMap();
//			userModel.addAttribute("userVo", new UserVo());
			modelAndView.addObject("userVo", new UserVo());
			//modelAndView.addObject(userModel);
		}
		
		super.postHandle(request, response, handler, modelAndView);
	}

	
}
