<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
 <!-- Custom styles for this template -->
    <link href="form-validation.css" rel="stylesheet">
    <!-- main page CSS -->
<link rel="stylesheet" href="/css/MainIndex.css">
<!-- 전사게시판 CSS -->
<link rel="stylesheet" href="/css/notice/notice.css">

</head>
<body>
<!-- main-GNB -->
<!-- 그룹웨어 GNB -->
	<header class="container-fluid main-gnb">
		<jsp:include page="../MainPage/header.jsp"></jsp:include>
	 </header>
	 <!-- 그룹웨어 GNB code 끝 -->
	 
<section class="e-approval-container">
	
		<!-- e-approval-lnb code -->
		<nav class="e-approval-lnb">
			<div class="e-approval-lnb-content">
				<h4>인사 페이지</h4>
				<div class="e-approval-form-btn">
					<input type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#exampleModal" value="회원정보 수정">
				</div>
				<div class="e-approval-approval-list">
					<span>인사 관리</span>
					<ul>
						<li><a href="/member/organization.jsp">조직도</a></li>
						<li><a href="/member/profile.jsp">프로필</a></li>
					</ul>
				</div>
				<div class="e-approval-approval-list">
					<span>근태 관리</span>					
					<ul>
						<li><a href="#">출/퇴근 관리</a></li>
						<li><a href="#">연/월차 관리</a></li>
					</ul>
				</div>
			</div>
		</nav>
	<!-- lnb code 끝 -->
<div class="tree">
    <ul>
        <li><a href="#">대표이사 정희석</a>
            <ul>
                <li><a href="#">~~~부서</a>
                    <ul>
                        <li><a href="#">Accountant 1</a></li>
                        <li><a href="#">Accountant 2</a></li>
                    </ul>

                </li>
                <li><a href="#">~~~부서</a>
                    <ul>
                        <li><a href="#">Sales</a>
                            <ul>
                                <li><a href="#">Sales1</a></li>
                                <li><a href="#">Sales2</a></li>
                                <li><a href="#">Sales3</a></li>
                            </ul>
                        </li>
                        <li><a href="#">Production1</a></li>
                        <li><a href="#">Production2</a></li>
                    </ul>
                  </li>
            </ul>

        </li>
    </ul>
    </div>
     <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
      integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
      crossorigin="anonymous"></script>
   <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
      crossorigin="anonymous"></script>
      <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
</body>
</html>