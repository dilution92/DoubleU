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
				 	<table class="table table-hover table-sm main-approval-table" style="table-layout:fixed">
						<thead class="text-muted text-gray-dark">
							<tr>
								<th scope="col"  width="30px;">중요</th>
								<th scope="col" width="60px;">이름</th>
								<th scope="col" width="150px;">메일주소</th>
								<th scope="col" width="100px;">제목</th>
								<th scope="col" width="90px;">날짜</th>
							</tr>
						</thead>
						
						<tbody class="text-muted">
						<c:set var="size" value="4" />
							<c:forEach var="list" items="${EmailList}" end="${size }" >
								<tr>
									<td style="color:red;">${list.emailChk}</td>
									<td>${list.emailName}</td>					
									<td>${list.emailAddress}</td>
									<td class="table-title-fixed-length">${list.emailTitle}</td>						
									<td>${list.emailDate}</td>						
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="main-go-page">
						<a href="/emailIndex">자세히 보기</a>
					</div>
			  	</div>
			</div>
</body>
</html>