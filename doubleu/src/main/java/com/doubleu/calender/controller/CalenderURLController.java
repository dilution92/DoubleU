package com.doubleu.calender.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.doubleu.calender.service.CalenderService;
import com.doubleu.calender.vo.CalenderVo;
import com.doubleu.calender.vo.CalenderWeekList;
import com.doubleu.profile.service.ProfileService;
import com.doubleu.profile.vo.ProfileVo;

@Controller
public class CalenderURLController {
	@Autowired
	CalenderService calender;
	
	@Autowired
	ProfileService profile;
	
	@RequestMapping(value = "/calenderMonth", method = {RequestMethod.POST, RequestMethod.GET} )
	public ModelAndView calenderMonth() {
		ModelAndView mv = new ModelAndView();
		List<CalenderWeekList> list = new ArrayList<>();
		

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
		
		
		List<ProfileVo> profile1 = profile.selectProfile();
		mv.addObject("profile", profile1);
		mv.setViewName("calender/Calender_write");

		return mv;
	}
	
	@RequestMapping(value = "/calenderUpdate", method = {RequestMethod.POST, RequestMethod.GET}  )
	public ModelAndView calenderUpdate(CalenderVo vo) {
		ModelAndView mv = new ModelAndView();
		
		int id = vo.getCalenderNo();
		CalenderVo selectOne = calender.selectOne(id);
		/* List<CalenderParticiptant> parti = calender.selectPartiList(id); */
		
		mv.addObject("selectVo", selectOne);
		/* mv.addObject("parti", parti); */
		mv.setViewName("calender/Calender_update");

		return mv;
	}
	
	
}
