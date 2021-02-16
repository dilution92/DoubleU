<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사유서 작성</title>
</head>
<body>
	<%
		Date nowTime = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy.MM.dd");
	 %>
	
	<div class="e-approval-form-container">
		<form action="/approvalInsertR" name="frmApproval" id="frmApproval" method="post">
			<div class="e-approval-work-btns">
				<div class="e-approval-work-form-choose">
					</a><select class="form-control form-control-sm e-approval-work-form-change">
						<option selected> 결재 양식 유형 </option>
						<option value="업무일반"> 업무 기안 </option>
						<option value="업무협조"> 업무 협조 </option>
						<option value="휴가신청"> 휴가신청서 </option>
						<option value="지각불참"> 지각/불참사유서 </option>
						<option value="지출결의서"> 지출 결의서 </option>
						<option value="업무일반"> 품의서 </option>
						<option value="업무일반"> 품의서 </option>
					</select>
					<input type="button" class="btn btn-outline-primary btn-sm" value="변경">
				</div>
				<div class="e-approval-work-form-btns">
					<input type="button" class="btn btn-outline-secondary btn-sm" value="목록으로">
				</div>
			</div>
		<hr style="margin-right: -3em; margin-left: -3em;">
		
		<main>
			<div class="e-approval-form-workType-container">
				<div class="e-approval-form-workType-title">
					<h4 style="font-weight: bold">${formName}</h4>
				</div>
				
				<div class="e-approval-form-workType-top">
					<div class="e-approval-form-workType-top-1">
						<table class="table table-sm table-bordered">
								<tr>
									<th> 기안자 </th>
									<td> <input type="text" name="drafterName" value="정해준" class="form-control form-control-sm" style="font-size: 1em; padding: 0; border: none; height: 100%; text-align: center;"> </td>
								</tr>
								<tr>
									<th>소속 </th>
									<td><input type="text" name="drafterDepartment" value="기획부" class="form-control form-control-sm"  style="font-size: 1em; padding: 0; border: none; height: 100%; text-align: center"> </td>
								</tr>
								<tr>
									<th>기안일 </th>
									<td><%= format.format(nowTime) %></td>
								</tr>
								<tr>
									<th>문서번호</th>
									<td>  </td>
								</tr>
						</table>
					</div>
					<div class="e-approval-form-decision-box">
						<div class="e-approval-form-decision-box-1 table-bordered">
							<p style="margin: 0;"> 결재란 </p>
						</div>
							<div id="makersZone" class="approval-amkers-zone e-approval-form-decision-box-2">
							
							</div>
					</div>
				</div>
				<table class="table table-sm e-approval-form-table-3 table-bordered">
					<tr>
						<th> 일시 </th>
						<td> <input type="date" name="eventDate" class="form-control form-control-sm" style="font-size: 1em;" required> </td>
						<th> 성명 </th>
						<td> <input type="text" name="name" class="form-control form-control-sm" style="font-size: 1em;" placeholder="성명" required> </td>
						<th> 직급 </th>
						<td> <input type="text" name="drafterPosition" class="form-control form-control-sm" style="font-size: 1em;" placeholder="직급" required> </td>
					</tr>
					<tr>
						<th> 제목 </th>
						<td colspan="5" align="left" style="">
						<input type="text" name="formTitle" class="form-control form-control-sm" style="font-size: 1em;" placeholder="제목을 입력하세요." required>
						</td>
					</tr>
					<tr>
						<th style="line-height: 400px; padding: 0;"> 상세 내용 </th>
						<td colspan="5" height="200px" style="padding: 0.5em;">
							<textarea class="form-control" name="formDoc" style="height: 100%; overflow: auto;" ></textarea>
						</td>
					</tr>		
					<tr>
						<th colspan="6"  style="padding: 0.5em; ">파일 첨부 </th>
					</tr>		
					<tr>
						<td colspan="6">
							<div class="e-approval-file-zone">
								<div class="input-group mb-3">
								  <div class="custom-file">
								    <input type="file" class="custom-file-input" id="inputGroupFile02">
								    <label class="custom-file-label" for="inputGroupFile02" aria-describedby="inputGroupFileAddon02">Choose file</label>
								  </div>
								</div>
							</div>
						</td>
					</tr>
				</table>
			</div>
			<hr style="margin-right: -3em; margin-left: -3em;">
			<div class="e-approval-work-btns">
				<div class="e-approval-work-form-btns" style="padding-bottom: 10em;">
					<jsp:include page="/WEB-INF/jsp/ElectronicApproval/insert/approval_insert_btns.jsp"></jsp:include>
				</div>
			</div>
			</main>
			
			<!-- 공통 -->
			<input type="text" name="formType" value="${formType}">
			
			<input type="hidden" id="TempMakerPosition" value="">
			<input type="hidden" id="TempMakerName" value="">
		</form>
	</div>
<script type="text/javascript">
funcApproval();
createMakerBox('makersZone');
</script>
</body>
</html>