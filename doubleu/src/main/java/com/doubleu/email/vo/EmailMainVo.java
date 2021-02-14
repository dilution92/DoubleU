package com.doubleu.email.vo;

import java.sql.Date;

public class EmailMainVo {

	private int emailNo;
	private String emailMid;
	private String emailAddress;
	private String emailName;
	private String emailTitle;
	private Date emailDate;
	private String emailContents;
	private int emailMailBox;
	private String emailFile;
	private String emailChk;
	private int emailDelete;
	
	public int getEmailNo() {
		return emailNo;
	}
	public void setEmailNo(int emailNo) {
		this.emailNo = emailNo;
	}
	public String getEmailMid() {
		return emailMid;
	}
	public void setEmailMid(String emailMid) {
		this.emailMid = emailMid;
	}
	public String getEmailAddress() {
		return emailAddress;
	}
	public void setEmailAddress(String emailAddress) {
		this.emailAddress = emailAddress;
	}
	public String getEmailName() {
		return emailName;
	}
	public void setEmailName(String emailName) {
		this.emailName = emailName;
	}
	public String getEmailTitle() {
		return emailTitle;
	}
	public void setEmailTitle(String emailTitle) {
		this.emailTitle = emailTitle;
	}
	public Date getEmailDate() {
		return emailDate;
	}
	public void setEmailDate(Date emailDate) {
		this.emailDate = emailDate;
	}
	public String getEmailContents() {
		return emailContents;
	}
	public void setEmailContents(String emailContents) {
		this.emailContents = emailContents;
	}
	public int getEmailMailBox() {
		return emailMailBox;
	}
	public void setEmailMailBox(int emailMailBox) {
		this.emailMailBox = emailMailBox;
	}
	public String getEmailFile() {
		return emailFile;
	}
	public void setEmailFile(String emailFile) {
		this.emailFile = emailFile;
	}
	public String getEmailChk() {
		return emailChk;
	}
	public void setEmailChk(String emailChk) {
		this.emailChk = emailChk;
	}
	public int getEmailDelete() {
		return emailDelete;
	}
	public void setEmailDelete(int emailDelete) {
		this.emailDelete = emailDelete;
	}
	
	@Override
	public String toString() {
		return "EmailMainVo [emailNo=" + emailNo + ", emailMid=" + emailMid + ", emailAddress=" + emailAddress
				+ ", emailName=" + emailName + ", emailTitle=" + emailTitle + ", emailDate=" + emailDate
				+ ", emailContents=" + emailContents + ", emailMailBox=" + emailMailBox + ", emailFile=" + emailFile
				+ ", emailChk=" + emailChk + ", emailDelete=" + emailDelete + "]";
	}
}
