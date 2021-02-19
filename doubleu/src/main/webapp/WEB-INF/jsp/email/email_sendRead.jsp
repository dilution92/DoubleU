<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
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
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

<!-- main page CSS -->
<link rel="stylesheet" href="/css/MainIndex.css">
<!-- 이메일 CSS -->
<link rel="stylesheet" href="/css/email/email_write.css">
<script src="/js/email/email_text.js"></script>
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
					<!-- 사이드바 링크 jsp page -->
					<jsp:include page="commonsCode/emailSidebarLink.jsp"></jsp:include>
					</div>
					<div class="e-approval-approval-list">
						<span class="sendmail-align">
						<span>내 메일함</span>
						<button type="button" style="font-size: 5px; line-height: 13px;" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#moveEmailContents">+</button>
						</span>
						
					<!-- 사이드바 링크 jsp page -->
					<jsp:include page="commonsCode/emailSideBarLinkMy.jsp"></jsp:include>
					</div>
				</div>
			</nav>
	<!-- lnb code 끝 -->
	
	<!-- 모달창 모음 -->
		<!-- 1. 내 메일함 추가 모달창 -->
	                <div class="modal fade bs-example-modal-lg" id="moveEmailContents" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
	                <div class="modal-dialog modal-lg">
	                    <div class="modal-content modalEmail">
	                        <div class="modalNewEmailFolder">
	                            <h4>새 메일함 만들기</h4>
	                            <input type="text" placeholder="메일함 이름">
	                            <div class="modalNewEmailFolderBtn">
	                                <button class="btn btn-primary btn-lg btn-primary btn-sm" role="button">만들기</button>
	                                <button class="btn btn-primary btn-lg btn-primary btn-sm" role="button">취소하기</button>
	                            </div>
	                        </div>
	                        
	                    </div>
	                </div>  
	                </div>
	  
     <!-- 모달창 모음 끝 -->           
                
		<main class="e-approval-article">

		
			<!-- 메일 검색바 code -->
			<div class="e-approval-search-bar">
	      		<form class="e-approval-search-form" action="" name="frm" method="post">
			      	<div class="e-approval-form-box">
			      		<span>보낸 메일함</span>
			      		
					</div>
					
					<div class="email-select-content">
											    
						<div class="emailSendContents">
							<div class="form-group col-sm-2">
							    <label for="exampleFormControlInput1">보내는 사람</label>
							</div>
							
							
							<div class="form-group col-sm-1">
							 	<input type="email" class="form-control" id="exampleFormControlInput1" readonly placeholder="송연주">
							</div>
							
							<div class="form-group col-sm-6">
							 	<input type="email" class="form-control" id="exampleFormControlInput1" readonly placeholder="name@example.com">
							</div>
							
					    </div>
					    
					    <div class="emailSendContentsRev">
					    
					    <!--  받는 사람 -->
							<div class="form-group col-sm-2">
							    <label for="exampleFormControlInput1">받는 사람</label>
							</div>
							
							
						
							<div class="form-group col-sm-7 revEmail">
								<c:forEach begin="0" end="20">
							 	<input type="email" readonly class="form-control col-sm-3" id="exampleFormControlInput1" placeholder="song1234567@gmail.com">
							 	</c:forEach>
							 
							</div>
													
					    </div>
					    
					    <!-- 참조 -->
					    <div class="emailSendContentsRef">
							<div class="form-group col-sm-2">
							    <label for="exampleFormControlInput1" >참조</label>
							</div>
							
						
							<div class="form-group col-sm-7 revRef">
								<c:forEach begin="0" end="10">
							 	<input type="email" readonly class="form-control col-sm-3" id="exampleFormControlInput1" placeholder="name1234ho@example.com">
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
								  <label class="form-check-label" for="defaultCheck1">
								    중요!
								  </label>
								</div>
																
							</div>
							
							<div class="form-group col-sm-7">
							 	<input type="email" class="form-control" id="exampleFormControlInput1" readonly placeholder="프론트 작업중입니다. 테스트 부탁드립니다. 안녕하세요.">
							</div>
							
							
					    </div>
			
						<!-- 내용 -->
						<div class="send-read-contents">
							<c:forEach begin="0" end="100">
							 <span class="badge badge-light">메일 내용</span><br>
							</c:forEach>
						</div>
							
						
						
						<!-- 파일첨부 -->
						<div class="custom-file">
						  <button type="button" id="fileAdd"class="btn btn-light">첨부파일</button>	 
					 	  <c:forEach begin="0" end="1">
					 	  <span class="badge badge-light">Choose file.jpg</span>
					 	  </c:forEach>
						</div>
					
						<!-- 버튼 -->
						<div class="send-and-cancel">
						<button type="button" class="btn btn-primary btn-lg">목록으로</button>
						</div>
					</div>
					
					
	     		</form>
			</div>
		</main>
	</section>

<script>

	chk = function() {
		console.log('하이')
		var arr = ['zero', 'one', 'tow']; 
		
		let btn = document.getElementById('testType')
		btn.value = arr
		console.log(btn.value)
		
		/*
		document.frm.action = "test.jsp";
		document.frm.submit();	*/
	}
	
	summernote();


</script>
	
</body>
</html>