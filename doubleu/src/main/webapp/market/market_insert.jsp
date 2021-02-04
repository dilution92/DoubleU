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

		<main class="market-insert-form">
			<form>
				<div class="form-group row">
		   		 <label for="inputPassword" class="col-sm-2 col-form-label">상품명</label>
				    <div class="col-sm-5">
				      <input type="password" class="form-control" id="inputPassword">
				    </div>
				  </div>
				  
				<div class="form-group row">
		   		 <label for="inputPassword" class="col-sm-2 col-form-label">카테고리</label>
				    <div class="col-sm-5">
   					 <select class="form-control" id="exampleFormControlSelect1">
								<option selected>카테고리</option>
								<option value="0">뷰티/미용</option>
								<option value="1">생활/가공식품</option>
								<option value="2">의류</option>
								<option value="3">디지털/가전</option>
								<option value="4">도서/티켓</option>
								<option value="5">부동산</option>
								<option value="6">기타 중고물품</option>
							</select>				    </div>
				  </div>
				  
					<div class="form-group row">
		   		 <label for="inputPassword" class="col-sm-2 col-form-label">판매가격</label>
				    <div class="col-sm-5" style="display : inline-block;">
						<button class="btn btn-primary" type="button" style="margin-bottom : 10px;" >무료 나눔</button>
						<button class="btn btn-primary" type="button" style="margin-bottom : 10px;">시세 확인</button>
				      <input type="password" class="form-control" id="inputPassword">
				    </div>
				  </div>
				  
				<div class="form-group row">
		   		<div class="custom-file">
  <input type="file" class="custom-file-input" id="customFile">
  <label class="custom-file-label" for="customFile">Choose file</label>
</div>
				</div>
				
				<div class="form-group row">
		   		 <label for="inputPassword" class="col-sm-2 col-form-label">계좌번호</label>
				    <div class="col-sm-5">
   					 <select class="form-control" id="exampleFormControlSelect1">
								<option selected>은행</option>
								<option value="0">신한</option>
								<option value="1">국민</option>
								<option value="2">농협</option>
								<option value="3">카카오뱅크</option>
								<option value="4">케이뱅크</option>
							</select>	
						<div style="margin-top : 10px;">			   
				      <input type="password" class="form-control" id="inputPassword">
				    </div>
				    </div>
				  </div>
				  
				  <div class="form-group row">
		   		 <label for="inputPassword" class="col-sm-2 col-form-label">내용</label>
				    <div class="col-sm-5">
				      <textarea class="form-control" id="inputPassword" rows ="10"></textarea>
				    </div>
				  </div>
				  
				<div class="market-btn-zone">
					<button class="btn btn-primary" type="submit">등록</button>
					<button class="btn btn-primary" type="submit">취소</button>
				</div>
			</form>
			<form>
  <div class="form-group">
    <label for="exampleFormControlFile1">Example file input</label>
    <input type="file" class="form-control-file" id="exampleFormControlFile1">
  </div>
</form>
  <div class="form-group">

	<div class="custom-file">
  <input type="file" class="custom-file-input" id="customFile">
  <label class="custom-file-label" for="customFile">Choose file</label>
</div>
</div>
			<!-- ========== -->







		</main>
	</section>

	<!-- 글쓰기 모달창 -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
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