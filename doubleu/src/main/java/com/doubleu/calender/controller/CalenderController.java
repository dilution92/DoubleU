package com.doubleu.calender.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.doubleu.calender.service.Calender;
import com.doubleu.calender.service.CalenderService;
import com.doubleu.calender.vo.CalenderVo;

@RestController
public class CalenderController {

	@Autowired
	CalenderService service;
	
	Calender calender;
	
	@RequestMapping(value="/CalenderInsertR", method=RequestMethod.POST)
	public ModelAndView calenderInsertR(CalenderVo vo) {
		System.out.println("controller 시작");
		ModelAndView mv = new ModelAndView();
		String msg = "";
		
		msg = service.insert(vo);
		mv.setViewName("calender/Calender_month");
		return mv;
	}
	
	
	@RequestMapping(value = "/CalenderMonthDiff", method= {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView CalenderMonthDiff(@RequestParam int diff) {
		ModelAndView mv = new ModelAndView();
		List<Integer> list = new ArrayList<Integer>();
		
		list = calender.changeMonth(diff);
		mv.addObject("list", list);
		mv.setViewName("calender/Calender_month");
		return mv;
	}
}
