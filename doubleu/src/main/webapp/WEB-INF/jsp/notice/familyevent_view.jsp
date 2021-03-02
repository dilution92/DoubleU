<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전사게시판-경조사 view</title>

<!-- awesome font CDN(W icon) -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA==" crossorigin="anonymous" />

<!-- favicon -->
<link rel="shortcut icon" href="../images/w_icon.ico">
<link rel="icon" href="w_icon.ico">

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

<!-- main page CSS -->
<link rel="stylesheet" href="/css/MainIndex.css">
<!-- 전사게시판 CSS -->
<link rel="stylesheet" href="/css/notice/notice.css">
<!-- 게시판 JS -->
<script src='/js/notice/notice.js'></script>

</head>
<body>

	<!-- 그룹웨어 GNB -->
	<header class="container-fluid main-gnb">
		<jsp:include page="../MainPage/header.jsp"/>
	 </header>
	<!-- 그룹웨어 GNB code 끝 -->

	<section class="e-approval-container">
	
		<!-- e-approval-lnb code -->
		<jsp:include page="side_menu.jsp"/>
		<!-- lnb code 끝 -->

		<main class="e-approval-article">

				<!-- 게시판 검색바 code -->
				<div class="e-approval-search-bar">
					<form class="e-approval-search-form" action="" name="noticeForm" method="post">
						<div class="e-approval-form-box">
							<span>경조사</span>
							<input class="btn btn-outline-primary btn-sm" type="button" value="검색" />
							<input class="form-control form-control-sm" type="text" placeholder="Search" aria-label="Search" id="approvalFindStr">
								
							<select	class="form-control form-control-sm e-approval-select-box">
								<option selected>제목</option>
								<option value="0">내용</option>
								<option value="1">제목+내용</option>
								<option value="2">작성자</option>
							</select>
						</div>
					</form>
				</div>

			<!-- ========== -->
			
			<!-- 경조사 view code -->
			<div>
				${att }
			</div>
			<div class="row">
			    <div class="col-xs-1 col-md-1"></div>
			    <div class="col-xs-8 col-md-10">
				    <div class="table table-responsive">
				        <table class="table">
					        <tr>
					        	<th class="success"><label for="exampleFormControlSelect1">제목</label></th>
					            <td colspan="3">${obj.familyeventSubject }</td>
					        </tr>
					        <tr>
					        	<div class="form-group">
					            <th class="success">작성자</th>
					            <td>${obj.familyeventMid }</td>
					            <th class="success">작성일</th>
					            <td>${obj.familyeventReportingDate }</td>
					            </div>
					        </tr>
					        <tr>
					            <th class="success">분류</th>
					            <td>${obj.familyeventType }</td>
					            <th class="success">조회수</th>
					            <td>${obj.familyeventHit }</td>
					        </tr>
<%--  					        <tr>
					        	<th>게시기한</th>
					        	<td colspan="3">
									<!-- <input type="radio" name="searchDate" value="영구" checked readonly="readonly"> 영구 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
									<input type="radio" name="familyeventPostType" value="${obj.familyeventPostType }" checked>${obj.familyeventPostType } &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									
										(시작일자 &nbsp;<input type="date" id="searchDateOne" name="familyeventPostStartDate" value="${obj.familyeventPostStartDate }" readOnly>
										&nbsp;~ &nbsp;
										종료일자 &nbsp;<input type="date" id="searchDateTwo" name="familyeventPostEndDate" value="${obj.familyeventPostEndDate }" readOnly> )
								</td>
					        </tr> --%>
					        <tr>
					        	<div class="form-group">
						            <th class="success"><label for="exampleFormControlTextarea1">내용</label></th>
						            <td colspan="3">
						            <textarea class="form-control" id="exampleFormControlTextarea1" rows="15" readonly="readonly" style="background-color:white">${obj.familyeventDoc }</textarea>
						            </td>
							  	</div>
					        </tr>
					        <tr style="border-color: #ffffff;">
					        	<th class="success">첨부파일</th>
					        	<td colspan="3"></td>
					        </tr>
					        <tr>
					        	<c:forEach var="att" items="${att}">
						        	<td style="border:none"></td>
						        	<td colspan="3" style="border:none">
						        		${att.oriFile }
						        	</td>
					        	</c:forEach>
					        </tr>
					        <tr>
					            <td colspan="4" class="text-center">
									<input type="button" class="btn btn-primary" value="수정" onclick="location.href='/familyeventUpdate?no=${obj.familyeventNo }'">
									<input type="button" class="btn btn-primary" value="목록가기" onclick="location.href='/familyeventIndex'">
					            </td>
					        </tr>
				        </table>
				    </div>
			    </div>
			</div>
			</form>
			<!-- ========== -->

 			<!-- 공지사항 댓글창 -->
 			<jsp:include page="notice_repl.jsp"/>
 			<!-- ========== -->
 			
		</main>
	</section>
	
		<!-- 글쓰기 모달창 -->
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content" style="width: 80%; height: 300px; top: 200px;">
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
									<select class="form-control form-control-sm e-approval-select-box">
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
 
</body>
</html>