<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
								<h5 class="card-title" style="font-weight:600;margin-top: 10px;text-align: center;">${vo.marketSubject } </h5>
								<p class="card-text" style="text-align: center;margin-bottom: 40px;">
								<c:choose>
									<c:when test="${vo.marketPrice == '0' }">무료나눔</c:when>
									<c:otherwise>
										<fmt:formatNumber value="${vo.marketPrice}" pattern="#,###원" />
									</c:otherwise>
								</c:choose>
								</p>
								<div style="display:flex;">
									<p class="card-text" style="width:50px;">👁${vo.marketHit }
									<p>
									<p class="card-text-name" style="margin-left:70px;">${vo.marketWriter}
								
								</div>
								<input type='hidden' class='marketNo' value='${vo.marketNo}'/>
								<p>
							</div>
						</div>
					</div>
				</c:forEach>
							
</body>
</html>