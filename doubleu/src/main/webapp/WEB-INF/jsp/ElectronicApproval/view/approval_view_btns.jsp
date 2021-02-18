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
	<div class="e-approval-view-btn-box">
		<c:choose>
			<c:when test="${vo.approvalState eq '(발신)상신' }">
				<div class="e-approva-view-btn-content">
					<input type="button" class="btn btn-outline-primary btn-sm" value="인쇄">
				</div>
				<div class="e-approva-view-btn-content">
					<input type="button" class="btn btn-outline-primary btn-sm" value="상신 취소" style="float: left">
					<input type="button" class="btn btn-outline-secondary btn-sm" value="삭제" style="float: left">
					<input type="button" class="btn btn-outline-secondary btn-sm" value="목록으로">
				</div>
			</c:when>
			<c:when test="${vo.approvalState eq '(발신)임시저장' }">
				<div class="e-approva-view-btn-content">
					<input type="button" class="btn btn-outline-secondary btn-sm" value="수정" style="float: left">
					<input type="button" class="btn btn-outline-secondary btn-sm" value="삭제" style="float: left">
					<input type="button" class="btn btn-outline-secondary btn-sm" value="목록으로">
				</div>
			</c:when>			
			<c:when test="${vo.approvalState eq '(발신)승인' }">
				<div class="e-approva-view-btn-content">
					<input type="button" class="btn btn-outline-primary btn-sm" value="인쇄">
				</div>
				<div class="e-approva-view-btn-content">
					<input type="button" class="btn btn-outline-secondary btn-sm" value="목록으로">
				</div>
			</c:when>
			<c:when test="${vo.approvalState eq '(발신)반려' }">
				<div class="e-approva-view-btn-content">
					<input type="button" class="btn btn-outline-primary btn-sm" value="인쇄">
				</div>
				<div class="e-approva-view-btn-content">
					<input type="button" class="btn btn-outline-primary btn-sm" value="재상신" style="float: left">
					<input type="button" class="btn btn-outline-secondary btn-sm" value="수정" style="float: left">
					<input type="button" class="btn btn-outline-secondary btn-sm" value="삭제" style="float: left">
					<input type="button" class="btn btn-outline-secondary btn-sm" value="목록으로">
				</div>
			</c:when>
			<c:when test="${vo.approvalState eq '(수신)결재예정' }">
				<div class="e-approva-view-btn-content">
					<input type="button" class="btn btn-outline-primary btn-sm" value="승인" style="float: left">
					<input type="button" class="btn btn-outline-secondary btn-sm" value="반려" style="float: left">
					<input type="button" class="btn btn-outline-secondary btn-sm" value="목록으로">
				</div>
			</c:when>
			<c:when test="${vo.approvalState eq '(수신)승인' }">
				<div class="e-approva-view-btn-content">
					<input type="button" class="btn btn-outline-secondary btn-sm" value="반려" style="float: left">
					<input type="button" class="btn btn-outline-secondary btn-sm" value="목록으로">
				</div>
			</c:when>
			<c:when test="${vo.approvalState eq '(수신)반려' }">
					<input type="button" class="btn btn-outline-primary btn-sm" value="승인" style="float: left">
					<input type="button" class="btn btn-outline-secondary btn-sm" value="목록으로">
			</c:when>
		</c:choose>
		</div>
</body>
</html>