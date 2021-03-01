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
<script src="http://code.jquery.com/jquery-1.11.1.min.js" type="text/javascript"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
		crossorigin="anonymous"></script>
<!-- ****************************** -->	

<script
            src="https://code.jquery.com/jquery-3.4.1.min.js"
            integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
            crossorigin="anonymous"></script>



</head>
<body>
<form action="" name="frmMember" id="frmMember">
	<div class="chooseMaker-container">
		<header class="chooseMaker-header">
			<h4>직원 조회</h4>
			<a href="#" onclick="selectAllMember()">전체 조회</a>
		</header>
		<hr>
		<section class="chooseMaker-main">
			<div class="chooseMaker-search">
				<select id="makerPosition" class="form-control form-control-sm e-approval-chooseMaker-select">
				<option value=""> 부서 선택 </option>
				<option value="IT기술부">IT기술부</option>
				<option value="영업부">영업부</option>
				<option value="관리부">관리부</option>
				</select>
				<input type="text" value="${param.findStr }" name="findStr" onkeyup="enterKey()" class="form-control form-control-sm e-approval-chooseMaker-input">
				<input type="button" value="검색" id="btnSelectMaker" class="btn btn-outline-primary btn-sm">
				<input type="hidden" value="${(empty param.nowPage)? 1: param.nowPage}" name="nowPage">
				<input type="hidden" value="${param.findType }" name="findType">
			</div>
			<div id="ajax_content">
			</div>
		</section>
	</div>
</form>




<script type="text/javascript">
$(document).ready(function() {
	$('#ajax_content').load('/approvalSelectMember');
})
function chooseMaker(memberNo, memberPosition, memberName) {
	var makerName = memberName;
	var makerPosition = memberPosition;
	var makerNo = memberNo;
	$(opener.document).find('#TempMakerPosition').val(makerPosition);
	$(opener.document).find('#TempMakerName').val(makerName);
	$(opener.document).find('#TempMakerNo').val(makerNo);
	self.close();
};

$('#btnSelectMaker').on('click', function() {
	var frm = $('#frmMember');
	document.frmMember.findType.value = $('#makerPosition option:selected').val();
	
	var param = $(frm).serialize();
	$.ajax({
		url: '/approvalSelectMember',
		data: param,
		dataType : 'html',
		method : 'post',
		success : function(data) {
			$('#ajax_content').html(data)
		}
	})
})
function noEvent() {
if (event.keyCode == 116) {
event.keyCode= 2;
return false;
}
else if(event.ctrlKey && (event.keyCode==78 || event.keyCode == 82))
{
return false;
}
if(window.event.keyCode == 13) {
	var frm = $('#frmMember');
	document.frmMember.findType.value = $('#makerPosition option:selected').val();
	
	var param = $(frm).serialize();
	$.ajax({
		url: '/approvalSelectMember',
		data: param,
		dataType : 'html',
		method : 'post',
		success : function(data) {
			$('#ajax_content').html(data)
		}
	})
	return false
}
}
document.onkeydown = noEvent;

</script>
</body>
</html>