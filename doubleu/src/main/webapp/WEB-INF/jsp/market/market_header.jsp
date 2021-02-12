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
				<div class="e-approval-search-bar">
					<form class="e-approval-search-form" action="" name="frm_approval"
						method="post">
						<div class="e-approval-form-box">
							<input class="btn btn-outline-primary btn-sm" type="button"
								value="검색" /> <input class="form-control form-control-sm"
								type="text" placeholder="Search" aria-label="Search"
								id="approvalFindStr"> <select
								class="form-control form-control-sm e-approval-select-box">
								<option selected>카테고리</option>
								<option value="0">뷰티/미용</option>
								<option value="1">생활/가공식품</option>
								<option value="2">의류</option>
								<option value="3">디지털/가전</option>
								<option value="4">도서/티켓</option>
								<option value="5">부동산</option>
								<option value="6">기타 중고물품</option>
							</select>
						</div>
					</form>
				</div>
</body>
</html>