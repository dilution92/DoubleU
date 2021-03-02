<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중고 게시판</title>
<!-- jquery -->
<script src="https://code.jquery.com/jquery-3.5.1.js" 
		integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" 
		crossorigin="anonymous"></script>
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
<link rel="stylesheet" href="/css/market/market.css">
<script src='js/market/market.js'></script>

</head>
<body>

	<!-- main-GNB -->
	<header class="container-fluid main-gnb">
			<jsp:include page="/WEB-INF/jsp/MainPage/header.jsp"/>
	</header>
	<!-- main-GNB code 끝 -->

	<section class="e-approval-container">
		<!-- e-approval-lnb code -->
				<jsp:include page="side_menu.jsp"/>

		<!-- lnb code 끝 -->

		<main class="e-approval-article" style="margin-bottom:100px;">
			<div class="market-header" style="height: 2%;  margin-bottom: 50px;">
				<jsp:include page="market_header.jsp"/>
	
			</div>
			<!-- ========== -->
			<span class="badge badge-pill badge-primary" id="market_date"></span>
			
			<!-- market view contents -->
			<div class='container' >
				<jsp:include page="market_view_contents.jsp"/>	
			</div>
	
	
			<!-- market repl  -->
			<div class='container market-repl-container'>
				<jsp:include page="market_repl.jsp"/>	
			</div>
		</main>
	</section>

	<!-- 글쓰기 모달창 -->
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<jsp:include page="board_write.jsp"/>
	</div>
 
 <!-- 찜목록 모달창 -->
	<div class="modal fade" id="dibModal" tabindex="-1" aria-labelledby="dibModal" aria-hidden="true">
		<jsp:include page="modal/dib_modal.jsp"/>
	</div>

	<!-- 계좌번호 모달창 -->
	<div class="modal fade" id="goAccount" tabindex="-1" aria-labelledby="goAccount" aria-hidden="true">
		<jsp:include page="modal/account_modal.jsp"/>
		
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

<script>brd()</script>
</body>
</html>