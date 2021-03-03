<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>전사게시판-공지사항</title>

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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
		crossorigin="anonymous"></script>
<!-- ****************************** -->	

<!-- main page CSS -->
<link rel="stylesheet" href="/css/MainIndex.css">
<!-- 전사게시판 CSS -->
<link rel="stylesheet" href="/css/notice/notice.css">
<!-- 게시판 JS -->
<script src='/js/notice/notice.js'></script>


</head>
<body>

	<!-- 그룹웨어 GNB -->
	<header class="container-fluid main-gnb">
		<jsp:include page="../MainPage/header.jsp"/>
	 </header>
	<!-- 그룹웨어 GNB code 끝 -->

	<section class="e-approval-container">
	
		<!-- e-approval-lnb code -->
		<jsp:include page="side_menu.jsp"/>
		<!-- lnb code 끝 -->

		<main class="e-approval-article">

		<form class="e-approval-search-form" action="" name="noticeForm" method="post">
				<!-- 게시판 검색바 code -->
				<div class="e-approval-search-bar">
				
					<div class="e-approval-form-box">
						<span>공지사항</span>
						<input class="btn btn-outline-primary btn-sm" type="button" value="검색" />
						<input class="form-control form-control-sm" type="text" placeholder="Search" aria-label="Search" id="approvalFindStr">
							
						<select	class="form-control form-control-sm e-approval-select-box">
							<option selected>제목</option>
							<option value="0">내용</option>
							<option value="1">제목+내용</option>
						</select>
					</div>
				</div>
			
			
			<!-- 전사게시판 공지사항 code -->
			<div class="notice-container">
				<table class="table table-hover">
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
					<tbody class="e-approval-list text-muted" id="noticeTypeColor">
	                		<c:forEach var='obj' items="${list }">
	                    		<tr onClick="location.href='/noticeView?no=${obj.noticeNo }'">
			                        <td style = "background-color:#ffffff; text-align:center;">${obj.noticeNo }</td>
			                        <td style = "background-color:#ffffff; text-align:center;">${obj.noticeType }</td>
			                        <td style = "background-color:#ffffff; text-align:center;">${obj.noticeSubject }</td>
			                        <td style = "background-color:#ffffff; text-align:center; color:#6c757d">${obj.noticeMid }</td>
			                        <td style = "background-color:#ffffff; text-align:center;">${obj.noticeReportingDate }</td>
			                        <td style = "background-color:#ffffff; text-align:center;">${obj.noticeHit }</td>
		                        </tr>
							</c:forEach>
                	</tbody>
            	</table>
   			</div>
   			
			<!-- 리스트 페이징 아이콘 code -->
			<div class="e-approval-list-pagination">
				<nav aria-label="Page navigation example">  
						<ul	class="pagination pagination-sm text-muted justify-content-center">
						
						<c:if test="${page.startPage>1 }">
							<li class="page-item"><a class="page-link" onclick='goPage1(1)'style="font-size: 0.7em">first</a></li>
							<li class="page-item"><a class="page-link" onclick='goPage1(${page.startPage-1})'style="font-size: 0.7em">&lt;</a></li>
						</c:if>	
							<c:forEach var='i' begin='${page.startPage }' end='${page.endPage }'>
								<li class="page-item"><a class="page-link" onclick='goPage1(${i})' style="font-size: 0.7em">${i }</a></li>
							</c:forEach>
							
						<c:if test="${page.endPage<page.totPage }">
							<li class="page-item"><a class="page-link" onclick = 'goPage1(${page.endPage+1})'
								style="font-size: 0.7em">&gt;</a></li>
							<li class="page-item"><a class="page-link" onclick = 'goPage1(${page.totPage})' style="font-size: 0.7em">last</a></li>
						</c:if>
						
					</ul>
				</nav>
				<input type="hidden" name="nowPage" class="nowPage">
			</div>
			<!-- ========== -->
		</form>
		</main>
	</section>
	
</body>
</html>