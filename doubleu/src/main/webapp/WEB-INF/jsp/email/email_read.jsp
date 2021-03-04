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
	
<!-- JQuery -->
<script
  src="https://code.jquery.com/jquery-3.5.1.js"
  integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
  crossorigin="anonymous"></script>
	
<!-- include summernote css/js-->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

<!-- main page CSS -->
<link rel="stylesheet" href="/css/MainIndex.css">
<!-- 이메일 CSS -->
<link rel="stylesheet" href="/css/email/email_read.css">


<!-- js -->
<script src="js/email/email_commons.js"></script>

<!-- alert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>





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
					<input type="button" class="btn btn-primary btn-lg" value="메일쓰기" onclick="location.href='/emailWrite'">
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
       <jsp:include page="./modal/newFolderModal.jsp"></jsp:include>
                
   <!-- 2. 스팸 모달창 -->
         
        <jsp:include page="./modal/spamModalRead.jsp"></jsp:include>
        
      <!--  3.삭제하기 모달창 -->	
			<jsp:include page="./modal/deleteModal.jsp"></jsp:include>    
    <!-- 모달창 모음 끝 -->           
               
	<main class="e-approval-article">

	
		<!-- 메일 검색바 code -->
			<div class="e-approval-search-bar">
	      		<form class="e-approval-search-form" action="" name="frm" method="post">
	      			<c:forEach var="list" items="${selectRead }">
	      			<input type="hidden" name="deleteBtnList" value="${list.emailNo }" />
	      			</c:forEach>
			      	<div class="e-approval-form-box">
			      		<span>메일함</span>
					</div>

				
				<div class="email-select-content">
					
					<ul class="email-select-list">
                    <li>
                     	<span class="btn btn-outline-primary btn-sm" data-toggle="modal" data-target="#spamEmailRev">스팸차단</span>
                    </li>
                    <li>
                          <span class="btn btn-outline-primary btn-sm" onclick="replyMail()">답장하기</span>
                     </li>

                     <li>
                         <span class="btn btn-outline-primary btn-sm" >삭제하기</span>
                     </li>

                     <li>
                         <span class="btn btn-outline-primary btn-sm" onclick="transMail()">전달하기</span>
                     </li>

				</ul>
					<!-- 제목 -->
					 <c:forEach var="list" items="${selectRead }">
				  
					<div class="emailSendContents">
						<div class="form-group col-sm-2">
						    <label for="exampleFormControlInput1">보내는 사람</label>
						</div>
						
						<div class="form-group col-sm-2">
						 	<input type="text" class="form-control" id="exampleFormControlInput1" readOnly value="${list.emailName }">
						</div>
						
						<div class="form-group col-sm-7">
						 	<input type="email" class="form-control" id="exampleFormControlInput1" readOnly value="${list.emailAddress }">
						</div>
				    </div>
				    
				    
				    
				    <!--  받는 사람 -->
				    <div class="emailSendContentsRev">

						<div class="form-group col-sm-2">
							<label for="exampleFormControlInput1">받는 사람</label>
						</div>

						<div class="form-group col-sm-7 revEmail">
							<c:forEach var="sendPerson" items="${selectSendList}">
							 	 	<input type="email" name="emailReceiverAddress" 
							 	 	value="${sendPerson.emailReceiverAddress}" readonly class="form-control col-sm-3"
									id="exampleFormControlInput1"
									placeholder="song1234567@gmail.com">
							<!-- 받는 사람 input -->
								
							</c:forEach>

						</div>

					</div>
				    
				    
				    
				    <!-- 참조 -->
				    <div class="emailSendContentsRef">
						<div class="form-group col-sm-2">
							<label for="exampleFormControlInput1">참조</label>
						</div>

						
						<div class="form-group col-sm-7 revRef">
							<c:forEach var="refPerson" items="${selectRefList }">
								<!-- 참조input -->
								<input type="email" readonly name="emailReceiverRef" class="form-control col-sm-3"
									id="exampleFormControlInput1"
									value="${refPerson.emailReceiverAddress }">
							</c:forEach>
						</div>

					</div>
					
					<!-- 제목 -->
					<div class="emailSendContentsHeader">
						<div class="form-group col-sm-1">
						    <label for="exampleFormControlInput1">제목</label>
						</div>
						
						<div class="form-group col-sm-1 importSend"></div>
						
						<div class="form-group col-sm-9">
						 	<input type="text" class="form-control" id="exampleFormControlInput1" readOnly value="${list.emailTitle }">
						</div>
				    	
				    </div>
				    
					<!-- 내용 -->
					<div class="send-read-contents">
						<div class="email-contents">
							${list.emailContents }
						</div>
						<div class="badge badge-light test"></div>
					</div>
					</c:forEach>	
					
					<!-- 파일첨부 -->
					
					<div class="custom-file">
					  <button type="button" id="fileAdd"class="btn btn-light">첨부파일</button>	 
				 	 	 <c:forEach var="selectFile" items="${selectFiles }">
				 	  <span class="badge badge-light">${selectFile.oriFile }</span>
				 	  	
				 	 </c:forEach>	
				 	  
					</div>

					<!-- 버튼 -->
					<div class="send-and-cancel">
					<button type="button" class="btn btn-primary btn-sm" onclick="location.href='/emailIndex'">목록으로</button>
					</div>
				</div>
				
     		</form>
		</div>
	</main>
</section>

<script>
//사이드바
selectChkBtn();

// 즐겨찾기 아이콘
favoritesBtn();

// 메일 읽음 아이콘
readBtn();

// 읽음 버튼을 눌렀을 때 아이콘 변경 
changeChkReadBtn();


//답장하기
var replyMail = function() {
	
	var frm = document.frm;

	
	console.log(frm.deleteBtnList.value);

	frm.action = "/ReplyWrite"
	frm.submit();
}

// 전달하기
var transMail = function() {


var frm = document.frm;
	console.log(frm.deleteBtnList.value);

	frm.action = "/transWrite"
	frm.submit();
}

</script>
	
</body>
</html>