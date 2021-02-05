<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<div class="e-approval-form-container">
		<header  class="e-approval-form-header">
			<h5>업무 기안</h5>
		</header>
			<div class="e-approval-work-btns">
				<div class="e-approval-work-form-btns">
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
					<input type="button" class="btn btn-outline-primary btn-sm" value="상신요청">
					<input type="button" class="btn btn-outline-primary btn-sm" value="임시저장">
					<input type="button" class="btn btn-outline-secondary btn-sm" value="목록으로">
				</div>
			</div>
		<hr style="margin-right: -8em; margin-left: -8em;">
		<main class="e-approval-form-main">
			<div class="e-approval-form-table-container">
				<h4 style="text-align: center;">업무 기안</h4>
				<form action="">
					<div class="e-approval-form-table-top">
						<div class="e-approval-form-table-1">
							<table class="table table-sm table-bordered">
									<tr>
										<td> 기안자</td>
										<td> 정해준 </td>
									</tr>
									<tr>
										<td>소속 </td>
										<td>기획부 </td>
									</tr>
									<tr>
										<td>기안일 </td>
										<td>2021.02.04 </td>
									</tr>
									<tr>
										<td>문서번호</td>
										<td>A12345162 </td>
									</tr>
							</table>
						</div>
						<div>
							<table class="table table-sm e-approval-form-table-top">
								<tr>
								<td rowspan="3" >결\n재 </td>
								<td>과장</td>
								</tr>
							</table>
						</div>
					</div>
					<table class="table table-sm e-approval-form-table-3 table-bordered">
						<tr>
							<th> 시행 일자 </th>
							<td> <input type="date"> </td>
							<th> 협조 부서 </th>
							<td> 개발부 </td>
						</tr>
						<tr>
							<th> 제목 </th>
							<td colspan="3" align="left"> 필수값입니다. </td>
						</tr>
						<br>		
						<tr>
							<td colspan="4" height="300px">정해준입니다. </td>
							</tr>		
					</table>
					<div class="e-approval-file-zone">
						<h5 style="font-size: 1em; border-bottom: 1px solid #000000; font-weight: bold" >파일 첨부</h5>
						<div class="input-group mb-3">
						  <div class="custom-file">
						    <input type="file" class="custom-file-input" id="inputGroupFile02">
						    <label class="custom-file-label" for="inputGroupFile02" aria-describedby="inputGroupFileAddon02">Choose file</label>
						  </div>
						</div>
					</div>
				</form>
			</div>
			<hr style="margin-right: -8em; margin-left: -8em;">
			<div class="e-approval-work-btns">
				<div class="e-approval-work-form-btns">
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
				</div >
				<div class="e-approval-work-form-btns" style="padding-bottom: 10em;">
					<input type="button" class="btn btn-outline-primary btn-sm" value="상신요청">
					<input type="button" class="btn btn-outline-primary btn-sm" value="임시저장">
					<input type="button" class="btn btn-outline-secondary btn-sm" value="목록으로">
				</div>
			</div>
		</main>
	
	
			

		
	</div>

</body>
</html>