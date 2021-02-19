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
		
		String formName = "";
		if(request.getParameter("formName") != null) {
			formName = request.getParameter("formName");
		}
	 %>
	
	
	<div class="e-approval-form-container">
		<form name="frmApproval" action="" method="post">
		<jsp:include page="/WEB-INF/jsp/ElectronicApproval/view/approval_view_btns.jsp"></jsp:include>
		<hr style="margin-right: -3em; margin-left: -3em;">
		
		<main>
			<div class="e-approval-form-workType-container">
				<div class="e-approval-form-workType-title">
					<h4 style="font-weight: bold">${vo.formType }</h4>
				</div>
				<div class="e-approval-form-workType-top">
					<div class="e-approval-form-workType-top-1">
						<table class="table table-sm table-bordered">
								<tr>
									<th> 기안자 </th>
									<td> ${vo.drafterName} </td>
								</tr>
								<tr>
									<th>소속 </th>
									<td>${vo.drafterDepartment }</td>
								</tr>
								<tr>
									<th>기안일 </th>
									<td>${vo.formDate }</td>
								</tr>
								<tr>
									<th>문서번호</th>
									<td> ${vo.formNo }  </td>
								</tr>
						</table>
					</div>
					
					<div class="e-approval-form-decision-box">
						<div class="e-approval-form-decision-box-1 table-bordered">
							<p style="margin: 0;"> 결재란 </p>
						</div>
						<div id="makersZone" class="approval-amkers-zone e-approval-form-decision-box-2">
							<c:forEach var="makerVo" items="${vo.decisionMakersList }">
							<table class="table table-sm table-bordered e-approval-form-decision-box-2 makerBox" id="makerBox">
								<tr>
									<td id="makerPositionContent">
										<input name="makerPosition" id="makerContent" value="${makerVo.makerPosition }" readonly="readonly">
									</td>
								</tr>
								<tr>
									<td height="80px;" width="80px;" style="padding-top: 28px;">
										<c:choose>
											<c:when test="${makerVo.decisionState == '1' }">
												<h6><span class="badge badge-pill badge-primary">결재승인</span></h6>
											</c:when>
											<c:when test="${makerVo.decisionState == '0' }">
												<h6><span class="badge badge-pill badge-dark">결재대기</span></h6>
											</c:when>
											<c:when test="${makerVo.decisionState == '2' }">
												<h6><span class="badge badge-pill badge-primary">결재반려</span></h6>
											</c:when>
										</c:choose>
									</td>
								</tr>
								<tr>
									<td id="makerNameContent" height="16.5px">
										<input name="makerName" id="makerContent" value="${makerVo.makerName }" readonly="readonly">
									</td>
								</tr>
							</table>
							</c:forEach>
						</div>
					</div>
				</div>
				<table class="table table-sm e-approval-form-table-3 table-bordered">
					<tr>
						<th> 일시 </th>
						<td> <input type="text" value="${vo.eventDate }" class="form-control form-control-sm approval-select-view" readonly="readonly"> </td>
						<th> 성명 </th>
						<td> <input type="text" value="${vo.drafterName }" class="form-control form-control-sm approval-select-view" readonly="readonly"> </td>
						<th> 직급 </th>
						<td> <input type="text" value="${vo.drafterPosition }" class="form-control form-control-sm approval-select-view" readonly="readonly"> </td>
					</tr>
					<tr>
						<th> 제목 </th>
						<td colspan="5" align="left" style="">
						<input type="text" value="${vo.formTitle }" class="form-control form-control-sm approval-select-view" readonly="readonly">
						</td>
					</tr>
					<tr>
						<th style="line-height: 400px; padding: 0;"> 상세 내용 </th>
						<td colspan="5" height="200px" style="padding: 0.5em;">
							<textarea class="form-control" name="subject" style=" font-size:1em; height: 100%; overflow: auto; font-size: 1em; background-color: #ffffff" readonly="readonly"  >${vo.formDoc }</textarea>
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
					<input type="button" id="e_approval_selectBtn" class="btn btn-outline-secondary btn-sm" value="목록으로">
				</div>
			</div>
			</main>
		</form>
	</div>

</body>
</html>