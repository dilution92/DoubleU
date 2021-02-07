<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>전사게시판-사내게시판</title>

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
<%--
	<header>
		<header class="container-fluid main-gnb">
		<jsp:include page="/MainPage/header.jsp"/>
	 </header>
--%>
	
	<header>
		<div class="container-fluid main-gnb">
			<nav class="navbar navbar-expand-lg navbar-light bg-light main-gnb-content">
				<a class="navbar-brand navbar-text-light " href="#"	style="margin-right: 28em">
					<!-- <span style="color:#007BFF; font-size:35px;"><i class="fab fa-weebly"></i></span> -->
					<img alt="" src="../images/notice/로고7.png" width="150px">
					</a>
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
						<li class="nav-item"><a class="nav-link" href="/notice/notice_index.jsp">게시판</a></li>
						<li class="nav-item"><a class="nav-link" href="#">주소록</a></li>
						<li class="nav-item"><a class="nav-link" href="#">캘린더</a></li>
						<li class="nav-item"><a class="nav-link" href="/calender/CalenderMonth.jsp">캘린더</a></li>
						<li class="nav-item"><a class="nav-link" href="/email/email_index.jsp">메일함</a></li>
						<li class="nav-item"><a class="nav-link" href="/ElectronicApproval/E_Approval_home.jsp">전자결재</a></li>
						<li class="nav-item"><a class="nav-link" href="/market/market_index.jsp">중고시장</a></li>
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
		<jsp:include page="notice_aside.jsp"/>
		<!-- lnb code 끝 -->

		<main class="e-approval-article">

				<!-- 게시판 검색바 code -->
				<div class="e-approval-search-bar">
					<form class="e-approval-search-form" action="" name="frm_approval" method="post">
						<div class="e-approval-form-box">
							<span>사내공지</span>
							<input class="btn btn-outline-primary btn-sm" type="button" value="검색" />
							<input class="form-control form-control-sm" type="text" placeholder="Search" aria-label="Search" id="approvalFindStr">
								
							<select	class="form-control form-control-sm e-approval-select-box">
								<option selected>제목</option>
								<option value="0">내용</option>
								<option value="1">제목+내용</option>
								<option value="2">작성자</option>
							</select>
						</div>
					</form>
				</div>

			<!-- ========== -->
			
			<!-- 전사게시판 사내공지 code -->
			<div class="notice-container">
        		<div class = "row">
          			<table class = "table table-hover">
                		<thead>
                    		<tr>
		                        <th style = "background-color:#f8f9fa; text-align:center;">번호</th>
		                        <th style = "background-color:#f8f9fa; text-align:center;">분류</th>
		                        <th style = "background-color:#f8f9fa; text-align:center;">제목</th>
		                        <th style = "background-color:#f8f9fa; text-align:center;">작성자</th>
		                        <th style = "background-color:#f8f9fa; text-align:center;">날짜</th>
		                        <th style = "background-color:#f8f9fa; text-align:center;">조회수</th>
	                    	</tr>
	                	</thead>
	                	<tbody>
							<c:forEach begin="1" end="10">
	                    		<tr>
			                        <td style = "background-color:#ffffff; text-align:center;">1</td>
			                        <td style = "background-color:#ffffff; text-align:center;">공지사항</td>
			                        <td style = "background-color:#ffffff; text-align:center;">안녕하세요</td>
			                        <td style = "background-color:#ffffff; text-align:center;">나</td>
			                        <td style = "background-color:#ffffff; text-align:center;">2021.01.31</td>
			                        <td style = "background-color:#ffffff; text-align:center;">31</td>
		                        </tr>
							</c:forEach>
                		</tbody>
            		</table>
        		</div>
   			</div>

			<!-- 리스트 페이징 아이콘 code -->
			<div class="e-approval-list-pagination">
				<nav aria-label="Page navigation example">
					<ul class="pagination pagination-sm text-muted justify-content-center" style="padding-top:20px">  
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
	
		<!-- 글쓰기 모달창 -->
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content"
				style="width: 80%; height: 300px; top: 200px;">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">글쓰기</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="moadl-body approval-scroll">
					<div class="accordion" id="accordionExample">
						<div class="card">
							<div class="card-header" id="headingOne">
								<h6 class="mb-0">
									<select
										class="form-control form-control-sm e-approval-select-box">
										<option selected>게시판 선택</option>
										<option value="1">중고게시판</option>
									</select>
								</h6>
							</div>

						</div>


					</div>
				</div>
				<div class="modal-footer">
					<input type="button" class="btn btn-secondary" data-dismiss="modal"
						value="close"> <input type="button"
						class="btn btn-primary" value="선택">
				</div>
			</div>
		</div>
	</div>
 
</body>
</html>