package com.doubleu.login.controller;
<<<<<<< HEAD
=======

>>>>>>> 8d6d66a0e872b20df1e257793f020a0239789c76

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class loginURLController {

	// login.jsp
	@RequestMapping(value="/DoubleULogin", method=RequestMethod.GET)
	public ModelAndView DoubleULogin() {
		ModelAndView mv = new ModelAndView();

		mv.setViewName("MainPage/login");

		return mv;
	}

}
