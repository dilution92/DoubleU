<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시세확인</title>

<!-- bootstrap CDN -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">

<!-- main page CSS -->
<link rel="stylesheet" href="/css/MainIndex.css">
<!-- 전자결재용 CSS -->
<link rel="stylesheet" href="/css/market/market.css">

</head>
<body>
<main class="e-approval-article"  style="width:100%;">
			
			<!-- ========== -->
			<div class='container market-price-search-container 'id = "content">
				<div class='market-price-search-form'>
						<div class="cate-top-txt"><h3>시세검색</h3></div>
					<div class="search-bar">
			                 <form  name="frm_search" role="search" method="post" class="search-form" 
			                 style="width: 100%; ">
								 <div class="market-search-bar" style="width: 500px; margin:0;">
									 <input class="form-control form-control-lg market-search"
											type="text" placeholder="상품명" aria-label="Search"
											id="approvalFindStr" value="${param.findStr }" name="findStr">
					                 <input class="btn btn-outline-primary btn-lg" type="button" value="검색" />
					                    <input type="hidden" name="nowPage" value="${(empty param.nowPage)? 1: param.nowPage}" size="10">
										<input type="hidden" name="serial" size="10" >
										<input type="hidden" name="search" value="select">
									</div>
			                 </form>
			       	 </div>
			     </div>
			     
			     
			     
			     <div class="market-price-contents container">
			     	<div class="price-chart">
			     	  차트 화면
			     	
			     	</div>
					<div class="price-chart-detail">
						<div>
						상품명 : 마우스
						</div>
					
						<div>
						평균가격 : 13,000원
						</div>
					
					
					</div>
			     
			     
			     </div>
				</div>

				


		</main>
</body>
</html>