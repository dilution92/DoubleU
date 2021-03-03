<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- bootstrap CDN -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
<script
  src="https://code.jquery.com/jquery-3.5.1.js"
  integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
  crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>




<!-- ****************************** -->

<!-- JS -->
<script src="/js/calender/CalenderMonth.js"></script>
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
        <div style="position: absolute; left: 48rem;" id="calender_main_top_header"> <!-- 중앙 이름 -->
            <input type="number" id="Wyear" class="form-control" value="${currentYear }" style="width:100px; display:initial;">
            <input type="hidden" id="monthcome" value="${currentMonth }">
            <input type="hidden" id="daycome" value="${currentDay }">
            <select id="Wmonth" class="form-control" style="width:100px; display:initial;">
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
					<th scope="col" width="9%">
						#
					</th>
					<c:forEach var="list" items="${list }" >
					<th scope="col" width="13%" id="calender_content" class="${list.dateIdN}">
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
		      		<c:forEach var="list" items="${list }" >
		      	
			      			<td id="calender_content"><!-- all-day 표시칸  -->
			      		<c:forEach items="${list.vo }" var="listVo"> <!-- 장기 일정이 표시 될 곳 -->
								<div class="${listVo.getCalenderGroup() }">
								<div class="${listVo.getCalenderType() }">
								<div class="calender_modal" id="${listVo.getCalenderNo() }" data-toggle="modal" data-target="#Calender_detail_modal">
								<c:choose>
									<c:when test="${listVo.getCalenderType() eq '장기'}">
											${listVo.getCalenderSubject() }
											<input type="hidden">
											<input type="hidden" value="${listVo.getCalenderNo() }"> <!-- 0 -->
											<input type="hidden" value="${listVo.getStartDate() }"> <!-- 1 -->
											<input type="hidden" value="${listVo.getStartTime() }"> <!-- 2 -->
											<input type="hidden" value="${listVo.getEndDate() }"> <!-- 3 -->
											<input type="hidden" value="${listVo.getEndTime() }"> <!-- 4 -->
											<input type="hidden" value="${listVo.getCalenderType() }"> <!-- 5 -->
											<input type="hidden" value="${listVo.getCalenderSubject() }"> <!-- 6 -->
											<input type="hidden" value="${listVo.getCalenderContent() }"> <!-- 7 -->
											<input type="hidden" value="${listVo.getCalenderPlace() }"> <!-- 8 -->
											<input type="hidden" value="${listVo.getCalenderWriter() }"> <!-- 9 -->
											<input type="hidden" value="${listVo.getCalenderGroup() }"> <!-- 10 -->
											<input type="hidden" value="${listVo.getCalenderTime() }"> <!-- 11 -->
									</c:when>
								</c:choose>
								</div>
								</div>
								</div>
						</c:forEach>
			      			</td>	
						
					</c:forEach>
				</tr>	
		      	<tr>
		      		<th class="weekTableLine">
			      		<c:forEach begin="0" end="23" var="i">
			      		
				      		<table class="table table-borderless">
							  <tr height="60px">
							    <th>	${i } 시</th>
							  </tr>
							</table>
						
			      		</c:forEach>
		      		</th>
				      	<c:forEach var="list" items="${list }"> <!-- 요일별 (가로 한칸씩) -->
				      		<td style="padding: 0;" class="weekTableLine">
					      		<table class="table table-borderless" style="margin-top: 7px">
				      				<c:forEach var="time" items="${list.time }"> <!-- 요일별 세로 (시간별) -->
									  <tr id="calender_content" height="76.5px"> <!-- 각 시간별 -->
								  		<td>
											<c:forEach items="${list.vo }" var="listVo"> 
											<div class="${listVo.getCalenderGroup() }">
											<div class="${listVo.getCalenderType() }">
											 <div class="calender_modal" >
												<c:choose>
												<c:when test="${listVo.getCalenderType() eq '단기'}">
													<c:if test="${listVo.getCalenderStartDay() eq list.day1 }">
													<c:if test="${listVo.getCalenderStartTime() eq time }">
														<i class="bi bi-diamond bi-diamond-color"></i>${listVo.getCalenderSubject() }
														<input type="hidden" value="${listVo.getCalenderNo() }"> <!-- 0 -->
														<input type="hidden" value="${listVo.getStartDate() }"> <!-- 1 -->
														<input type="hidden" value="${listVo.getStartTime() }"> <!-- 2 -->
														<input type="hidden" value="${listVo.getEndDate() }"> <!-- 3 -->
														<input type="hidden" value="${listVo.getEndTime() }"> <!-- 4 -->
														<input type="hidden" value="${listVo.getCalenderType() }"> <!-- 5 -->
														<input type="hidden" value="${listVo.getCalenderSubject() }"> <!-- 6 -->
														<input type="hidden" value="${listVo.getCalenderContent() }"> <!-- 7 -->
														<input type="hidden" value="${listVo.getCalenderPlace() }"> <!-- 8 -->
														<input type="hidden" value="${listVo.getCalenderWriter() }"> <!-- 9 -->
														<input type="hidden" value="${listVo.getCalenderGroup() }"> <!-- 10 -->
														<input type="hidden" value="${listVo.getCalenderTime() }"> <!-- 11 -->
													</c:if>
													</c:if>
												</c:when>
												</c:choose>
										</div>
										</div>
										</div>
									</c:forEach>
										</td>
								  </tr>
				      		</c:forEach>
								</table>
							</td>
						</c:forEach>
		      	</tr>
			      	
		</tbody>
		</table>
		</div>
		
		<!-- 모달창 -->
	<div class="modal fade" id="Calender_detail_modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
 		<jsp:include page="Calender_pop_modal.jsp"></jsp:include>
	</div>
	
</main>


</body>
</html>