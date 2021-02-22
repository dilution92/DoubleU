<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	 
	 
<aside id="calender_aside">
	<!-- 일정 사이드바  -->
	<jsp:include page="Calender_aside.jsp"></jsp:include>
</aside>

<main id="calender_main">
    <div id="calender_main_content">
    	<h2>일정 입력</h2>
    	<form action="/CalenderInsertR" method="post" id="InsertForm">
    		<input type="hidden" value="writer" name="calenderWriter">
			<table class="table table-bordered" >
    			<tr>
    				<td width="20%">제목</td>
    				<td width="80%"> <input type="text" name="calenderSubject"> </td>
    			</tr>
    			<tr>
    				<td>기간</td>
    				<td> 
    				<input type="date" name="calenderDateStart">
    				<input type="time" name="calenderTimeStart">
    				<input type="date" name="calenderDateEnd"> 
    				<input type="time" name="calenderTimeEnd">
    				</td>
    			</tr>
    			<tr>
    				<td>그룹분류</td>
    				<td> 
    					<select name="calenderGroup">
    						<option value="">그룹선택</option>
						    <option value="그룹일정">그룹일정</option>
						    <option value="내일정">내 일정</option>
    					</select>
    				</td>
    			</tr>
    			<tr>
    				<td>참석자</td>
    				<td> <input type="text" name="calenderParticiptant"> </td>
    			</tr>
    			<tr>
    				<td>장소</td>
    				<td> <input type="text" name="calenderPlace"> </td>
    			</tr>
    			<tr>
    				<td>내용</td>
    				<td> <textarea rows="10" cols="80" name="calenderContent"></textarea> </td>
    			</tr>
			</table>
				<div>
					<input type="button" class="btn btn-primary" value="일정작성" id="InsertFormSubmit">
					<input type="button" class="btn btn-primary" value="돌아가기">
				</div>
    	</form>
    </div>
    
    <!-- 모달창 -->
	<div class="modal fade" id="Calender_insert_modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
 		<jsp:include page="Calender_write_pop_modal.jsp"></jsp:include>
	</div>	
	
</main>
<script type="text/javascript">
$(function(){
	$("#InsertFormSubmit").click(function(){
        $('#Calender_insert_modal').modal();
    });
    
    $("#modal_insert").click(function(){
        $('#InsertForm').submit();
    })
})
</script>

</body>
</html>