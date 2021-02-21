<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- email_index.jsp 상세버튼 dropdowns --%>

<div class="e-approval-form-box">
  	   <span>받은 메일함</span>
       <input class="btn btn-outline-primary btn-sm" name="onname" type="button" id="emailSearchTitle" value="검색"/>
       <input class="form-control form-control-sm" type="text" placeholder="Search" name="emailFindStr" aria-label="Search" id="emailFindStr">
     	
     	
	<button class="btn btn-outline-primary btn-sm dropdown-toggle" style="display: inline-block; width: 7%; float: right; margin-left: 0.5em;" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" >상세 </button>
	 <div class="dropdown-menu" style="width:450px;">
	   <div class="dropdown-align">
	   		<span><label for="searchSend">보낸사람</label></span>
	   		<span><input type="text" id="searchSend"></span>
	   </div>
	   <div class="dropdown-align">
	   		<span><label for="searchReceive">받는사람</label></span>
	   		<span><input type="text" id="searchReceive"></span>
	   </div>
	   <div class="dropdown-align">
	   		<span><label for="searchContents">제목</label></span>
	   		<span><input type="text" id="searchContents"></span>
	   </div>
	   <div class="dropdown-align">
	   		<span><label for="searchDate">기간</label></span>
	   		<span><span><input type="date" id="searchDateOne"></span></span>
	   		<span><span><input type="date" id="searchDateTwo"></span></span>
	   </div>
	   
	    <div class="dropdown-divider"></div>
	    <div class="searchResetBtn">
		    <input class="btn btn-outline-primary btn-sm"  name="onname" type="button" value="검색"/>
			<input class="btn btn-outline-primary btn-sm" name="onname" type="button" value="내용 초기화"/>
		</div>
	</div>
</div>