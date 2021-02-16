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
		<h3 style="width: 200px; height: 30px;">중고게시판</h3>

				<!-- 찜목록 -->
				<input class="btn btn-outline-primary btn-sm market-dib" data-toggle="modal"
					data-target="#dibModal" type="button" value="찜목록" />
				<!-- 시세확인 -->
				<input class="btn btn-outline-primary btn-sm market-dib" 
				onClick="location.href='marketPriceRange'" type="button" value="시세확인" />
				<!-- 전자결재홈 검색바 code -->
				<div class="market-search-bar">
					<form class="market-search-form" action="/marketSelect" name="frm_market" method="post">
						<div class="market-search-form-box" style="display:flex;">
								<select class="form-control form-control-sm e-approval-select-box">
								<option value="">카테고리</option>
								<option value="1">뷰티/미용</option>
								<option value="2">식품</option>
								<option value="3">의류</option>
								<option value="4">전자제품</option>
								<option value="5">도서/티켓</option>
								<option value="6">기타 중고물품</option>
							</select>
							<input class="form-control form-control-sm" type="text" placeholder="상품명" aria-label="Search" id='findStr'  name='findStr' style="margin-left:5px;"> 
							<input class="btn btn-outline-primary btn-sm" type="submit" value="검색" style="margin-left:5px;"/> 
							<!-- hidden -->
						</div>
					</form>
				</div>
</body>
</html>