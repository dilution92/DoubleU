<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<div class="bg-light main-gnb-content">
		<div class="header-logo">
			<a class="" href="/mainPage">
				<img alt="" src="../images/notice/로고7.png" width="150px" style="margin-left: 8px">
			</a>
		</div>
		<div class="header-content">
			<div class="main-gnb-menu">
				<ul class="nav ">
					<li class="nav-item active">
						<a class="nav-link" href="/mainPage">홈<span class="sr-only">(current)</span></a>
					</li>
					<li class="nav-item"><a class="nav-link" href="/noticeIndex">게시판</a></li>
					<li class="nav-item"><a class="nav-link" href="/profileIndex">주소록</a></li>
					<li class="nav-item"><a class="nav-link" href="/calenderMonth">캘린더</a></li>
					<li class="nav-item"><a class="nav-link" href="/emailIndex">메일함</a></li>
					<li class="nav-item"><a class="nav-link" href="/approvalIndex?memberNo=${member.memberName }">전자결재</a></li>
					<li class="nav-item"><a class="nav-link" href="/marketIndex">더블마켓</a></li>
				</ul>
			</div>
			<div class="main-gnb-toggle">
				<div class="header-member-name">
					<a>${member.memberName }&nbsp님</a>
				 </div>
				 <div class="header-member-toggle-menu">
						<div class="nav-item dropdown dropdown-content">
							<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" 
							aria-haspopup="true" aria-expanded="false">
							<span><i class="bi bi-justify" style="font-size: 25px;"></i></span>
							</a>
							<div class="dropdown-menu dropdown-content" aria-labelledby="navbarDropdown" style="left:-100px;">
								<a class="dropdown-item  " href="/memberModifyIndex">정보 수정</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item  " href="/loginOut">로그아웃</a>
							</div>
						</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>