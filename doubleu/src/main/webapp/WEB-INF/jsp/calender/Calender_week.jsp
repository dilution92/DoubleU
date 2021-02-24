<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/css/calender/Calender.css">
<!-- main page CSS -->
<link rel="stylesheet" href="/css/MainIndex.css">
</head>

<body>
<!-- 그룹웨어 GNB -->
	<header class="container-fluid main-gnb">
		<jsp:include page="../MainPage/header.jsp"></jsp:include>
	 </header>
	 <!-- 그룹웨어 GNB code 끝 -->

<!-- 왼쪽 고정 바 -->
<aside id="calenderAside">
	<!-- 일정 사이드바  -->
	<jsp:include page="Calender_aside.jsp"></jsp:include>
</aside>

<main id="calender_main">
    <div style="height: 50px;" id="calender_main_top_btn"> <!-- 상단 버튼 -->
        <div style="float: left; margin-left: 30px;"> <!-- 좌측 이동 & 투데이 -->
           <input type="button" class="btn btn-primary" onclick="location.href='/CalenderWeekDiff?diff=-7'" value="이전" >
            <input type="button" class="btn btn-primary" onclick="location.href='/CalenderWeekDiff?diff=7'" value="다음">
            <input type="button" class="btn btn-primary" onclick="location.href='/CalenderWeekToday'" value="오늘">
        </div>
        <div style="position: absolute; left: 53rem;" id="calender_main_top_header"> <!-- 중앙 이름 -->
            <input type="number" id="year" class="form-control" value="${currentYear }" style="width:100px; display:initial;">
            <input type="hidden" id="monthcome" value="${currentMonth }">
            <input type="hidden" id="daycome" value="${currentDay }">
            <select id="month" class="form-control" style="width:100px; display:initial;">
            	<option value="1">1월</option>
            	<option value="2">2월</option>
            	<option value="3">3월</option>
            	<option value="4">4월</option>
            	<option value="5">5월</option>
            	<option value="6">6월</option>
            	<option value="7">7월</option>
            	<option value="8">8월</option>
            	<option value="9">9월</option>
            	<option value="10">10월</option>
            	<option value="11">11월</option>
            	<option value="12">12월</option>
            </select>
        </div>
        <div style="float: right; margin-right: 50px;" id="calender_main_top_sector"> <!-- 우측 표시 달력 -->
           <input type="button" class="btn btn-primary" value="월간" onclick="location.href='/calenderMonth'">
            <input type="button" class="btn btn-primary" value="주간" onclick="location.href='/calenderWeek'">
            <input type="button" class="btn btn-primary" value="일간" onclick="location.href='/calenderDay'">
        </div>
    </div>
    <div>
		<table class="table table-bordered">
			<thead><!-- 요일 들어갈 자리 -->
				<tr height="50px">
					<th scope="col" width="8%">
						#
					</th>
					<c:forEach var="list" items="${list }" >
					<th scope="col" width="13.1%" class="${list.month}${list.day}">
						<span>${list.week }</span> 
						<span>${list.day }</span> 
					</th>
					</c:forEach>
					
				</tr>
			</thead>
			<tbody><!-- 달력 컨텐츠가 표시 될 곳 -->
		      	<tr><!-- 일주일은 묶는곳 -->
		      		<th><!-- all-day 표시칸  -->
		      			All-day
		      		</th>
		      <c:forEach var="temp" begin="1" end="7" >
		      		<td id="calender_content"><!-- all-day 표시칸  -->
		      			<div class="calender_modal" >
							I can do this all day
						</div>
		      		</td>
		      </c:forEach>
		      	</tr>
		      
	      
	        <%
	        	for(int i=1; i<=25; i++){
	        %>
	        	<tr><!-- 일주일은 묶는곳 -->
	        	<th ><!--  -->
	        		<%=i-1 %> 시
	        	</th>
	        <%
	        		for(int j=1; j<=7; j++){
	        %>
				<td id="calender_content"><!-- 월간 달력 한칸 -->
					<div><!-- 단기 일정이 표시 될 곳 -->
					</div>
				</td>
	        <%
	        		}
	        %>		
	        	</tr>
	        <% 
	        	}
	        %>
	        
		</tbody>
		</table>
		</div>
		
		<!-- 모달창 -->
	<div class="modal fade" id="Calender_detail_modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
 		<jsp:include page="Calender_pop_modal.jsp"></jsp:include>
	</div>
	
</main>

<script>
$(function(){
	$(".calender_modal").click(function(){
        $('#Calender_detail_modal').modal();
    })
    
    $("#month").change(function(){
    	var changedMonth = parseInt($('#month').val());
    	console.log(month+"셀렉박스 월 값");
    	var url = "/WeekSelectedMonth?changedMonth="+changedMonth;
    	location.href=url;
    })
    
    $("#year").change(function(){
    	var changedyear = parseInt($('#year').val());
    	console.log(changedyear+"셀렉박스 년 값");
    	var url = "/WeekSelectedYear?changedYear="+changedyear;
    	location.href=url;
    })
})

$(document).ready(function(){
	var month = $("#monthcome").val();
	console.log(month);
	 $("#month").val(month).attr("selected","selected");
})

$(document).ready(function(){
	var month = $("#monthcome").val();
	var day = $("#daycome").val();
	var targetToday = document.getElementsByClassName(month+day)[0];
	targetToday.style.border="5px skyblue solid";
})

</script>
	
</body>
</html>