<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
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
							<img
								src="data:image/jpeg;base64,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"
								class="card-img-top" alt="...">
							<div class="card-body">
								<h5 class="card-title">${vo.marketSubject }</h5>
								<p class="card-text">${vo.marketPrice}</p>
								<p class="card-text">🤍 2
								<p>
								<p class="card-text-name">${vo.membersNo }
								<input type='text' class='no' value='${vo.serial}'/>
								<p>
							</div>
						</div>
					</div>

				</c:forEach>
<%-- <c:forEach begin="1" end="4">

					<div class="col mb-4">
						<div class="card">
							<img
								src="data:image/jpeg;base64,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"
								class="card-img-top" alt="...">
							<div class="card-body">
								<h5 class="card-title">수분 크림</h5>
								<p class="card-text">4,000원</p>
								<p class="card-text">🤍 2
								<p>
								<p class="card-text-name">김재현
								<p>
							</div>
						</div>
					</div>
					<div class="col mb-4">
						<div class="card">
							<img
								src="http://m.pilke.co.kr/web/product/big/201807/512_shop1_15307957190841.jpg"
								class="card-img-top" alt="...">
							<div class="card-body">
								<h5 class="card-title">텀블러</h5>
								<p class="card-text">8,000원</p>
								<p class="card-text">🖤 4
								<p>
								<p class="card-text-name">전예린
								<p>
							</div>
						</div>
					</div>
				</c:forEach> --%>
</body>
</html>