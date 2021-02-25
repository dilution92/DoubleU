<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<script src="js/email/email_commons.js"></script>
</head>
<div class="e-approval-table" >
				<table class="table table-hover table-sm" id="selectFindStr">
					<tbody class="e-approval-list text-muted">						
						<c:forEach var="list" items="${findStrResult }">
							<tr>
								<td><input name="chkBox" class="chkBoxClass" type="checkbox"/></td>
								<td><i class="bi bi-star"></i></td>
                                <td><i class="bi bi-envelope"></i></td>
                                <td>${list.emailChk }</td>
                                <td>${list.emailName }</td>
								<td>${list.emailAddress}</td>					
								<td style=" text-align: left; text-indent: 2em;"  onclick="goView(${list.emailNo})">${list.emailTitle }</td>					
								<td>${list.emailDate }</td>		
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			
			<!-- ========== -->
			
			<!-- 리스트 페이징 아이콘 code -->
			<div class="e-approval-list-pagination">
				<nav aria-label="Page navigation example">  
						<ul
						class="pagination pagination-sm text-muted justify-content-center">
						
						<c:if test="${page.startPage>1 }">
							<li class="page-item"><a class="page-link" onclick='goPage(1)'style="font-size: 0.7em">first</a></li>
							<li class="page-item"><a class="page-link" onclick='goPage(${page.startPage-1})'style="font-size: 0.7em">&lt;</a></li>
						</c:if>	
							<c:forEach var='i' begin='${page.startPage }' end='${page.endPage }'>
								<li class="page-item"><a class="page-link" onclick='goPage(${i})' style="font-size: 0.7em">${i }</a></li>
							</c:forEach>
							
						<c:if test="${page.endPage<page.totPage }">
							<li class="page-item"><a class="page-link" onclick = 'goPage(${page.endPage+1})'
								style="font-size: 0.7em">&gt;</a></li>
							<li class="page-item"><a class="page-link" onclick = 'goPage(${page.totPage})' style="font-size: 0.7em">last</a></li>
						</c:if>
						
					</ul>
				</nav>
			</div>
<script>
</script>