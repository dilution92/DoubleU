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
		String mainJob = "E_Approval_select.jsp";
		if(request.getParameter("mainJob") != null) {
			mainJob = request.getParameter("mainJob");
		}
	%>	
	
	<!-- 그룹웨어 GNB -->
	<header class="container-fluid main-gnb">
		<jsp:include page="/MainPage/header.jsp"></jsp:include>
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
					<a href="E_Approval_home.jsp?mainJob=E_Approval_select_choose.jsp&selectName=발신된 문서">발신 문서함</a>
					<ul>
						<li><a href="E_Approval_home.jsp?mainJob=E_Approval_select_choose.jsp&selectName=상신한 문서함">상신한 문서함</a></li>
						<li><a href="E_Approval_home.jsp?mainJob=E_Approval_select_choose.jsp&selectName=임시 저장된 문서">임시 저장된 문서</a></li>
						<li><a href="E_Approval_home.jsp?mainJob=E_Approval_select_choose.jsp&selectName=승인 완료된 문서">승인 완료된 문서</a></li>
						<li><a href="E_Approval_home.jsp?mainJob=E_Approval_select_choose.jsp&selectName=반려된 문서">반려된 문서</a></li>
					</ul>
				</div>
				<div class="e-approval-approval-list">
					<a href="E_Approval_home.jsp?mainJob=E_Approval_select_choose.jsp&selectName=수신된 문서">수신 문서함</a>					
					<ul>
						<li><a href="E_Approval_home.jsp?mainJob=E_Approval_select_choose.jsp&selectName=결재할 문서">결재할 문서</a></li>
						<li><a href="E_Approval_home.jsp?mainJob=E_Approval_select_choose.jsp&selectName=승인한 문서">승인한 문서</a></li>
						<li><a href="E_Approval_home.jsp?mainJob=E_Approval_select_choose.jsp&selectName=반려한 문서">반려한 문서</a></li>
					</ul>
				</div>
			</div>
		</nav>
	<!-- lnb code 끝 -->
		<main class="e-approval-article">
			<jsp:include page="<%= mainJob %>"></jsp:include>
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
										<li><a href="E_Approval_home.jsp?mainJob=E_Approval_form_work.jsp&formName=업무 기안">업무 기안</a></li>
										<li><a href="E_Approval_home.jsp?mainJob=E_Approval_form_work.jsp&formName=업무 협조">업무 협조</a></li>
										<li><a href="E_Approval_home.jsp?mainJob=E_Approval_form_petition.jsp&formName=품의서">품의서</a></li>
										<li><a href="E_Approval_home.jsp?mainJob=E_Approval_form_purchasePetition.jsp&formName=구매 품의서">구매품의서</a></li>
										<li><a href="E_Approval_home.jsp?mainJob=E_Approval_form_explanatory.jsp&formName=사유서">사유서</a></li>
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
										<li><a href="E_Approval_home.jsp?mainJob=E_Approval_form_vacation.jsp&formName=휴가 신청서">휴가 신청서</a></li>
										<li><a href="E_Approval_home.jsp?mainJob=E_Approval_form_explanatory.jsp&formName=지각/결근 사유서"">지각/결근 사유서</a></li>
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
										<li><a href="#">지출결의서</a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<input type="button" class="btn btn-secondary" data-dismiss="modal" value="close">
					<input type="button" class="btn btn-primary" value="선택"> 
				</div>
			</div>
		</div>
	</div>

<script type="text/javascript">
</script>

</body>
</html>