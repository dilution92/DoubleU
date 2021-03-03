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
    </div>
    <div id="calender_aside_checkbox"> <!-- 스케줄 체크박스 -->
        <form action="">
        	<div style="display: block; margin-top: 20px;">
	            <label for="all_con">전체일정</label>
	            <input type="checkbox" name="" id="all_con" checked="checked">
        	</div>
        	<div style="display: block;">
	            <label for="group_con">그룹일정</label>
	            <input type="checkbox" name="" id="group_con" checked="checked">
        	</div>
        	<div style="display: block;">
	            <label for="my_con">내 일정</label>
	            <input type="checkbox" name="" id="my_con" checked="checked">
        	</div>
        </form>
    </div>
</div>
</body>
</html>