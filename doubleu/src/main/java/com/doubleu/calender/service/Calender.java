package com.doubleu.calender.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

@Component
public class Calender {
	int year;
	int month;
	int day;
	
	String week[] = {"SUN","MON","TUE","WEN","THU","FRI","SAT"};
	int lastDay[] = {31,28,31,30,31,30,31,31,30,31,30,31};
	
	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public int getMonth() {
		return month;
	}

	public void setMonth(int month) {
		this.month = month;
	}

	public int getDay() {
		return day;
	}

	public void setDay(int day) {
		this.day = day;
	}

	public Calender() {
		SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss");
		Date time = new Date();
		String time1 = format1.format(time);
		year = Integer.parseInt(time1.substring(0,4));
		month = Integer.parseInt(time1.substring(5,7));
		day = Integer.parseInt(time1.substring(8,10));
		
		setMonthCalender();
	}
	
	public int setWeekMethod(int year, int month, int day) {
		String week[] = {"일","월","화","수","목","금","토"};
		int lastDay[] = {31,28,31,30,31,30,31,31,30,31,30,31};
		if(year%400==0) {
				lastDay[1]=29;
			}else if(year%100==0) {
				lastDay[1]=28;
			}else if(year%4==0) {
				lastDay[1]=29;
			}
		int totalyear = (year-2017-1)*365+((year-2017)/4); // 기준년부터 작년까지의 총 일수
		
		int totalmonth = 0;
		for(int i=0;i<month-1;i++) // 올해의 오늘까지의 총 일수
	       {
			totalmonth+=lastDay[i];
	       }
		
		int totaltoday = totalyear+totalmonth+day;
		int totalweek = totaltoday%7;
		
		return totalweek;
	}
	
	public List<Integer> setMonthCalender() {
		
		List<Integer> list = new ArrayList<>();
		
		//2017년 1월 1일 일요일이 기준
		String week[] = {"일","월","화","수","목","금","토"};
		int lastDay[] = {31,28,31,30,31,30,31,31,30,31,30,31};
		if(year%400==0) {
				lastDay[1]=29;
			}else if(year%100==0) {
				lastDay[1]=28;
			}else if(year%4==0) {
				lastDay[1]=29;
			}
		int totalyear = (year-2017-1)*365+((year-2017)/4); // 기준년부터 작년까지의 총 일수
		
		int totalmonth = 0;
		for(int i=0;i<month-1;i++) // 올해의 오늘까지의 총 일수
	       {
			totalmonth+=lastDay[i];
	       }
		
		int totaltoday = totalyear+totalmonth+day;
		int totalweek = totaltoday%7; // 오늘 요일 계산하기
		
		
		int monthfirstday = totalyear+totalmonth+1;
		int monthweek = monthfirstday%7; // 이번 달 1일의 요일 계산하기
		
		
		// 화면단에 뿌려질 날짜리스트
		//첫번째 일요일 날짜부터 차례대로 입력한다.
		//da의 수만큼 이전 달의 날짜를 입력한다.
		int lastmonth = month-2; // 이전달 구하기 lastmonth는 이전달 index 값
		if((month-1)==0) {
			lastmonth = 11;
		}else {
			lastmonth = month-2;
		}
		int lastMonthday = lastDay[lastmonth]; // 이전달 마지막 일 구하기
		System.out.println(lastMonthday);
		
		for(int i=0; i<monthweek; i++) {
			int startNum = lastMonthday-monthweek+1;
			startNum = startNum+i;
			list.add(startNum);
		}
		
		for(int i=0; i<lastDay[month-1]; i++) {
			list.add(i+1);
		}
		
		int nextMonthday = 42-(monthweek+lastDay[month-1]);
		for(int i=0; i<nextMonthday; i++) {
			list.add(i+1);
		}
		
		return list;
	}
	
	//Month 이전,다음
	public List<Integer> changeMonth(int diff) {
		System.out.println("월 변경 시작");
		if((month+diff)>12) {
			setMonth(1);
			setYear(year+1);
		}else if((month+diff)==0) {
			setMonth(12);
			setYear(year-1);
		}else {
			setMonth(month+diff);
		}
		System.out.println(month);
		return setMonthCalender();
	}
	
	//Month오늘
	public List<Integer> changeMonthToday() {
		SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss");
		Date time = new Date();
		String time1 = format1.format(time);
		year = Integer.parseInt(time1.substring(0,4));
		month = Integer.parseInt(time1.substring(5,7));
		day = Integer.parseInt(time1.substring(8,10));
		
		return setMonthCalender();
	}
	
	public List<Integer> selectChangeMonth(int changedMonth) {
		setMonth(changedMonth);
		return setMonthCalender();
	}
	
	public List<Integer> selectChangeYear(int changedYear) {
		setYear(changedYear);
		return setMonthCalender();
	}
	
	//@@@@@@@@@@@@@@@@@@ CalenderWeek @@@@@@@@@@@@@@@@@@@
	
	
	public List<CalenderWeekList> setCalenderWeek() {
		
		List<CalenderWeekList> list = new ArrayList<>();
		
		if(day-7<0) { // 주간이 지난달을 포함할 경우
			int totalweek = setWeekMethod(year, month-1, lastDay[month-2]);
			int startNum= lastDay[month-2]-totalweek;
			for(int i=0; i<totalweek+1; i++) {
				CalenderWeekList weekList = new CalenderWeekList();
				startNum = startNum+i;
				weekList.setDay(startNum);
				weekList.setWeek(week[i]);
				list.add(weekList);
			}
			for(int i=0; i<7-(totalweek+1); i++) {
				CalenderWeekList weekList = new CalenderWeekList();
				startNum= 1;
				startNum = startNum+i;
				weekList.setDay(startNum);
				weekList.setWeek(week[i]);
				list.add(weekList);
			}
			
		}else if(day+7<lastDay[month-1]) { // 주간이 다음달을 포함할 경우
			int totalweek = setWeekMethod(year, month, lastDay[month-1]);
			int startNum= lastDay[month-1]-totalweek;
			for(int i=0; i<(totalweek+1); i++) {
				CalenderWeekList weekList = new CalenderWeekList();
				startNum= day-totalweek;
				startNum = startNum+i;
				weekList.setDay(startNum);
				weekList.setWeek(week[i]);
				list.add(weekList);
			}
			
			for(int i=0; i<7-(totalweek+1); i++) {
				CalenderWeekList weekList = new CalenderWeekList();
				startNum= 1;
				startNum = startNum+i;
				weekList.setDay(startNum);
				weekList.setWeek(week[i]);
				list.add(weekList);
			}
		}else {
			for(int i=0; i<7; i++) {
				int totalweek = setWeekMethod(year, month, day);
				CalenderWeekList weekList = new CalenderWeekList();
				int startNum= day-totalweek;
				startNum = startNum+i;
				weekList.setDay(startNum);
				weekList.setWeek(week[i]);
				list.add(weekList);
			}
		}
		
		
		
		
		
		return list;
	}
	
	
	
	//Week 이전,다음
	public List<CalenderWeekList> changeWeek(int diff) {
		List<CalenderWeekList> list = new ArrayList<CalenderWeekList>();
		
		int lastDay[] = {31,28,31,30,31,30,31,31,30,31,30,31};
		int monthIndex = month-1;
		if((day+diff)<1) { //변경된 day가 1일보다 미만일 경우
			if(monthIndex==0) {
				setMonth(12);
				setYear(year-1);
				monthIndex=11;
			}else {
				monthIndex = monthIndex-1;
			}
			setDay(lastDay[monthIndex]-(day+diff));
			setMonth(monthIndex+1);
		}else if((day+diff)>lastDay[monthIndex]) {  //변경된 day가 마지막일을 초과할 경우
			if(monthIndex==11) {
				setMonth(1);
				setYear(year+1);
				
			}else {
				setMonth(monthIndex+1);
			}
			setDay(day+diff-lastDay[monthIndex]);
			
		}else { // 변경된 day가 월 범위 내 인경우
			setDay((day+diff));
		}
		
		list = setCalenderWeek();
		return list;
	}
	
	public List<CalenderWeekList> changeWeekToday() {
		SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss");
		Date time = new Date();
		String time1 = format1.format(time);
		year = Integer.parseInt(time1.substring(0,4));
		month = Integer.parseInt(time1.substring(5,7));
		day = Integer.parseInt(time1.substring(8,10));
		
		return setCalenderWeek();
	}
	
	//Day 이전,다음
	public void changeDay(int diff) {
		setDay(day+diff);
	}	
}
