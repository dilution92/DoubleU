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
<div class="modal-dialog">
			<div class="modal-content"
				style="width: 80%; height: 330px; top: 200px;">
				<div class="modal-header">
					<h5 class="modal-title" id="goAccount">계좌보기</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body" >
				
					<div class="form-group row">
					    <label for="inputEmail3" class="col-sm-3 col-form-label">은행</label>
					    <div class="col-sm-8">
					      <div class="form-control" id="inputEmail3" >${vo.marketBank }</div>
					    </div>
					  </div>
					<div class="form-group row">
					    <label for="inputEmail3" class="col-sm-3 col-form-label">계좌번호</label>
					    <div class="col-sm-8">
					      <div class="form-control" id="inputEmail3" >${vo.marketAccount }</div>
					    </div>
					  </div>
					<div class="form-group row">
					    <label for="inputEmail3" class="col-sm-3 col-form-label">예금주</label>
					    <div class="col-sm-8">
					      <div class="form-control" id="inputEmail3" >김재현</div>
					    </div>
					  </div>
				</div>
				<div class="modal-footer" >
					<input type="button" class="btn btn-primary" data-dismiss="modal"
						value="확인했어요">
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
</body>
</html>