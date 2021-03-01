package com.doubleu.calender.vo;

import java.util.ArrayList;
import java.util.List;

public class CalenderWeekList {
	String week;
	int day;
	int month;
	int year;
	List<String> time;
	String minute;
	String day1;
	
	List<CalenderVo> vo; 
	
	// 컨텐츠 표시를 위한 멤버필드
	int dateIdN;
	int timeIdN;
	List<Integer> period; // 표시기간 ListVo랑 index가 일치
	
	
	
	
	public String getDay1() {
		return day1;
	}

	public void setDay1(String day1) {
		this.day1 = day1;
	}

	public CalenderWeekList() {
		vo = new ArrayList<>();
		period = new ArrayList<>();
	}
	
	public List<Integer> getPeriod() {
		return period;
	}

	public void setPeriod(int i) {
		period.add(i);
	}

	public int getDateIdN() {
		return dateIdN;
	}

	public void setDateIdN(int dateIdN) {
		this.dateIdN = dateIdN;
	}

	public int getTimeIdN() {
		return timeIdN;
	}

	public void setTimeIdN(int timeIdN) {
		this.timeIdN = timeIdN;
	}
	
	public List<CalenderVo> getVo() {
		return vo;
	}

	public void setVo(CalenderVo o) {
		vo.add(o);
	}

	public List<String> getTime() {
		return time;
	}
	public void setTime(List<String> time) {
		this.time = time;
	}
	public String getMinute() {
		return minute;
	}
	public void setMinute(String minute) {
		this.minute = minute;
	}
	
	public int getMonth() {
		return month;
	}
	public void setMonth(int month) {
		this.month = month;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public String getWeek() {
		return week;
	}
	public void setWeek(String week) {
		this.week = week;
	}
	public int getDay() {
		return day;
	}
	public void setDay(int day) {
		this.day = day;
	}

	
	
}
