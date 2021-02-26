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
								<c:forEach var='vo' items='${list }' >
									  <button type="button" class="list-group-item list-group-item-action" >
									  	<h6 class="card-title"style="float: left;">${vo.marketSubject }</h6>
										<p class="card-text" style="float: right;">${vo.marketPrice }</p>
									  </button>
									  
								
								  </c:forEach>
								</div>
							</div>

						</div>
					</div>
				</div>
				<div class="modal-footer">
					<input type="button" class="btn btn-secondary" data-dismiss="modal"	value="close"> 
						<input type="button" class="btn btn-primary" value="이동">
				</div>
			</div>
		</div>
</body>
</html>