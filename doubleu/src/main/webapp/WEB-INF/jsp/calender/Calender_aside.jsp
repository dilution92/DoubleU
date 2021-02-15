<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
</head>
<body>
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
</body>
</html>