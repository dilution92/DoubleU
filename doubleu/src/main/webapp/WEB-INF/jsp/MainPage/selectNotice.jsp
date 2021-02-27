<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
			<h6 class="article-title">사내 게시판</h6>
			<ul class="nav nav-tabs ariticle-aTag-ms" id="myTab" role="tablist">
			 	<li class="nav-item" role="presentation">
			   		<a class="nav-link active" id="#notice-tab" data-toggle="tab" href="#notice" role="tab" aria-controls="#notice" aria-selected="true">공지사항</a>
			  	</li>
			  	<li class="nav-item" role="presentation">
			    	<a class="nav-link" id="profile-tab" data-toggle="tab" href="#event" role="tab" aria-controls="event" aria-selected="false">경조사</a>
			  	</li>
			  	<li class="nav-item" role="presentation">
			    	<a class="nav-link" id="market-tab" data-toggle="tab" href="#market" role="tab" aria-controls="receiver" aria-selected="false">더블마켓</a>
			  	</li>
			</ul>
			<div class="tab-content" id="myTabContent">
			 	<div class="tab-pane fade show active" id="notice" role="tabpanel" aria-labelledby="#notice-tab">
				 	<div>
				 	공지사항 내용
				 	</div>
					<div class="main-go-page">
						<a href="#">자세히 보기</a>
					</div>
			  	</div>
			  	
			 	 <div class="tab-pane fade" id="event" role="tabpanel" aria-labelledby="event-tab">
					<div>
						경조사 내용
					</div>					
					<div class="main-go-page">
						<a href="#">자세히 보기</a>
					</div>
			 	 </div>
			 	 <div class="tab-pane fade" id="market" role="tabpanel" aria-labelledby="market-tab">
					<div>
						더블마켓 내용
					</div>					
					<div class="main-go-page">
						<a href="#">자세히 보기</a>
					</div>
			 	 </div>
			</div>
</body>
</html>