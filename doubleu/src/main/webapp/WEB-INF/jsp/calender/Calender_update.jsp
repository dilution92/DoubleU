<%@page import="com.doubleu.calender.vo.CalenderParticiptant"%>
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


<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
	
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
    <div id="calender_main_content">
    	<h2>일정 입력</h2>
    	<form action="/CalenderUpdateR" method="post" id="frm_updateR">
    		<input type="hidden" value="writer" name="calenderWriter">
			<table class="table table-bordered" >
    			<tr>
    				<td width="20%">제목</td>
    				<td width="80%"> <input type="text" name="calenderSubject" value="${selectVo.getCalenderSubject() }"> 
    								<input type="hidden" name="calenderNo" value="${selectVo.getCalenderNo() }">
    				</td>
    			</tr>
    			<tr>
    				<td>기간</td>
    				<td> 
    				<input type="date" name="calenderDateStart" >
    				<input type="time" name="calenderTimeStart">
    				<input type="date" name="calenderDateEnd"> 
    				<input type="time" name="calenderTimeEnd">
    				
    				
    				<input type="hidden" name="calenderStartYear" value="${selectVo.getCalenderStartYear() }">
    				<input type="hidden" name="calenderStartMonth" value="${selectVo.getCalenderStartMonth() }">
    				<input type="hidden" name="calenderStartDay" value="${selectVo.getCalenderStartDay() }">
    				<input type="hidden" name="calenderStartTime" value="${selectVo.getCalenderStartTime() }">
    				<input type="hidden" name="calenderStartMinute" value="${selectVo.getCalenderStartMinute() }">
    				<input type="hidden" name="calenderEndYear" value="${selectVo.getCalenderEndYear() }">
    				<input type="hidden" name="calenderEndMonth" value="${selectVo.getCalenderEndMonth() }">
    				<input type="hidden" name="calenderEndDay" value="${selectVo.getCalenderEndDay() }">
    				<input type="hidden" name="calenderEndTime" value="${selectVo.getCalenderEndTime() }">
    				<input type="hidden" name="calenderEndMinute" value="${selectVo.getCalenderEndMinute() }">
    				
    				<input type="hidden" name="calenderType" value="${selectVo.getCalenderType() }">
    				<input type="hidden" class="calenderTypecome" value="${selectVo.getCalenderGroup() }">
    				
    				</td>
    			</tr>
    			<tr>
    				<td>그룹분류</td>
    				<td> 
    					<select name="calenderGroup" id="calenderGroup">
    						<option value="">그룹선택</option>
						    <option value="그룹일정">그룹일정</option>
						    <option value="내일정">내 일정</option>
    					</select>
    				</td>
    			</tr>
    			<%-- <tr>
    				<!-- <td>참석자
							<input type="button" class="btn btn-outline-primary btn-sm"
								data-toggle="modal" data-target="#Calender_parti_modal" role="button"
								value="주소록">
    				</td> -->
    				<td> 
    					<c:forEach items="${parti }" var="parti">
    						<div>
    							<input type="text" name="calPartiList1" value="${parti.calenderPartiMember }">
    							<input type="text" name="calPartiNo" value="${parti.calenderPartiNo }">
    						</div>
    					</c:forEach>
    				</td>
    			</tr> --%>
    			<tr>
    				<td>장소</td>
    				<td> <input type="text" name="calenderPlace" value="${selectVo.getCalenderPlace() }"> </td>
    			</tr>
    			<tr>
    				<td>내용</td>
    				<td> <textarea rows="10" cols="80" name="calenderContent" >${selectVo.getCalenderContent() }</textarea> </td>
    			</tr>
			</table>
				<div>
					<input type="button" class="btn btn-primary" value="일정수정" id="btnUpdateSubmit">
					<input type="button" class="btn btn-primary" value="돌아가기">
				</div>
    	</form>
    </div>
    
    <!--  저장 모달창 -->
	<div class="modal fade" id="Calender_insert_modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
 		<jsp:include page="Calender_write_pop_modal.jsp"></jsp:include>
	</div>	
	
	<!-- 참석자 모달창 -->
	<div class="modal fade" id="Calender_parti_modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
 		<jsp:include page="Calender_parti_modal.jsp"></jsp:include>
	</div>
	
</main>
<script type="text/javascript">
$(function(){
		/* 기간 합치기 */
		var typecome = $('.calenderTypecome').val();
		$('#calenderGroup').val(typecome);

		var cds1 = document.getElementsByName("calenderStartYear")[0].value;
		var cds2 = document.getElementsByName("calenderStartMonth")[0].value;
		var cds3 = document.getElementsByName("calenderStartDay")[0].value;

		var cts1 = document.getElementsByName("calenderStartTime")[0].value;
		var cts2 = document.getElementsByName("calenderStartMinute")[0].value;

		var cde1 = document.getElementsByName("calenderEndYear")[0].value;
		var cde2 = document.getElementsByName("calenderEndMonth")[0].value;
		var cde3 = document.getElementsByName("calenderEndDay")[0].value;

		var cte1 = document.getElementsByName("calenderEndTime")[0].value;
		var cte2 = document.getElementsByName("calenderEndMinute")[0].value;
		
		var cdsList = cds1+"-"+cds2+"-"+cds3;
		var cdeList = cde1+"-"+cde2+"-"+cde3;
		var ctsList = cts1+":"+cts2;
		var cteList = cte1+":"+cte2;
		
		document.getElementsByName("calenderDateStart")[0].value = cdsList;
		document.getElementsByName("calenderTimeStart")[0].value = ctsList;
		document.getElementsByName("calenderDateEnd")[0].value = cdeList;
		document.getElementsByName("calenderTimeEnd")[0].value = cteList;

});

// submit 버튼
$("#btnUpdateSubmit").click(function(){
	/* 기간 쪼개기 */
	var cds = document.getElementsByName("calenderDateStart")[0].value;
	var cts = document.getElementsByName("calenderTimeStart")[0].value;
	var cde = document.getElementsByName("calenderDateEnd")[0].value;
	var cte = document.getElementsByName("calenderTimeEnd")[0].value;

	var cdsList = cds.split('-');
	var cds1 =  cdsList[0];
	var cds2 =  cdsList[1];
	var cds3 =  cdsList[2];

	var ctsList = cts.split(':');
	var cts1 = ctsList[0];
	var cts2 = ctsList[1];

	var cdeList = cde.split('-');
	var cde1 =  cdeList[0];
	var cde2 =  cdeList[1];
	var cde3 =  cdeList[2];

	var cteList = cte.split(':');
	var cte1 = cteList[0];
	var cte2 = cteList[1];

	document.getElementsByName("calenderStartYear")[0].value = cds1;
	document.getElementsByName("calenderStartMonth")[0].value = cds2;
	document.getElementsByName("calenderStartDay")[0].value = cds3;

	document.getElementsByName("calenderStartTime")[0].value = cts1;
	document.getElementsByName("calenderStartMinute")[0].value = cts2;

	document.getElementsByName("calenderEndYear")[0].value = cde1;
	document.getElementsByName("calenderEndMonth")[0].value = cde2;
	document.getElementsByName("calenderEndDay")[0].value = cde3;

	document.getElementsByName("calenderEndTime")[0].value = cte1;
	document.getElementsByName("calenderEndMinute")[0].value = cte2;
	
	
	var c1 = cde1+cde2+cde3;
	var c2 = cds1+cds2+cds3;
	console.log(c1+"c1");
	console.log(c2+"c2");
	
	if(cds!=null){
		
		var chkperiod = parseInt(c1)-parseInt(c2);
		
		var c3 = parseInt(chkperiod);
		
		var v1 = "장기";
		var v2 = "단기";
		if(c3>0){
			document.getElementsByName("calenderType")[0].value = v1;
		}else{
			document.getElementsByName("calenderType")[0].value = v2;
		}
		
	}
	
    $('#frm_updateR').submit();
})

</script>

</body>
</html>