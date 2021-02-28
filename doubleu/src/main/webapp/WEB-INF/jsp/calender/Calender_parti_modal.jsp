<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

 <div class="modal-dialog modal-lg">
    <div class="modal-content">
		<div class="modal-header">
			<h5 class="modal-title" id="exampleModalLabel" >참여자</h5>
			
	    	<button type="button" class="close" data-dismiss="modal" aria-label="Close">
	        	<span aria-hidden="true">&times;</span>
	        </button>
		</div>

			<div class="modal-body">	
			
				<form action="">
				
				<div class="search-btn" style="text-align: left">
					<select class="form-control form-control-sm" style="width: 70px;">
						<option value="">이름</option>
						<option value="">부서</option>
					</select> 
					<input class="form-control form-control-sm col-3" type="text" placeholder="Search" aria-label="Search" id="approvalFindStr">
					<input class="btn btn-outline-primary btn-sm " name="onname" type="button" value="검색" />
				</div>
			
					<table class="table table-bordered">
						<tr height="50px">
							<td width="350px">주소록</td>
							<td width="100px">버튼</td>
							<td width="350px">참여자</td>
						</tr>
						<tr height="500px">
							<td width="350px">
								<c:forEach items="${profile}" var="profile"><!-- 왼쪽 주소록 리스트 -->
									<div class="inputMember" >
										<input type="checkbox" name="memberchk" /> 
										<span class="badge rounded-pill bg-light text-dark">${profile.memberTeam }</span>
										<span class="badge rounded-pill bg-light text-dark">${profile.memberName }</span> 
										<span class="badge rounded-pill bg-light text-dark">${profile.memberPosition }</span>
									</div> 
								</c:forEach>
							</td>
							
							<td width="100px">
								<div class="search-btn-address-btn-two-align">
									<button type="button" class="btn btn-outline-primary btn-sm">
										<i class="bi bi-plus">+</i>
									</button>
									<button type="button" class="btn btn-outline-primary btn-sm">
										<i class="bi bi-dash">-</i>
									</button>
								</div>
							</td>
							
							<td width="350px">
								<c:forEach begin="0" end="10">
									<div class="outputMember">
										<span class="badge rounded-pill bg-light text-dark">더블유 조리팀</span>
										<span class="badge rounded-pill bg-light text-dark">송연주</span> 
										<span class="badge rounded-pill bg-light text-dark">사원</span>
									</div>
								</c:forEach>
							</td>
						</tr>
					</table>
				</form>
			</div>
		<div class="modal-footer">
			<button class="btn btn-primary btn-lg btn-primary btn-sm" role="button">추가하기</button>
			<button class="btn btn-primary btn-lg btn-primary btn-sm" role="button">취소하기</button>
		</div>
	</div>
</div>
</body>
</html>