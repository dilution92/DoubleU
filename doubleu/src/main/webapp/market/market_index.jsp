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

	<!-- 그룹웨어 GNB -->
	<header>
		<div class="container-fluid main-gnb">
			<nav
				class="navbar navbar-expand-lg navbar-light bg-light main-gnb-content">
				<a class="navbar-brand navbar-text-light " href="#"
					style="margin-right: 28em">DoubleU</a>
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

			<div class="market-header" style="height: 2%; margin-bottom: 50px;">

				<!-- 찜목록 -->
				<input class="btn btn-outline-primary btn-sm " data-toggle="modal"
					data-target="#dibModal" type="button" value="찜목록" />

				<!-- 전자결재홈 검색바 code -->
				<div class="e-approval-search-bar">
					<form class="e-approval-search-form" action="" name="frm_approval"
						method="post">
						<div class="e-approval-form-box">
							<input class="btn btn-outline-primary btn-sm" type="button"
								value="검색" /> <input class="form-control form-control-sm"
								type="text" placeholder="Search" aria-label="Search"
								id="approvalFindStr"> <select
								class="form-control form-control-sm e-approval-select-box">
								<option selected>카테고리</option>
								<option value="0">뷰티/미용</option>
								<option value="1">생활/가공식품</option>
								<option value="2">의류</option>
								<option value="3">디지털/가전</option>
								<option value="4">도서/티켓</option>
								<option value="5">부동산</option>
								<option value="6">기타 중고물품</option>
							</select>
						</div>
					</form>
				</div>

			</div>
			<!-- ========== -->


			<!-- 글갯수/ 최신순 -->
			<div class="market-subheader-container">
				<div class='market-total'>
					<p class="card-text">글 갯수 : 8</p>
				</div>
				<div class="e-approval-dib">
					<form class="e-approval-search-form" action="" name="frm_approval"
						method="post">
						<div class="e-approval-form-box" style="float: right;">
							<input class="btn btn-outline-primary btn-sm" type="button"
								value="최신순" /> <input class="btn btn-outline-primary btn-sm"
								type="button" value="낮은 가격순" />

						</div>
					</form>
				</div>
			</div>
			<!-- 중고게시판 게시글 code -->
			<div class="row row-cols-1 row-cols-md-4">
				<c:forEach begin="1" end="4">

					<div class="col mb-4">
						<div class="card">
							<img
								src="data:image/jpeg;base64,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"
								class="card-img-top" alt="...">
							<div class="card-body">
								<h5 class="card-title">수분 크림</h5>
								<p class="card-text">4,000원</p>
								<p class="card-text">🤍 2
								<p>
								<p class="card-text-name">김재현
								<p>
							</div>
						</div>
					</div>
					<div class="col mb-4">
						<div class="card">
							<img
								src="http://m.pilke.co.kr/web/product/big/201807/512_shop1_15307957190841.jpg"
								class="card-img-top" alt="...">
							<div class="card-body">
								<h5 class="card-title">텀블러</h5>
								<p class="card-text">8,000원</p>
								<p class="card-text">🖤 4
								<p>
								<p class="card-text-name">전예린
								<p>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			<!-- ========== -->

			<!-- 리스트 페이징 아이콘 code -->
			<div class="e-approval-list-pagination">
				<nav aria-label="Page navigation example">
					<ul
						class="pagination pagination-sm text-muted justify-content-center">
						<li class="page-item"><a class="page-link" href="#"
							style="font-size: 0.7em">first</a></li>
						<li class="page-item"><a class="page-link" href="#"
							style="font-size: 0.7em">&lt;</a></li>
						<li class="page-item"><a class="page-link" href="#"
							style="font-size: 0.7em">1</a></li>
						<li class="page-item"><a class="page-link" href="#"
							style="font-size: 0.7em">2</a></li>
						<li class="page-item"><a class="page-link" href="#"
							style="font-size: 0.7em">3</a></li>
						<li class="page-item"><a class="page-link" href="#"
							style="font-size: 0.7em">&gt;</a></li>
						<li class="page-item"><a class="page-link" href="#"
							style="font-size: 0.7em">last</a></li>
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
 
 <!-- 찜목록 모달창 -->
	<div class="modal fade" id="dibModal" tabindex="-1" aria-labelledby="dibModal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content"
				style="width: 80%; height: 400px; top: 200px;">
				<div class="modal-header">
					<h5 class="modal-title" id="dibModal">찜 목록</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="moadl-body approval-scroll">
					<div class="accordion" id="accordionExample">
						<div class="card">
							<div class="card-header" id="headingOne" style="display : inline-block;">
								<div class="list-group">
								<c:forEach begin="1" end="4">
									  <button type="button" class="list-group-item list-group-item-action" >
									  	<h6 class="card-title"style="float: left;">수분 크림</h6>
										<p class="card-text" style="float: right;">4,000원</p>
									  </button>
									  
									  <button type="button" class="list-group-item list-group-item-action" >
									  	<h6 class="card-title"style="float: left;">텀블러</h6>
										<p class="card-text" style="float: right;">8,000원</p>
									  </button>
								  </c:forEach>
								</div>
							</div>

						</div>
					</div>
				</div>
				<div class="modal-footer">
					<input type="button" class="btn btn-secondary" data-dismiss="modal"	value="close"> 
						<input type="button" class="btn btn-primary" value="이동">
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