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
<style>
* {margin: 0; padding: 0;}
.tree{
	padding-top : 50px;
}
.tree ul {
    padding-top: 20px; position: relative;
	
	transition: all 0.5s;
	-webkit-transition: all 0.5s;
	-moz-transition: all 0.5s;
}

.tree li {
	float: left; text-align: center;
	list-style-type: none;
	position: relative;
	padding: 20px 5px 0 5px;
	
	transition: all 0.5s;
	-webkit-transition: all 0.5s;
	-moz-transition: all 0.5s;
}

/*We will use ::before and ::after to draw the connectors*/

.tree li::before, .tree li::after{
	content: '';
	position: absolute; top: 0; right: 50%;
	border-top: 1px solid #ccc;
	width: 50%; height: 20px;
}
.tree li::after{
	right: auto; left: 50%;
	border-left: 1px solid #ccc;
}

/*We need to remove left-right connectors from elements without 
any siblings*/
.tree li:only-child::after, .tree li:only-child::before {
	display: none;
}

/*Remove space from the top of single children*/
.tree li:only-child{ padding-top: 0;}

/*Remove left connector from first child and 
right connector from last child*/
.tree li:first-child::before, .tree li:last-child::after{
	border: 0 none;
}
/*Adding back the vertical connector to the last nodes*/
.tree li:last-child::before{
	border-right: 1px solid #ccc;
	border-radius: 0 5px 0 0;
	-webkit-border-radius: 0 5px 0 0;
	-moz-border-radius: 0 5px 0 0;
}
.tree li:first-child::after{
	border-radius: 5px 0 0 0;
	-webkit-border-radius: 5px 0 0 0;
	-moz-border-radius: 5px 0 0 0;
}

/*Time to add downward connectors from parents*/
.tree ul ul::before{
	content: '';
	position: absolute; top: 0; left: 50%;
	border-left: 1px solid #ccc;
	width: 0; height: 20px;
}

.tree li a{
	border: 1px solid #ccc;
	padding: 5px 10px;
	text-decoration: none;
	color: #666;
	font-family: arial, verdana, tahoma;
	font-size: 15px;
	display: inline-block;
	
	border-radius: 5px;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	
	transition: all 0.5s;
	-webkit-transition: all 0.5s;
	-moz-transition: all 0.5s;
}

/*Time for some hover effects*/
/*We will apply the hover effect the the lineage of the element also*/
.tree li a:hover, .tree li a:hover+ul li a {
	background: #c8e4f8; color: #000; border: 1px solid #94a0b4;
}
/*Connector styles on hover*/
.tree li a:hover+ul li::after, 
.tree li a:hover+ul li::before, 
.tree li a:hover+ul::before, 
.tree li a:hover+ul ul::before{
	border-color:  #94a0b4;
}

</style>
</head>
<body>
<!-- main-GNB -->
	<!-- 그룹웨어 GNB -->
	<header>
		<div class="container-fluid main-gnb">
			<nav class="navbar navbar-expand-lg navbar-light bg-light main-gnb-content">
				<a class="navbar-brand navbar-text-light " href="#"	style="margin-right: 28em">
					<span style="color:#007BFF"><i class="fab fa-weebly fa-2x"></i></span></a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav mr-auto main-gnb-menu">
						<li class="nav-item active"><a class="nav-link" href="#">홈<span
								class="sr-only">(current)</span></a></li>
						<li class="nav-item"><a class="nav-link" href="#">게시판</a></li>
						<li class="nav-item"><a class="nav-link" href="#">주소록</a></li>
						<li class="nav-item"><a class="nav-link" href="#">캘린더</a></li>
						<li class="nav-item"><a class="nav-link" href="#">메일함</a></li>
						<li class="nav-item"><a class="nav-link" href="#">전자결재</a></li>
					</ul>

					<ul class="navbar-nav my-2 my-lg-0">
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <span class="navbar-toggler-icon"></span>
						</a>
							<div class="dropdown-menu" aria-labelledby="navbarDropdown">
								<a class="dropdown-item  " href="#">정보 수정</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item  " href="#">로그아웃</a>
							</div></li>
					</ul>
				</div>
			</nav>
		</div>
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
						<li><a href="#">조직도</a></li>
						<li><a href="#">프로필</a></li>
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