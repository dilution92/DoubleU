package com.doubleu.email.vo;

import java.sql.Date;
import java.util.List;

public class EmailMainVo {
	
	int emailNo;
	String emailMid;
	String emailAddress;
	String emailName;
	String emailTitle;
	Date emailDate;
	String emailContents;
	int emailMailBox;
	String emailFile;
	String emailChk;
	int emailDelete;
		
	List<AttEmailVo> attFileList;
	
	
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
	
	public List<AttEmailVo> getAttFileList() {
		return attFileList;
	}
	public void setAttFileList(List<AttEmailVo> attFileList) {
		this.attFileList = attFileList;
	}
	
	@Override
	public String toString() {
		return "EmailMainVo [emailNo=" + emailNo + ", emailMid=" + emailMid + ", emailAddress=" + emailAddress
				+ ", emailName=" + emailName + ", emailTitle=" + emailTitle + ", emailDate=" + emailDate
				+ ", emailContents=" + emailContents + ", emailMailBox=" + emailMailBox + ", emailFile=" + emailFile
				+ ", emailChk=" + emailChk + ", emailDelete=" + emailDelete + ", attFileList=" + attFileList + "]";
	}
	
}
