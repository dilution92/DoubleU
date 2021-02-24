package com.doubleu.calender.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.doubleu.calender.service.Calender;
import com.doubleu.calender.service.CalenderService;
import com.doubleu.calender.service.CalenderWeekList;
import com.doubleu.calender.vo.CalenderVo;

@Controller
public class CalenderURLController {

	@Autowired
	CalenderService service;
	
	@Autowired
	Calender calender;
	
	@RequestMapping(value = "/calenderMonth", method = {RequestMethod.POST, RequestMethod.GET} )
	public ModelAndView calenderMonth() {
		ModelAndView mv = new ModelAndView();
		List<CalenderWeekList> list = new ArrayList<>();
		
		List<CalenderVo> cList = new ArrayList<CalenderVo>();
		
		cList = service.selectList();
		
		list = calender.setMonthCalender();
		int year = calender.getYear();
		int month = calender.getMonth();
		int day = calender.getDay();
		mv.addObject("currentYear", year);
		mv.addObject("currentMonth", month);
		mv.addObject("currentDay", day);
		mv.addObject("list",list);
		mv.setViewName("calender/Calender_month");
		
		return mv;
	}
	
	@RequestMapping(value = "/calenderWeek", method = {RequestMethod.POST, RequestMethod.GET} )
	public ModelAndView calenderWeek() {
		ModelAndView mv = new ModelAndView();
		List<CalenderWeekList> list = new ArrayList<CalenderWeekList>();
		
		
		list = calender.setCalenderWeek();
		int year = calender.getYear();
		int month = calender.getMonth();
		int day = calender.getDay();
		mv.addObject("currentYear", year);
		mv.addObject("currentMonth", month);
		mv.addObject("currentDay", day);
		mv.addObject("list",list);
		mv.setViewName("calender/Calender_week");

		return mv;
	}
	
	@RequestMapping(value = "/calenderDay", method = {RequestMethod.POST, RequestMethod.GET} )
	public ModelAndView calenderDay() {
		ModelAndView mv = new ModelAndView();
		
		CalenderWeekList listDay = calender.setCalenderDay();
		int year = calender.getYear();
		int month = calender.getMonth();
		mv.addObject("currentYear", year);
		mv.addObject("currentMonth", month);
		mv.addObject("listDay", listDay);
		mv.setViewName("calender/Calender_day");
 
		return mv;
	}
	
	@RequestMapping(value = "/calenderWrite", method = {RequestMethod.POST, RequestMethod.GET}  )
	public ModelAndView calenderWrite() {
		ModelAndView mv = new ModelAndView();

		mv.setViewName("calender/Calender_write");

		return mv;
	}
	
	
}
