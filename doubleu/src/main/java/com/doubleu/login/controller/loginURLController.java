package com.doubleu.login.controller;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.doubleu.login.service.LoginService;
import com.doubleu.login.vo.LoginVo;

@Controller
public class loginURLController {

	
	
	LoginService LoginService;
	
	// login.jsp
	@RequestMapping(value="/DoubleULogin", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView DoubleULogin() {
		ModelAndView mv = new ModelAndView();

		
		
		mv.setViewName("MainPage/login");

		return mv;
	}
	
	// 로그인 체크
	@RequestMapping(value="/LoginCheck", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView LoginResult(
			LoginVo vo,
			HttpServletRequest req,
			HttpSession session
			) {
		
		ModelAndView mv = new ModelAndView();
		
		
		System.out.println(vo);
		
		
		return mv;
	}

}
