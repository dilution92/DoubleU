package com.doubleu.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class ControllerMain {

	@RequestMapping(value = "/")
	public ModelAndView index() {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("MainPage/login");
		return mv;
	}
	
	@RequestMapping(value = "/mainHeader")
	public ModelAndView mainHeader() {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("MainPage/");
		return mv;
	}
	@RequestMapping(value = "/mainPage")
	public ModelAndView mainPage() {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("MainPage/index");
		return mv;
	}
}
