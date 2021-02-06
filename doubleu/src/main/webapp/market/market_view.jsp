<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중고 게시판</title>

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

</head>
<body>

	<!-- main-GNB -->
	<header class="container-fluid main-gnb">
			<jsp:include page="/MainPage/header.jsp"/>
	</header>
	<!-- main-GNB code 끝 -->

	<section class="e-approval-container">
		<!-- e-approval-lnb code -->
		<nav class="e-approval-lnb">
			<div class="e-approval-lnb-content">
				<h4>게시판</h4>
				<div class="e-approval-form-btn">
					<input type="button" class="btn btn-primary btn-lg"
						data-toggle="modal" data-target="#exampleModal" value="글쓰기">
				</div>
				<div class="e-approval-approval-list">
					<a href="#">중고게시판</a>
					<ul>

						<li><a href="#">나눠야하나</a></li>
					</ul>
				</div>

			</div>
		</nav>
		<!-- lnb code 끝 -->

		<main class="e-approval-article">
			<div class="market-header" style="height: 2%;  margin-bottom: 50px;">
				<jsp:include page="market_header.jsp"/>
	
			</div>
			<!-- ========== -->
			<span class="badge badge-pill badge-primary">2분 전</span>
			
			<!-- market view contents -->
			<div class='container' >
				<jsp:include page="market_view_contents.jsp"/>	
			</div>
	
	
			<!-- market repl  -->
			<div class='container market-repl-container'>
				
				
				<div class="shadow-sm p-3 mb-5 bg-white rounded market-repl-each">
					<div>
						<div class="text-muted float-left">정해준</div>	
						<div class='float-right' >2021-02-21</div>
					</div>
					<div class="market-repl-each-doc">
						안녕
					</div>
					<button type="button" class="btn btn-outline-primary" style="font-size: 1px;margin-top: 30px;">수정</button> 			
						<button type="button" class="btn btn-outline-primary" style="font-size: 1px;margin-top: 30px;">삭제</button> 	
				</div>
				<div class="shadow-sm p-3 mb-5 bg-white rounded market-repl-each">
					<div>
						<div class="text-muted float-left">정해준</div>	
						<div class='float-right' >2021-02-21</div>
					</div>
					<div class="market-repl-each-doc">
						안녕
					</div>
					<button type="button" class="btn btn-outline-primary" style="font-size: 1px;margin-top: 30px;">수정</button> 			
						<button type="button" class="btn btn-outline-primary" style="font-size: 1px;margin-top: 30px;">삭제</button> 	
				</div>
				<div class="shadow-sm p-3 mb-5 bg-white rounded market-repl-each">
					<div>
						<div class="text-muted float-left">정해준</div>	
						<div class='float-right' >2021-02-21</div>
					</div>
					<div class="market-repl-each-doc">
						안녕
					</div>
					<button type="button" class="btn btn-outline-primary" style="font-size: 1px;margin-top: 30px;">수정</button> 			
						<button type="button" class="btn btn-outline-primary" style="font-size: 1px;margin-top: 30px;">삭제</button> 	
				</div>
				
				
			<div class="market-repl-form">
			<form class="form-inline">
				  <div class="form-group mb-1" style="padding-left: 1rem!important;">
					   <input type="text" readonly class="form-control-plaintext" id="staticEmail2"  value="송연주">
					  </div>
					  <div class=" p-3 bg-white ">
					  <textarea class="form-control" id="exampleFormControlTextarea1" style="width: 900px;"></textarea>
					  </div>
					  <button type="submit" class="btn btn-primary mb-2">댓글달기</button>
			</form>
			</div>			
			</div>
		</main>
	</section>

	<!-- 글쓰기 모달창 -->
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<jsp:include page="board_write.jsp"/>
	</div>
 
 <!-- 찜목록 모달창 -->
	<div class="modal fade" id="dibModal" tabindex="-1" aria-labelledby="dibModal" aria-hidden="true">
		<jsp:include page="dib_modal.jsp"/>
	</div>

	<!-- 계좌번호 모달창 -->
	<div class="modal fade" id="goAccount" tabindex="-1" aria-labelledby="goAccount" aria-hidden="true">
		<jsp:include page="accountModal.jsp"/>
		
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