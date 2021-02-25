package com.doubleu.calender.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.doubleu.calender.service.CalenderService;
import com.doubleu.calender.vo.CalenderWeekList;
import com.doubleu.calender.vo.CalenderVo;

@RestController
public class CalenderController {

	@Autowired
	CalenderService calender;
	
	@RequestMapping(value="/CalenderInsertR", method=RequestMethod.POST)
	public ModelAndView calenderInsertR(CalenderVo vo) {
		System.out.println("controller 시작");
		ModelAndView mv = new ModelAndView();
		String msg = "";
		List<CalenderWeekList> list = new ArrayList<>();
		
		msg = calender.insert(vo);
		list = calender.setMonthCalender();
		int year = calender.getYear();
		int month = calender.getMonth();
		int day = calender.getDay();
		mv.addObject("list", list);
		mv.addObject("currentYear", year);
		mv.addObject("currentMonth", month);
		mv.addObject("currentDay", day);
		mv.setViewName("calender/Calender_month");
		return mv;
	}
	
	
	//month 이전/다음버튼
	@RequestMapping(value = "/CalenderMonthDiff", method= {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView CalenderMonthDiff(@RequestParam int diff) {
		System.out.println("controller 시작");
		
		ModelAndView mv = new ModelAndView();
		List<CalenderWeekList> list = new ArrayList<>();
		
		System.out.println(diff);
		list = calender.changeMonth(diff);
		int year = calender.getYear();
		int month = calender.getMonth();
		int day = calender.getDay();
		mv.addObject("list", list);
		mv.addObject("currentYear", year);
		mv.addObject("currentMonth", month);
		mv.addObject("currentDay", day);
		mv.setViewName("calender/Calender_month");
		return mv;
	}
	
	//month 오늘버튼
	@RequestMapping(value = "/CalenderMonthToday", method= {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView CalenderMonthToday() {
		System.out.println("controller 시작");
		
		ModelAndView mv = new ModelAndView();
		List<CalenderWeekList> list = new ArrayList<>();
		
		list = calender.changeMonthToday();
		int year = calender.getYear();
		int month = calender.getMonth();
		int day = calender.getDay();
		mv.addObject("list", list);
		mv.addObject("currentYear", year);
		mv.addObject("currentMonth", month);
		mv.addObject("currentDay", day);
		mv.setViewName("calender/Calender_month");
		return mv;
	}
	
	//select 박스 월 선택시 변경
	@RequestMapping(value = "/MonthSelectedMonth", method= {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView MonthSelectedMonth(@RequestParam int changedMonth) {
		System.out.println("controller 시작");
		
		ModelAndView mv = new ModelAndView();
		List<CalenderWeekList> list = new ArrayList<>();
		
		list = calender.monthSelectedMonth(changedMonth);
		int year = calender.getYear();
		int month = calender.getMonth();
		int day = calender.getDay();
		mv.addObject("list", list);
		mv.addObject("currentYear", year);
		mv.addObject("currentMonth", month);
		mv.addObject("currentDay", day);
		mv.setViewName("calender/Calender_month");
		return mv;
	}
	
	//input 년 선택시 변경
	@RequestMapping(value = "/MonthSelectedYear", method= {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView MonthSelectedYear(@RequestParam int changedYear) {
		System.out.println("controller 시작");
		
		ModelAndView mv = new ModelAndView();
		List<CalenderWeekList> list = new ArrayList<>();
		
		list = calender.monthSelectedYear(changedYear);
		int year = calender.getYear();
		int month = calender.getMonth();
		int day = calender.getDay();
		mv.addObject("list", list);
		mv.addObject("currentYear", year);
		mv.addObject("currentMonth", month);
		mv.addObject("currentDay", day);
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
		int day = calender.getDay();
		mv.addObject("list", list);
		mv.addObject("currentYear", year);
		mv.addObject("currentMonth", month);
		mv.addObject("currentDay", day);
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
		int day = calender.getDay();
		mv.addObject("list", list);
		mv.addObject("currentYear", year);
		mv.addObject("currentMonth", month);
		mv.addObject("currentDay", day);
		mv.setViewName("calender/Calender_week");
		
		return mv;
	}
	
	//select 박스 월 선택시 변경
			@RequestMapping(value = "/WeekSelectedMonth", method= {RequestMethod.POST, RequestMethod.GET})
			public ModelAndView WeekSelectedMonth(@RequestParam int changedMonth) {
				ModelAndView mv = new ModelAndView();
				List<CalenderWeekList> list = new ArrayList<CalenderWeekList>();
				
				list = calender.weekSelectedMonth(changedMonth);
				for (int i = 0; i <6; i++) {
					System.out.println(list.get(i).getDay());
				}
				int year = calender.getYear();
				int month = calender.getMonth();
				int day = calender.getDay();
				mv.addObject("list", list);
				mv.addObject("currentYear", year);
				mv.addObject("currentMonth", month);
				mv.addObject("currentDay", day);
				mv.setViewName("calender/Calender_week");
				
				return mv;
			}
			
			//input 년 선택시 변경
			@RequestMapping(value = "/WeekSelectedYear", method= {RequestMethod.POST, RequestMethod.GET})
			public ModelAndView WeekSelectedYear(@RequestParam int changedYear) {
				System.out.println("controller 시작");
				
				ModelAndView mv = new ModelAndView();
				List<CalenderWeekList> list = new ArrayList<>();
				
				list = calender.weekSelectedYear(changedYear);
				int year = calender.getYear();
				int month = calender.getMonth();
				int day = calender.getDay();
				mv.addObject("list", list);
				mv.addObject("currentYear", year);
				mv.addObject("currentMonth", month);
				mv.addObject("currentDay", day);
				mv.setViewName("calender/Calender_week");
				return mv;
			}
	
	
	
	
	//@@@@@@@@@@@@@@@@@@@@ DAY @@@@@@@@@@@@@@@@@@
	
	
	//day 이전/다음버튼
		@RequestMapping(value = "/CalenderDayDiff", method= {RequestMethod.POST, RequestMethod.GET})
		public ModelAndView CalenderDayDiff(@RequestParam int diff) {
			
			ModelAndView mv = new ModelAndView();
			CalenderWeekList listDay = calender.changeDay(diff);
			int year = calender.getYear();
			int month = calender.getMonth();
			mv.addObject("currentYear", year);
			mv.addObject("currentMonth", month);
			mv.addObject("listDay", listDay);
			mv.setViewName("calender/Calender_day");
			
			return mv;
		}
		
		@RequestMapping(value = "/CalenderDayToday", method= {RequestMethod.POST, RequestMethod.GET})
		public ModelAndView CalenderDayToday() {
			
			ModelAndView mv = new ModelAndView();
			CalenderWeekList listDay = calender.changeDayToday();
			int year = calender.getYear();
			int month = calender.getMonth();
			mv.addObject("currentYear", year);
			mv.addObject("currentMonth", month);
			mv.addObject("listDay", listDay);
			mv.setViewName("calender/Calender_day");
			
			return mv;
		}
		
		//select 박스 월 선택시 변경
		@RequestMapping(value = "/DaySelectedMonth", method= {RequestMethod.POST, RequestMethod.GET})
		public ModelAndView DaySelectedMonth(@RequestParam int changedMonth) {
			System.out.println("controller 시작");
			
			ModelAndView mv = new ModelAndView();
			CalenderWeekList listDay = calender.changeDayToday();
			
			listDay = calender.daySelectedMonth(changedMonth);
			int year = calender.getYear();
			int month = calender.getMonth();
			mv.addObject("currentYear", year);
			mv.addObject("currentMonth", month);
			mv.addObject("listDay", listDay);
			mv.setViewName("calender/Calender_day");
			return mv;
		}
		
		//input 년 선택시 변경
		@RequestMapping(value = "/DaySelectedYear", method= {RequestMethod.POST, RequestMethod.GET})
		public ModelAndView DaySelectedYear(@RequestParam int changedYear) {
			System.out.println("controller 시작");
			
			ModelAndView mv = new ModelAndView();
			CalenderWeekList listDay = calender.changeDayToday();
			
			listDay = calender.daySelectedYear(changedYear);
			int year = calender.getYear();
			int month = calender.getMonth();
			mv.addObject("currentYear", year);
			mv.addObject("currentMonth", month);
			mv.addObject("listDay", listDay);
			mv.setViewName("calender/Calender_day");
			return mv;
		}
}
