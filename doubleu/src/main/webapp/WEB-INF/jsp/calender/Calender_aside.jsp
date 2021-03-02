<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<div class="calender_lnb">
	<h2>Calender Home</h2>
 	<div> <!-- 일정등록 버튼 -->
        <input type="button" class="btn btn-primary" value="일정등록" name="calender_aside_btn" onclick="location.href='/calenderWrite'">
        <input type="button" class="btn btn-primary" value="일정수정" name="calender_aside_btn" onclick="location.href='Calender_modify.jsp'">
    </div>
    <div id="calender_aside_checkbox"> <!-- 스케줄 체크박스 -->
        <form action="">
        	<div style="display: block; margin-top: 20px;">
	            <label for="">전체일정</label>
	            <input type="checkbox" name="" id="" >
        	</div>
        	<div style="display: block;">
	            <label for="">그룹일정</label>
	            <input type="checkbox" name="" id="" >
        	</div>
        	<div style="display: block;">
	            <label for="">내 일정</label>
	            <input type="checkbox" name="" id="" >
        	</div>
        </form>
    </div>
</div>
</body>
</html>