<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>프로필</title>

<!-- awesome font CDN(W icon) -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA==" crossorigin="anonymous" />

<!-- favicon -->
<link rel="shortcut icon" href="../images/w_icon.ico">
<link rel="icon" href="w_icon.ico">

<!-- bootstrap CDN -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">

<!-- bootstrap script, Jquery CDN -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
		crossorigin="anonymous"></script>
<!-- ****************************** -->	

<!-- main page CSS -->
<link rel="stylesheet" href="/css/MainIndex.css">
<!-- 전사게시판 CSS -->
<link rel="stylesheet" href="/css/notice/notice.css">

</head>
<body>

	<!-- 그룹웨어 GNB -->
	<header>
		<div class="container-fluid main-gnb">
			<nav class="navbar navbar-expand-lg navbar-light bg-light main-gnb-content">
				<a class="navbar-brand navbar-text-light " href="#"	style="margin-right: 28em">
					<span style="color:#007BFF"><i class="fab fa-weebly fa-2x"></i></span></a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav mr-auto main-gnb-menu">
						<li class="nav-item active"><a class="nav-link" href="#">홈<span
								class="sr-only">(current)</span></a></li>
						<li class="nav-item"><a class="nav-link" href="#">게시판</a></li>
						<li class="nav-item"><a class="nav-link" href="#">주소록</a></li>
						<li class="nav-item"><a class="nav-link" href="#">캘린더</a></li>
						<li class="nav-item"><a class="nav-link" href="#">메일함</a></li>
						<li class="nav-item"><a class="nav-link" href="#">전자결재</a></li>
					</ul>

					<ul class="navbar-nav my-2 my-lg-0">
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <span class="navbar-toggler-icon"></span>
						</a>
							<div class="dropdown-menu" aria-labelledby="navbarDropdown">
								<a class="dropdown-item  " href="#">정보 수정</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item  " href="#">로그아웃</a>
							</div></li>
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
				<h4>인사 페이지</h4>
				<div class="e-approval-form-btn">
					<input type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#exampleModal" value="회원정보 수정">
				</div>
				<div class="e-approval-approval-list">
					<span>인사 관리</span>
					<ul>
						<li><a href="#">조직도</a></li>
						<li><a href="#">프로필</a></li>
					</ul>
				</div>
				<div class="e-approval-approval-list">
					<span>근태 관리</span>					
					<ul>
						<li><a href="#">출/퇴근 관리</a></li>
						<li><a href="#">연/월차 관리</a></li>
					</ul>
				</div>
			</div>
		</nav>
	<!-- lnb code 끝 -->
		<main class="e-approval-article">

				<!-- 게시판 검색바 code -->
				<div class="e-approval-search-bar">
					<form class="e-approval-search-form" action="" name="frm_approval" method="post">
						<div class="e-approval-form-box">
							<span>프로필</span>
							<input class="btn btn-outline-primary btn-sm" type="button" value="검색" />
							<input class="form-control form-control-sm" type="text" placeholder="Search" aria-label="Search" id="approvalFindStr">
								
							<select	class="form-control form-control-sm e-approval-select-box">
								<option selected>부서</option>
								<option value="0">~~부</option>
								<option value="1">~~~부</option>
								<option value="2">~~~~부</option>
							</select>
						</div>
					</form>
				</div>

			<!-- ========== -->
			
			<!-- 전사게시판 사내공지 code -->
			<div class="container">
        		  <table class="table table-hover">
  	<thread>
  		<tr>
  			<th>이름</th>
  			<th>부서</th>
  			<th>직급</th>
  			<th>이메일</th>
  			<th>전화번호</th>
  		</tr>
  	</thread>
  	<tbody>
  		<tr>
  			<td>정희석</td>
  			<td>영업팀</td>
  			<td>팀장</td>
  			<td>~~~@~~~</td>
  			<td>010-0000-0000</td>
  		</tr>
  		
  		<tr>
  			<td>강성연</td>
  			<td>마케팅팀</td>
  			<td>팀장</td>
  			<td>~~~@~~~</td>
  			<td>010-0000-0000</td>
  		</tr>
  		
  		<tr>
  			<td>김재현</td>
  			<td>경영지원팀</td>
  			<td>부장</td>
  			<td>~~~@~~~</td>
  			<td>010-0000-0000</td>
  		</tr>
  		
  		<tr>
  			<td>송연주</td>
  			<td>디지털팀</td>
  			<td>부장</td>
  			<td>~~~@~~~</td>
  			<td>010-0000-0000</td>
  		</tr>
  		
  		<tr>
  			<td>정해준</td>
  			<td>개발팀</td>
  			<td>부장</td>
  			<td>~~~@~~~</td>
  			<td>010-0000-0000</td>
  		</tr>
  	</tbody>
  </table>
			
			
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

		</main>
	</section>
</body>
</html>