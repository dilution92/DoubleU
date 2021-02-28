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
					<form class="market-search-form" action="" name="frm_market" method="post" style="display:flex;">
				<input class="btn btn-outline-primary btn-sm market-dib" type="button" onclick="godib('${member.memberName}')" value="찜목록"
				   data-toggle="modal" data-target="#dibModal"/>
				<!-- 시세확인 -->
				<input class="btn btn-outline-primary btn-sm market-dib" 
				onClick="location.href='marketPriceRange'" type="button" value="시세확인" />
				<!-- 전자결재홈 검색바 code -->
				<div class="market-search-bar">
						<div class="market-search-form-box" style="display:flex;margin-top:10px;">
								<select class="form-control form-control-sm e-approval-select-box" name="marketCategory" id="market_category" >
								<option value="" >카테고리</option>
								<option value="뷰티/미용">뷰티/미용</option>
								<option value="식품">식품</option>
								<option value="의류">의류</option>
								<option value="전자제품">전자제품</option>
								<option value="도서/티켓">도서/티켓</option>
								<option value="기타 중고물품">기타 중고물품</option>
							</select>
							<input class="form-control form-control-sm" type="text" placeholder="상품명" aria-label="Search" id='findStr'  value='${param.findStr}'name='findStr' style="margin-left:5px;"/> 
							<input class="btn btn-outline-primary btn-sm" type="button" value="검색" style="margin-left:5px;"id="market_btnFind"/> 
							<!-- hidden -->
							<input type='hidden' name='marketCategory'  value='null' />
							<input type='hidden' name='marketNo'  value=''/>
							<input type='hidden' name='dibUser'  value='${member.memberName }'/>
							
							
						</div>
				</div>
					</form>
				<script>brd()</script>
</body>
</html>