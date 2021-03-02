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
		
			<form action="/calenderUpdate" id="frm_modify" method="post">
				<table class="table table-bordered" >
		    		<tr>
		    			<td width="20%">제목</td>
		    			<td> <input type="text" name="calenderSubject" id="modalCalenderSubject" readonly="readonly">
		    				<input type="hidden" name="calenderNo" id="modalCalenderNo">
		    				<input type="hidden" name="calenderType" id="modalCalenderType">
		    			</td>
		    		</tr>
		    		<tr>
		    			<td>기간</td>
		    			<td> 
		    			<input type="date" name="calenderDateStart" id="modalCalenderDateStart" readonly="readonly">
	    				<input type="time" name="calenderTimeStart" id="modalCalenderTimeStart" readonly="readonly">
	    				<input type="date" name="calenderDateEnd" id="modalCalenderDateEnd" readonly="readonly"> 
	    				<input type="time" name="calenderTimeEnd" id="modalCalenderTimeEnd" readonly="readonly">
	    				
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
		    			<select name="calenderGroup" id="modalCalenderGroup" disabled="disabled">
    						<option value="" >그룹선택</option >
						    <option value="그룹일정">그룹일정</option>
						    <option value="내일정">내 일정</option>
    					</select>
		    			</td>
		    		</tr>
		    		<!-- <tr>
		    			<td>참석자</td>
		    			<td> <input type="text" name="calenderParticiptant" id="modalCalenderParticiptant"> </td>
		    		</tr> -->
		    		<tr>
		    			<td>장소</td>
		    			<td> <input type="text" name="calenderPlace" id="modalCalenderPlace" value="" readonly="readonly"> </td>
		    		</tr>
		    		<tr>
		    			<td>내용</td>
		    			<td> <textarea rows="5" cols="40" name="calenderContent" id="modalCalenderContent" readonly="readonly"></textarea> </td>
		    		</tr>
				</table>
		    </form>
		</div>
		<div class="modal-footer">
			<button type="button" class="btn btn-primary" data-dismiss="modal">돌아가기</button>
			<button type="button" class="btn btn-primary" id="btn_modify">일정수정</button>
			<button type="button" class="btn btn-primary" id="btn_delete">일정삭제</button>
		</div>
		
		
 	</div>
</div>

 <!--  저장 모달창 -->
	<div class="modal fade" id="Calender_delete_modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
 		<jsp:include page="Calender_delete_modal.jsp"></jsp:include>
	</div>	

</body>
</html>