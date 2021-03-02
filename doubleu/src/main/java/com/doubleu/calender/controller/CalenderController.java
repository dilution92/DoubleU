package com.doubleu.calender.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

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
	
	@RequestMapping(value = "/CalenderDelete", method= {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView CalenderDelete(CalenderVo vo, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		String msg = "";
		List<CalenderWeekList> list = new ArrayList<>();
		msg = calender.delete(vo); 
		
		list = calender.setMonthCalender(session);
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
	
	
	@RequestMapping(value="/CalenderUpdateR", method=RequestMethod.POST)
	public ModelAndView CalenderUpdateR(CalenderVo vo, HttpSession session) {
		System.out.println("@@ update controller 시작");
		ModelAndView mv = new ModelAndView();
		String msg = "";
		List<CalenderWeekList> list = new ArrayList<>();
		
		msg = calender.update(vo);
		list = calender.setMonthCalender(session);
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
	
	
	
	/*
	 * @RequestMapping(value = "/CalenderMonthModal", method= {RequestMethod.POST,
	 * RequestMethod.GET}) public ModelAndView CalenderMonthModal() { ModelAndView
	 * mv = new ModelAndView(); System.out.println("@@ 컨트롤러 시작");
	 * 
	 * List<CalenderWeekList> list = new ArrayList<>();
	 * 
	 * 
	 * list = calender.setMonthCalender(); int year = calender.getYear(); int month
	 * = calender.getMonth(); int day = calender.getDay();
	 * mv.addObject("currentYear", year); mv.addObject("currentMonth", month);
	 * mv.addObject("currentDay", day); mv.addObject("list",list);
	 * 
	 * mv.setViewName("calender/Calender_month");
	 * 
	 * 
	 * 
	 * System.out.println("@@@ 컨트롤러 종료"); return mv; }
	 */
	
	@RequestMapping(value="/CalenderInsertR", method=RequestMethod.POST)
	public ModelAndView calenderInsertR(CalenderVo vo, HttpSession session) {
		System.out.println("controller 시작");
		ModelAndView mv = new ModelAndView();
		String msg = "";
		List<CalenderWeekList> list = new ArrayList<>();
		
		msg = calender.insert(vo, session);
		list = calender.setMonthCalender(session);
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
	public ModelAndView CalenderMonthDiff(@RequestParam int diff,HttpSession session ) {
		System.out.println("controller 시작");
		
		ModelAndView mv = new ModelAndView();
		List<CalenderWeekList> list = new ArrayList<>();
		
		System.out.println(diff);
		calender.changeMonth(diff);
		list = calender.setMonthCalender(session);
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
	public ModelAndView CalenderMonthToday(HttpSession session) {
		System.out.println("controller 시작");
		
		ModelAndView mv = new ModelAndView();
		List<CalenderWeekList> list = new ArrayList<>();
		
		calender.changeMonthToday();
		list = calender.setMonthCalender(session);
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
	public ModelAndView MonthSelectedMonth(@RequestParam int changedMonth, HttpSession session) {
		System.out.println("controller 시작");
		
		ModelAndView mv = new ModelAndView();
		List<CalenderWeekList> list = new ArrayList<>();
		
		calender.monthSelectedMonth(changedMonth);
		list = calender.setMonthCalender(session);
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
	public ModelAndView MonthSelectedYear(@RequestParam int changedYear, HttpSession session) {
		System.out.println("controller 시작");
		
		ModelAndView mv = new ModelAndView();
		List<CalenderWeekList> list = new ArrayList<>();
		
		calender.monthSelectedYear(changedYear);
		list = calender.setMonthCalender(session);
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
	public ModelAndView CalenderWeekDiff(@RequestParam int diff, HttpSession session) {
		System.out.println("controller 시작");
		
		ModelAndView mv = new ModelAndView();
		List<CalenderWeekList> list = new ArrayList<CalenderWeekList>();
		
		System.out.println(diff);
		calender.changeWeek(diff);
		list = calender.setCalenderWeek(session);
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
	public ModelAndView CalenderWeekToday(HttpSession session) {
		System.out.println("controller 시작");
		
		ModelAndView mv = new ModelAndView();
		List<CalenderWeekList> list = new ArrayList<CalenderWeekList>();
		
		calender.changeWeekToday();
		list = calender.setCalenderWeek(session);
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
			public ModelAndView WeekSelectedMonth(@RequestParam int changedMonth, HttpSession session) {
				ModelAndView mv = new ModelAndView();
				List<CalenderWeekList> list = new ArrayList<CalenderWeekList>();
				
				calender.weekSelectedMonth(changedMonth);
				list = calender.setCalenderWeek(session);
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
			public ModelAndView WeekSelectedYear(@RequestParam int changedYear, HttpSession session) {
				System.out.println("controller 시작");
				
				ModelAndView mv = new ModelAndView();
				List<CalenderWeekList> list = new ArrayList<>();
				
				calender.weekSelectedYear(changedYear);
				list = calender.setCalenderWeek(session);
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
		public ModelAndView CalenderDayDiff(@RequestParam int diff, HttpSession session) {
			
			ModelAndView mv = new ModelAndView();
			calender.changeDay(diff);
			CalenderWeekList listDay = calender.setCalenderDay(session);
			int year = calender.getYear();
			int month = calender.getMonth();
			mv.addObject("currentYear", year);
			mv.addObject("currentMonth", month);
			mv.addObject("listDay", listDay);
			mv.setViewName("calender/Calender_day");
			
			return mv;
		}
		
		@RequestMapping(value = "/CalenderDayToday", method= {RequestMethod.POST, RequestMethod.GET})
		public ModelAndView CalenderDayToday(HttpSession session) {
			
			ModelAndView mv = new ModelAndView();
			calender.changeDayToday();
			CalenderWeekList listDay = calender.setCalenderDay(session);
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
		public ModelAndView DaySelectedMonth(@RequestParam int changedMonth, HttpSession session) {
			System.out.println("controller 시작");
			
			ModelAndView mv = new ModelAndView();
			calender.daySelectedMonth(changedMonth);
			
			CalenderWeekList listDay = calender.setCalenderDay(session);
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
		public ModelAndView DaySelectedYear(@RequestParam int changedYear, HttpSession session) {
			System.out.println("controller 시작");
			
			ModelAndView mv = new ModelAndView();
			
			calender.daySelectedYear(changedYear);
			CalenderWeekList listDay = calender.setCalenderDay(session);
			int year = calender.getYear();
			int month = calender.getMonth();
			mv.addObject("currentYear", year);
			mv.addObject("currentMonth", month);
			mv.addObject("listDay", listDay);
			mv.setViewName("calender/Calender_day");
			return mv;
		}
}
