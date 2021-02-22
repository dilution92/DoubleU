<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<%
	String memberNo = (String) session.getAttribute("memberNo");
	String memberPosition= (String) session.getAttribute("memberPosition");
	
%>
	
	<input type="button" id="btnApprovalUpdateR" class="btn btn-outline-primary btn-sm" value="상신요청">
	<input type="button" id="btnApprovalTempUpdateR" class="btn btn-outline-primary btn-sm" value="임시저장">
	<input type="button" id="btnApprovalSelect" class="btn btn-outline-secondary btn-sm" value="목록으로">
	<input type="hidden" name="makerPositionArr">
	<input type="hidden" name="makerNameArr">
	<input type="hidden" name="makerOrderArr">
	<input type="hidden" name="makerNoArr">
	<input type="hidden" id="TempMakerPosition" value="">
	<input type="hidden" id="TempMakerName" value="">
	<input type="hidden" id="TempMakerNo" value="">
	<input type="hidden" name="formType" value="${formType}">
	<c:if test="${formType != '사유서' and formType != '지각/결근사유서'}">
		<input type="hidden" name="drafterPosition" value="<%= memberPosition %>">
	</c:if>
	<input type="hidden" name="checkedHaifTime" value="">
	<input type="hidden" name="vacationType" value="">
	<input type="hidden" name="memberNo" value="<%= memberNo %>">
	<input type="hidden" name="decisionMakerCnt" value="">
	<input type="hidden" name="formNo" value="${vo.formNo }">
<script type="text/javascript">
checkFormData();
</script>
</body>
</html>