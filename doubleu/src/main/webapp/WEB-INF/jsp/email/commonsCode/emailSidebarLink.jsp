<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사이드바 메일함 링크</title>
</head>
<body>
<ul>
	<li>
	<a href="/emailIndex">받은 메일함</a>
	<span class="badge badge-pill badge-ligh">1566</span>
	</li>
	<li><a href="/emailImportant">중요 메일함</a></li>
	<li><a href="/emailTemp">임시 보관함</a></li>
	<li><a href="/emailSendEmail">보낸 메일함</a></li>
	<li><a href="/emailSpam">스팸 메일함</a> <button type="button" style="font-size:10px;"class="btn btn-primary btn-sm">비우기</button></li>
	<li><a href="/emailThash">휴지통</a> <button type="button" style="font-size:10px;" class="btn btn-primary btn-sm">비우기</button></li>
</ul>
</body>
</html>