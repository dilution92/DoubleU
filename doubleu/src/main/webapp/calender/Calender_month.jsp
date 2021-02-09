<%@page import="java.util.List"%>
<%@page import="com.doubleu.calender.Calender"%>
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
<%
	Calender cal = new Calender();
	List<Integer> list = cal.getList();
%>


	<!-- 그룹웨어 GNB -->
	<header class="container-fluid main-gnb">
		<jsp:include page="/MainPage/header.jsp"></jsp:include>
	 </header>
	 <!-- 그룹웨어 GNB code 끝 -->
	 
	 
<aside id="calender_aside">
	<!-- 일정 사이드바  -->
	<jsp:include page="Calender_aside.jsp"></jsp:include>
</aside>

<main id="calender_main">
    <div style="height: 50px;" id="calender_main_top_btn"> <!-- 상단 버튼 -->
        <div style="float: left; margin-left: 30px;"> <!-- 좌측 이동 & 투데이 -->
            <input type="button" class="btn btn-primary" value="이전" >
            <input type="button" class="btn btn-primary" value="다음">
            <input type="button" class="btn btn-primary" value="오늘">
        </div>
        <div style="position: absolute; left: 53rem;" id="calender_main_top_header"> <!-- 중앙 이름 -->
            <h3>2021년 3월</h3>
        </div>
        <div style="float: right; margin-right: 50px;" id="calender_main_top_sector"> <!-- 우측 표시 달력 -->
            <input type="button" class="btn btn-primary" value="월간" onclick="location.href='Calender_month.jsp'">
            <input type="button" class="btn btn-primary" value="주간" onclick="location.href='Calender_week.jsp'">
            <input type="button" class="btn btn-primary" value="일간" onclick="location.href='Calender_day.jsp'">
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
			
			<% for(int i=0; i<6; i++) { %>
        	<tr height="150px;"><!-- 일주일은 묶는곳 -->
			
			<% for(int j=0; j<7; j++){ %>
			<td id="calender_content"><!-- 월간 달력 한칸 -->
				<div><!-- 날자가 표시 될 곳 -->
				<%=list.get(i*6+j+i) %>
				</div>
				<div class="calender_modal" ><!-- 장기 일정이 표시 될 곳 -->
					여기에 일정이 표시
				</div>
				<div><!-- 단기 일정이 표시 될 곳 -->
				
				</div>
			</td>
       <%} %>
        	</tr>
		<%} %>
			</tbody>
		</table>
	</div>
	
	<!-- 모달창 -->
	<div class="modal fade" id="Calender_detail_modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
 		<jsp:include page="Calender_pop_modal.jsp"></jsp:include>
	</div>	
		
</main>
 
<script type="text/javascript">
$(function(){
    $(".calender_modal").click(function(){
        $('#Calender_detail_modal').modal();
    })
})
</script>


</body>
</html>