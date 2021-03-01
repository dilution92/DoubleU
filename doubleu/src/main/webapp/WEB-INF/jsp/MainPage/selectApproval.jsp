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
			<h6 class="article-title">최근 결재함</h6>
			
			<ul class="nav nav-tabs ariticle-aTag-ms" id="myTab" role="tablist">
			 	<li class="nav-item" role="presentation">
			   		<a class="nav-link active" id="#outgoingApproval-tab" data-toggle="tab" href="#outgoingApproval" role="tab" aria-controls="#outgoingApproval" aria-selected="true">발신</a>
			  	</li>
			  	<li class="nav-item" role="presentation">
			    	<a class="nav-link" id="receiverApproval-tab" data-toggle="tab" href="#receiverApproval" role="tab" aria-controls="receiverApproval" aria-selected="false">수신</a>
			  	</li>
			</ul>
			<div class="tab-content" id="myTabContent">
			 	<div class="tab-pane fade show active" id="outgoingApproval" role="tabpanel" aria-labelledby="#outgoingApproval-tab">
					<table class="table table-hover table-sm main-approval-table">
						<thead class="text-muted text-gray-dark">
							<tr>
								<th scope="col"  width="90px;">기안일</th>
								<th scope="col" width="110px;">결재양식</th>
								<th scope="col">제목</th>
								<th scope="col" width="90px;">기안자</th>
								<th scope="col" width="90px;">결재 상태</th>
							</tr>
						</thead>
						<tbody class="text-muted">
							<c:set var="no" value="1" />
							<c:forEach var="outgoingVo" items="${outgoingApprovalList }">
								<tr class="main-approval-item" onclick="location.href='/approvalSelectView?formNo=${outgoingVo.formNo}&&formType=${outgoingVo.formType}'">
									<td>${outgoingVo.formDate}</td>
									<td>${outgoingVo.formType}</td>					
									<td class="table-title-fixed-length">${outgoingVo.formTitle}</td>
									<td>${outgoingVo.drafterName }</td>						
									<c:choose>
										<c:when test="${outgoingVo.approvalState eq '(발신)상신'}">
											<td><span class="badge badge-success">진행중</span></td>	
										</c:when>
										<c:when test="${outgoingVo.approvalState eq '(발신)임시저장'}">
											<td><span class="badge badge-light">임시저장</span></td>	
										</c:when>
										<c:when test="${outgoingVo.approvalState eq '(발신)승인'}">
											<td><span class="badge badge-primary">승인</span>	</td>
										</c:when>
										<c:when test="${outgoingVo.approvalState eq '(발신)반려'}">
											<td><span class="badge badge-warning">반려</span></td>	
										</c:when>
									</c:choose>
								</tr>
								<c:set var= "no" value="${no+1 }"></c:set>
							</c:forEach>
						</tbody>
					</table>
					<div class="main-go-page">
						<a href="#">자세히 보기</a>
					</div>
			  	</div>
			 	 <div class="tab-pane fade" id="receiverApproval" role="tabpanel" aria-labelledby="receiverApproval-tab">
					<table class="table table-hover table-sm main-approval-table">
						<thead class="e-approval-list text-muted text-gray-dark">
							<tr>
								<th scope="col" width="90px;">기안일</th>
								<th scope="col" width="110px;">결재양식</th>
								<th scope="col" class="table-title-fixed-length">제목</th>
								<th scope="col" width="90px">기안자</th>
								<th scope="col" width="90px;">결재 여부</th>
							</tr>
						</thead>
						<tbody class="e-approval-list text-muted">
							<c:set var="no" value="1" />
							<c:forEach var="receiverVo" items="${receiverApprovalList }">
								<tr class="main-approval-item" onclick="location.href='/approvalSelectView?formNo=${receiverVo.formNo}&&formType=${receiverVo.formType}'">
									<td>${receiverVo.formDate}</td>
									<td>${receiverVo.formType}</td>					
									<td class="table-title-fixed-length">${receiverVo.formTitle}</td>					
									<td>${receiverVo.drafterName }</td>					
									<c:choose>
										<c:when test="${receiverVo.decisionState == '0'}">
											<td><span class="badge badge-success">결재대기</span></td>	
										</c:when>
										<c:when test="${receiverVo.decisionState == '1'}">
											<td><span class="badge badge-primary">결재승인</span>	</td>
										</c:when>
										<c:when test="${receiverVo.decisionState == '-1'}">
											<td><span class="badge badge-warning">결재반려</span></td>	
										</c:when>
									</c:choose>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="main-go-page">
						<a href="#">자세히 보기</a>
					</div>
			 	 </div>
			</div>
</body>
</html>