<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"> <meta name="viewport" content="width=device-width, initial-scale=1.0"> <meta http-equiv="X-UA-Compatible" content="ie=edge">

<title>중고 게시판</title>

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
<!-- 차트 링크 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.js"></script>
<!-- 튤립 -->
 <script src="https://https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script> 
<body>

	<!-- main-GNB -->
	<header class="container-fluid main-gnb">
			<jsp:include page="/WEB-INF/jsp/MainPage/header.jsp"/>
	</header>
	<!-- main-GNB code 끝 -->


	<section class="e-approval-container">
		<!-- e-approval-lnb code -->
				<jsp:include page="side_menu.jsp"/>

		<!-- lnb code 끝 -->

		<main class="e-approval-article">
			<div class="market-header" style="height: 2%;  margin-bottom: 50px;">
				<h3 style="width: 200px; height: 30px;">더블마켓 </h3>
			</div>
			<!-- ========== -->
			<div class='container market-price-search-container 'id = "content">
				<div class='market-price-search-form' style="margin-bottom:50px;">
					<div id = "cont-wrap" >
						<div class="cate-top-txt"><h3>시세검색</h3></div>
			        </div>
					<div class="search-bar">
			                 <form  name="frm_search" action="/marketSelectPrice" method="post" class="search-form" >
								 <div class="market-search-bar" >
									 <input class="form-control form-control-lg market-search"
											type="text" placeholder="정확한 상품명을 입력해주세요" aria-label="Search"
											id="approvalFindStr" value="${param.selectPrice }" name="selectPrice" style="width:50%;font-size:1rem;">
					                 <input class="btn btn-outline-primary btn-lg" type="submit" value="검색" />
					                    <input type="hidden" name="nowPage" value="${(empty param.nowPage)? 1: param.nowPage}" size="10">
									</div>
			                 </form>
			       	 </div>
			     </div>
			     
      <div id="chart-container">
      			<c:choose>
      				<c:when test="${!empty priceList }">
                        <canvas id="priceChart" style="width: 80%; height: 300px;text-align:center;"></canvas>
      					<div class="price-chart-detail">
      						
      						${param.selectPrice }의 시세 :<span class="badge badge-primary"> ${price }</span>원 <br><br><br>
      						<button type="button" class="btn btn-primary" onclick="location.href='/marketSelect?findStr=${param.selectPrice }'"
      						data-toggle="tooltip" data-placement="left" title="바로검색" id="example">${param.selectPrice }게시물 보기</button>
      					</div>
      				</c:when>
      				<c:when test="${!empty msg }">
						<div class="alert alert-danger" role="alert"> ${msg }</div>
					</c:when>
      			</c:choose>
     </div>
 
        </div>
 
		</main>
	</section>


	<!-- bootstrap script, Jquery CDN -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
		crossorigin="anonymous"></script>
	<!-- ****************************** -->
<script>
$( function () {
    $('[data-toggle="tooltip"]').tooltip()
  } );
</script>
<script>
var marketDate = [];
var marketPrice = [];

<c:forEach var="priceList" items="${priceList}">
	marketDate.push('${priceList.MARKET_DATE}');
	marketPrice.push('${priceList.PRICEAVG}');
</c:forEach>

var ctx = document.getElementById("priceChart");
var myChart = new Chart(ctx, {
    type: 'line',
    data: {
        labels: marketDate,
        datasets: [{
            label: '가격',
            data: marketPrice,
            backgroundColor: [
                'rgba(54, 162 , 235, 0.2)',
               
            ],
            borderColor: [
                'rgba(54, 162 , 235, 0.2)',
              
            ]
        }]
    },
    options: {
    
        scales: {
            xAxes: [{

                ticks: {
                    beginAtZero: true,
                  
                }
            }]
        }
    }
}
);   
    
</script>

</body>
</html>