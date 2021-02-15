/**
 *
 * 작성일 : 21.02.15 
 * 작성자 : 송연주 
 * 항목 : 메일 쓰기
 * 	- 메일 보내기 전 보내는 사람과 메일 주소가 공백일 때 데이터 유효 검사
 * 	- 다중으로 파일을 선택했을 때 파일의 데이터를 div tag에 저장한다.
 * 파일명 : email_write.js
 */


function sendToEmail() {
	

	var frm =  document.frm
	var sendToPerson = frm.sendToPerson;
	var sendToAddress = frm.sendToAddress;
	
	if(sendToPerson.value.trim().length == 0) {
		swal("보내는 사람을 입력해주세요.");
		sendToPerson.focus();
	}
	
	if(sendToAddress.value.trim().length == 0) {
		swal("보내는 사람의 이메일을 입력해주세요.")
		sendToAddress.focus();
	}
	
}


/* 다중 파일 이름 */
var FileChoice = function() {

	var customFile = document.getElementById('customFile')		
	var pTag = document.getElementById('fileContents')
	
	
	var arrayValue = new Array();
	
	for(var i = 0; i < customFile.files.length; i++) {
		var filesMultiple = customFile.files[i].name;
		arrayValue[i] = filesMultiple;
		
		// 자식
		var spanTag = document.createElement("span");
		var Contents = document.createTextNode(arrayValue[i]);
		
		spanTag.appendChild(Contents)
		
		// 부모
		var FileListDiv = document.getElementById('fileList');
		FileListDiv.appendChild(spanTag);
	}
}

