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
							<tr onclick="goView(${outgoingVo.formNo}, '${outgoingVo.formType }')">
								<td>${outgoingVo.formDate}</td>
								<td>${outgoingVo.formType}</td>					
								<td style=" text-align: left; text-indent: 3em;">${outgoingVo.formTitle}</td>					
								<td>${outgoingVo.drafterName }</td>					
								<c:choose>
									<c:when test="${outgoingVo.approvalState eq '(발신)상신'}">
										<td><span class="badge badge-success">진행중</span></td>	
									</c:when>
									<c:when test="${outgoingVo.approvalState eq '(발신)임시저장'}">
										<td><span class="badge badge-light">임시저장</span></td>	
									</c:when>
									<c:when test="${outgoingVo.approvalState eq '(발신)승인'}">
										<td><span class="badge badge-primary">승인</span>	</td>
									</c:when>
									<c:when test="${outgoingVo.approvalState eq '(발신)반려'}">
										<td><span class="badge badge-warning">반려</span></td>	
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
						<li class="page-item"><a class="page-link" href="#" style="font-size: 0.7em" onclick="goOutgoingPage(1)" >first</a></li>
						<c:choose>
							<c:when test="${outgoingPage.startPage > 1}">
								<li class="page-item"><a class="page-link" href="#" style="font-size: 0.7em" onclick="goOutgoingPage(${outgoingPage.startPage-1})">&lt;</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link" href="#" style="font-size: 0.7em" onclick="goOutgoingPage(${outgoingPage.startPage})">&lt;</a></li>
							</c:otherwise>
						</c:choose>
						<c:forEach var="i" begin="${outgoingPage.startPage}" end="${outgoingPage.endPage }">
							<li class="page-item"><a class="page-link" href="#" style="font-size: 0.7em" onclick="goOutgoingPage(${i})">${i}</a></li>
						</c:forEach>
						<c:choose>
							<c:when test="${outgoingPage.endPage >  outgoingPage.totPage}">
								<li class="page-item"><a class="page-link" href="#" style="font-size: 0.7em" onclick="goOutgoingPage(${outgoingPage.endPage+1})">&gt;</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link" href="#" style="font-size: 0.7em" onclick="goOutgoingPage(${outgoingPage.totPage})">&gt;</a></li>
							</c:otherwise>
						</c:choose>
						<li class="page-item"><a class="page-link" href="#" style="font-size: 0.7em" onclick="goOutgoingPage(${outgoingPage.totPage})">last</a></li>
					</ul>
				</nav>
			</div>
			<!-- ========== -->
			
			<!-- 최근 수신한 문서함 code -->
				<table class="table table-hover table-sm">
					<thead class="e-approval-list text-muted text-gray-dark">
						<tr>
							<th scope="col"  width="180px;">기안일</th>
							<th scope="col"  width="150px;">결재양식</th>
							<th scope="col">제목</th>
							<th scope="col">기안자</th>
							<th scope="col" width="150px;">결재 여부</th>
						</tr>
					</thead>
					<tbody class="e-approval-list text-muted">
						<c:set var="no" value="1" />
						<c:forEach var="receiverVo" items="${receiverList }">
							<tr onclick="goView(${receiverVo.formNo}, '${receiverVo.formType }')">
								<td>${receiverVo.formDate}</td>
								<td>${receiverVo.formType}</td>					
								<td style=" text-align: left; text-indent: 3em;">${receiverVo.formTitle}</td>					
								<td>${receiverVo.drafterName }</td>					
								<c:choose>
									<c:when test="${receiverVo.approvalState eq '(발신)상신'}">
										<td><span class="badge badge-success">결재대기</span></td>	
									</c:when>
									<c:when test="${receiverVo.approvalState eq '(발신)승인'}">
										<td><span class="badge badge-primary">승인</span>	</td>
									</c:when>
									<c:when test="${receiverVo.approvalState eq '(발신)반려'}">
										<td><span class="badge badge-warning">반려</span></td>	
									</c:when>
								</c:choose>
							</tr>
							<c:set var= "no" value="${no+1 }"></c:set>
						</c:forEach>
					</tbody>
				</table>
			<!-- ========== -->
			
			<!-- 수신 문서함 페이징 아이콘 code -->
			<div class="e-approval-list-pagination">
				<nav aria-label="Page navigation example">
					<ul class="pagination pagination-sm text-muted justify-content-center">  
						<li class="page-item"><a class="page-link" href="#" style="font-size: 0.7em" onclick="receiverPage(1)" >first</a></li>
						<c:choose>
							<c:when test="${receiverPage.startPage > 1}">
								<li class="page-item"><a class="page-link" href="#" style="font-size: 0.7em" onclick="receiverPage(${receiverPage.startPage-1})">&lt;</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link" href="#" style="font-size: 0.7em" onclick="receiverPage(${receiverPage.startPage})">&lt;</a></li>
							</c:otherwise>
						</c:choose>
						<c:forEach var="i" begin="${receiverPage.startPage}" end="${receiverPage.endPage }">
							<li class="page-item"><a class="page-link" href="#" style="font-size: 0.7em" onclick="receiverPage(${i})">${i}</a></li>
						</c:forEach>
						<c:choose>
							<c:when test="${receiverPage.endPage >  receiverPage.totPage}">
								<li class="page-item"><a class="page-link" href="#" style="font-size: 0.7em" onclick="receiverPage(${receiverPage.endPage+1})">&gt;</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link" href="#" style="font-size: 0.7em" onclick="receiverPage(${receiverPage.totPage})">&gt;</a></li>
							</c:otherwise>
						</c:choose>
						<li class="page-item"><a class="page-link" href="#" style="font-size: 0.7em" onclick="receiverPage(${receiverPage.totPage})">last</a></li>
					</ul>
				</nav>
			</div>
				<input type="hidden" name="nowOutgoingPage" value="${(empty param.nowOutgoingPage)? 1:param.nowOutgoingPage }">
				<input type="hidden" name="nowReceiverPage" value="${(empty param.nowReceiverPage)? 1:param.nowReceiverPage }"> 
				<input type="hidden" name="nowPlace" value="indexPlace">
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