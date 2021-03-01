package com.doubleu.notice.vo;

import java.util.List;

public class NoticeVo {
	int noticeNo;
	String noticeSubject;
	String noticeMid;
	String noticeReportingDate;
	String noticePostType;
	String noticePostStartDate;
	String noticePostEndDate;
	String noticeType;
	int noticeHit;
	String noticeDoc;
	
	List<NoticeAttVo> attList;

	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}

	public String getNoticeSubject() {
		return noticeSubject;
	}

	public void setNoticeSubject(String noticeSubject) {
		this.noticeSubject = noticeSubject;
	}

	public String getNoticeMid() {
		return noticeMid;
	}

	public void setNoticeMid(String noticeMid) {
		this.noticeMid = noticeMid;
	}

	public String getNoticeReportingDate() {
		return noticeReportingDate;
	}

	public void setNoticeReportingDate(String noticeReportingDate) {
		this.noticeReportingDate = noticeReportingDate;
	}

	public String getNoticePostType() {
		return noticePostType;
	}

	public void setNoticePostType(String noticePostType) {
		this.noticePostType = noticePostType;
	}

	public String getNoticePostStartDate() {
		return noticePostStartDate;
	}

	public void setNoticePostStartDate(String noticePostStartDate) {
		this.noticePostStartDate = noticePostStartDate;
	}

	public String getNoticePostEndDate() {
		return noticePostEndDate;
	}

	public void setNoticePostEndDate(String noticePostEndDate) {
		this.noticePostEndDate = noticePostEndDate;
	}

	public String getNoticeType() {
		return noticeType;
	}

	public void setNoticeType(String noticeType) {
		this.noticeType = noticeType;
	}

	public int getNoticeHit() {
		return noticeHit;
	}

	public void setNoticeHit(int noticeHit) {
		this.noticeHit = noticeHit;
	}

	public String getNoticeDoc() {
		return noticeDoc;
	}

	public void setNoticeDoc(String noticeDoc) {
		this.noticeDoc = noticeDoc;
	}

	public List<NoticeAttVo> getAttList() {
		return attList;
	}

	public void setAttList(List<NoticeAttVo> attList) {
		this.attList = attList;
	}
	
}
