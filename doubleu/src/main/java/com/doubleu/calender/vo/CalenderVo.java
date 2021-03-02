package com.doubleu.calender.vo;

import java.util.List;

public class CalenderVo {

	private int calenderNo;
	private String calenderStartYear;
	private String calenderStartMonth;
	private String calenderStartDay;
	private String calenderStartTime;
	private String calenderStartMinute;
	private String calenderEndYear;
	private String calenderEndMonth;
	private String calenderEndDay;
	private String calenderEndTime;
	private String calenderEndMinute;
	private String calenderType;
	private String calenderSubject;
	private String calenderContent;
	private String calenderPlace;
	private String calenderWriter;
	private String calenderGroup;
	private String calenderTime;
	
	/*
	 * private List<CalenderParticiptant> calPartiList;
	 * 
	 * 
	 * public List<CalenderParticiptant> getCalPartiList() { return calPartiList; }
	 * public void setCalPartiList(List<CalenderParticiptant> calPartiList) {
	 * this.calPartiList = calPartiList; }
	 */
	public String getStartDate() {
		String date;
		date = getCalenderStartYear()+"-"
			+ getCalenderStartMonth()+"-"
			+ getCalenderStartDay();
		return date;
	}
	public String getStartTime() {
		String date;
		date = 
			getCalenderStartTime()+":"
			+ getCalenderStartMinute();
		return date;
	}
	public String getEndDate() {
		String date;
		date = getCalenderEndYear()+"-"
				+ getCalenderEndMonth()+"-"
				+ getCalenderEndDay();
				
		return date;
	}
	public String getEndTime() {
		String date;
		date = 
				getCalenderEndTime()+":"
				+ getCalenderEndMinute();
		return date;
	}
	public String getCalenderType() {
		return calenderType;
	}
	public void setCalenderType(String calenderType) {
		this.calenderType = calenderType;
	}
	public int getCalenderNo() {
		return calenderNo;
	}
	public void setCalenderNo(int calenderNo) {
		this.calenderNo = calenderNo;
	}
	public String getCalenderStartYear() {
		return calenderStartYear;
	}
	public void setCalenderStartYear(String calenderStartYear) {
		this.calenderStartYear = calenderStartYear;
	}
	public String getCalenderStartMonth() {
		return calenderStartMonth;
	}
	public void setCalenderStartMonth(String calenderStartMonth) {
		this.calenderStartMonth = calenderStartMonth;
	}
	public String getCalenderStartDay() {
		return calenderStartDay;
	}
	public void setCalenderStartDay(String calenderStartDay) {
		this.calenderStartDay = calenderStartDay;
	}
	public String getCalenderStartTime() {
		return calenderStartTime;
	}
	public void setCalenderStartTime(String calenderStartTime) {
		this.calenderStartTime = calenderStartTime;
	}
	public String getCalenderStartMinute() {
		return calenderStartMinute;
	}
	public void setCalenderStartMinute(String calenderStartMinute) {
		this.calenderStartMinute = calenderStartMinute;
	}
	public String getCalenderEndYear() {
		return calenderEndYear;
	}
	public void setCalenderEndYear(String calenderEndYear) {
		this.calenderEndYear = calenderEndYear;
	}
	public String getCalenderEndMonth() {
		return calenderEndMonth;
	}
	public void setCalenderEndMonth(String calenderEndMonth) {
		this.calenderEndMonth = calenderEndMonth;
	}
	public String getCalenderEndDay() {
		return calenderEndDay;
	}
	public void setCalenderEndDay(String calenderEndDay) {
		this.calenderEndDay = calenderEndDay;
	}
	public String getCalenderEndTime() {
		return calenderEndTime;
	}
	public void setCalenderEndTime(String calenderEndTime) {
		this.calenderEndTime = calenderEndTime;
	}
	public String getCalenderEndMinute() {
		return calenderEndMinute;
	}
	public void setCalenderEndMinute(String calenderEndMinute) {
		this.calenderEndMinute = calenderEndMinute;
	}
	public String getCalenderSubject() {
		return calenderSubject;
	}
	public void setCalenderSubject(String calenderSubject) {
		this.calenderSubject = calenderSubject;
	}
	public String getCalenderContent() {
		return calenderContent;
	}
	public void setCalenderContent(String calenderContent) {
		this.calenderContent = calenderContent;
	}
	public String getCalenderPlace() {
		return calenderPlace;
	}
	public void setCalenderPlace(String calenderPlace) {
		this.calenderPlace = calenderPlace;
	}
	public String getCalenderWriter() {
		return calenderWriter;
	}
	public void setCalenderWriter(String calenderWriter) {
		this.calenderWriter = calenderWriter;
	}
	public String getCalenderGroup() {
		return calenderGroup;
	}
	public void setCalenderGroup(String calenderGroup) {
		this.calenderGroup = calenderGroup;
	}
	public String getCalenderTime() {
		return calenderTime;
	}
	public void setCalenderTime(String calenderTime) {
		this.calenderTime = calenderTime;
	}
	
	
}
