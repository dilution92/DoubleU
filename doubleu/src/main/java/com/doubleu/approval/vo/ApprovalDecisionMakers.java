package com.doubleu.approval.vo;

public class ApprovalDecisionMakers {
	int employeeNo;
	int formNo;
	String makerName;
	String makerPosition;
	int decisionState;
	
	public int getEmployeeNo() {
		return employeeNo;
	}
	public void setEmployeeNo(int employeeNo) {
		this.employeeNo = employeeNo;
	}
	public int getFormNo() {
		return formNo;
	}
	public void setFormNo(int formNo) {
		this.formNo = formNo;
	}
	public String getMakerName() {
		return makerName;
	}
	public void setMakerName(String makerName) {
		this.makerName = makerName;
	}
	public String getMakerPosition() {
		return makerPosition;
	}
	public void setMakerPosition(String makerPosition) {
		this.makerPosition = makerPosition;
	}
	public int getDecisionState() {
		return decisionState;
	}
	public void setDecisionState(int decisionState) {
		this.decisionState = decisionState;
	}
}
