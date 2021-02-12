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
		<form action="">
			<div class="e-approval-view-btn-box">
				<div class="e-approva-view-btn-content">
					<input type="button" class="btn btn-outline-primary btn-sm" value="인쇄">
				</div>
				<div class="e-approva-view-btn-content">
					<input type="button" class="btn btn-outline-primary btn-sm" value="상신 요청" style="float: left">
					<input type="button" class="btn btn-outline-primary btn-sm" value="승인" style="float: left">
					<input type="button" class="btn btn-outline-primary btn-sm" value="재상신" style="float: left">
					<input type="button" class="btn btn-outline-primary btn-sm" value="상신 취소" style="float: left">
					<input type="button" class="btn btn-outline-secondary btn-sm" value="반려" style="float: left">
					<input type="button" class="btn btn-outline-secondary btn-sm" value="수정" style="float: left">
					<input type="button" class="btn btn-outline-secondary btn-sm" value="삭제" style="float: left">
					<input type="button" class="btn btn-outline-secondary btn-sm" value="목록으로">
				</div>
			</div>
		<hr style="margin-right: -3em; margin-left: -3em;">
		
		<main>
			<div class="e-approval-form-workType-container">
				<div class="e-approval-form-workType-title">
					<h4 style="font-weight: bold"><%= formName %></h4>
				</div>
				
				<div class="e-approval-form-workType-top">
					<div class="e-approval-form-workType-top-1">
						<table class="table table-sm table-bordered">
								<tr>
									<th> 기안자 </th>
									<td> 정해준 </td>
								</tr>
								<tr>
									<th>소속 </th>
									<td>기획부 </td>
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
					<div class="e-approval-form-approval-box">
						<div class="e-approval-form-approval-box-1 table-bordered">
							<p style="margin: 0;"> 결재란 </p>
						</div>
						<c:forEach begin="1" end="3">						
							<table class="table table-sm table-bordered e-approval-form-approval-box-2">
									<tr>
										<td height="20px;"style="padding-top: 0; padding-bottom: 0;"> 직급 </td>
									</tr>
									<tr>
										<td height="80px;" style="padding: 0; line-height: 80px"> <a href="#" style="font-weight: bold;">직원 조회</a> </td>
									</tr>
									<tr>
										<td height="20px;" style="padding-top: 0; padding-bottom: 0;" > 결재 대기 </td>
									</tr>
							</table>
						</c:forEach>
					</div>
				</div>
				<table class="table table-sm e-approval-form-table-3 table-bordered">
					<tr>
						<th> 일시 </th>
						<td> <input type="date" class="form-control form-control-sm" style="font-size: 1em;" > </td>
						<th> 협조부서 </th>
						<td> <input type="text" class="form-control form-control-sm" style="font-size: 1em;" required> </td>
					</tr>
					<tr>
						<th> 제목 </th>
						<td colspan="3" align="left" style="">
						<input type="text" class="form-control form-control-sm" style="font-size: 1em;" placeholder="제목을 입력해주세요." required>
						</td>
					</tr>
					<tr>
						<th style="line-height: 400px; padding: 0;"> 상세 내용 </th>
						<td colspan="3" height="200px" style="padding: 0.5em;">
							<textarea class="form-control" style="height: 100%; overflow: auto;" ></textarea>
						</td>
					</tr>		
					<tr>
						<th colspan="4"  style="padding: 0.5em; ">파일 첨부 </th>
					</tr>		
					<tr>
						<td colspan="4">
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
				<hr>
				<div class="e-approval-reason">
					<h6 style="font-size: 1.2em; font-weight: bold">결재 사유</h6>
					<span style="font-size: 1em; font-weight: bold;">&nbsp; 정해준 사원</span> <span style="color: #007bff; font-weight: bold">(승인)</span>
						<textarea rows="4" style="width: 100%; border: 1px solid #dee2e6; border-radius: 5px; margin-top: 0.6em; padding: 0.3em;"> 일단 승인하며, 자세한 사항은 출장 복귀 후에 보고 바랍니다.</textarea>
					<span style="font-size: 1em; font-weight: bold">&nbsp; 정희석 대표 </span> <span style="color: #ffc107; font-weight: bold">(반려)</span>
						<textarea rows="4" style="width: 100%; border: 1px solid #dee2e6; border-radius: 5px; margin-top: 0.6em; padding: 0.3em;"> 자네, 결재란 잘못 입력했네. </textarea>
				</div>
				<hr>
				
			</div>
			<hr style="margin-right: -3em; margin-left: -3em;">
				<div class="e-approval-work-form-btns" style="padding-bottom: 10em;">
					<input type="button" class="btn btn-outline-secondary btn-sm" value="목록으로">
				</div>
			</main>
		</form>
	</div>
</body>
</html>