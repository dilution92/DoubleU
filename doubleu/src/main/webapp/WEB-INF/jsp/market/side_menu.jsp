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
				<h4><span><a href="marketIndex?dibUser=${member.memberName }" style="text-decoration:none; color:black;">더블마켓</a></span></h4>
				<div class="e-approval-form-btn">
<!-- 					<input type="button" class="btn btn-primary btn-lg"
						data-toggle="modal" data-target="#exampleModal" value="글쓰기">
 -->					
 				<input type="button" class="btn btn-primary btn-lg"
						onClick="location.href='marketInsert'" value="글쓰기">	
				</div>
	
				<div class="e-approval-approval-list">
<%-- 					<span><a href="marketIndex?dibUser=${member.memberName }">더블마켓</a></span>
 --%>				
				</div>

			</div>
		</nav>
</body>
</html>