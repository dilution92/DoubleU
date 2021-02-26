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



