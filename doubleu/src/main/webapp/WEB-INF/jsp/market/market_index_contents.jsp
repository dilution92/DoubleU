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
						<div class="card"  onclick="brd.view(${vo.marketNo})">
							<c:forEach items="${vo.attlist }" var="att">
							<img src='../upload/market/${att.oriFile }'class="card-img-top" alt="...">
							</c:forEach>
							<div class="card-body">
								<h5 class="card-title">${vo.marketSubject }, 번호 : ${vo.marketNo } </h5>
								<p class="card-text">${vo.marketPrice}</p>
								<p class="card-text">🤍 2
								<p>
								<p class="card-text-name">${vo.membersNo }
								<input type='text' class='no' value='${vo.marketNo}'/>
								<p>
							</div>
						</div>
					</div>

				</c:forEach>

</body>
</html>