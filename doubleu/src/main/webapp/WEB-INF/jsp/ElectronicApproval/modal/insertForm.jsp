<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="modal fade e-approval-formChoose-modal" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">결재 유형 선택</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="moadl-body e-approval-scroll">
					<div class="accordion" id="accordionExample">
						<div class="card">
							<div class="card-header e-approval-formChoose-modal-tab" id="headingOne">
								<h6 class="mb-0">
									<button class="btn btn-link btn-block text-left e-approval-formChoose-btn" type="button" data-toggle="collapse" data-target="#collapseOne"
									 aria-expanded="true" aria-controls="collapseOne">
									 업무
									 </button>
								</h6>
							</div>
							<div id="collapseOne" class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
								<div class="card-body">
									<ul  class="e-approval-formChoose-modal-ul">
										<li><a onclick="goFormList('업무기안')" href="#">업무 기안</a></li>
										<li><a onclick="goFormList('업무협조')" href="#">업무 협조</a></li>
										<li><a onclick="goFormList('품의서')" href="#">품의서</a></li>
										<li><a onclick="goFormList('구매품의서')" href="#">구매품의서</a></li>
										<li><a onclick="goFormList('사유서')" href="#">사유서</a></li>
									</ul>
								</div>
							</div>
						</div>
						<div class="card">
							<div class="card-header e-approval-formChoose-modal-tab" id="headingTwo">
								<h6 class="mb-0">
									<button class="btn btn-link btn-block text-left e-approval-formChoose-btn" type="button" data-toggle="collapse" data-target="#collapseTwo"
									 aria-expanded="true" aria-controls="collapseTwo" style="width: 100%;">
									 인사
									</button>
								</h6>
							</div>
							<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
								<div class="card-body">
									<ul class="e-approval-formChoose-modal-ul">
										<li><a onclick="goFormList('휴가신청서')" href="#">휴가 신청서</a></li>
										<li><a onclick="goFormList('지각/결근사유서')" href="#">지각/결근 사유서</a></li>
									</ul>
								</div>
							</div>
						</div>
						<div class="card">
							<div class="card-header e-approval-formChoose-modal-tab" id="headingThree">
								<h6 class="mb-0">
									<button class="btn btn-link btn-block text-left e-approval-formChoose-btn" type="button" data-toggle="collapse" data-target="#collapseThree"
									 aria-expanded="true" aria-controls="collapseThree">
									 지출 결의
									 </button>
								</h6>
							</div>
							<div class="collapse" id="collapseThree" aria-labelledby="headingThree" data-parent="#accordionExample">
								<div class="card-body">
									<ul  class="e-approval-formChoose-modal-ul">
										<li><a onclick="goFormList('지출결의서')" href="#">지출결의서</a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<input type="button" class="btn btn-secondary" data-dismiss="modal" value="close">
				</div>
			</div>
		</div>
	</div>
</body>
</html>