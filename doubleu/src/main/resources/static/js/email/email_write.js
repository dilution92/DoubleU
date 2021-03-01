/**
 *
 * 작성일 : 21.02.15 
 * 작성자 : 송연주 
 * 항목 : 메일 쓰기
 * 	- 메일 보내기 전 보내는 사람과 메일 주소가 공백일 때 데이터 유효 검사
 * 	- 다중으로 파일을 선택했을 때 파일의 데이터를 div tag에 저장한다.
 * 파일명 : email_write.js

	추가 : 21.02.25
	임시 저장 버튼 js
	
	추가 : 21.02.28
	받는 사람, 참조 개별적으로 작성할 때 추가하기
 */


function sendToEmail() {
	
	var frm =  document.frm
	var sendToPerson = frm.emailName;
	var sendToAddress = frm.emailAddress;
	
	if(sendToPerson.value.trim().length == 0) {
		swal("보내는 사람을 입력해주세요.");
		sendToPerson.focus();
	}
	
	if(sendToAddress.value.trim().length == 0) {
		swal("보내는 사람의 이메일을 입력해주세요.")
		sendToAddress.focus();
	}
	
	
	frm.action = '/emailResult';
	frm.submit();
	
}


/* 다중 파일 이름 */
var FileChoice = function() {

	var customFile = document.getElementById('customFile')		
	var arrayValue = new Array();
	
	for(var i = 0; i < customFile.files.length; i++) {
		var filesMultiple = customFile.files[i].name;
		arrayValue[i] = filesMultiple;
		
		// 자식
		var spanTag = document.createElement("span");
		var contents = document.createTextNode(arrayValue[i]);
		
		spanTag.appendChild(contents)
		
		// 부모
		var FileListDiv = document.getElementById('fileList');
		FileListDiv.appendChild(spanTag);
	}
}


/* 임시 저장 버튼 */

var sendToTemp = function() {
	var emailTemp = document.querySelector('#emailTemp');
	var emailTitle = document.querySelector('#emailTitleId');
	
	if(emailTitle.value == "") {
		emailTemp.innerText = "제목없음";
	}else {
		emailTemp.innerText = emailTitle.value;
	}

}

var tempSendEmail = function() {
	var frm = document.frm;
	frm.action = '/emailTemp';
	frm.submit();
}



/* 받는 사람 추가 function */

var addAddressPeronal = function() {
	var arrInput = new Array(0);
	var arrInputValue = new Array(0);
		 
addInput = function() {
	  arrInput.push(arrInput.length); // 배열의 끝에 하나 이상의 요소를 추가하고, 배열의 새로운 길이를 반환
	  console.log(arrInput.length); 
	  arrInputValue.push(""); // input value값은 ""
	  display();
	}
	
	
function display() {
	  document.getElementById('parah').innerHTML="";
	  for (intI=0;intI<arrInput.length;intI++) {
	    document.getElementById('parah').innerHTML+=createInput(arrInput[intI], arrInputValue[intI]);
	  }
	}
	
function saveValue(intId,strValue) {
	  arrInputValue[intId]=strValue;
	}  
			
function createInput(id,value) {
	  return "<input type='text' style='width: 150px;' class='emailBtnList > input' name='emailReceiverAddress' value='' style='border: 1px solid #ced4da;' id='emailBtn "+ id +"' onChange='javascript:saveValue("+ id +",this.value)' value='"+ 
	 
	value +"'>"
	+"<input type='button' class='emailBtnList > input' onclick='deleteInput()' value='x' style='width:20px; margin-right:5px'  id='del "+ id +"' onChange='javascript:saveValue("+ id +",this.value)' value='"+ 
	 
	value +"'>";
	}

// 삭제
deleteInput = function() {
	  if (arrInput.length > 0) { 
	     arrInput.pop(); 
	     arrInputValue.pop();
	  }
	  display(); 
	}
	
}


/* 받는 사람 참조 function */
var addAddressPeronalRef = function() {
	var arrInputRef = new Array(0);
	var arrInputValueRef = new Array(0);
		 
addInputRef = function() {
	  arrInputRef.push(arrInputRef.length); // 배열의 끝에 하나 이상의 요소를 추가하고, 배열의 새로운 길이를 반환
	  console.log(arrInputRef.length); 
	  arrInputValueRef.push(""); // input value값은 ""
	  displayRef(); // displayRef()실행
	}
	
	
function displayRef() {
	  document.getElementById('Refparah').innerHTML="";
	  for (intI=0;intI<arrInputRef.length;intI++) {
	    document.getElementById('Refparah').innerHTML+=createInputRef(arrInputRef[intI], arrInputValueRef[intI]);
	  }
	}

function saveValueRef(intId,strValue) {
	  arrInputValueRef[intId]=strValue;
	}  
			
function createInputRef(id,value) {
	  return "<input type='text' style='width: 150px;' class='emailBtnList > input' name='emailReceiverRef' value='' style='border: 1px solid #ced4da;' id='emailRefBtn "+ id +"' onChange='javascript:saveValueRef("+ id +",this.value)' value='"+ 
	 
	value +"'>"
	+"<input type='button' class='emailBtnList > input' onclick='deleteInputRef()' value='x' style='width:20px; margin-right:5px'  id='delRef "+ id +"' onChange='javascript:saveValueRef("+ id +",this.value)' value='"+ 
	 
	value +"'>";
	}


// 삭제
deleteInputRef = function() {
	  if (arrInputRef.length > 0) { 
	     arrInputRef.pop(); 
	     arrInputValueRef.pop();
	  }
	  displayRef(); 
	}

}



/* 체크박스 모달창 */

selectChkBox = function(selectAll) {
	console.log(selectAll)
	var check_count = document.getElementsByName("emailAddressChk");
	check_count.forEach((checkbox) => {
		checkbox.checked = selectAll.checked;
	})
		
}




