<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
	<%
		Date nowTime = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy.MM.dd");
		
		String formName = "";
		if(request.getParameter("formName") != null) {
			formName = request.getParameter("formName");
		}
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
									<td> <input type="text" name="drafterDepartment" value="기획부" class="form-control form-control-sm"  style="font-size: 1em; padding: 0; border: none; height: 100%; text-align: center"> </td>
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
						<th> 품의 목적 </th>
						<td width="350px;"> <input type="text" name="formPurpose" class="form-control form-control-sm" style="font-size: 1em;" required> </td>
						<th> 예산 </th>
						<td> <input type="text" name="budget" class="form-control form-control-sm" style="font-size: 1em;" required> </td>
					</tr>
					<tr>
						<th> 제목 </th>
						<td colspan="3" align="left" style="">
						<input type="text" name="formTitle" class="form-control form-control-sm" style="font-size: 1em;" placeholder="제목을 입력해주세요." required>
						</td>
					</tr>
					<tr>
						<th style="line-height: 400px; padding: 0;"> 상세 내역 </th>
						<td colspan="3" height="200px" style="padding: 0.5em;">
							<textarea class="form-control" name="formDoc" style=" font-size:1em; height: 100%; overflow: auto;" ></textarea>
						</td>
					</tr>		
					<tr>
						<th colspan="4"  style="padding: 0.5em; ">파일 첨부 </th>
					</tr>		
					<tr>
						<td colspan="4">
							<div class="e-approval-file-zone">
								<div class="input-group mb-3">
								  <div class="custom-file" id="fileZone" >
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
					<jsp:include page="/WEB-INF/jsp/ElectronicApproval/update/approval_update_btns.jsp"></jsp:include>
				</div>
			</div>
			</main>
			<!-- 공통 -->
		</form>
	</div>
<script type="text/javascript">
funcApproval();
createMakerBox('makersZone');
createFile('fileZone');
</script>
</body>
</html>