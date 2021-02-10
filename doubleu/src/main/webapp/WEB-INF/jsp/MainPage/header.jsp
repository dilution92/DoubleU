<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light main-gnb-content">
		<a class="navbar-brand navbar-text-light " href="/MainPage/index.jsp" style="margin-right: 41em">
			<img alt="" src="../images/notice/로고7.png" width="150px" style="margin-left: 8px">
		</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto main-gnb-menu">
				<li class="nav-item active">
					<a class="nav-link" href="/MainPage/index.jsp">홈<span class="sr-only">(current)</span></a>
				</li>
				<li class="nav-item"><a class="nav-link" href="/notice/notice_index.jsp">게시판</a></li>
				<li class="nav-item"><a class="nav-link" href="#">주소록</a></li>
				<li class="nav-item"><a class="nav-link" href="/calender/Calender_month.jsp">캘린더</a></li>
				<li class="nav-item"><a class="nav-link" href="/email/email_index.jsp">메일함</a></li>
				<li class="nav-item"><a class="nav-link" href="/approvalGoHome">전자결재</a></li>
				<li class="nav-item"><a class="nav-link" href="/market/market_index.jsp">중고시장</a></li>
			</ul>
	
			<ul class="navbar-nav my-2 my-lg-0">
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" 
					aria-haspopup="true" aria-expanded="false">
						<span class="navbar-toggler-icon"></span>
					</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item  " href="#">정보 수정</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item  " href="#">로그아웃</a>
					</div>
				</li>
			</ul>
		</div>
	</nav>
</body>
</html>