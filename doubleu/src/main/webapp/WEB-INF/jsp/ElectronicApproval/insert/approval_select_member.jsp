<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
			<div class="chooseMaker-table">
				<table class="table table-hover table-sm">
					<thead class="e-approval-list text-muted text-gray-dark">
						<tr>
							<th scope="col" width="100px;"> 부서 </th>
							<th scope="col"> 이름 </th>
							<th scope="col" width="100px;"> 직급 </th>
						</tr>
					</thead>
					<tbody class="e-approval-list text-muted">
						 <c:forEach var="vo" items="${list }"> 
							<tr onclick="chooseMaker('${vo.memberNo}','${vo.memberPosition}','${vo.memberName}')">
								<td> ${vo.memberDepartment } </td>
								<td> ${vo.memberName } </td>
								<td> ${vo.memberPosition } </td> 
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="e-approval-list-pagination">
				<nav aria-label="Page navigation example">
					<ul class="pagination pagination-sm text-muted justify-content-center">  
						<li class="page-item"><a class="page-link" href="#" style="font-size: 0.7em" onclick="goMemberPage(1)" >first</a></li>
						<c:choose>
							<c:when test="${page.startPage > 1}">
								<li class="page-item"><a class="page-link" href="#" style="font-size: 0.7em" onclick="goMemberPage(${page.startPage-1})">&lt;</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link" href="#" style="font-size: 0.7em" onclick="goMemberPage(${page.startPage})">&lt;</a></li>
							</c:otherwise>
						</c:choose>
						<c:forEach var="i" begin="${page.startPage}" end="${page.endPage }">
							<li class="page-item"><a class="page-link" href="#" style="font-size: 0.7em" onclick="goMemberPage(${i})">${i}</a></li>
						</c:forEach>
						<c:choose>
							<c:when test="${page.endPage >  page.totPage}">
								<li class="page-item"><a class="page-link" href="#" style="font-size: 0.7em" onclick="goMemberPage(${page.endPage+1})">&gt;</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link" href="#" style="font-size: 0.7em" onclick="goMemberPage(${page.totPage})">&gt;</a></li>
							</c:otherwise>
						</c:choose>
						<li class="page-item"><a class="page-link" href="#" style="font-size: 0.7em" onclick="goMemberPage(${page.totPage})">last</a></li>
					</ul>
				</nav>
			</div>
</body>
</html>