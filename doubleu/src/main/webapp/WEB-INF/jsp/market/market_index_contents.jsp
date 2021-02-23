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

	<c:forEach var='vo' items='${list }' >
					<div class="col mb-4">
						<div class="card"  onclick="view(${vo.marketNo})">	
							<div class="card-body">
		<img src='images/market/${vo.oriFile}'class="card-img-top" alt="..." style="width:150px; height : 150px;">
								<h5 class="card-title">${vo.marketSubject } </h5>
								<p class="card-text">
								<c:choose>
									<c:when test="${vo.marketPrice == '무료나눔' }">${vo.marketPrice}</c:when>
									<c:otherwise>${vo.marketPrice}원</c:otherwise>
								</c:choose>
								</p>
								<p class="card-text">🤍 2
								<p>
								<p class="card-text-name">${vo.marketWriter}
								<input type='hidden' class='marketNo' value='${vo.marketNo}'/>
								<p>
							</div>
						</div>
					</div>
				</c:forEach>
							
</body>
</html>