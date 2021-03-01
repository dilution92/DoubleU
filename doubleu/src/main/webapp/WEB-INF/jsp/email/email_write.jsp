<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메일</title>

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


<!-- include summernote css/js-->
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

<!-- main page CSS -->
<link rel="stylesheet" href="/css/MainIndex.css">
<!-- 이메일 CSS -->
<link rel="stylesheet" href="/css/email/email_write.css">

<!-- alert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<!-- 텍스트 js -->
<script src="/js/email/email_text.js"></script>
<script src="/js/email/email_write.js"></script>


</head>
<body>
	<!-- 그룹웨어 GNB 헤더-->

	<header class="container-fluid main-gnb">
		<jsp:include page="/WEB-INF/jsp/MainPage/header.jsp"></jsp:include>
	 </header>
	<!-- 그룹웨어 GNB code 끝 -->

	<section class="e-approval-container">

		<!-- e-approval-lnb code -->
		<nav class="e-approval-lnb">
			<div class="e-approval-lnb-content">
				<h3>메일</h3>
				<div class="e-approval-form-btn">
					<input type="button" class="btn btn-primary btn-lg" value="메일쓰기">
				</div>
				<div class="e-approval-approval-list">
					<span>메일함</span>
					<!-- 사이드바 링크 jsp page -->
					<jsp:include page="commonsCode/emailSidebarLink.jsp"></jsp:include>
				</div>
				<div class="e-approval-approval-list">
					<span class="sendmail-align"> <span>내 메일함</span>
						<button type="button" style="font-size: 5px; line-height: 13px;"
							class="btn btn-primary btn-sm" data-toggle="modal"
							data-target="#moveEmailContents">+</button>
					</span>

					<!-- 사이드바 링크 jsp page -->
					<jsp:include page="commonsCode/emailSideBarLinkMy.jsp"></jsp:include>
				</div>
			</div>
		</nav>
		<!-- lnb code 끝 -->

		<!-- 모달창 모음 -->
		<!-- 1. 내 메일함 추가 모달창 -->
		<jsp:include page="./modal/newFolderModal.jsp"></jsp:include>

		<!-- 2. 임시 저장하기 모달창 -->

		<jsp:include page="./modal/temporaryModal.jsp"></jsp:include>

		<!-- 주소록 모달창 -->
		<jsp:include page="./modal/addressBookModal.jsp"></jsp:include>
		<!-- 모달창 모음 끝 -->

		<main class="e-approval-article">


			<!-- 메일 쓰기 action="emailResult"-->
			<div class="e-approval-search-bar">
				<form class="e-approval-search-form" enctype="multipart/form-data" action="" id="sendToEmail"
					name="frm" method="post">
					
					<!-- hidden -->
					<input type="hidden" name="memberFindStr">
					<input type="hidden" name="memberOption">
					<!-- hidden 끝 -->
					<div class="e-approval-form-box">
						<span>메일쓰기</span>

					</div>

					<div class="email-select-content">

						<div class="emailSendContents">
							<div class="form-group col-sm-2">
								<label for="exampleFormControlInput1">보내는 사람</label>
							</div>

							<div class="form-group col-sm-1">
								<input type="text" class="form-control" name="emailName"
									id="exampleFormControlInput1" value="${member.memberName }">
							</div>

							<div class="form-group col-sm-6">
								<input type="email" class="form-control" name="emailAddress"
									id="exampleFormControlInput1" value="${member.memberEmail }">
							</div>
							<button type="button" style="margin-left: 11px; height: 37px;"
								class="btn btn-outline-primary btn-sm" onclick="sendToTemp()"
								data-toggle="modal" data-target="#temporaryEmailContents">임시
								저장하기
							</button>
						</div>


						
						<div class="emailSendContentsRev">
							<div class="form-group col-sm-2">
								<label for="exampleFormControlInput1">받는 사람</label>
							</div>

							
							<div class="form-group col-sm-7 revEmail">
								<div class="emailBtnList" id="parah">
									<!-- input자리 -->
								</div>
								<c:forEach begin="0" end="0">
								<!-- 받는 사람 input -->

								</c:forEach>
								

							</div>

							<!-- 주소록 버튼 -->
							
							<div class="form-group col-sm-2 rev-to-me">
								<input type="button" class="btn btn-outline-primary btn-sm" id="addBtn" value="추가" onclick="addInput()"><br/>	
								<input type="button" id="addBtnAddress" class="btn btn-outline-primary btn-sm"
									data-toggle="modal" data-target="#EmailAddress" role="button"
									value="주소록">
							</div>
						</div>

						<!-- 참조1 -->
						<div class="emailSendContentsRef">
							<div class="form-group col-sm-2">
								<label for="exampleFormControlInput1">참조</label>
							</div>

							
							<div class="form-group col-sm-7 revRef">
								<div class="emailBtnRefList" id="Refparah">
									<!-- input자리 -->
								</div>
								<c:forEach begin="0" end="0">
									<!-- 참조input -->
									
								</c:forEach>
							</div>
							
							<!-- 참조 추가 버튼 -->
							<div class="form-group col-sm-2 rev-to-me">
								<input type="button" class="btn btn-outline-primary btn-sm" id="addRefBtn" value="추가" onclick="addInputRef()"><br/>	
							</div>

						</div>
					
						
						<!-- 제목 -->
						<div class="emailSendContentsHeader">
							<div class="form-group col-sm-1">
								<label for="exampleFormControlInput1">제목</label>
							</div>

							<div class="form-group col-sm-1 importSend">
								<div class="form-check">
									<input class="form-check-input" type="checkbox" name="emailChk"
										value="" id="defaultCheck1"> 
									<label class="form-check-label" for="defaultCheck1"> 중요! </label>
								</div>

							</div>

							<div class="form-group col-sm-7">
								<input type="email" class="form-control" name="emailTitle"
									id="emailTitleId">
							</div>


						</div>

						<!-- 내용 -->
						<textarea name="emailContents" id="summernote" ></textarea>



						<!-- 파일첨부 -->

						<div class="custom-file">
							<input type="file" class="custom-file-input" name="attEmailFileList"
								multiple="multiple" onchange="FileChoice()" id="customFile">
							<label class="custom-file-label" for="customFile">Choose
								files</label>
							<div class="file_list" id="fileList">
								<button type="button" class="btn btn-light">첨부파일</button>
								<!-- 파일 첨부 시 span 태그가 생김 -->
							</div>
						</div>

						<!-- 버튼 -->
						<div class="send-and-cancel">
							<button type="button"  class="btn btn-primary btn-sm"
								onclick="sendToEmail()">보내기</button>
							<button type="button" onclick="location.href='/emailIndex'" class="btn btn-primary btn-sm">취소하기</button>
						</div>
					</div>
					
					
					<!-- hidden -->
				</form>
			</div>
		</main>
	</section>

	<script>
		/* js */
		summernote(); // text 에디터 함수

		addAddressPeronal();
		addAddressPeronalRef();
		
	</script>

</body>
</html>