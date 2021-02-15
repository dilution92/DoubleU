/** 
	version: 1.0
	파일명: ElectronicApproval.js
	작성 일자: 2021-02-01
	작성자: 정해준
	설명 : 전자결재에서 아용되는 script 함수 정의

	수정일자: 2021-02-11
	수정자: 정해준
	수정내역: append(zone, boxCnt), createMakerBox(makersZone) 정의 
	
	수정일자: 2021-02-14
	수정자: 정해준
	수정내역, checkFile()
 */


/* 상세 보기 */
var goView = function(formNo) {
	var frm = document.frmApproval;
	frm.formNo.value = formNo;
	
	frm.action = "/approvalGoView"
	frm.submit();	
}

/* btn 기능 퍼블리싱 */
function funcApproval() {
		var frm = document.frmApproval;
		
	/*정보 전송*/
	
	$('#btnApprovalSave').on('click', function() {
		frm.enctype = 'multipart/form-data';
		
		alert("정상적으로 등록되었습니다.")
		frm.action = '/approvalInsert';
		frm.submit();
	})
	
	/*임시 저장*/
	$('#btnApprovalTempSave').on('click', function() {
		alert('임시저장함에 저장되었습니다.')
		frm.action = '/approvalTempInsert';
		frm.submit();
	}) 
}

/* 결재란 박스 추가 함수 정의*/
function createMakerBox(makersZone) {
	var zone = document.getElementById(makersZone)
	var boxCnt = 1;
	append(zone, boxCnt);
}
function append(zone, boxCnt) {

	//박수 갯수
	var boxCnt = boxCnt;
	
	//table 생성
	var makerBox = document.createElement("table");
	makerBox.setAttribute("class", "table table-sm table-bordered e-approval-form-decision-box-2 makerBox");
	makerBox.setAttribute("id", "makerBox");
	
	
	//결재권자 직급 행 생성
	var trPosition = document.createElement("tr");
	
	var tdPosition = document.createElement("td");
	tdPosition.setAttribute("id","makerPositionContent");
	
	var inputPosition = document.createElement("input");
	inputPosition.setAttribute("name", "makerPosition" + boxCnt);
	inputPosition.setAttribute("id", "makerContent");
	inputPosition.setAttribute("value", "직급");
	inputPosition.setAttribute("readonly", "readonly");
	
	tdPosition.appendChild(inputPosition);
	trPosition.appendChild(tdPosition);
	makerBox.appendChild(trPosition);
	
	
	//직원조회란 생성
	var trSign = document.createElement("tr");
	
	var tdSign= document.createElement("td");
	tdSign.setAttribute("height", "80px;");
	
	var aSign= document.createElement("input");
	aSign.setAttribute("id", "makerSignBtn");
	aSign.setAttribute("name", "makerSignBtn" + boxCnt);
	aSign.setAttribute("type", "button");
	aSign.setAttribute("value", "직원조회");
	
	//직원 조회 버튼 생성
	aSign.onclick = function() {   
		var eventBtn = event.srcElement.name;
		var checkSize = eventBtn.charAt(eventBtn.length-1);
		
		var winWidth = "500";
		var winHeight = "600";
		
		
		var winLeft = Math.ceil((window.screen.width - winWidth)/2);
		var winTop = Math.ceil((window.screen.height- winHeight)/2);
		var win = window.open('/newPage', 'win', 'width=' + winWidth + ', height=' + winHeight + ', left=' + winLeft + ', top = ' + winTop );

		win.onbeforeunload = function(){
			inputName.value = $('#TempMakerName').val();
			inputPosition.value = $('#TempMakerPosition').val();
			
			var checkName = $('.makerBox:last input[id=makerSignBtn]').attr('name');
			alert(checkName);
			alert(aSign.name)
			var zone = document.getElementById("makersZone")
			if(zone.childNodes.length === 2 || aSign.name === checkName) {
				boxCnt++;
				append(zone, boxCnt);
			}
		}
	}
	tdSign.appendChild(aSign);
	trSign.appendChild(tdSign);
	makerBox.appendChild(trSign);


	//결재권자 이름 행 생성
	var trName= document.createElement("tr");

	var tdName = document.createElement("td");
	tdName.setAttribute("id", "makerNameContent");
	tdName.setAttribute("height", "16.5px");
	
	var inputName= document.createElement("input");
	inputName.setAttribute("name", "makerName"  + boxCnt);
	inputName.setAttribute("id", "makerContent");
	inputName.setAttribute("value", "이름");
	inputName.setAttribute("readonly", "readonly");
	
	tdName.appendChild(inputName);
	trName.appendChild(tdName);
	makerBox.appendChild(trName);
	
	
	//박스 삭제 btn 기능 함수 정의
	var delBtn = document.createElement("input");
	delBtn.setAttribute("id", "makerDelBtn")
	delBtn.setAttribute("type", "button");
	delBtn.setAttribute("value", "x");
	delBtn.onclick = function(ev) {
		if(zone.childNodes.length <= 2) {
			return;
		}
		
		else {
		var ele = ev.srcElement;
		var p = ele.parentNode;
		var pp = p.parentNode;
		var ppp = pp.parentNode;
		
		zone.removeChild(ppp);
		}
	}
	tdSign.appendChild(delBtn);
	zone.appendChild(makerBox)
}

function vacationCnt() {
	var frm = document.frmApproval;
	
	if(frm.startDate.value == null || frm.endDate.value == null) {
		return;
	}
	else {
	}
}
function chooseVacationType() {
	var frm = document.frmApproval;
	var vacationType = $('#VacationType option:selected').val();
	if(vacationType == '반차') {
		$('#startDate').attr('disabled', 'disabled');
		$('#endDate').attr('disabled', 'disabled');
		frm.vacationCnt.value = 0.5;
	}
	else if( vacationType == '연차' || vacationType == '월차'){
		$('#startDate').removeAttr('disabled');
		$('#endDate').removeAttr('disabled');
		frm.vacationCnt.value = null;
	}
}


function appendFile(zone, fileCnt) {
	var fileCnt = fileCnt;
	var div = document.createElement('div');
	div.setAttribute('class', 'fileContent');
	
	var fileInput = document.createElement('input');
	fileInput.setAttribute('type', 'file');
	fileInput.setAttribute('name', 'approvalFile');
	fileInput.setAttribute('id', 'approvalFile' + fileCnt);
	fileInput.setAttribute('multiple', 'multiple');
	fileInput.onchange = function() {
		var checkId = $('.fileContent:last input[type=file]').attr('id');
		if(checkId === fileInput.id || zone.childNodes.length === 2) {
		fileCnt++;
		appendFile(zone,fileCnt)
		}
	}
	
	var delBtn = document.createElement('input');
	delBtn.setAttribute('type', 'button');
	delBtn.setAttribute('id', 'delBtnFile');
	delBtn.setAttribute('value', '파일 삭제');
	delBtn.onclick = function() {
		if(zone.childNodes.length <= 2) {
			return;
		}
		else {
			ele = event.srcElement;
			eleParent = ele.parentNode;
			zone. removeChild(eleParent);
		}
	}
	div.appendChild(fileInput);	
	div.appendChild(delBtn);	
	zone.appendChild(div);
}

function createFile(fileZone) {
	var zone = document.getElementById(fileZone);
	var fileCnt = 1;
	appendFile(zone, fileCnt)
}

