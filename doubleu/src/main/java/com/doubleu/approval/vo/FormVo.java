package com.doubleu.approval.vo;

import java.util.List;

// 결재 양식에 공통으로 들어가는 내용을 담은 Vo
public class FormVo {
	int formNo;
	int memberNo;
	String drafterName;
	String formDate;
	String drafterDepartment;
	String drafterPosition;
	String formTitle;
	String formDoc;
	String formType;
	String cooperationDepartment;
	String eventDate;
	String approvalState;
	String DecisionState;
	List<AttFileVo> attFileList; // 파일 첨부가 있을 경우  
	List<AttFileVo> delFileList; // 파일 첨부가 있을 경우  
	List<DecisionMakerVo> decisionMakersList; // 결재권자 목록을 담을 인스턴스
	FormPetitionVo formPetitionVo; // 품의서 관련 결재 양식일 경우
	FormVacationVo formVacationVo; // 휴가 관련 결재 양식일 경우

	

	public List<AttFileVo> getDelFileList() {
		return delFileList;
	}
	public void setDelFileList(List<AttFileVo> delFileList) {
		this.delFileList = delFileList;
	}
	public String getDecisionState() {
		return DecisionState;
	}
	public void setDecisionState(String decisionState) {
		DecisionState = decisionState;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public List<AttFileVo> getAttFileList() {
		return attFileList;
	}
	public void setAttFileList(List<AttFileVo> attFileList) {
		this.attFileList = attFileList;
	}
	public String getApprovalState() {
		return approvalState;
	}
	public void setApprovalState(String approvalState) {
		this.approvalState = approvalState;
	}
	
	public List<DecisionMakerVo> getDecisionMakersList() {
		return decisionMakersList;
	}
	public void setDecisionMakersList(List<DecisionMakerVo> decisionMakersList) {
		this.decisionMakersList = decisionMakersList;
	}
	public String getDrafterPosition() {
		return drafterPosition;
	}
	public void setDrafterPosition(String drafterPosition) {
		this.drafterPosition = drafterPosition;
	}
	public int getFormNo() {
		return formNo;
	}
	public FormPetitionVo getFormPetitionVo() {
		return formPetitionVo;
	}
	public void setFormPetitionVo(FormPetitionVo formPetitionVo) {
		this.formPetitionVo = formPetitionVo;
	}
	public FormVacationVo getFormVacationVo() {
		return formVacationVo;
	}
	public void setFormVacationVo(FormVacationVo formVacationVo) {
		this.formVacationVo = formVacationVo;
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
