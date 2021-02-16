<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전자결재 홈</title>
</head>
<body>
			<!-- 최근 발신한 문서함 code -->
			<div class="e-approval-table">
				<strong class="text-gray-dark">최근 발신한 문서</strong>
				<table class="table table-hover table-sm">
					<thead class="e-approval-list text-muted text-gray-dark">
						<tr>
							<th scope="col"  width="180px;">기안일</th>
							<th scope="col"  width="150px;">결재양식</th>
							<th scope="col">제목</th>
							<th scope="col">기안자</th>
							<th scope="col" width="150px;">결재 상태</th>
						</tr>
					</thead>
					<tbody class="e-approval-list text-muted">
						<c:set var="no" value="1" />
						<c:forEach var="outgoingVo" items="${outgoingList }">
							<tr onclick="goView(${outgoingVo.formNo})">
								<td>${outgoingVo.formDate}</td>
								<td>${outgoingVo.formType}</td>					
								<td style=" text-align: left; text-indent: 3em;">${outgoingVo.formTitle}</td>					
								<td>${outgoingVo.drafterName }</td>					
								<c:choose>
									<c:when test="${outgoingVo.approvalState eq '(발신)상신'}">
										<td><span class="badge badge-success">진행중</span></td>	
									</c:when>
									<c:when test="${outgoingVo.approvalState eq '(발신)임시저장'}">
										<span class="badge badge-light">임시저장</span>
									</c:when>
									<c:when test="${outgoingVo.approvalState eq '(발신)승인'}">
										<span class="badge badge-primary">승인</span>	
									</c:when>
									<c:when test="${outgoingVo.approvalState eq '(발신)반려'}">
										<span class="badge badge-warning">반려</span>
									</c:when>
								</c:choose>
							</tr>
							<c:set var= "no" value="${no+1 }"></c:set>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<!-- ========== -->
			
			<!-- 리스트 페이징 아이콘 code -->
			<div class="e-approval-list-pagination">
				<nav aria-label="Page navigation example">
					<ul class="pagination pagination-sm text-muted justify-content-center">  
						<li class="page-item"><a class="page-link" href="#" style="font-size: 0.7em" onclick="goPage(1)" >first</a></li>
						<li class="page-item"><a class="page-link" href="#" style="font-size: 0.7em" onclick="goPage(${outgoingPage.startPage-1})">&lt;</a></li>
						<c:forEach var="i" begin="${outgoingPage.startPage}" end="${outgoingPage.endPage }">
							<li class="page-item"><a class="page-link" href="#" style="font-size: 0.7em" onclick="goPage(${i})">${i}</a></li>
						</c:forEach>
						<li class="page-item"><a class="page-link" href="#" style="font-size: 0.7em" onclick="goPage(${outgoingPage.endPage+1})">&gt;</a></li>
						<li class="page-item"><a class="page-link" href="#" style="font-size: 0.7em" onclick="goPage(${outgoingPage.totPage})">last</a></li>
					</ul>
				</nav>
			</div>
			<!-- ========== -->
			
			<!-- 최근 수신한 문서함 code -->
			<div class="e-approval-table">
				<strong class="text-gray-dark">최근 수신한 문서</strong>
				<table class="table table-hover table-sm">
					<thead class="e-approval-list text-muted text-gray-dark">
						<tr onclick="goView(${no})">
							<th scope="col">기안일</th>
							<th scope="col">결재양식</th>
							<th scope="col">제목</th>
							<th scope="col">기안자</th>
							<th scope="col">결재 상태</th>
						</tr>
					</thead>
					<tbody class="e-approval-list text-muted">
						<c:set var="no" value="0"></c:set>
						<c:forEach begin="1" end="5">
							<tr>
								<td>2021-02-03</td>
								<td>업무 기안</td>					
								<td style=" text-align: left; text-indent: 2em;">그룹웨어 프론트엔드 화면 설계안 요청합니다.</td>					
								<td>정해준</td>					
								<td>진행중</td>					
							</tr>
							<c:set var="no" value="${no+1 }"></c:set>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<!-- ========== -->
			
			<!-- 수신 문서함 페이징 아이콘 code -->
			<div class="e-approval-list-pagination" >
				<nav aria-label="Page navigation example">
					<ul class="pagination pagination-sm text-muted justify-content-center">  
						<li class="page-item"><a class="page-link" href="#" style="font-size: 0.7em">first</a></li>
						<li class="page-item"><a class="page-link" href="#" style="font-size: 0.7em">&lt;</a></li>
						<li class="page-item"><a class="page-link" href="#" style="font-size: 0.7em">1</a></li>
						<li class="page-item"><a class="page-link" href="#" style="font-size: 0.7em">2</a></li>
						<li class="page-item"><a class="page-link" href="#" style="font-size: 0.7em">3</a></li>
						<li class="page-item"><a class="page-link" href="#" style="font-size: 0.7em">&gt;</a></li>
						<li class="page-item"><a class="page-link" href="#" style="font-size: 0.7em">last</a></li>
					</ul>
				</nav>
			</div>
			<!-- ========= -->
			
			

<!-- bootstrap script, Jquery CDN -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
		crossorigin="anonymous"></script>
<!-- ****************************** -->

<script type="text/javascript">
</script>

</body>
</html>