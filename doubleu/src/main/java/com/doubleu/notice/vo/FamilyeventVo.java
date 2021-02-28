package com.doubleu.notice.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class FamilyeventVo {
	int familyeventNo;
	String familyeventSubject;
	String familyeventMid;
	String familyeventReportingDate;
	String familyeventPostType;
	String familyeventPostStartDate;
	String familyeventPostEndDate;
	String familyeventType;
	int familyeventHit;
	String familyeventDoc;

	List<FamilyeventAttVo> attList;
	
	public int getFamilyeventNo() {
		return familyeventNo;
	}
	public void setFamilyeventNo(int familyeventNo) {
		this.familyeventNo = familyeventNo;
	}
	public String getFamilyeventSubject() {
		return familyeventSubject;
	}
	public void setFamilyeventSubject(String familyeventSubject) {
		this.familyeventSubject = familyeventSubject;
	}
	public String getFamilyeventMid() {
		return familyeventMid;
	}
	public void setFamilyeventMid(String familyeventMid) {
		this.familyeventMid = familyeventMid;
	}
	public String getFamilyeventReportingDate() {
		return familyeventReportingDate;
	}
	public void setFamilyeventReportingDate(String familyeventReportingDate) {
		this.familyeventReportingDate = familyeventReportingDate;
	}
	public String getFamilyeventPostType() {
		return familyeventPostType;
	}
	public void setFamilyeventPostType(String familyeventPostType) {
		this.familyeventPostType = familyeventPostType;
	}
	public String getFamilyeventPostStartDate() {
		return familyeventPostStartDate;
	}
	public void setFamilyeventPostStartDate(String familyeventPostStartDate) {
		this.familyeventPostStartDate = familyeventPostStartDate;
	}
	public String getFamilyeventPostEndDate() {
		return familyeventPostEndDate;
	}
	public void setFamilyeventPostEndDate(String familyeventPostEndDate) {
		this.familyeventPostEndDate = familyeventPostEndDate;
	}
	public String getFamilyeventType() {
		return familyeventType;
	}
	public void setFamilyeventType(String familyeventType) {
		this.familyeventType = familyeventType;
	}
	public int getFamilyeventHit() {
		return familyeventHit;
	}
	public void setFamilyeventHit(int familyeventHit) {
		this.familyeventHit = familyeventHit;
	}
	public String getFamilyeventDoc() {
		return familyeventDoc;
	}
	public void setFamilyeventDoc(String familyeventDoc) {
		this.familyeventDoc = familyeventDoc;
	}

	public List<FamilyeventAttVo> getAttList() {
		return attList;
	}
	public void setAttList(List<FamilyeventAttVo> attList) {
		this.attList = attList;
	}
	
}
