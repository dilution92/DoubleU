<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중고 게시판</title>


</head>
<body>
<%
	//Map<String, Object> map  =  session.getAttribute("list");    // "Testing"을 키로 문자열을 저장
   
    session.setAttribute("MyData", 10);    // "MyData"를 키로 정수를 저장
%>

<div class="modal-dialog">
			<div class="modal-content"
				style="width: 80%; height: 400px; top: 200px;">
				<div class="modal-header">
					<h5 class="modal-title" id="dibModal">찜 목록</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="moadl-body approval-scroll">
					<div class="accordion" id="accordionExample">
						<div class="card">
							<div class="card-header" id="headingOne" style="display : inline-block;">
								<div class="list-group">
								<c:forEach var='vo' items='${marketlist }' >
									  <button type="button" class="list-group-item list-group-item-action"
									   onclick="view(${vo.marketNo})">
									  	<h6 class="card-title"style="float: left;">${vo.marketSubject }</h6>
									  	<c:choose>
											<c:when test="${vo.marketPrice == '0' }">
											<p class="card-text" style="float: right;">무료나눔</p>
											</c:when>
											<c:otherwise>
												<p class="card-text" style="float: right;">${vo.marketPrice }원</p>
											</c:otherwise>
										</c:choose>
										
									  </button>
									  
								
								  </c:forEach>

								</div>
							</div>

						</div>
					</div>
				</div>
				<div class="modal-footer">
					<input type="button" class="btn btn-secondary" data-dismiss="modal"	value="close"> 
				</div>
			</div>
		</div>
</body>
</html>