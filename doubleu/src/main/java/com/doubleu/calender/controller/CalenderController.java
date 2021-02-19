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
import com.doubleu.calender.service.CalenderWeekList;
import com.doubleu.calender.vo.CalenderVo;

@RestController
public class CalenderController {

	@Autowired
	CalenderService service;
	
	@Autowired
	Calender calender;
	
	@RequestMapping(value="/CalenderInsertR", method=RequestMethod.POST)
	public ModelAndView calenderInsertR(CalenderVo vo) {
		System.out.println("controller 시작");
		ModelAndView mv = new ModelAndView();
		String msg = "";
		List<Integer> list = new ArrayList<Integer>();
		
		msg = service.insert(vo);
		list = calender.setMonthCalender();
		int year = calender.getYear();
		int month = calender.getMonth();
		mv.addObject("currentYear", year);
		mv.addObject("currentMonth", month);
		mv.addObject("list",list);
		mv.setViewName("calender/Calender_month");
		return mv;
	}
	
	
	//month 이전/다음버튼
	@RequestMapping(value = "/CalenderMonthDiff", method= {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView CalenderMonthDiff(@RequestParam int diff) {
		System.out.println("controller 시작");
		
		ModelAndView mv = new ModelAndView();
		List<Integer> list = new ArrayList<Integer>();
		
		System.out.println(diff);
		list = calender.changeMonth(diff);
		int year = calender.getYear();
		int month = calender.getMonth();
		mv.addObject("currentYear", year);
		mv.addObject("currentMonth", month);
		mv.addObject("list", list);
		mv.setViewName("calender/Calender_month");
		return mv;
	}
	
	//month 오늘버튼
	@RequestMapping(value = "/CalenderMonthToday", method= {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView CalenderMonthToday() {
		System.out.println("controller 시작");
		
		ModelAndView mv = new ModelAndView();
		List<Integer> list = new ArrayList<Integer>();
		
		list = calender.changeMonthToday();
		int year = calender.getYear();
		int month = calender.getMonth();
		mv.addObject("list", list);
		mv.addObject("currentYear", year);
		mv.addObject("currentMonth", month);
		mv.setViewName("calender/Calender_month");
		return mv;
	}
	
	//select 박스 월 선택시 변경
	@RequestMapping(value = "/SelectChangedMonth", method= {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView SelectChangedMonth(@RequestParam int changedMonth) {
		System.out.println("controller 시작");
		
		ModelAndView mv = new ModelAndView();
		List<Integer> list = new ArrayList<Integer>();
		
		list = calender.selectChangeMonth(changedMonth);
		int year = calender.getYear();
		int month = calender.getMonth();
		mv.addObject("currentYear", year);
		mv.addObject("currentMonth", month);
		mv.addObject("list", list);
		mv.setViewName("calender/Calender_month");
		return mv;
	}
	
	//input 년 선택시 변경
	@RequestMapping(value = "/SelectChangedYaer", method= {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView SelectChangedYaer(@RequestParam int changedYear) {
		System.out.println("controller 시작");
		
		ModelAndView mv = new ModelAndView();
		List<Integer> list = new ArrayList<Integer>();
		
		list = calender.selectChangeYear(changedYear);
		int year = calender.getYear();
		int month = calender.getMonth();
		mv.addObject("currentYear", year);
		mv.addObject("currentMonth", month);
		mv.addObject("list", list);
		mv.setViewName("calender/Calender_month");
		return mv;
	}
	
	
	
	
	//@@@@@@@@@@@@@@@@ week @@@@@@@@@@@@@@@@@@
	
	
	
	
	
	//week 이전/다음버튼
	@RequestMapping(value = "/CalenderWeekDiff", method= {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView CalenderWeekDiff(@RequestParam int diff) {
		System.out.println("controller 시작");
		
		ModelAndView mv = new ModelAndView();
		List<CalenderWeekList> list = new ArrayList<CalenderWeekList>();
		
		System.out.println(diff);
		list = calender.changeWeek(diff);
		for (int i = 0; i <6; i++) {
			System.out.println(list.get(i).getDay());
		}
		int year = calender.getYear();
		int month = calender.getMonth();
		mv.addObject("currentYear", year);
		mv.addObject("currentMonth", month);
		mv.addObject("list", list);
		mv.setViewName("calender/Calender_week");
		
		return mv;
	}
	
	
	// week 오늘 버튼
	@RequestMapping(value = "/CalenderWeekToday", method= {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView CalenderWeekToday() {
		System.out.println("controller 시작");
		
		ModelAndView mv = new ModelAndView();
		List<CalenderWeekList> list = new ArrayList<CalenderWeekList>();
		
		list = calender.changeWeekToday();
		for (int i = 0; i <6; i++) {
			System.out.println(list.get(i).getDay());
		}
		int year = calender.getYear();
		int month = calender.getMonth();
		mv.addObject("currentYear", year);
		mv.addObject("currentMonth", month);
		mv.addObject("list", list);
		mv.setViewName("calender/Calender_week");
		
		return mv;
	}
	
	
}
