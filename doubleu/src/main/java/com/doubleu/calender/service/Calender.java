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
	
	public List<Integer> monthSelectedMonth(int changedMonth) {
		setMonth(changedMonth);
		return setMonthCalender();
	}
	
	public List<Integer> monthSelectedYear(int changedYear) {
		setYear(changedYear);
		return setMonthCalender();
	}
	
	//@@@@@@@@@@@@@@@@@@ CalenderWeek @@@@@@@@@@@@@@@@@@@
	
	
	public List<CalenderWeekList> setCalenderWeek() {
		
		List<CalenderWeekList> list = new ArrayList<>();
		
		int totalweek ;
		int startNum ;
		
		if(day-7<0 && day<=setWeekMethod(year, month, day)) { // 주간이 지난달을 포함할 경우
			
			if((month-1)==0) {
				totalweek = setWeekMethod(year-1, 12, lastDay[11]);
				startNum= lastDay[11]-totalweek;
				
			}else {
				totalweek = setWeekMethod(year, month-1, lastDay[month-2]);
				startNum= lastDay[month-2]-totalweek;
				
			}
			
			for(int i=0; i<totalweek+1; i++) {
				CalenderWeekList weekList = new CalenderWeekList();
				weekList.setDay(startNum);
				weekList.setWeek(week[i]);
				list.add(weekList);
				startNum = startNum+1;
			}
			
			startNum= 1;
			
			for(int i=(totalweek+1); i<7; i++) {
				CalenderWeekList weekList = new CalenderWeekList();
				weekList.setDay(startNum);
				weekList.setWeek(week[i]);
				list.add(weekList);
				startNum = startNum+1;
			}
			
		}else if(day+7-(totalweek = setWeekMethod(year, month, day))>lastDay[month-1]) { // 주간이 다음달을 포함할 경우
			totalweek = setWeekMethod(year, month, lastDay[month-1]);
			startNum= lastDay[month-1]-totalweek;
			
			if(month==12) {
				totalweek = setWeekMethod(year, 12, lastDay[11]);
				startNum= lastDay[11]-totalweek;
				
			}else {
				totalweek = setWeekMethod(year, month, lastDay[month-1]);
				startNum= lastDay[month-1]-totalweek;
				
			}
			
			for(int i=0; i<totalweek+1; i++) {
				CalenderWeekList weekList = new CalenderWeekList();
				weekList.setDay(startNum);
				weekList.setWeek(week[i]);
				list.add(weekList);
				startNum = startNum+1;
			}
			
			startNum= 1;
			
			for(int i=(totalweek+1); i<7; i++) {
				CalenderWeekList weekList = new CalenderWeekList();
				System.out.println(startNum+"스타트넘");
				weekList.setDay(startNum);
				weekList.setWeek(week[i]);
				list.add(weekList);
				startNum = startNum+1;
			}
			
		}else {
			
			totalweek = setWeekMethod(year, month, day);
			startNum= day-totalweek;
			
			for(int i=0; i<7; i++) {
				CalenderWeekList weekList = new CalenderWeekList();
				weekList.setDay(startNum);
				weekList.setWeek(week[i]);
				list.add(weekList);
				startNum = startNum+1;
			}
		}
		
		return list;
	}
	
	
	
	//Week 이전,다음
	public List<CalenderWeekList> changeWeek(int diff) {
		List<CalenderWeekList> list = new ArrayList<CalenderWeekList>();
		int totalweek ;
		int lastDay[] = {31,28,31,30,31,30,31,31,30,31,30,31};
		int monthIndex = month-1;
		if((day+diff)<1) { //변경된 day가 1일보다 미만일 경우
			if(monthIndex==0) {
				setMonth(12);
				setYear(year-1);
				monthIndex=11;
			}else {
				monthIndex = monthIndex-1;
				setMonth(monthIndex+1);
			}
			setDay(lastDay[monthIndex]+(day+diff));
		}else if((day+diff)>lastDay[monthIndex]) {  //변경된 day가 마지막일을 초과할 경우
			if(monthIndex==11) {
				setMonth(1);
				setYear(year+1);
				setDay(day+diff-lastDay[11]);
			}else {
				setMonth(month+1);
				setDay(day+diff-lastDay[monthIndex]);
			}
			
		}else { // 변경된 day가 월 범위 내 인경우
			setDay((day+diff));
		}
		
		list = setCalenderWeek();
		System.out.println(day + "현재 설정날짜");
		return list;
	}
	
	public List<CalenderWeekList> changeWeekToday() {
		SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss");
		Date time = new Date();
		String time1 = format1.format(time);
		year = Integer.parseInt(time1.substring(0,4));
		month = Integer.parseInt(time1.substring(5,7));
		day = Integer.parseInt(time1.substring(8,10));
		
		System.out.println(year);
		System.out.println(month);
		System.out.println(day);
		return setCalenderWeek();
	}
	
	
	public CalenderWeekList setCalenderDay() {
		CalenderWeekList listDay = new CalenderWeekList();
		listDay.setDay(day);
		listDay.setWeek(week[setWeekMethod(year, month, day)]);
		
		return listDay;
	}
	
	public List<CalenderWeekList> weekSelectedMonth(int changedMonth) {
		setMonth(changedMonth);
		return setCalenderWeek();
	}
	
	public List<CalenderWeekList> weekSelectedYear(int changedYear) {
		setYear(changedYear);
		return setCalenderWeek();
	}
	
	//Day 이전,다음
	public CalenderWeekList changeDay(int diff) {
		
		CalenderWeekList listDay = new CalenderWeekList();
		if(day+diff==0) {
			if(month==1){
				setYear(year-1);
				setMonth(12);
				setDay(31);
			}else {
				setMonth(month-1);
				setDay(lastDay[month-1]);
			}
		}else if(day+diff>lastDay[month-1]) {
			if(month==12) {
				setYear(year+1);
				setMonth(1);
				setDay(1);
			}else {
				setMonth(month+1);
				setDay(1);
			}
		}else {
			setDay(day-1);
		}
		listDay.setDay(day);
		listDay.setWeek(week[setWeekMethod(year, month, day)]);
		
		return listDay;
	}	
	
	public CalenderWeekList changeDayToday() {
		
		CalenderWeekList listDay = new CalenderWeekList();
		SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss");
		Date time = new Date();
		String time1 = format1.format(time);
		year = Integer.parseInt(time1.substring(0,4));
		month = Integer.parseInt(time1.substring(5,7));
		day = Integer.parseInt(time1.substring(8,10));
		
		listDay.setDay(day);
		listDay.setWeek(week[setWeekMethod(year, month, day)]);
		
		return listDay;
	}
	
	public CalenderWeekList daySelectedMonth(int changedMonth) {
		setMonth(changedMonth);
		return setCalenderDay();
	}
	
	public CalenderWeekList daySelectedYear(int changedYear) {
		setYear(changedYear);
		return setCalenderDay();
	}
}
