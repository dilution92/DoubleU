package com.doubleu.calender.vo;

public class CalenderWeekList {
	String week;
	int day;
	int month;
	int year;
	String time;
	String minute;
	String dateId;
	String timeId;
	
	CalenderVo vo; 
	
	
	
	public CalenderWeekList() {
		vo = new CalenderVo();
	}
	
	public CalenderVo getVo() {
		return vo;
	}
	public void setVo(CalenderVo vo) {
		this.vo = vo;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getMinute() {
		return minute;
	}
	public void setMinute(String minute) {
		this.minute = minute;
	}
	public String getDateId() {
		return dateId;
	}
	public void setDateId(String id) {
		dateId = id;
	}
	public String getTimeId() {
		return timeId;
	}
	public void setTimeId(String timeId) {
		timeId = timeId;
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
