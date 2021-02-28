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
			<h6 class="article-title">메일함</h6>
			<ul class="nav nav-tabs ariticle-aTag-ms" id="myTab" role="tablist">
			 	<li class="nav-item" role="presentation">
			   		<a class="nav-link active" id="#receiverMail-tab" data-toggle="tab" href="#receiverMail" role="tab" aria-controls="#receiverMail" aria-selected="true">수신</a>
			  	</li>
			</ul>
			<div class="tab-content" id="myTabContent">
			 	<div class="tab-pane fade show active" id="receiverMail" role="tabpanel" aria-labelledby="#receiverMail-tab">
				 	<div>
				 	메일함 내용
				 	</div>
					<div class="main-go-page">
						<a href="#">자세히 보기</a>
					</div>
			  	</div>
			</div>
</body>
</html>