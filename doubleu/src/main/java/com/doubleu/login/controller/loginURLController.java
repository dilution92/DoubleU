package com.doubleu.login.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import com.doubleu.login.mybatis.LoginDao;
import com.doubleu.login.service.LoginService;


@Controller
public class loginURLController {

	@Autowired
	LoginService LoginService;
	
	@Autowired
	LoginDao daoService;
	
	// login.jsp
	@RequestMapping(
			value="/login", 
			method= {RequestMethod.GET, RequestMethod.POST})
	
	public ModelAndView DoubleULogin() {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("MainPage/login");

		return mv;
	}
	
	// loginPost.jsp
	@RequestMapping(
			value="/loginPost", 
			method= {RequestMethod.GET, RequestMethod.POST})
	
	public ModelAndView LoginPost() {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("MainPage/loginPost");

		return mv;
	}

}
