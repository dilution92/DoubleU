<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	
<!-- bootstrap CDN -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
<!-- main page CSS -->
<link rel="stylesheet" href="/css/MainIndex.css">
<!-- 전자결재용 CSS -->
<link rel="stylesheet" href="/css/ElectronicApproval/ElectronicApproval.css">
<script type="text/javascript" src="/js/E-Approval/ElectronicApproval.js"></script>
<!-- bootstrap script, Jquery CDN -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
		crossorigin="anonymous"></script>
<!-- ****************************** -->	

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous">
</script>



</head>
<body>
<form action="" name="frmMember">
	<div class="chooseMaker-container">
		<header class="chooseMaker-header">
			<h4>직원 조회</h4>
		</header>
		<hr>
		<section class="chooseMaker-main">
			<div class="chooseMaker-search">
				<select name="makerPosition" class="form-control form-control-sm e-approval-chooseMaker-select">
				<option value=""> 직급 선택 </option>
				<option value="전무">전무</option>
				<option value="상무">상무</option>
				<option value="이사">이사</option>
				<option value="부장">부장</option>
				<option value="차장">차장</option>
				<option value="과장">과장</option>
				<option value="대리">대리</option>
				<option value="주임">주임</option>
				<option value="사원">사원</option>
				</select>
				<input type="text" value="" name="findStr" class="form-control form-control-sm e-approval-chooseMaker-input">
				<input type="button" value="검색" id="btnSelectMaker" class="btn btn-outline-primary btn-sm ">
				<input type="hidden" value="${(empty param.nowPage) ? 1: param.nowPage}" name="nowPage">
			</div>
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
			
		</section>
	</div>
</form>




<script type="text/javascript">
function chooseMaker(memberNo, memberPosition, memberName) {
	var makerName = memberName;
	var makerPosition = memberPosition;
	var makerNo = memberNo;
	$(opener.document).find('#TempMakerPosition').val(makerPosition);
	$(opener.document).find('#TempMakerName').val(makerName);
	$(opener.document).find('#TempMakerNo').val(makerNo);
	window.close();
};

$('#btnSelectMaker').on('click', function() {
	var frm = document.frmMember;
	frm.action = '/approvalSelectMember';
	frm.submit();
})

</script>
</body>
</html>