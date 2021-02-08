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
<!--file CDN -->
<link href="https://cdn.jsdelivr.net/npm/bs-custom-file-input/dist/bs-custom-file-input.min.js">
<!-- main page CSS -->
<link rel="stylesheet" href="/css/MainIndex.css">
<!-- 전자결재용 CSS -->
<link rel="stylesheet" href="/css/market/market.css">
<!-- 중고게시판 javascript -->
<script src='/js/market/market.js'></script></head>
<body>

		<!-- main-GNB -->
	<header class="container-fluid main-gnb">
			<jsp:include page="/MainPage/header.jsp"/>
	</header>
	<!-- main-GNB code 끝 -->

	<section class="e-approval-container">
		<!-- e-approval-lnb code -->
				<jsp:include page="side_menu.jsp"/>

		<!-- lnb code 끝 -->

		<main class="e-approval-article">
			<h3 style="width: 200px; height: 30px;">중고게시판</h3>
		
		
			<div class='market-insert-form'>
			<form>
				<div class="form-group row">
		   		 <label for="marketName" class="col-sm-2 col-form-label">상품명</label>
				    <div class="col-sm-8">
				      <input type="text" class="form-control" id="marketName">
				    </div>
				  </div>
				  
				<div class="form-group row">
		   		 <label for="marketaCate" class="col-sm-2 col-form-label">카테고리</label>
				    <div class="col-sm-8">
   					 <select class="form-control" id="marketaCate">
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
		   		 <label for="marketPrice" class="col-sm-2 col-form-label">판매가격</label>
				    <div class="col-sm-8" style="display : inline-block;">
						<button class="btn btn-primary" type="button" style="margin-bottom : 10px;" >무료 나눔</button>
						<button class="btn btn-primary" type="button" style="margin-bottom : 10px;">시세 확인</button>
				    	  <div style="display:flex;">
				    	  <input type="text" class="form-control" id="marketPrice" onkeyup="numberWithCommas(this.value)" style="text-align : right;">
				    	  <span class="input-group-text">원</span>
				    	</div>
				    </div>
				  </div>
				
				
				<div class="form-group row">
				 <label for="inputPassword" class="col-sm-2 col-form-label">사진</label>
				  <div class="col-sm-8" style="display : inline-block;">
			   		<div class="custom-file">
					  <input type="file" class="custom-file-input"  id="profile_pt" onchange="previewImage(this,'View_area')">
					  <label class="custom-file-label" for="customFile">Choose file</label>
					</div>
					<div id='View_area' class='View_area' ></div>
					</div>
				</div>


				<div class="form-group row">
		   		 <label for="marketAccount" class="col-sm-2 col-form-label">계좌번호</label>
				    <div class="col-sm-8">
   					 <select class="form-control" id="exampleFormControlSelect1">
								<option selected>은행</option>
								<option value="0">신한</option>
								<option value="1">국민</option>
								<option value="2">농협</option>
								<option value="3">카카오뱅크</option>
								<option value="4">케이뱅크</option>
							</select>	
						<div style="margin-top : 10px;">			   
				      <input type="text" class="form-control" id="marketAccount">
				    </div>
				    </div>
				  </div>
				  
				  <div class="form-group row">
		   		 <label for="marketDoc" class="col-sm-2 col-form-label">내용</label>
				    <div class="col-sm-8">
				      <textarea class="form-control" id="marketDoc" rows ="10"></textarea>
				    </div>
				  </div>
				  
				<div class="market-btn-zone">
					<button class="btn btn-primary" type="submit">등록</button>
					<button class="btn btn-primary" type="submit">취소</button>
				</div>
			</form>
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