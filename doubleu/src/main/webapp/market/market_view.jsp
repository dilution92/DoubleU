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
			<div class="market-header" style="height: 2%;  margin-bottom: 50px;">
			<h3 style="width : 13%">중고게시판</h3>

				<!-- 찜목록 -->
				<input class="btn btn-outline-primary btn-sm market-dib" data-toggle="modal"
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
			<span class="badge badge-pill badge-primary">화장품</span>
			<div class='container' >
			<table class="table table-striped">
  <thead>
    <tr>
      <th scope="col">상품명</th>
      <th scope="col">텀블러</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">가격</th>
      <td>8,000원</td>
    </tr>
    <tr>
      <th scope="row">작성자</th>
      <td>김재현</td>
    </tr>
    <tr>
      <th scope="row">조회수</th>
      <td>3</td>
    </tr>
  </tbody>
</table>
			<img src="data:image/jpeg;base64,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" 
			class="rounded mx-auto d-block market-img" alt="...">

			
				</div>
	



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