<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중고 게시판</title>
</head>
<body>
	<c:forEach var='vo' items='${list }'>
					<div class="col mb-4">
						<div class="card"  onclick="view(${vo.marketNo})">
							<img src='images/market/${vo.attlist[0].oriFile}'class="card-img-top" alt="...">
						
							<!--  <img src='images/market/test.png'class="card-img-top" alt="...">-->
							
							<div class="card-body">
								<h5 class="card-title">${vo.marketSubject } </h5>
								<p class="card-text">${vo.marketPrice}원</p>
								<p class="card-text">🤍 2
								<p>
								<p class="card-text-name">${vo.membersNo }
								<input type='text' class='marketNo' value='${vo.marketNo}'/>
								<p>
							</div>
						</div>
					</div>

				</c:forEach>
</body>
</html>