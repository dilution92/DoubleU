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

<!-- main page CSS -->
<link rel="stylesheet" href="/css/MainIndex.css">
<!-- 전자결재용 CSS -->
<link rel="stylesheet" href="/css/email/ElectronicApproval.css">

</head>
<body>
	<!-- 그룹웨어 GNB 헤더-->
	<header>
		<div class="container-fluid main-gnb">
			<nav class="navbar navbar-expand-lg navbar-light bg-light main-gnb-content">
				<a class="navbar-brand navbar-text-light " href="#" style="margin-right: 28em">DoubleU</a>
			</nav>
		</div>
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
						<li><a href="#">받은 메일함</a><span class="badge badge-primary">1566</span></li>
						<li><a href="#">별표 메일함</a></li>
						<li><a href="#">중요 메일함</a></li>
						<li><a href="#">임시 보관함</a></li>
						<li><a href="#">보낸 보관함</a></li>
						<li><a href="#">스팸 메일함</a> <button type="button" style="font-size:10px;"class="btn btn-primary btn-sm">비우기</button></li>
						<li><a href="#">휴지통</a>       <button type="button" style="font-size:10px;" class="btn btn-primary btn-sm">비우기</button></li>
						
					</ul>
				</div>
				<div class="e-approval-approval-list">
					<span class="sendmail-align">
					<span>내 메일함</span>
					<button type="button" style="font-size: 5px; line-height: 13px;" class="btn btn-primary btn-sm" data-toggle="modal" data-target=".bs-example-modal-lg">+</button>
					</span>
					
					<ul>
						<li><a href="#">NOTES</a></li>
						<li><a href="#">보관함</a></li>
					</ul>
				</div>
			</div>
		</nav>
	<!-- lnb code 끝 -->
	
	<!-- 모달창 모음 -->
		<!-- 1. 내 메일함 추가 모달창 -->
	                <div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
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
	                
        <!-- 2. 스팸 모달창 -->
         
         <div class="modal fade bs-example-modal-lg"  id="spamEmailRev" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
	                <div class="modal-dialog modal-lg">
	                    <div class="modal-content modalSpamEmail">
	                        <div class="modalSpamEmailFolder">
	                            <h4>스팸 차단</h4>
	                            <p>선택한 메일의 정보를 차단 정보로 등록하고, 해당 정보로 오는 메일은 앞으로 받지 않고 자동 반송합니다.</p>
	                            <input type="text" placeholder="song@gmail.com">
	                            <div class="modalSpamEmailFolderBtn">
	                                <button class="btn btn-primary btn-lg btn-primary btn-sm" role="button">차단하기</button>
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
	      		<form class="e-approval-search-form" action="" name="" method="post">
			      	<div class="e-approval-form-box">
			      		<span>받은메일함</span>
				        <input class="btn btn-outline-primary btn-sm" type="button" value="검색"/>
				        <input class="form-control form-control-sm" type="text" placeholder="Search" aria-label="Search" id="approvalFindStr">
				      	
				      	<select class="form-control form-control-sm e-approval-select-box">
				      		<option selected> 메일 </option>
				      	</select>
					</div>
	     		</form>
			</div>
			<!-- ========== -->
			
			<!-- 선택 -->
						
			<div class="email-select-content">
				<ul class="email-select-list">
					<li>
						<label>
						<input type="checkbox"/>전체선택
						</label>
					</li>
                    <li>
                     	<span data-toggle="modal" data-target="#spamEmailRev">스팸차단</span>
                    </li>
                    <li class="listTest" style="cursor: pointer; ">
                          <span>답장하기</span>
                     </li>

                     <li class="listTest" style="cursor: pointer; ">
                         <span>삭제하기</span>
                     </li>

                     <li class="listTest" style="cursor: pointer; ">
                         <span>전달하기</span>
                     </li>

                     <li class="listTest" style="cursor: pointer; ">
                         <span>읽음</span>
                     </li>

                     <li class="listTest" style="cursor: pointer; ">
                         <span data-toggle="modal" data-target=".bs-example-modal-sm">이동</span>
                 	</li>
				</ul>
			</div>
				
			
			
			<!-- 메일함 -->
			<div class="e-approval-table">
				<table class="table table-hover table-sm">
					<tbody class="e-approval-list text-muted">
						<c:forEach begin="1" end="20">
							<tr>
								<td><input type="checkbox"/></td>
								<td><i class="bi bi-star"></i></td>
                                <td><i class="bi bi-envelope"></i></td>
                                <td><i class="bi bi-exclamation"></i></td>
								<td>song@gmail.com</td>					
								<td style=" text-align: left; text-indent: 2em;">프론트엔드 작업 중 입니다. 시간이 참 빨리 지나가네요 흑흑</td>					
								<td>2021-02-23 23:55:45</td>							
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<!-- ========== -->
			
			<!-- 리스트 페이징 아이콘 code -->
			<div class="e-approval-list-pagination">
				<nav aria-label="Page navigation example">
					<ul class="pagination pagination-sm text-muted justify-content-center">  
						<li class="page-item"><a class="page-link" href="#" style="font-size: 0.7em">first</a></li>
						<li class="page-item"><a class="page-link" href="#" style="font-size: 0.7em">&lt;</a></li>
						<li class="page-item"><a class="page-link" href="#" style="font-size: 0.7em">1</a></li>
						<li class="page-item"><a class="page-link" href="#" style="font-size: 0.7em">2</a></li>
						<li class="page-item"><a class="page-link" href="#" style="font-size: 0.7em">3</a></li>
						<li class="page-item"><a class="page-link" href="#" style="font-size: 0.7em">&gt;</a></li>
						<li class="page-item"><a class="page-link" href="#" style="font-size: 0.7em">last</a></li>
					</ul>
				</nav>
			</div>
			<!-- ========== -->

		</main>
	</section>


		
</body>
</html>