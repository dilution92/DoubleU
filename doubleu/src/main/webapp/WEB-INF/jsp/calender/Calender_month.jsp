<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="com.doubleu.calender.service.CalenderService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- bootstrap CDN -->
<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
   integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
   crossorigin="anonymous">
<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">

<!-- bootstrap script, Jquery CDN -->
   <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
      integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
      crossorigin="anonymous"></script>
   <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
      crossorigin="anonymous"></script>

<!-- ajax -->
<script
  src="https://code.jquery.com/jquery-3.5.1.js"
  integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
  crossorigin="anonymous"></script>

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
	 
	 
<aside id="calender_aside">
	<!-- 일정 사이드바  -->
	<jsp:include page="Calender_aside.jsp"></jsp:include>
</aside>

<main id="calender_main">
    <div style="height: 50px;" id="calender_main_top_btn"> <!-- 상단 버튼 -->
        <div style="float: left; margin-left: 30px;"> <!-- 좌측 이동 & 투데이 -->
            <input type="button" class="btn btn-primary" onclick="location.href='/CalenderMonthDiff?diff=-1'" value="이전" >
            <input type="button" class="btn btn-primary" onclick="location.href='/CalenderMonthDiff?diff=1'" value="다음">
            <input type="button" class="btn btn-primary" onclick="location.href='/CalenderMonthToday'" value="오늘">
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
					<th scope="col" width="14.2%">
						Sun
					</th>
					<th scope="col" width="14.2%">
						Mon
					</th>
					<th scope="col" width="14.2%">
						Tue
					</th>
					<th scope="col" width="14.2%">
						Wen
					</th>
					<th scope="col" width="14.2%">
						Thu
					</th>
					<th scope="col" width="14.2%">
						Fri
					</th>
					<th scope="col" width="14.2%">
						Sat
					</th>
				</tr>
			</thead>
			<tbody><!-- 달력 컨텐츠가 표시 될 곳 -->
			<form>
			
			<c:forEach items="${list}" var="list">
			<c:set var="i" value="${i+1 }"/>
			<c:if test="${i%7==1 }">
			<tr height="150px;">
			</c:if>
			
			
			<td id="calender_content" class="${list.dateIdN}"><!-- 월간 달력 한칸 -->
				<div ><!-- 날자가 표시 될 곳 -->
				${list.day}
				</div>
				
				<div><!-- 일정이 표시 될 곳 -->
					<c:forEach items="${list.vo }" var="listVo"> <!-- 일정 타입 -->
						
						<input type="hidden" value="${listVo.getCalenderType()}" class="insertCalenderType"> 
					</c:forEach>
					<c:forEach items="${list.vo }" var="listVo"> <!-- 장기 일정이 표시 될 곳 -->
						<div class="calender_modal" id="${listVo.getCalenderNo() }">
						<c:choose>
							<c:when test="${listVo.getCalenderType() eq '장기'}">
								장기 ::
									${listVo.getCalenderSubject() }
									
							</c:when>
						</c:choose>
						</div>
					</c:forEach>
					<c:forEach items="${list.vo }" var="listVo"> <!-- 단기 일정이 표시 될 곳 -->
						<div class="calender_modal" >
							<c:choose>
							<c:when test="${listVo.getCalenderType() eq '단기'}">
								단기 ::
									${listVo.getCalenderSubject() }
									
							</c:when>
						</c:choose>
						</div>
					</c:forEach>
				</div>
				
			</td>
			<c:if test="${i%7==0 }">
			</tr>
			</c:if>
			
			
			</c:forEach>
			</form>
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
    	var param = $(this).attr("id");
    	var idUrl = "/CalenderMonthModal?id="+param;
    	console.log(param);
    	location.href=idUrl;
    	/* 
    	$.ajax ({
            url: '/CalenderMonthModal',
            data : param,
            dataType: 'html',
            method : 'POST',
            success: function(data) {
               console.log(data)
            }
         }); */
    	
        $('#Calender_detail_modal').modal();
    })
    
   
    $("#month").change(function(){
    	var changedMonth = parseInt($('#month').val());
    	var url = "/MonthSelectedMonth?changedMonth="+changedMonth;
    	location.href=url;
    })
    
    $("#year").change(function(){
    	var changedyear = parseInt($('#year').val());
    	var url = "/MonthSelectedYear?changedYear="+changedyear;
    	location.href=url;
    })
    
})

$(document).ready(function(){
	var month = $("#monthcome").val();
	
	 $("#month").val(month).attr("selected","selected");
})

$(document).ready(function(){
	var year = $("#year").val();
	var month = $("#monthcome").val();
	if(month<10){
		month = "0"+month;
	}
	var day = $("#daycome").val();
	if(day<10){
		day = "0"+day;
	}
	var targetToday = document.getElementsByClassName(year+month+day)[0];
	targetToday.style.border="5px skyblue solid";
})

$(document).ready(function(){
	
	/* var ctn = $('.insertCalenderType').length;// 갯수카운트
	
	for(var i=0; i<ctn; i++){
		if(document.getElementsByClassName("insertCalenderType")[i].value == "장기"){
			var tvalue = document.getElementsByClassName("calNo")[i].value;
			$('.longPeriod').children(tvalue).css('display','');
		}
		else if(document.getElementsByClassName("insertCalenderType")[i].value == "단기"){
			var tvalue = document.getElementsByClassName("calNo")[i].value;
			$('.shortPeriod').children(tvalue).css('display','');
		}
		else{
			$('.longPeriod').children(tvalue).css('display','none');
			$('.shortPeriod').children(tvalue).css('display','none');
		}
	}
	 */
	
	
	/* var ictype = $('.insertCalenderType').val();
	var sp = document.getElementsByClassName("shortPeriod")[0];
	var lp = document.getElementsByClassName("longPeriod")[0];
	
	if( ictype !=null){
		
		if(ictype == "장기"){
			$(".longPeriod").show();
		}
		if(ictype == "단기"){
			$(".shortPeriod").show();
		}
	} */
})

/* function changeMonth(){
	
	var month = $("#month").val();
	
	$.ajax({
	    type : "POST",
	    url : "/CalenderChangeMonth", 
	    data : month : month ,
	    error : function(error) {
	    	console.log("error");
	    },
	    success : function(data) {
		console.log("success");
	    }
	});
} */
</script>


</body>
</html>