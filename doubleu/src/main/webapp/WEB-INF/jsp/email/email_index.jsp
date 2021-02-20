<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메일</title>

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

<!-- JQuery -->
<script
  src="https://code.jquery.com/jquery-3.5.1.js"
  integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
  crossorigin="anonymous"></script>


<!-- main page CSS -->
<link rel="stylesheet" href="/css/MainIndex.css">
<!-- 이메일 CSS -->
<link rel="stylesheet" href="/css/email/email_main.css">

<!-- js -->
<script src="js/email/email_commons.js"></script>

<!-- alert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

</head>
<body>
	<!-- 그룹웨어 GNB 헤더-->

	<header>
		<jsp:include page="/WEB-INF/jsp/MainPage/header.jsp"></jsp:include>
	 </header>
	 <!-- 그룹웨어 GNB code 끝 -->
	 
	<section class="e-approval-container">
		
		<!-- e-approval-lnb code -->
			<nav class="e-approval-lnb"> 
				<div class="e-approval-lnb-content">
					<h3>메일</h3>
					<div class="e-approval-form-btn">
						<input type="button" class="btn btn-primary btn-lg" value="메일쓰기" onclick="location.href='/emailWrite'">
					</div>
					
					<div class="e-approval-approval-list">
						<span>메일함</span>
						<!-- 사이드바 링크 jsp page -->
						<jsp:include page="commonsCode/emailSidebarLink.jsp"></jsp:include>
					</div>
					
					<div class="e-approval-approval-list">
						<span class="sendmail-align">
						<span>내 메일함</span>
						<button type="button" style="font-size: 5px; line-height: 13px;" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#moveEmailContents">+</button>
						</span>
						
						<!-- 사이드바 링크 jsp page -->
						<jsp:include page="commonsCode/emailSideBarLinkMy.jsp"></jsp:include>
					</div>
				</div>
			</nav>
	<!-- lnb code 끝 -->
	
	<!-- 모달창 모음 -->
		<!-- 1. 내 메일함 추가 모달창 -->
			<jsp:include page="./modal/newFolderModal.jsp"></jsp:include>
	                
        <!-- 2. 스팸 모달창 -->
			<jsp:include page="./modal/spamModal.jsp"></jsp:include>
	    
	    <!-- 3. 이동 모달창 -->
	   	 	<jsp:include page="./modal/moveFolderModal.jsp"></jsp:include>
	     	

     <!-- 모달창 모음 끝 -->           
                
		<main class="e-approval-article">

			
			<!-- 메일 검색바 code -->
			<div class="e-approval-search-bar">
	      		<form class="e-approval-search-form" action="" id="emailFormId" name="emailForm" method="post">
			      	<%--경로 -> ./commonsCode/emailDropDown.jsp --%>
			      	<jsp:include page="./commonsCode/searchDropDown.jsp"></jsp:include>
	     		</form>
			</div>
			<!-- ========== -->

			<!-- 선택 -->
						
			<div class="email-select-content">
				<jsp:include page="./commonsCode/selectAllDropDowns.jsp"></jsp:include>
			</div>

			<!-- 메일함 -->
			<div class="e-approval-table" >
				<table class="table table-hover table-sm" id="selectFindStr">
					<tbody class="e-approval-list text-muted">
						<c:forEach var="list" items="${list }">
							<tr>
								<td><input name="chkBox" class="chkBoxClass" type="checkbox"/></td>
								<td><i class="bi bi-star"></i></td>
                                <td><i class="bi bi-envelope"></i></td>
                                <td>${list.emailChk }</td>
								<td>${list.emailAddress}</td>					
								<td style=" text-align: left; text-indent: 2em;">${list.emailTitle }</td>					
								<td>${list.emailDate }</td>		
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
			
		</main>
	</section>
	

<script>

// 사이드바
selectChkBtn();

// 즐겨찾기 아이콘
favoritesBtn();

// 메일 읽음 아이콘
readBtn();

// 읽음 버튼을 눌렀을 때 아이콘 변경 
changeChkReadBtn();

// 메일 검색 bar
emailSelectSearch();
</script>
</body>
</html>