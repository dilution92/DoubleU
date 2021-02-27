<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일정 상세 페이지</title>
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
		    			<td> <input type="text" name="calenderSubject" id="modalCalenderSubject">
		    			</td>
		    		</tr>
		    		<tr>
		    			<td>기간</td>
		    			<td> 
		    			<input type="date" name="calenderDateStart" id="modalCalenderDateStart">
	    				<input type="time" name="calenderTimeStart" id="modalCalenderTimeStart">
	    				<input type="date" name="calenderDateEnd" id="modalCalenderDateEnd"> 
	    				<input type="time" name="calenderTimeEnd" id="modalCalenderTimeEnd">
	    				
	    				<input type="hidden" name="calenderStartYear">
	    				<input type="hidden" name="calenderStartMonth">
	    				<input type="hidden" name="calenderStartDay">
	    				<input type="hidden" name="calenderStartTime">
	    				<input type="hidden" name="calenderStartMinute">
	    				<input type="hidden" name="calenderEndYear">
	    				<input type="hidden" name="calenderEndMonth">
	    				<input type="hidden" name="calenderEndDay">
	    				<input type="hidden" name="calenderEndTime">
	    				<input type="hidden" name="calenderEndMinute">
		    			</td>
		    		</tr>
		    		<tr>
		    			<td>그룹분류</td>
		    			<td>
		    			<select name="calenderGroup" id="modalCalenderGroup">
    						<option value="">그룹선택</option>
						    <option value="그룹일정">그룹일정</option>
						    <option value="내일정">내 일정</option>
    					</select>
		    			</td>
		    		</tr>
		    		<tr>
		    			<td>참석자</td>
		    			<td> <input type="text" name="calenderParticiptant" id="modalCalenderParticiptant"> </td>
		    		</tr>
		    		<tr>
		    			<td>장소</td>
		    			<td> <input type="text" name="calenderPlace" id="modalCalenderPlace" value="" > </td>
		    		</tr>
		    		<tr>
		    			<td>내용</td>
		    			<td> <textarea rows="5" cols="40" name="calenderContent" id="modalCalenderContent"></textarea> </td>
		    		</tr>
				</table>
		    </form>
		</div>
		<div class="modal-footer">
			<button type="button" class="btn btn-primary">돌아가기</button>
			<button type="button" class="btn btn-primary" onclick="location.href='Calender_modify.jsp'">일정수정</button>
			<button type="button" class="btn btn-primary">일정삭제</button>
		</div>
 	</div>
</div>
</body>
</html>