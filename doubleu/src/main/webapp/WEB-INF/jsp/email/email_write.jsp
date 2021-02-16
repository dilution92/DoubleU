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

	<header>
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
					<ul>
						<li><a href="email_index.jsp">받은 메일함</a><span
							class="badge badge-pill badge-ligh">1566</span></li>
						<li><a href="#">별표 메일함</a></li>
						<li><a href="#">임시 보관함</a></li>
						<li><a href="#">보낸 메일함</a></li>
						<li><a href="#">스팸 메일함</a>
							<button type="button" style="font-size: 10px;"
								class="btn btn-primary btn-sm">비우기</button></li>
						<li><a href="#">휴지통</a>
							<button type="button" style="font-size: 10px;"
								class="btn btn-primary btn-sm">비우기</button></li>

					</ul>
				</div>
				<div class="e-approval-approval-list">
					<span class="sendmail-align"> <span>내 메일함</span>
						<button type="button" style="font-size: 5px; line-height: 13px;"
							class="btn btn-primary btn-sm" data-toggle="modal"
							data-target="#moveEmailContents">+</button>
					</span>

					<ul>
						<li><a href="email_keep_one.jsp">NOTES</a></li>
						<li><a href="email_keep_two.jsp">보관함</a></li>
					</ul>
				</div>
			</div>
		</nav>
		<!-- lnb code 끝 -->

		<!-- 모달창 모음 -->
		<!-- 1. 내 메일함 추가 모달창 -->
		<div class="modal fade bs-example-modal-lg" id="moveEmailContents"
			tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
			aria-hidden="true">
			<div class="modal-dialog modal-lg">
				<div class="modal-content modalEmail">
					<div class="modalNewEmailFolder">
						<h4>새 메일함 만들기</h4>
						<input type="text" placeholder="메일함 이름">
						<div class="modalNewEmailFolderBtn">
							<button class="btn btn-primary btn-lg btn-primary btn-sm"
								role="button">만들기</button>
							<button class="btn btn-primary btn-lg btn-primary btn-sm"
								role="button">취소하기</button>
						</div>
					</div>

				</div>
			</div>
		</div>

		<!-- 2. 임시 저장하기 모달창 -->

		<div class="modal fade bs-example-modal-lg"
			id="temporaryEmailContents" tabindex="-1" role="dialog"
			aria-labelledby="myLargeModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg">
				<div class="modal-content modalTemporaryEmail">
					<div class="modalTemporaryEmailFolder">

						<h4>작성하신 메일이 임시 저장되었습니다.</h4>
						<h6>제목 : 제목없음</h6>
						<p>
							<strong>임시저장된 메일 보내기</strong><br /> <br /> 1. 왼쪽 메뉴에서 ‘임시보관함’을
							선택하세요.
						</p>
						<div class="modalTemporaryEmailFolderBtn">
							<button class="btn btn-primary btn-lg btn-primary btn-sm"
								role="button">확인</button>
							<button class="btn btn-primary btn-lg btn-primary btn-sm"
								role="button">쓰던 페이지로 가기</button>
						</div>
					</div>

				</div>
			</div>
		</div>

		<!-- 주소록 모달창 -->
		<div class="modal fade bs-example-modal-lg" id="EmailAddress"
			tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
			aria-hidden="true">
			<div class="modal-dialog modal-lg">
				<div class="modal-content modalEmailAddressEmail"
					style="margin-left: -30px;">
					<div class="modalAddressEmailFolder">


						<h4>주소록</h4>

						<div class="search-btn">
							<select class="form-control form-control-sm" style="width: 70px;">
								<option value="">이름</option>
								<option value="">부서</option>
							</select> <input class="form-control form-control-sm col-3" type="text"
								placeholder="Search" aria-label="Search" id="approvalFindStr">
							<input class="btn btn-outline-primary btn-sm " name="onname"
								type="button" value="검색" />
						</div>

						<div class="search-btn-address">
							<div class="search-btn-address-btn-one col-5">
								<label class="btn btn-outline-primary btn-sm"> <input
									type="checkbox" style="margin-right: 5px;" /> 전체선택
								</label>
								<c:forEach begin="0" end="20">
									<div class="address-name">
										<input type="checkbox" name="emailAddressChk" /> <span
											class="badge rounded-pill bg-light text-dark">송연주</span> <span
											class="badge rounded-pill bg-light text-dark">song@gmail.com</span>
										<span class="badge rounded-pill bg-light text-dark">더블유
											조리팀</span>
									</div>
								</c:forEach>
							</div>

							<div class="search-btn-address-btn-two col-1">
								<div class="search-btn-address-btn-two-align">
									<button type="button" class="btn btn-outline-primary btn-sm">
										<i class="bi bi-plus"></i>
									</button>
									<button type="button" class="btn btn-outline-primary btn-sm">
										<i class="bi bi-dash"></i>
									</button>
								</div>

								<div class="search-btn-address-btn-two-ref-align">
									<button type="button" class="btn btn-outline-primary btn-sm">
										<i class="bi bi-plus"></i>
									</button>
									<button type="button" class="btn btn-outline-primary btn-sm">
										<i class="bi bi-dash"></i>
									</button>
								</div>
							</div>

							<div class="search-btn-address-btn-one col-5">

								<div>받는 사람</div>
								<div class="rev-mail-one">
									<div class="rev-align-scroll">
										<c:forEach begin="0" end="20">
											<span class="badge rounded-pill bg-light text-dark">송연주</span>
											<span class="badge rounded-pill bg-light text-dark">song@gmail.com</span>
											<span class="badge rounded-pill bg-light text-dark">더블유
												조리팀</span>
										</c:forEach>
									</div>
								</div>

								<div style="margin-top: 10px">참조</div>
								<div class="ref-mail-two">
									<div class="rev-align-scroll">
										<c:forEach begin="0" end="20">
											<span class="badge rounded-pill bg-light text-dark">송연주</span>
											<span class="badge rounded-pill bg-light text-dark">song@gmail.com</span>
											<span class="badge rounded-pill bg-light text-dark">더블유
												조리팀</span>
										</c:forEach>
									</div>
								</div>
							</div>
						</div>

						<div class="modalAddressEmailFolderBtn">
							<button class="btn btn-primary btn-lg btn-primary btn-sm"
								role="button">추가하기</button>
							<button class="btn btn-primary btn-lg btn-primary btn-sm"
								role="button">취소하기</button>
						</div>
					</div>

				</div>
			</div>
		</div>
		<!-- 모달창 모음 끝 -->

		<main class="e-approval-article">


			<!-- 메일 쓰기 action="emailResult"-->
			<div class="e-approval-search-bar">
				<form class="e-approval-search-form" enctype="multipart/form-data" action="" id="sendToEmail"
					name="frm" method="post">
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
									id="exampleFormControlInput1" value="송" placeholder="송연주">
							</div>

							<div class="form-group col-sm-6">
								<input type="email" class="form-control" name="emailAddress"
									id="exampleFormControlInput1" value="name@example.com"
									placeholder="name@example.com">
							</div>
							<button type="button" style="margin-left: 11px; height: 37px;"
								class="btn btn-outline-primary btn-sm" onclick="sendToTemp()"
								data-toggle="modal" data-target="#temporaryEmailContents">임시
								저장하기</button>
						</div>

						<div class="emailSendContentsRev">

							<!--  받는 사람 -->
							<div class="form-group col-sm-2">
								<label for="exampleFormControlInput1">받는 사람</label>
							</div>


							<div class="form-group col-sm-7 revEmail">
								<c:forEach begin="0" end="20">
									<input type="text" readonly class="form-control col-sm-3"
										id="exampleFormControlInput1"
										placeholder="song1234567@gmail.com">
								</c:forEach>

							</div>

							<!-- 주소록 버튼 -->
							<div class="form-group col-sm-2 rev-to-me">
								<input type="button" class="btn btn-outline-primary btn-sm"
									data-toggle="modal" data-target="#EmailAddress" role="button"
									value="주소록">
							</div>
						</div>

						<!-- 참조 -->
						<div class="emailSendContentsRef">
							<div class="form-group col-sm-2">
								<label for="exampleFormControlInput1">참조</label>
							</div>


							<div class="form-group col-sm-7 revRef">
								<c:forEach begin="0" end="10">
									<input type="email" readonly class="form-control col-sm-3"
										id="exampleFormControlInput1"
										placeholder="name1234ho@example.com">
								</c:forEach>
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
									id="exampleFormControlInput1"
									value="백엔드 작업중입니다. 테스트 부탁드립니다. 안녕하세요."
									placeholder="백엔드 작업중입니다. 테스트 부탁드립니다. 안녕하세요.">
							</div>


						</div>

						<!-- 내용 -->
						<textarea name="emailContents" id="summernote" value=""></textarea>



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
							<button type="button" class="btn btn-primary btn-lg"
								onclick="sendToEmail()">보내기</button>
							<button type="button" class="btn btn-primary btn-lg">취소하기</button>
						</div>
					</div>


				</form>
			</div>
		</main>
	</section>

	<script>
		/* js */

		summernote(); // text 에디터 함수

		/* jQuery */
		$(document).ready(function() {

		});
	</script>

</body>
</html>