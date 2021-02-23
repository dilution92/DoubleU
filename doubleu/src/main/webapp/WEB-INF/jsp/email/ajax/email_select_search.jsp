<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<script src="js/email/email_commons.js"></script>
</head>
<body>
	<div class="e-approval-table" >
		<table class="table table-hover table-sm" >
			<tbody class="e-approval-list text-muted">
				<c:forEach var="list" items="${selectFindStr }">
					<tr>
						<td><input name="chkBox" class="chkBoxClass" type="checkbox"/></td>
						<td><i class="bi bi-star"></i></td>
                         <td><i class="bi bi-envelope"></i></td>
                         <td>${list.emailChk }</td>
						<td>${list.emailAddress}</td>					
						<td style=" text-align: left; text-indent: 2em;" onclick="goView(${list.emailNo})">${list.emailTitle }</td>					
						<td>${list.emailDate }</td>		
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
<script>
</script>