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
		
		session.setAttribute("employeeNo", "3355");
		session.setAttribute("employeeName", "정해준");
		session.setAttribute("employeePosition", "주임");
	%>	
	
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
					<a href="ElectronicApproval/E_Approval_home.jsp?mainJob=E_Approval_select_choose.jsp&selectName=발신된 문서">발신 문서함</a>
					<ul>	<!-- /WEB-INF/ElectronicApproval/E_Approval_home.jsp?mainJob=E_Approval_select_choose.jsp&selectName=상신한 문서함 -->
						<li><a href="/approvalGoList?findState=(발신)상신">상신한 문서함</a></li>
						<li><a href="/approvalGoList?findState=(발신)임시저장">임시 저장된 문서</a></li>
						<li><a href="/approvalGoList?findState=(발신)승인">승인 완료된 문서</a></li>
						<li><a href="/approvalGoList?findState=(발신)반려">반려된 문서</a></li>
					</ul>
				</div>
				<div class="e-approval-approval-list">
					<a href="ElectronicApproval/E_Approval_home.jsp?mainJob=E_Approval_select_choose.jsp&selectName=수신된 문서">수신 문서함</a>					
					<ul>
						<li><a href="/approvalGoList?selectName=(수신)결재예정">결재할 문서</a></li>
						<li><a href="/approvalGoList?selectName=(수신)승인">승인한 문서</a></li>
						<li><a href="/approvalGoList?selectName=(수신)반려">반려한 문서</a></li>
					</ul>
				</div>
			</div>
		</nav>
	<!-- lnb code 끝 -->
		<main class="e-approval-article">
		<c:if test="${mainJob eq 'select/approval_select_formState.jsp' or mainJob eq 'select/approval_select.jsp'}">
		<!-- 전자결재홈 검색바 code -->
			<div class="e-approval-search-bar">
	      		<form class="e-approval-search-form" action="" name="frmApproval" method="post">
			      	<div class="e-approval-form-box">
				        <input class="btn btn-outline-primary btn-sm" type="button" value="검색"/>
				        <input class="form-control form-control-sm" name="findStr" value="" type="text" placeholder="Search" aria-label="Search" id="approvalFindStr">
				      	<select class="form-control form-control-sm e-approval-select-box">
				      		<option selected> 문서 상태 </option>
				      		<option value="0"> 진행중인 문서 </option>
				      		<option value="1"> 임시저장한 문서 </option>
				      		<option value="2"> 승인된 문서 </option>
				      		<option value="3"> 반려된 문서 </option>
				      		<option value="4"> 결재해야할 문서 </option>
				      		<option value="5"> 승인한 문서 </option>
				      		<option value="6"> 반려한 문서 </option>
				      	</select>
					</div>
					<!-- hidden 탭 -->
					<input type="hidden" name="formNo" value="">
					<input type="hidden" name="formType" value="">
					<input type="hidden" name="formState" value="">
					
					<input type="hidden" name="nowPage" value="${(empty param.nowpage)? 1 : param.Page}">
	     		</form>
			</div>
		</c:if>
			<jsp:include page="/WEB-INF/jsp/ElectronicApproval/${(empty mainJob)? 'select/approval_select.jsp': mainJob }"></jsp:include>
		</main>
	</section>
	
	
	<!-- 모달창 -->
	<div class="modal fade e-approval-formChoose-modal" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">결재 유형 선택</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="moadl-body e-approval-scroll">
					<div class="accordion" id="accordionExample">
						<div class="card">
							<div class="card-header e-approval-formChoose-modal-tab" id="headingOne">
								<h6 class="mb-0">
									<button class="btn btn-link btn-block text-left e-approval-formChoose-btn" type="button" data-toggle="collapse" data-target="#collapseOne"
									 aria-expanded="true" aria-controls="collapseOne">
									 업무
									 </button>
								</h6>
							</div>
							<div id="collapseOne" class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
								<div class="card-body">
									<ul  class="e-approval-formChoose-modal-ul">
										<li><a href="/approvalGoFormType?formType=업무기안">업무 기안</a></li>
										<li><a href="/approvalGoFormType?formType=업무협조">업무 협조</a></li>
										<li><a href="/approvalGoFormType?formType=품의서">품의서</a></li>
										<li><a href="/approvalGoFormType?formType=구매품의서">구매품의서</a></li>
										<li><a href="/approvalGoFormType?formType=사유서">사유서</a></li>
									</ul>
								</div>
							</div>
						</div>
						<div class="card">
							<div class="card-header e-approval-formChoose-modal-tab" id="headingTwo">
								<h6 class="mb-0">
									<button class="btn btn-link btn-block text-left e-approval-formChoose-btn" type="button" data-toggle="collapse" data-target="#collapseTwo"
									 aria-expanded="true" aria-controls="collapseTwo" style="width: 100%;">
									 인사
									</button>
								</h6>
							</div>
							<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
								<div class="card-body">
									<ul class="e-approval-formChoose-modal-ul">
										<li><a href="/approvalGoFormType?formType=휴가신청서">휴가 신청서</a></li>
										<li><a href="/approvalGoFormType?formType=지각/결근사유서">지각/결근 사유서</a></li>
									</ul>
								</div>
							</div>
						</div>
						<div class="card">
							<div class="card-header e-approval-formChoose-modal-tab" id="headingThree">
								<h6 class="mb-0">
									<button class="btn btn-link btn-block text-left e-approval-formChoose-btn" type="button" data-toggle="collapse" data-target="#collapseThree"
									 aria-expanded="true" aria-controls="collapseThree">
									 지출 결의
									 </button>
								</h6>
							</div>
							<div class="collapse" id="collapseThree" aria-labelledby="headingThree" data-parent="#accordionExample">
								<div class="card-body">
									<ul  class="e-approval-formChoose-modal-ul">
										<li><a href="/approvalGoFormType?formType=지출결의서">지출결의서</a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<input type="button" class="btn btn-secondary" data-dismiss="modal" value="close">
				</div>
			</div>
		</div>
	</div>

<script type="text/javascript">
</script>

</body>
</html>