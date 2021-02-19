package com.doubleu.email.vo;

public class EmailReceiverVo {
	
	int emailReceiverNo;
	int emailNo;
	String emailReceiverName;
	String emailReceiverAddress;
	String emailReceiverDept;
	int emailReceiverRef;
	String emailMid;
	
	public int getEmailReceiverNo() {
		return emailReceiverNo;
	}
	public void setEmailReceiverNo(int emailReceiverNo) {
		this.emailReceiverNo = emailReceiverNo;
	}
	public int getEmailNo() {
		return emailNo;
	}
	public void setEmailNo(int emailNo) {
		this.emailNo = emailNo;
	}
	public String getEmailReceiverName() {
		return emailReceiverName;
	}
	public void setEmailReceiverName(String emailReceiverName) {
		this.emailReceiverName = emailReceiverName;
	}
	public String getEmailReceiverAddress() {
		return emailReceiverAddress;
	}
	public void setEmailReceiverAddress(String emailReceiverAddress) {
		this.emailReceiverAddress = emailReceiverAddress;
	}
	public String getEmailReceiverDept() {
		return emailReceiverDept;
	}
	public void setEmailReceiverDept(String emailReceiverDept) {
		this.emailReceiverDept = emailReceiverDept;
	}
	public int getEmailReceiverRef() {
		return emailReceiverRef;
	}
	public void setEmailReceiverRef(int emailReceiverRef) {
		this.emailReceiverRef = emailReceiverRef;
	}
	public String getEmailMid() {
		return emailMid;
	}
	public void setEmailMid(String emailMid) {
		this.emailMid = emailMid;
	}
	
	@Override
	public String toString() {
		return "EmailReceiverVo [emailReceiverNo=" + emailReceiverNo + ", emailNo=" + emailNo + ", emailReceiverName="
				+ emailReceiverName + ", emailReceiverAddress=" + emailReceiverAddress + ", emailReceiverDept="
				+ emailReceiverDept + ", emailReceiverRef=" + emailReceiverRef + ", emailMid=" + emailMid + "]";
	}
}
