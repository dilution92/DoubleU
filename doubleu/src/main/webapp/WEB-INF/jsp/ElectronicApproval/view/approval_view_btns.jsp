<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String memberNo = (String) session.getAttribute("memberNo");
	String memberPosition= (String) session.getAttribute("memberPosition");
	String memberName= (String) session.getAttribute("memberName");
	String memberDepartment= (String) session.getAttribute("memberDepartment");
	
%>

		<c:choose>
			<c:when test="${vo.approvalState eq '(발신)상신' and memberNo == vo.memberNo}">
					<div class="e-approval-view-btn-box">
						<div class="e-approva-view-btn-content">
							<input type="button" class="btn btn-outline-primary btn-sm" value="인쇄">
						</div>
						<div class="e-approva-view-btn-content">
							<input type="button" id="btnApprovalCancelReport" class="btn btn-outline-primary btn-sm" value="상신 취소" style="float: left">
							<input type="button"  id="btnApprovalDelete" class="btn btn-outline-secondary btn-sm" value="삭제" style="float: left">
							<input type="button" name="btnApprovalSelect" id="btnApprovalSelect" class="btn btn-outline-secondary btn-sm" value="목록으로">
						</div>
					</div>
			</c:when>
			<c:when test="${vo.approvalState eq '(발신)임시저장' and memberNo == vo.memberNo}">
				<div class="e-approval-view-btn-box" style="display: flex; justify-content: flex-end;">
					<div class="e-approva-view-btn-content">
						<input type="button" id="btnApprovalUpdate" class="btn btn-outline-primary btn-sm" value="수정" style="float: left">
						<input type="button" id="btnApprovalDelete" class="btn btn-outline-secondary btn-sm" value="삭제" style="float: left">
						<input type="button" name="btnApprovalSelect" id="btnApprovalSelect" class="btn btn-outline-secondary btn-sm" value="목록으로">
					</div>
				</div>
			</c:when>			
			<c:when test="${vo.approvalState eq '(발신)승인' and memberNo == vo.memberNo}">
				<div class="e-approval-view-btn-box">
					<div class="e-approva-view-btn-content">
						<input type="button" id="btnApprovalPrint" class="btn btn-outline-primary btn-sm" value="인쇄">
					</div>
					<div class="e-approva-view-btn-content">
						<input type="button" name="btnApprovalSelect" id="btnApprovalSelect" class="btn btn-outline-secondary btn-sm" value="목록으로">
					</div>
				</div>
			</c:when>
			<c:when test="${vo.approvalState eq '(발신)반려' and memberNo == vo.memberNo }">
				<div class="e-approval-view-btn-box">
					<div class="e-approva-view-btn-content">
						<input type="button" id="btnAppro0valUpdate" class="btn btn-outline-primary btn-sm" value="수정" style="float: left">
						<input type="button" id="btnApprovalDelete" class="btn btn-outline-secondary btn-sm" value="삭제" style="float: left">
						<input type="button" name="btnApprovalSelect" id="btnApprovalSelect" class="btn btn-outline-secondary btn-sm" value="목록으로">
					</div>
				</div>
			</c:when>
			<c:when test="${makerVo.makerOrder == '1'}">
				<div class="e-approval-view-btn-box"  style="display: flex; justify-content: flex-end;">
					<div class="e-approva-view-btn-content">
						<input type="button" id="btnFormApproval" class="btn btn-outline-primary btn-sm" value="승인" style="float: left">
						<input type="button" id="btnFormReject" class="btn btn-outline-secondary btn-sm" value="반려" style="float: left">
						<input type="button" name="btnApprovalSelect" id="btnApprovalSelect" class="btn btn-outline-secondary btn-sm" value="목록으로">
					</div>
				</div>
			</c:when>
			<c:when test="${vo.approvalState eq '(수신)승인' }">
				<div class="e-approval-view-btn-box">
					<div class="e-approva-view-btn-content">
						<input type="button" id="btnApprovalPrint" class="btn btn-outline-primary btn-sm" value="인쇄">
					</div>
					<div class="e-approva-view-btn-content">
						<input type="button" id="btnFormReject" class="btn btn-outline-secondary btn-sm" value="반려" style="float: left">
						<input type="button" name="btnApprovalSelect" id="btnApprovalSelect" class="btn btn-outline-secondary btn-sm" value="목록으로">
					</div>
				</div>
			</c:when>
			<c:when test="${vo.approvalState eq '(수신)반려' }">
				<div class="e-approval-view-btn-box">
					<input type="button" id="btnFormApproval" class="btn btn-outline-primary btn-sm" value="승인" style="float: left">
					<input type="button"  name="btnApprovalSelect" id="btnApprovalSelect"  class="btn btn-outline-secondary btn-sm" value="목록으로">
				</div>
			</c:when>
		</c:choose>
		<input type="hidden" name="findStr">	
		<input type="hidden" name="nowOutgoingPage" value="${param.nowOutgoingPage }">
		<input type="hidden" name="nowReceiverPage" value="${param.nowReceiverPage }"> 
		<input type="hidden" name="nowPlace" value="${param.nowPlace}">
		<input type="hidden" name="nowChooseSelectPage"value="${param.nowChooseSelectPage }">
		<input type="hidden" name="findState" value="${param.findState }">
		<input type="hidden" name="formNo" value="${vo.formNo }" >
		<input type="hidden" name="formType" value="${vo.formType }">
</body>
</html>