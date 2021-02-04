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
<link rel="stylesheet" href="/css/ElectronicApproval.css">

</head>
<body>
	
	<!-- 그룹웨어 GNB -->
	<header>
		<div class="container-fluid main-gnb">
			<nav class="navbar navbar-expand-lg navbar-light bg-light main-gnb-content">
				<a class="navbar-brand navbar-text-light " href="#" style="margin-right: 28em">DoubleU</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav mr-auto main-gnb-menu">
						<li class="nav-item active">
							<a class="nav-link" href="#">홈<span class="sr-only">(current)</span></a>
						</li>
						<li class="nav-item"><a class="nav-link" href="#">게시판</a></li>
						<li class="nav-item"><a class="nav-link" href="#">주소록</a></li>
						<li class="nav-item"><a class="nav-link" href="#">캘린더</a></li>
						<li class="nav-item"><a class="nav-link" href="#">메일함</a></li>
						<li class="nav-item"><a class="nav-link" href="#">전자결재</a></li>
					</ul>
	
					<ul class="navbar-nav my-2 my-lg-0">
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" 
							aria-haspopup="true" aria-expanded="false">
								<span class="navbar-toggler-icon"></span>
							</a>
							<div class="dropdown-menu" aria-labelledby="navbarDropdown">
								<a class="dropdown-item  " href="#">정보 수정</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item  " href="#">로그아웃</a>
							</div>
						</li>
					</ul>
				</div>
			</nav>
		</div>
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
					<a href="#">내가 보낸 문서함</a>
					<ul>
					
						<li><a href="#">상신한 문서함</a></li>
						<li><a href="#">임시 저장된 문서</a></li>
						<li><a href="#">승인 완료된 문서</a></li>
						<li><a href="#">반려된 문서</a></li>
					</ul>
				</div>
				<div class="e-approval-approval-list">
					<a href="#">내가 받은 문서함</a>					
					<ul>
						<li><a href="#">결재할 문서</a></li>
						<li><a href="#">승인한 문서</a></li>
						<li><a href="#">반려한 문서</a></li>
					</ul>
				</div>
			</div>
		</nav>
	<!-- lnb code 끝 -->
	
		<main class="e-approval-article">

			<!-- 전자결재홈 검색바 code -->
			<div class="e-approval-search-bar">
	      		<form class="e-approval-search-form" action="" name="frm_approval" method="post">
			      	<div class="e-approval-form-box">
				        <input class="btn btn-outline-primary btn-sm" type="button" value="검색"/>
				        <input class="form-control form-control-sm" type="text" placeholder="Search" aria-label="Search" id="approvalFindStr">
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
	     		</form>
			</div>
			<!-- ========== -->
			
			<!-- 최근 발신한 문서함 code -->
			<div class="e-approval-table">
				<strong class="text-gray-dark">최근 발신한 문서</strong>
				<table class="table table-hover table-sm">
					<thead class="e-approval-list text-muted text-gray-dark">
						<tr>
							<th scope="col">기안일</th>
							<th scope="col">결재양식</th>
							<th scope="col">제목</th>
							<th scope="col">기안자</th>
							<th scope="col">긴급</th>
							<th scope="col">결재 상태</th>
						</tr>
					</thead>
					<tbody class="e-approval-list text-muted">
						<c:forEach begin="1" end="4">
							<tr>
								<td>2021-02-03</td>
								<td>업무 기안</td>					
								<td style=" text-align: left; text-indent: 2em;">그룹웨어 프론트엔드 화면 설계안 요청합니다.</td>					
								<td>정해준</td>					
								<td>긴급</td>					
								<td>진행중</td>					
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<!-- ========== -->
			
			<!-- 리스트 페이징 아이콘 code -->
			<div class="e-approval-list-pagination">
				<nav aria-label="Page navigation example">
					<ul class="pagination pagination-sm text-muted justify-content-center">  
						<li class="page-item"><a class="page-link" href="#" style="font-size: 0.7em">first</a></li>
						<li class="page-item"><a class="page-link" href="#" style="font-size: 0.7em">&lt;</a></li>
						<li class="page-item"><a class="page-link" href="#" style="font-size: 0.7em">1</a></li>
						<li class="page-item"><a class="page-link" href="#" style="font-size: 0.7em">2</a></li>
						<li class="page-item"><a class="page-link" href="#" style="font-size: 0.7em">3</a></li>
						<li class="page-item"><a class="page-link" href="#" style="font-size: 0.7em">&gt;</a></li>
						<li class="page-item"><a class="page-link" href="#" style="font-size: 0.7em">last</a></li>
					</ul>
				</nav>
			</div>
			<!-- ========== -->
			
			<!-- 최근 수신한 문서함 code -->
			<div class="e-approval-table">
				<strong class="text-gray-dark">최근 수신한 문서</strong>
				<table class="table table-hover table-sm">
					<thead class="e-approval-list text-muted text-gray-dark">
						<tr>
							<th scope="col">기안일</th>
							<th scope="col">결재양식</th>
							<th scope="col">제목</th>
							<th scope="col">기안자</th>
							<th scope="col">긴급</th>
							<th scope="col">결재 상태</th>
						</tr>
					</thead>
					<tbody class="e-approval-list text-muted">
						<c:forEach begin="1" end="4">
							<tr>
								<td>2021-02-03</td>
								<td>업무 기안</td>					
								<td style=" text-align: left; text-indent: 2em;">그룹웨어 프론트엔드 화면 설계안 요청합니다.</td>					
								<td>정해준</td>					
								<td>긴급</td>					
								<td>진행중</td>					
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<!-- ========== -->
			
			<!-- 수신 문서함 페이징 아이콘 code -->
			<div class="e-approval-list-pagination" >
				<nav aria-label="Page navigation example">
					<ul class="pagination pagination-sm text-muted justify-content-center">  
						<li class="page-item"><a class="page-link" href="#" style="font-size: 0.7em">first</a></li>
						<li class="page-item"><a class="page-link" href="#" style="font-size: 0.7em">&lt;</a></li>
						<li class="page-item"><a class="page-link" href="#" style="font-size: 0.7em">1</a></li>
						<li class="page-item"><a class="page-link" href="#" style="font-size: 0.7em">2</a></li>
						<li class="page-item"><a class="page-link" href="#" style="font-size: 0.7em">3</a></li>
						<li class="page-item"><a class="page-link" href="#" style="font-size: 0.7em">&gt;</a></li>
						<li class="page-item"><a class="page-link" href="#" style="font-size: 0.7em">last</a></li>
					</ul>
				</nav>
			</div>
			<!-- ========= -->
		</main>
	</section>
	
	<!-- 모달창 -->
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">결재 유형 선택</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="moadl-body approval-scroll">
					<div class="accordion" id="accordionExample">
						<div class="card">
							<div class="card-header" id="headingOne">
								<h6 class="mb-0">
									<button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#collapseOne"
									 aria-expanded="true" aria-controls="collapseOne">
									 일반 업무
									 </button>
								</h6>
							</div>
							<div id="collapseOne" class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
								<div class="card-body">
									<ul>
										<li><a href="#">업무 기안</a></li>
										<li><a href="#">업무 협조</a></li>
										<li><a href="#">품의서</a></li>
										<li><a href="#">회의록</a></li>
									</ul>
								</div>
							</div>
						</div>
						<div class="card">
							<div class="card-header" id="headingTwo">
								<h6 class="mb-0">
									<button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#collapseTwo"
									 aria-expanded="true" aria-controls="collapseTwo">
									 인사
									</button>
								</h6>
							</div>
							<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
								<div class="card-body">
									<ul>
										<li><a href="#">휴가 신청서</a></li>
										<li><a href="#">지각/불참 사유서</a></li>
									</ul>
								</div>
							</div>
						</div>
						<div class="card">
							<div class="card-header" id="headingThree">
								<h6 class="mb-0">
									<button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#collapseThree"
									 aria-expanded="true" aria-controls="collapseThree">
									 지출결의
									 </button>
								</h6>
							</div>
							<div class="collapse" id="collapseThree" aria-labelledby="headingThree" data-parent="#accordionExample">
								<div class="card-body">
									<ul>
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



<!-- bootstrap script, Jquery CDN -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
		crossorigin="anonymous"></script>
<!-- ****************************** -->

<script type="text/javascript">
</script>

</body>
</html>