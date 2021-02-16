package com.doubleu.approval.vo;

public class FormVacationVo {
	int formNo;
	String startDate;
	String endDate;
	String vacationCnt;
	String vacationType;
	String halfDayType;
	
	public String getHalfDayType() {
		return halfDayType;
	}
	public void setHalfDayType(String halfDayType) {
		this.halfDayType = halfDayType;
	}
	public String getVacationCnt() {
		return vacationCnt;
	}
	public void setVacationCnt(String vacationCnt) {
		this.vacationCnt = vacationCnt;
	}
	public int getFormNo() {
		return formNo;
	}
	public void setFormNo(int formNo) {
		this.formNo = formNo;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getVacationType() {
		return vacationType;
	}
	public void setVacationType(String vacationType) {
		this.vacationType = vacationType;
	}

}
