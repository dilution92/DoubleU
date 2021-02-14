package com.doubleu.calender.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CalenderController {

	@RequestMapping(value = "/calenderMonth", method = {RequestMethod.POST, RequestMethod.GET} )
	public ModelAndView calenderMonth() {
		ModelAndView mv = new ModelAndView();

		mv.setViewName("calender/Calender_month");

		return mv;
	}
	
	@RequestMapping(value = "/calenderWrite", method = {RequestMethod.POST, RequestMethod.GET}  )
	public ModelAndView calenderWrite() {
		ModelAndView mv = new ModelAndView();

		mv.setViewName("calender/Calender_write");

		return mv;
	}
	
	
}
