package com.doubleu.approval;

import java.util.List;

// 결재 양식에 공통으로 들어가는 내용을 담은 Vo
public class ApprovalFormVo {
	int formNo;
	String drafterName;
	String formDate;
	String drafterDepartment;
	String drafterPosition;
	String formTitle;
	String formDoc;
	String formType;
	String cooperationDepartment;
	String eventDate;
	
	List<ApprovalAttFileVo> approvalAttFiles; // 파일 첨부가 있을 경우  
	List<ApprovalDecisionMakers> makersList; // 결재권자 목록을 담을 인스턴스
	FormPetition formPetition; // 품의서 관련 결재 양식일 경우
	FormVacation formVacation; // 휴가 관련 결재 양식일 경우

	
	public List<ApprovalDecisionMakers> getMakersList() {
		return makersList;
	}
	public void setMakersList(List<ApprovalDecisionMakers> makersList) {
		this.makersList = makersList;
	}
	public List<ApprovalAttFileVo> getApprovalAttFiles() {
		return approvalAttFiles;
	}
	public void setApprovalAttFiles(List<ApprovalAttFileVo> approvalAttFiles) {
		this.approvalAttFiles = approvalAttFiles;
	}
	
	
	public String getDrafterPosition() {
		return drafterPosition;
	}
	public void setDrafterPosition(String drafterPosition) {
		this.drafterPosition = drafterPosition;
	}
	public FormPetition getFormPetition() {
		return formPetition;
	}
	public void setFormPetition(FormPetition formPetition) {
		this.formPetition = formPetition;
	}
	public FormVacation getFormVacation() {
		return formVacation;
	}
	public void setFormVacation(FormVacation formVacation) {
		this.formVacation = formVacation;
	}
	public int getFormNo() {
		return formNo;
	}
	public void setFormNo(int formNo) {
		this.formNo = formNo;
	}
	public String getDrafterName() {
		return drafterName;
	}
	public void setDrafterName(String drafterName) {
		this.drafterName = drafterName;
	}
	public String getFormDate() {
		return formDate;
	}
	public void setFormDate(String formDate) {
		this.formDate = formDate;
	}
	public String getDrafterDepartment() {
		return drafterDepartment;
	}
	public void setDrafterDepartment(String drafterDepartment) {
		this.drafterDepartment = drafterDepartment;
	}
	public String getFormTitle() {
		return formTitle;
	}
	public void setFormTitle(String formTitle) {
		this.formTitle = formTitle;
	}
	public String getFormDoc() {
		return formDoc;
	}
	public void setFormDoc(String formDoc) {
		this.formDoc = formDoc;
	}
	public String getFormType() {
		return formType;
	}
	public void setFormType(String formType) {
		this.formType = formType;
	}
	public String getCooperationDepartment() {
		return cooperationDepartment;
	}
	public void setCooperationDepartment(String cooperationDepartment) {
		this.cooperationDepartment = cooperationDepartment;
	}
	public String getEventDate() {
		return eventDate;
	}
	public void setEventDate(String eventDate) {
		this.eventDate = eventDate;
	}
	
}
