<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <div class="modal-dialog">
    <div class="modal-content">
		<div class="modal-header">
			<h5 class="modal-title" id="exampleModalLabel">일정 상세 보기</h5>
		    	<button type="button" class="close" data-dismiss="modal" aria-label="Close">
		        	<span aria-hidden="true">&times;</span>
		        </button>
		</div>
		<div class="modal-body">
			<form action="">
				<table class="table table-bordered" >
		    		<tr>
		    			<td width="20%">제목</td>
		    			<td>제목</td>
		    		</tr>
		    		<tr>
		    			<td>기간</td>
		    			<td> 
		    			<input type="date" name="calender_date_start">
		    			<input type="time" name="calender_time_start">
		    			<input type="date" name="calender_date_end"> 
		    			<input type="time" name="calender_time_end">
		    			</td>
		    		</tr>
		    		<tr>
		    			<td>그룹분류</td>
		    			<td>그룹분류</td>
		    		</tr>
		    		<tr>
		    			<td>참석자</td>
		    			<td> <input type="text" name="calender_participtant"> </td>
		    		</tr>
		    		<tr>
		    			<td>장소</td>
		    			<td> <input type="text" name="calender_place"> </td>
		    		</tr>
		    		<tr>
		    			<td>내용</td>
		    			<td> <textarea rows="5" cols="40" name="calender_content"></textarea> </td>
		    		</tr>
				</table>
		    </form>
		</div>
		<div class="modal-footer">
			<button type="button" class="btn btn-primary" data-dismiss="modal">돌아가기</button>
			<button type="button" class="btn btn-primary" onclick="location.href='Calender_modify.jsp'">일정수정</button>
			<button type="button" class="btn btn-primary">일정삭제</button>
		</div>
 	</div>
   </div>
</body>
</html>