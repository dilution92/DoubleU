<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전자결재 홈</title>

<!-- bootstrap CDN -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
<!-- main page CSS -->
<link rel="stylesheet" href="/css/MainIndex.css">
<!-- 전자결재용 CSS -->
<link rel="stylesheet" href="/css/ElectronicApproval/ElectronicApproval.css">
<script type="text/javascript" src="/js/E-Approval/ElectronicApproval.js"></script>
<!-- bootstrap script, Jquery CDN -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
		crossorigin="anonymous"></script>
<!-- ****************************** -->
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String mainJob = "select/approval_select.jsp";
		if(request.getParameter("mainJob") != null) {
			mainJob = request.getParameter("mainJob");
		}
		
	%>	
	
<form class="e-approval-search-form" action="" name="frmApproval" method="post">
	<!-- 그룹웨어 GNB -->
	<header class="container-fluid main-gnb">
		<jsp:include page="/WEB-INF/jsp/MainPage/header.jsp"></jsp:include>
	 </header>
	 <!-- 그룹웨어 GNB code 끝 -->
	 
	<section class="e-approval-container">
		<!-- e-approval-lnb code -->
		<nav class="e-approval-lnb">
			<div class="e-approval-lnb-content">
				<h4>전자결재 홈</h4>
				<div class="e-approval-form-btn">
					<input type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#exampleModal" value="새 결재 진행">
				</div>
				<div class="e-approval-approval-list">
					<a href="#">발신 문서함</a>
					<ul>	<!-- /WEB-INF/ElectronicApproval/E_Approval_home.jsp?mainJob=E_Approval_select_choose.jsp&selectName=상신한 문서함 -->
						<li><a href="/approvalGoList?findState=(발신)상신">상신한 문서함</a></li>
						<li><a href="/approvalGoList?findState=(발신)임시저장">임시 저장된 문서</a></li>
						<li><a href="/approvalGoList?findState=(발신)승인">승인 완료된 문서</a></li>
						<li><a href="/approvalGoList?findState=(발신)반려">반려된 문서</a></li>
					</ul>
				</div>
				<div class="e-approval-approval-list">
					<a href="#">수신 문서함</a>					
					<ul>
						<li><a href="/approvalGoList?findState=0">결재할 문서</a></li>
						<li><a href="/approvalGoList?findState=1">승인한 문서</a></li>
						<li><a href="/approvalGoList?findState=-1">반려한 문서</a></li>
					</ul>
				</div>
			</div>
		</nav>
	<!-- lnb code 끝 -->
		<main class="e-approval-article">
		<c:if test="${mainJob eq 'select/approval_select_formState.jsp' or mainJob eq 'select/approval_select.jsp'}">
		<!-- 전자결재홈 검색바 code -->
			<div class="e-approval-search-bar">
			      	<div class="e-approval-form-box">
				        <input class="btn btn-outline-primary btn-sm" id="btnApprovalFind" type="button" value="검색"/>
			      		<input class="form-control form-control-sm" name="findStr" value="${(empty param.findStr)? '':param.findStr}" type="text" placeholder="Search" aria-label="Search" id="approvalFindStr">
		     			<select id="selectFormType" class="form-control form-control-sm e-approval-select-box">
							<option value=""> 결재 양식 유형 </option>
							<option value="업무기안"> 업무 기안 </option>
							<option value="업무협조"> 업무 협조 </option>
							<option value="품의서"> 품의서 </option>
							<option value="구매품의서"> 구매품의서 </option>
							<option value="사유서"> 사유서</option>
							<option value="휴가신청서"> 휴가신청서 </option>
							<option value="지각/결근사유서"> 지각/결근사유서 </option>
							<option value="지출결의서"> 지각/결근사유서 </option>
						</select>
					</div>
					<!-- hidden 탭 -->
					<input type="hidden" name="formType" value="">
					<input type="hidden" name="formNo" value="">
					<input type="hidden" name="formState" value="">
					<input type="hidden" name="selectFormType" value="">
					<input type="hidden" name="selectFormState" value="">
					<input type="hidden" name="findType" value="${(empty param.findType)? '':param.findType}">
			</div>
		</c:if>
			<div>
			<jsp:include page="/WEB-INF/jsp/ElectronicApproval/${(empty mainJob) ? 'select/approval_select.jsp' : mainJob }"></jsp:include>
			</div>
		</main>
	</section>
	<!-- 모달창 -->
	<div>
		<jsp:include page="/WEB-INF/jsp/ElectronicApproval/modal/insertForm.jsp"></jsp:include>
	</div>
	
</form>
<script type="text/javascript">
funcApproval();
</script>

</body>
</html>