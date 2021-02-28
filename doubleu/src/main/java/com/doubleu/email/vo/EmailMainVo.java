package com.doubleu.email.vo;

import java.sql.Date;
import java.util.List;

public class EmailMainVo {
	int emailNo;
	int memberNo;
	String memberMid;
	String emailAddress;
	String emailName;
	String emailTitle;
	Date emailDate;
	String emailContents;
	int emailMailBox;
	String emailChk;
	int emailDelete;
		
	List<AttEmailVo> attFileList;
	List<EmailReceiverVo> emailRevList; // 받은 사람, 참조
	List<EmailMainVo> emailReadList; // 메일 읽기
	
	public int getEmailNo() {
		return emailNo;
	}
	public void setEmailNo(int emailNo) {
		this.emailNo = emailNo;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public String getMemberMid() {
		return memberMid;
	}
	public void setMemberMid(String memberMid) {
		this.memberMid = memberMid;
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
	public List<EmailReceiverVo> getEmailRevList() {
		return emailRevList;
	}
	public void setEmailRevList(List<EmailReceiverVo> emailRevList) {
		this.emailRevList = emailRevList;
	}
	public List<EmailMainVo> getEmailReadList() {
		return emailReadList;
	}
	public void setEmailReadList(List<EmailMainVo> emailReadList) {
		this.emailReadList = emailReadList;
	}
	
	@Override
	public String toString() {
		return "EmailMainVo [emailNo=" + emailNo + ", memberNo=" + memberNo + ", memberMid=" + memberMid
				+ ", emailAddress=" + emailAddress + ", emailName=" + emailName + ", emailTitle=" + emailTitle
				+ ", emailDate=" + emailDate + ", emailContents=" + emailContents + ", emailMailBox=" + emailMailBox
				+ ", emailChk=" + emailChk + ", emailDelete=" + emailDelete + ", attFileList=" + attFileList
				+ ", emailRevList=" + emailRevList + ", emailReadList=" + emailReadList + "]";
	}
	
}
