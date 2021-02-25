<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<nav class="e-approval-lnb">
			<div class="e-approval-lnb-content">
				<h4>인사 페이지</h4>
				<div class="e-approval-form-btn">
<!-- 					<input type="button" class="btn btn-primary btn-lg"
						data-toggle="modal" data-target="#exampleModal" value="글쓰기">
 -->					
 				<input type="button" class="btn btn-primary btn-lg"
						onClick="location.href='memberModifyIndex'" value="회원정보 수정">		
				</div>
				
				<div class="e-approval-approval-list">
				<span>인사 관리</span>
				<ul>
					<li><a href="organizationIndex">조직도</a></li>
					<li><a href="profileIndex">프로필</a></li>
				</ul>
				</div>
				<div class="e-approval-approval-list">
					<span>근태 관리</span>
					<ul>
						<li><a href="workIndex">출/퇴근 조회</a></li>
						<li><a href="vacationIndex">연/월차 조회</a></li>
					</ul>
				</div>
			</div>
		</nav>
</body>
</html>