package com.doubleu.calender.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.doubleu.calender.service.CalenderService;
import com.doubleu.calender.vo.CalenderVo;

@RestController
public class CalenderController {

	@Autowired
	CalenderService service;

	@RequestMapping(value="/CalenderInsertR", method=RequestMethod.POST)
	public ModelAndView calenderInsertR(CalenderVo vo) {
		ModelAndView mv = new ModelAndView();
		String msg = "";
		
		msg = service.insert(vo);
		mv.setViewName("calender/calenderMonth");
		return mv;
	}
}
