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
			<jsp:include page="/WEB-INF/jsp/MainPage/header.jsp"/>
	</header>
	<!-- main-GNB code 끝 -->


	<section class="e-approval-container">
		<!-- e-approval-lnb code -->
				<jsp:include page="side_menu.jsp"/>

		<!-- lnb code 끝 -->

		<main class="e-approval-article">
			<div class="market-header" style="height: 2%;  margin-bottom: 50px;">
				<h3 style="width: 200px; height: 30px;">중고게시판</h3>
			</div>
			<!-- ========== -->
			<div class='container market-price-search-container 'id = "content">
				<div class='market-price-search-form'>
					<div id = "cont-wrap" >
						<div class="cate-top-txt"><h3>시세검색</h3></div>
			        </div>
					<div class="search-bar">
			                 <form  name="frm_search" role="search" method="post" class="search-form" >
								 <div class="market-search-bar" >
									 <input class="form-control form-control-lg market-search"
											type="text" placeholder="상품명" aria-label="Search"
											id="approvalFindStr" value="${param.findStr }" name="findStr">
					                 <input class="btn btn-outline-primary btn-lg" type="button" value="검색" />
					                    <input type="hidden" name="nowPage" value="${(empty param.nowPage)? 1: param.nowPage}" size="10">
										<input type="hidden" name="serial" size="10" >
										<input type="hidden" name="search" value="select">
									</div>
			                 </form>
			       	 </div>
			     </div>
			     
			     
			     
			     <div class="market-price-contents">
			     	<div class="price-chart">
			     	  차트 화면
			     	
			     	</div>
					<div class="price-chart-detail">
					
					상품 시세
					
					</div>
			     
			     
			     </div>
				</div>

				


		</main>
	</section>


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