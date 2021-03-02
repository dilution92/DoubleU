<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, inital-scale=1, shrink-to-fit=no">
<title>Hello, world!</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
	<script
  src="https://code.jquery.com/jquery-3.5.1.js"
  integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
  crossorigin="anonymous"></script>
<link rel="stylesheet" href="/css/MainIndex.css">

<script type="text/javascript" src="/js/MainPage.js"></script>
</head>

<body>
<form action="" name="frmMainIndex">
	<!-- main-GNB -->
	<header class="container-fluid main-gnb">
			<jsp:include page="header.jsp"/>
	</header>
	<!-- main-GNB code 끝 -->

	<!-- main-body code -->
<div class="main-container">
	<nav class="main-content-personnel">
		<div class="main-content-fixed">
		<div class="content-profile rounded rounded">
			<div class="profile-header">
			<div style="width: 150px; height: 150px; display: inline-block; border-radius: 10000px; background-image: url(${profileImg });
			background-size: 106% 106%" >
			</div>
			</div>
			<div class="profile-body">
				<strong class="text-muted">${member.memberName}</strong><br>
				<span class="small text-muted">직급: ${member.memberPosition}</span><br>
				<span class="small text-muted">부서: ${member.memberDepartment}</span><br>
			</div>
		</div>
		<div class="content-workManagement">
			<div class="WM-header">
				<strong class="text-muted ">근태 관리</strong><br>
				<p class="small lh-sm text-muted" id="clock"></p>
			</div>
			<div class="WM-timeTable">
				<div class="WM-timeTable-attendance">
					<span>출근 시간</span>				
					<input type="text" value="09:30" name="attentdance" readonly="readonly">
				</div>
				<div class="WM-timeTable-leaveWork">
					<span>퇴근 시간</span>				
					<input type="text" value="18:30" name="leaveWork" readonly="readonly">
				</div>
			</div>
			<div class="WM-btns">
				<input type="button" value="출근" class="btn btn-primary btn-sm">
				<input type="button" value="퇴근" class="btn btn-primary btn-sm"> 
			</div>
			<div class="WM-workState">
				<select class="form-control form-control-sm">
					<option value=""> 근무 상태 </option>
					<option value=""> 외근 </option>
					<option value=""> 출장 </option>
					<option value=""> 반차</option>
				</select>
			</div>
		</div>
		</div>
	</nav>
	<main class="main-content-article">
		<!-- 전자결재 -->
		<div class="main-article">
			<jsp:include page="selectApproval.jsp"/>
		</div>
		<div class="main-article">
			<jsp:include page="selectNotice.jsp"/>
		</div>
		<div class="main-article">
			<jsp:include page="selectMailBox.jsp"/>
		</div>
	
	</main>
	<aside class="main-content-calender">
	
		<div class="content-calender" >
			<div class="content-calender-title">
			<strong class="text-muted" style="text-align: left;">캘린더</strong>
			<h6 class="text-primary" style="text-align: right; font-size: .9em;"> - ${currentYear}년  ${currentMonth}월 - </h6>
			</div>
			<table class="table table-bordered main-calender" style="text-align: center">
			<thead><!-- 요일 들어갈 자리 -->
				<tr height="15px" style="font-size: 13px">
					<th scope="col" width="14.2%" >
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
			<div><!-- 달력 컨텐츠가 표시 될 곳 -->
			<form>
			
			<c:forEach items="${calender}" var="list">
			<c:set var="i" value="${i+1 }"/>
			<c:if test="${i%7==1 }">
			<tr height="40px;" style="font-size: 13px" class="calrender-sun">
			</c:if>
			
			
			<td id="calender_content" class="${list.dateIdN}"><!-- 월간 달력 한칸 -->
				<div ><!-- 날자가 표시 될 곳 -->
				
				</div>
				<div class="calender_icon">
					<input type="hidden" class="size_chk" value="${list.vo.size() }">
					<input type="text" class="all_icon" value="${list.day}" style="border-radius: 15px; height: 20px; width: 20px; padding: 0; border: none; text-align: center;">
				</div> 
				
			</td>
			<c:if test="${i%7==0 }">
			</tr>
			</c:if>
			
			
			</c:forEach>
			</form>
			</div>
		</table>
		</div>
		<div class="content-schedule">
			<h6 class="article-title">오늘 일정</h6>
			 <c:forEach items="${mainList}" var="mainList">
			<div class="schedule-article">
				<p>
					<strong class="d-block text-gray-dark">${mainList.getCalenderStartYear() }-${mainList.getCalenderStartMonth() }-${mainList.getCalenderStartDay() }</strong>
					<span>${mainList.getCalenderContent() }</span>
				</p>
			</div>
			 </c:forEach>
			
			<div class="main-go-page">
				<a href="/calenderMonth">자세히 보기</a>
			</div>
		</div>
	</aside>
</div>
</form>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
		crossorigin="anonymous"></script>
</body>
<script type="text/javascript">


function clock() {
	var clockTarget = document.getElementById("clock");
    var date = new Date();
    var month = date.getMonth();
    var clockDate = date.getDate();
    var day = date.getDay();
    var week = ['일', '월', '화', '수', '목', '금', '토'];
    var hours = date.getHours();
    var hoursTime = (hours<10)? '0'+hours:hours; 
    var minutes = date.getMinutes();
    var minutesTime = (minutes<10)? '0'+minutes:minutes; 
    var seconds = date.getSeconds();
    var secondsTime = (seconds<10)? '0'+seconds:seconds; 

    clockTarget.innerText = month+1 + '월 ' + clockDate + '일 ' + week[day] + '요일 ' + hoursTime + ':' + minutesTime + ':' + secondsTime;
    // 월은 0부터 1월이기때문에 +1일을 해주고 
    // 시간 분 초는 한자리수이면 시계가 어색해보일까봐 10보다 작으면 앞에0을 붙혀주는 작업을 3항연산으로 했습니다. 
}
function init() {
clock();
// 최초에 함수를 한번 실행시켜주고 
setInterval(clock, 1000);
// setInterval이라는 함수로 매초마다 실행을 해줍니다.
// setInterval은 첫번째 파라메터는 함수이고 두번째는 시간인데 밀리초단위로 받습니다. 1000 = 1초 
}
init();

</script>
</html>

