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
			<%
				String selectName = "검색 결과";
				if(request.getParameter("selectName") != null) {
					selectName = request.getParameter("selectName");
				}
			%>
				<strong class="text-gray-dark">${ listName }</strong>
				<table class="table table-hover table-sm e-approval-list">
					<thead class="text-muted text-gray-dark">
						<tr>
							<th scope="col" width="120px;">기안일 </th>
							<th scope="col"  width="150px;">결재양식</th>
							<th scope="col" width="350px;" ">제목</th>
							<th scope="col"  width="100px;">기안자</th>
							<th scope="col"  width="120px;">결재 상태</th>
							<c:if test="${findState == '1' or findState == '0' or findState == '-1'}">
								<th scope="col"  width="120px;">결재 여부</th>
							</c:if>
						</tr>
					</thead>
					<tbody class="text-muted">
						<c:forEach var="vo" items="${list}">
							<tr onclick="goView(${vo.formNo})">
								<td>${vo.formDate}</td>
								<td>${vo.formType }</td>					
								<td class="table-title-fixed-length" style="text-align: left;">${vo.formTitle}</td>					
								<td>${vo.drafterName}</td>					
								<c:choose>
									<c:when test="${vo.approvalState eq '(발신)상신'}">
										<td><span class="badge badge-success">진행중</span></td>	
									</c:when>
									<c:when test="${vo.approvalState eq '(발신)임시저장'}">
										<td><span class="badge badge-light">임시저장</span></td>	
									</c:when>
									<c:when test="${vo.approvalState eq '(발신)승인'}">
										<td><span class="badge badge-primary">승인</span>	</td>
									</c:when>
									<c:when test="${vo.approvalState eq '(발신)반려'}">
										<td><span class="badge badge-warning">반려</span></td>
									</c:when>
								</c:choose>
								<c:choose>
									<c:when test="${vo.decisionState== '0'}">
										<td><span class="badge badge-success">결재대기</span></td>	
									</c:when>
									<c:when test="${vo.decisionState== '1'}"
									>
										<td><span class="badge badge-primary">결재승인</span>	</td>
									</c:when>
									<c:when test="${vo.decisionState== '-1'}">
										<td><span class="badge badge-warning">결재반려</span></td>	
									</c:when>
								</c:choose>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<!-- ========== -->
			<!-- 리스트 페이징 아이콘 code -->
			<div class="e-approval-list-pagination">
				<nav aria-label="Page navigation example">
					<ul class="pagination pagination-sm text-muted justify-content-center">  
						<li class="page-item"><a class="page-link" href="#" style="font-size: 0.7em" onclick="goChooseSelectPage(1)" >first</a></li>
						<c:choose>
							<c:when test="${page.startPage > 1}">
								<li class="page-item"><a class="page-link" href="#" style="font-size: 0.7em" onclick="goChooseSelectPage(${page.startPage-1})">&lt;</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link" href="#" style="font-size: 0.7em" onclick="goChooseSelectPage(${page.startPage})">&lt;</a></li>
							</c:otherwise>
						</c:choose>
						<c:forEach var="i" begin="${page.startPage}" end="${page.endPage }">
							<li class="page-item"><a class="page-link" href="#" style="font-size: 0.7em" onclick="goChooseSelectPage(${i})">${i}</a></li>
						</c:forEach>
						<c:choose>
							<c:when test="${page.endPage >  page.totPage}">
								<li class="page-item"><a class="page-link" href="#" style="font-size: 0.7em" onclick="goChooseSelectPage(${page.endPage+1})">&gt;</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link" href="#" style="font-size: 0.7em" onclick="goChooseSelectPage(${page.totPage})">&gt;</a></li>
							</c:otherwise>
						</c:choose>
						<li class="page-item"><a class="page-link" href="#" style="font-size: 0.7em" onclick="goChooseSelectPage(${page.totPage})">last</a></li>
					</ul>
				</nav>
			</div>
			<input type="hidden" name="nowChooseSelectPage" value="${(empty param.nowChooseSelectPage) ? 1 : param.nowChooseSelectPage }">
			<input type="hidden" name="findState" value="${ findState }">
			<input type="hidden" name="nowPlace" value="searchPlace">
			<!-- ========== -->

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