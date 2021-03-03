<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<nav class="e-approval-lnb">
			<div class="e-approval-lnb-content">
				<h4>게시판</h4>
				<div class="e-approval-form-btn">
<!-- 					<input type="button" class="btn btn-primary btn-lg"
						data-toggle="modal" data-target="#exampleModal" value="글쓰기">
 -->			
 				<c:if test="${loginName eq '강성연' }">		
		 			<input type="button" class="btn btn-primary btn-lg"
							onClick="location.href='noticeInsert'" value="공지사항 글쓰기">
		 			<input type="button" class="btn btn-primary btn-lg"
							onClick="location.href='familyeventInsert'" value="경조사 글쓰기">	
				</c:if>								
				</div>
				
				<div class="e-approval-approval-list">
				<span>전사게시판</span>
				<ul>
					<li><a href="noticeIndex">공지사항</a></li>
					<li><a href="familyeventIndex">경조사</a></li>
				</ul>
				</div>
						
			</div>
		</nav>
</body>
</html>