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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.js"></script>

<script>
    
 
    
 
 
    $(document).ready(function() {
 
        
        var chartLabels = []; // 받아올 데이터를 저장할 배열 선언
        var chartData = []; 
        var month="";
    
        var cooContractNo = '<c:out value="${no}"/>';
        
        function createChart() {
            
            var ctx = document.getElementById("canvas").getContext("2d");
            LineChartDemo = Chart.Line(ctx, {
                data : lineChartData,
                options : {
                    scales : {
                        yAxes : [ {
                            ticks : {
                                beginAtZero : true
                            }
                        } ]
                    }
                }
            });
        }
 
 
        
        //selectList로 월을 선택해서 ajax로 받는다.
        $('#selectMonth').change(function() {
            var changeMonth = $('#selectMonth option:selected').val();
            month = changeMonth;
            console.log('month:'+month);
            
            
             
        });
        
        //버튼을 클릭하면 차트가 그려진다. createChart()함수를 안에다 선언해야지 차트값을 받더라...
        $('#btn').click(function(){
            
            chartLabels = [];
            chartData=[];
            
            //getJson으로 데이터 
            $.getJSON("./getDailyVisitor", {
                cooContractNo : cooContractNo,
                month : month
            }, function(data) {
                $.each(data, function(key, value) {
                    
                    chartLabels.push(value.statsDate);
                    chartData.push(value.statsAmount);
                });
                
                lineChartData = {
                        labels : chartLabels,
                        datasets : [ {
                            label : "일별 방문자 수",
                            backgroundColor:"#bfdaf9",
                            borderColor: "#80b6f4",
                            pointBorderColor: "#80b6f4",
                            pointBackgroundColor: "#80b6f4",
                            pointHoverBackgroundColor: "#80b6f4",
                            pointHoverBorderColor: "#80b6f4",
                            fill: false,
                            borderWidth: 4,
                            data : chartData
                        } ]
 
                    }
                createChart();
                
            });
        })
 
        
    })
    
</script>

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
				<h3 style="width: 200px; height: 30px;">중고게시판</h3>
			</div>
			<!-- ========== -->
			<div class='container market-price-search-container 'id = "content">
				<div class='market-price-search-form'>
					<div id = "cont-wrap" >
						<div class="cate-top-txt"><h3>시세검색</h3></div>
			        </div>
					<div class="search-bar">
			                 <form  name="frm_search" action="/marketSelectPrice" method="post" class="search-form" >
								 <div class="market-search-bar" >
									 <input class="form-control form-control-lg market-search"
											type="text" placeholder="상품명" aria-label="Search"
											id="approvalFindStr" value="${param.findStr }" name="selectPrice" style="width:50%;">
					                 <input class="btn btn-outline-primary btn-lg" type="submit" value="검색" />
					                    <input type="hidden" name="nowPage" value="${(empty param.nowPage)? 1: param.nowPage}" size="10">
										<input type="hidden" name="serial" size="10" >
										<input type="hidden" name="search" value="select">
									</div>
			                 </form>
			       	 </div>
			     </div>
			     
			     

 <div class="row">
 
            <div class="container">
 
 
 
                <div style="margin-top:20px; margin-left:80px">
                    <select name="selectMonth" id="selectMonth">
 
                        <option value="1">JAN</option>
                        <option value="2">FEB</option>
                        <option value="3">MAR</option>
                        <option value="4">APR</option>
                        <option value="5">MAY</option>
                        <option value="6">JUN</option>
                        <option value="7">JUL</option>
                        <option value="8">AUG</option>
                        <option value="9">SEP</option>
                        <option value="10">OCT</option>
                        <option value="11">NOV</option>
                        <option value="12">DEC</option>
                    </select>
                    <button id="btn">보기</button>
                </div>
            </div>
 
 				<h1>시세 : ${price }</h1>
 
            <div id="graph" style="width: 80%; margin: 30px;">
                <div>
                    <canvas id="canvas" height="350" width="600"></canvas>
                </div>
            </div>
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
	
		</script>
</body>
</html>