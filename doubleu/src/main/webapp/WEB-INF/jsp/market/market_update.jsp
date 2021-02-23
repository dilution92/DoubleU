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
			<jsp:include page="/WEB-INF/jsp/MainPage/header.jsp"/>
	</header>
	<!-- main-GNB code 끝 -->

	<section class="e-approval-container">
		<!-- e-approval-lnb code -->
				<jsp:include page="side_menu.jsp"/>

		<!-- lnb code 끝 -->

		<main class="e-approval-article">
			<h3 style="width: 200px; height: 30px;">중고게시판</h3>
		
		
			<div class='market-insert-form'>
			<form action = "/marketUpdateR" class="frm_market_insert" name="frm_market_update" method="post"enctype="multipart/form-data" >
				<div class="form-group row">
		   		 <label for="marketWriter" class="col-sm-2 col-form-label  is-invalid">작성자</label>
				    <div class="col-sm-8">
				      <input type="text" class="form-control "  name="marketWriter"required readonly value="김재현">
<%-- 				      <input type="text" class="form-control "  name="marketWriter"required readonly value="${member.memberName }"> --%>
				    </div>
				  </div>
				
				<div class="form-group row">
		   		 <label for="marketName" class="col-sm-2 col-form-label  is-invalid">상품명</label>
				    <div class="col-sm-8">
				      <input type="text" class="form-control "  name="marketSubject"required value="${vo.marketSubject }">
				    </div>
				  </div>
				  
				<div class="form-group row">
		   		 <label for="marketaCate" class="col-sm-2 col-form-label">카테고리</label>
				    <div class="col-sm-8">
   					 <select class="form-control " name="marketCategory"  required>
								<option value="">카테고리</option>
								<option value="뷰티/미용"<c:if test="${vo.marketCategory =='뷰티/미용'}">selected="selected"</c:if>>뷰티/미용</option>
								<option value="식품"<c:if test="${vo.marketCategory== '식품'}">selected="selected"</c:if>>식품</option>
								<option value="의류"<c:if test="${vo.marketCategory== '의류'}">selected="selected"</c:if>>의류</option>
								<option value="전자제품"<c:if test="${vo.marketCategory== '전자제품'}">selected="selected"</c:if>>전자제품</option>
								<option value="도서/티켓"<c:if test="${vo.marketCategory== '도서/티켓'}">selected="selected"</c:if>>도서/티켓</option>
								<option value="기타 중고물품"<c:if test="${vo.marketCategory== '기타 중고물품'}">selected="selected"</c:if>>기타 중고물품</option>
					</select>				    
					</div>
				  </div>
				  
					<div class="form-group row">
		   		 <label for="marketPrice" class="col-sm-2 col-form-label">판매가격</label>
				    <div class="col-sm-8" style="display : inline-block;">
						<button class="btn btn-primary" type="button" style="margin-bottom : 10px;" id='btnFree' data-toggle="modal" data-target="#FreeModal">무료 나눔</button>
						<button class="btn btn-primary" type="button" style="margin-bottom : 10px;"
						onclick="window.open('/marketNewpage','window_name','width=600,height=182,location=no,status=no,scrollbars=yes');">시세 확인</button>
				    	  <div style="display:flex;">
				    	  <input type="text" class="form-control" name="marketPrice" id="marketPrice" value="${vo.marketPrice }"onkeyup="numberWithCommas(this.value)" style="text-align : right;" required>
				    	  <span class="input-group-text">원</span>
				    	</div>
				    </div>
				  </div>
				
				
				<div class="form-group row">
				 <label for="inputPassword" class="col-sm-2 col-form-label">사진</label>
				  <div class="col-sm-8" style="display : inline-block;">
			   		<div class="custom-file">
					  <input type="file" class="custom-file-input" id="attList" name="attList" onchange="previewImage(this,'View_area')" multiple='multiple'>
					  <label class="custom-file-label" for="customFile">Choose file</label>
					</div>
					<div id='View_area' class='View_area' style="display:flex;" >
					<c:forEach items="${vo.attlist }" var="att">
						<div style="display:inline-block;position:relative;">
							<img src='images/market/${att.oriFile }' style="width:100px; height:100px;"/>
							<input type="button" value="X" onclick="delBtn(this)" style="position:absolute;border-width:0;right:5px;font-size:15px;color : white;opacity:0.3;background-color:grey;border-radius:10px;">
						</div>
					</c:forEach>
					</div>
					</div>
				</div>


				<div class="form-group row">
		   		 <label for="marketAccount" class="col-sm-2 col-form-label">계좌번호</label>
				    <div class="col-sm-8">
   					 <select class="form-control" id="exampleFormControlSelect1" required name="marketBank">
								<option value="">은행</option>
								<option value="신한"<c:if test="${vo.marketBank== '신한'}">selected="selected"</c:if>>신한</option>
								<option value="국민"<c:if test="${vo.marketBank== '국민'}">selected="selected"</c:if>>국민</option>
								<option value="농협"<c:if test="${vo.marketBank== '농협'}">selected="selected"</c:if>>농협</option>
								<option value="카카오뱅크"<c:if test="${vo.marketBank== '카카오뱅크'}">selected="selected"</c:if>>카카오뱅크</option>
								<option value="케이뱅크"<c:if test="${vo.marketBank== '케이뱅크'}">selected="selected"</c:if>>케이뱅크</option>
							</select>	
						<div style="margin-top : 10px;">			   
				      <input type="text" class="form-control js-sms-content" id="marketAccount" name="marketAccount"value="${vo.marketAccount }"onkeyup="accountCheck(this.value)" >
				    </div>
				    </div>
				  </div>
				  
				  <div class="form-group row">
		   		 <label for="marketDoc" class="col-sm-2 col-form-label">내용</label>
				    <div class="col-sm-8">
				      <textarea class="form-control" id="marketDoc" name = "marketDoc" rows ="10"required>${vo.marketDoc }</textarea>
				    </div>
				  </div>
				  
				<div class="market-btn-zone">
					<input class="btn btn-primary" type="submit"   id = 'btnModify' value="수정">
					<input class="btn btn-primary" type="button" onclick = "goBack();" value = '취소' >
				</div>
				
				<!-- hidden -->
				<input type="hidden" name="marketHit" value = "1">
				<input type="hidden" name="marketWriter" value = "${member.memberName }">
				<input type='text' name='marketNo'  value='${vo.marketNo}'/>
			</form>
			</div>


			<!-- ========== -->

		</main>
	</section>

	<!-- 글쓰기 모달창 -->
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<jsp:include page="board_write.jsp"/>
	</div>
	<!-- 무료나눔 모달창 -->

	<div class="modal fade" id="FreeModal" tabindex="-1" aria-labelledby="FreeModal" aria-hidden="true">
		<jsp:include page="modal/free_modal.jsp"/>

		
	</div>

<!-- 파일 모달창 -->
	<div class="modal fade" id="PhotoAlertModal" tabindex="-1" aria-labelledby="PhotoAlertModal" aria-hidden="true">
		<jsp:include page="modal/photo_alert_modal.jsp"/>
	
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

<script></script>
</body>
</html>