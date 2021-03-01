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
			
			 	<!-- 공지사항 -->
			 	<div class="tab-pane fade show active" id="notice" role="tabpanel" aria-labelledby="#notice-tab">
				 	<div>
					<table class="table table-hover table-sm main-approval-table">
						<thead class="text-muted text-gray-dark">
							<tr>
								<th scope="col"  width="100px;">분류</th>
								<th scope="col" width="220px;">제목</th>
								<th scope="col" width="100px;">작성자</th>
								<th scope="col" width="100px;">날짜</th>
								<th scope="col" width="90px;">조회수</th>
							</tr>
						</thead>
						
						<tbody class="text-muted">
						<c:set var="size" value="5" />
	                		<c:forEach var='obj' items="${contentList1 }" end="${size }">
								<tr onclick="location.href='/noticeView?no=${obj.noticeNo }'">
									<td>${obj.noticeType}</td>
									<td>${obj.noticeSubject}</td>					
									<td>${obj.noticeMid}</td>
									<td>${obj.noticeReportingDate}</td>						
									<td>${obj.noticeHit}</td>						
								</tr>
							</c:forEach>
						</tbody>
						</table>
				 	</div>
					<div class="main-go-page">
						<a href="/noticeIndex?no=${obj.noticeNo }">자세히 보기</a>
					</div>
			  	</div>
			  	
			  	<!-- 경조사 -->
			 	 <div class="tab-pane fade" id="event" role="tabpanel" aria-labelledby="event-tab">
				 	<div>
					<table class="table table-hover table-sm main-approval-table">
						<thead class="text-muted text-gray-dark">
							<tr>
								<th scope="col"  width="100px;">분류</th>
								<th scope="col" width="220px;">제목</th>
								<th scope="col" width="100px;">작성자</th>
								<th scope="col" width="100px;">날짜</th>
								<th scope="col" width="90px;">조회수</th>
							</tr>
						</thead>
						
						<tbody class="text-muted">
						<c:set var="size" value="5" />
	                		<c:forEach var='obj' items="${contentList }" end="${size }">
								<tr onclick="location.href='/familyeventView?no=${obj.familyeventNo }'">
									<td>${obj.familyeventType}</td>
									<td>${obj.familyeventSubject}</td>					
									<td>${obj.familyeventMid}</td>
									<td>${obj.familyeventReportingDate}</td>						
									<td>${obj.familyeventHit}</td>						
								</tr>
							</c:forEach>
						</tbody>
						</table>
				 	</div>
					<div class="main-go-page">
						<a href="/familyeventIndex?no=${obj.familyeventNo }">자세히 보기</a>
					</div>
			 	 </div>
			 	 
			 	 <!-- 더블마켓 -->
			 	 <div class="tab-pane fade" id="market" role="tabpanel" aria-labelledby="market-tab">
					<div>
					<table class="table table-hover table-sm main-approval-table">
						<thead class="text-muted text-gray-dark">
							<tr>
								<th scope="col"  width="120px;">카테고리</th>
								<th scope="col" width="150px;">상품명</th>
								<th scope="col" width="150px;">가격</th>
								<th scope="col" width="100px;">작성자</th>
								<th scope="col" width="90px;">조회수</th>
							</tr>
						</thead>
						
						<tbody class="text-muted">
						<c:set var="size" value="5" />
							<c:forEach var="list" items="${marketList }" end="${size }" >
								<tr onclick="location.href='marketView?marketNo=${list.marketNo}&dibUser=${member.memberName }'">
									<td>${list.marketCategory}</td>
									<td>${list.marketSubject}</td>					
									<td >${list.marketPrice}</td>
									<td>${list.marketWriter}</td>						
									<td>${list.marketHit}</td>						
								</tr>
							</c:forEach>
						</tbody>
					</table>
					</div>					
					<div class="main-go-page">
						<a href="/marketIndex?dibUser=${member.memberName }">자세히 보기</a>
					</div>
			 	 </div>
			</div>

</body>
</html>