<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, inital-scale=1, shrink-to-fit=no">
<title>Hello, world!</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
<link rel="stylesheet" href="/css/MainIndex.css">
</head>


<body>
<form action="">
	<!-- main-GNB -->
	<header class="container-fluid main-gnb">
			<jsp:include page="header.jsp"/>
	</header>
	<!-- main-GNB code 끝 -->


	<!-- main-body code -->
<div class="main-container">
	<nav class="main-content-personnel">
		<div class="content-profile rounded rounded">
			<div class="profile-header">
			</div>
			<div class="profile-body">
				<strong class="text-muted">정해준</strong> <br>
				<span class="small text-muted">직급: 사원</span> <br>
				<span class="small text-muted">부서: 기획부</span> <br>
			</div>
		</div>
		<div class="content-workManagement">
			<div class="WM-header">
				<strong class="text-muted">근태 관리</strong><br>
				<p class="small lh-sm text-muted">2021-01-31(일) 21:58</p>
			</div>
			<div class="WM-timeTable">
				<div class="WM-timeTable-attendance">
					<span>출근 시간</span>				
					<input type="text" value="09:30" name="attentdance" readonly="readonly">
				</div>
				<div class="WM-timeTable-leaveWork">
					<span>퇴근 시간</span>				
					<input type="text" value="18:30" name="leaveWork" readonly="readonly">
				</div>
			</div>
			<div class="WM-btns">
				<input type="button" value="출근" class="btn btn-primary btn-sm">
				<input type="button" value="퇴근" class="btn btn-primary btn-sm"> 
			</div>
			<div class="WM-workState">
				<select class="form-control form-control-sm">
					<option value=""> 근무 상태 </option>
					<option value=""> 외근 </option>
					<option value=""> 출장 </option>
					<option value=""> 반차</option>
				</select>
			</div>
		</div>
	</nav>
	
	<main class="main-content-article">
		<!-- 전자결재 -->
		<div class="main-approval">
			<jsp:include page="selectApproval.jsp"/>
		</div>
	
	
	</main>
	
	<aside class="main-content-calender">
		<div class="content-schedule">
			<h6 class="article-title">전사 일정</h6>
			<div class="schedule-article">
				<p>
					<a href="#">
					<strong class="d-block text-gray-dark">2021-01-31(일)</strong>
					<span>임직원 전체 회의입니다.</span>
					</a>
				</p>
			</div>
			<div class="schedule-article">
				<p>
					<a href="#">
						<strong class="d-block text-gray-dark">2021-01-31(일)</strong>
						<span>임직원 전체 회의입니다.</span>
					</a>
				</p>
			</div>
			<div class="schedule-article">
				<p>
					<a href="#">
						<strong class="d-block text-gray-dark">2021-01-31(일)</strong>
						<span>임직원 전체 회의입니다.</span>
					</a>
				</p>
			</div>
			<div class="main-go-page">
				<a href="#">자세히 보기</a>
			</div>
		</div>
	</aside>
</div>
</form>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
		crossorigin="anonymous"></script>
</body>

</html>

