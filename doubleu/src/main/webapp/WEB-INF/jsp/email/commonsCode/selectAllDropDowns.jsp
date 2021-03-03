<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>    
<%--email_index.jsp --%>
<ul class="email-select-list">
	<li>
		<label class="btn btn-outline-primary btn-sm">
		<input type="checkbox" onclick="selectChkBox(this)"/>전체선택
		</label>
	</li>
     <li>
      	<span class="btn btn-outline-primary btn-sm" id="emailSpamBlockBtn"  
      	data-toggle="modal" data-target="#spamEmailRev">스팸차단</span>
     </li>
     <li>
           <span class="btn btn-outline-primary btn-sm" id="emailSendBtn" onclick="replyMail()">답장하기</span>
      </li>

      <li>
          	<span class="btn btn-outline-primary btn-sm" id="deleteBtn"  
      	data-toggle="modal" data-target="#deleteEmail">삭제하기</span>
      </li>

      <li>
          <span class="btn btn-outline-primary btn-sm" id="emailPassBtn" onclick="transMail()">전달하기</span>
      </li>

      <li>
          <span class="btn btn-outline-primary btn-sm" id="emailReadBtn">읽음</span>
      </li>

      <li>
	      <div class="input-group mb-3">
			  <div class="input-group-prepend">
			    <button class="btn btn-outline-primary btn-sm" id="MoveFolderBtn" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">이동</button>
			    <div class="dropdown-menu">	 
			      <a class="dropdown-item" onclick="sendImpEmail()">중요 메일함</a>
			      <a class="dropdown-item" onclick="sendTempEmail()">임시 보관함</a>
			      <a class="dropdown-item" onclick="sendSpamEmail()">스팸 메일함</a>
			      <a class="dropdown-item" onclick="sendTrashEmail()">휴지통</a>
			      <div role="separator" class="dropdown-divider"></div>
			      <a class="dropdown-item" href="#">NOTES</a>
			    </div>
			  </div>
		</div>
     </li>	
</ul>
<script>
var sendSpamEmail = function() {
	console.log('실행 중')
	var valueArr = new Array();
	var list = $('input:checkbox[name=chkBox]')
	
	for(var i=0; i<list.length; i++) {
		if(list[i].checked) {
			valueArr.push(list[i].value);
			
		};
		
	}

	
	var frm = document.emailForm;
	var deleteList = frm.deleteBtnList;

	deleteList.value = valueArr;

	frm.action = "/selectSendMailBtn"
	frm.submit();
}

var sendImpEmail = function() {
	console.log('실행 중')
	var valueArr = new Array();
	var list = $('input:checkbox[name=chkBox]')
	
	for(var i=0; i<list.length; i++) {
		if(list[i].checked) {
			valueArr.push(list[i].value);
			
		};
		
	}

	
	var frm = document.emailForm;
	var deleteList = frm.deleteBtnList;

	deleteList.value = valueArr;

	frm.action = "/selectImpMailBtn"
	frm.submit();
}

var sendTrashEmail = function() {
	console.log('실행 중')
	var valueArr = new Array();
	var list = $('input:checkbox[name=chkBox]')
	
	for(var i=0; i<list.length; i++) {
		if(list[i].checked) {
			valueArr.push(list[i].value);
			
		};
		
	}

	
	var frm = document.emailForm;
	var deleteList = frm.deleteBtnList;

	deleteList.value = valueArr;
	
	
	frm.action = "/selectTrashMailBtn"
	frm.submit();
}


var sendTempEmail = function() {
	console.log('실행 중')
	var valueArr = new Array();
	var list = $('input:checkbox[name=chkBox]')
	
	for(var i=0; i<list.length; i++) {
		if(list[i].checked) {
			valueArr.push(list[i].value);
			
		};
		
	}

	
	var frm = document.emailForm;
	var deleteList = frm.deleteBtnList;

	deleteList.value = valueArr;

	frm.action = "/selectTempMailBtn"
	frm.submit();
}

// 답장하기
var replyMail = function() {
	
	var valueArr = new Array();
	var list = $('input:checkbox[name=chkBox]')
	
	for(var i=0; i<list.length; i++) {
		if(list[i].checked) {
			valueArr.push(list[i].value);
			
		};
		
	}

	
	var frm = document.emailForm;
	var deleteList = frm.deleteBtnList;

	deleteList.value = valueArr;

	console.log(deleteList.value);
	frm.action = "/ReplyWrite"
	frm.submit();
}

// 전달하기
var transMail = function() {
	
	var valueArr = new Array();
	var list = $('input:checkbox[name=chkBox]')
	
	for(var i=0; i<list.length; i++) {
		if(list[i].checked) {
			valueArr.push(list[i].value);
			
		};
		
	}

	
	var frm = document.emailForm;
	var deleteList = frm.deleteBtnList;

	deleteList.value = valueArr;

	console.log(deleteList.value);
	frm.action = "/transWrite"
	frm.submit();
}
</script>