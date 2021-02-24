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
	
	수정일자: 2021-02-17
	수정자: 정해준
	수정내역: goView()
 */


function checkFormData() {
	$(document).ready(function() {
		var frm = document.frmApproval;
		var isChange = false;
		
		$('input[name=formTitle]').on('change', function() {
			isChange = true;
		})
		
		$('textarea[name=formDoc]').on('change', function() {
			isChange = true;
		})
		$('input[name=cooperationDepartment]').on('change', function() {
			isChange = true;    
		})
		$('input[name=eventDate]').on('change', function() {
			isChange = true;
		})
		$('input[name=formPurpose]').on('change', function() {
			isChange = true;
		})
		$('input[name=budget]').on('change', function() {
			isChange = true;
		})
		$('input[name=startDate]').on('change', function() {
			isChange = true;
		})
		$('input[name=endDate]').on('change', function() {
			isChange = true;
		})
		$('input[name=halfDate]').on('change', function() {
			isChange = true;
		})
		$('#selectVacationType').on('change', function() {
			isChange = true;
		})
		
		
		/*update버튼 기능 구현*/
		$('#btnApprovalUpdateR').on('click', function() {
			frm.enctype = 'multipart/form-data';
			isChange = false;
			var checkForm = true;
		//유효성 검사
	
		if(!frm.formTitle.checkValidity()) {
			alert("제목을 입력해주세요.")
			checkForm = false;
			return;
		}
		
		if(!frm.formDoc.checkValidity()) {
			alert("내용을 입력해주세요.")
			checkForm = false;
			return;
		}
		if($('input[name=formType]').val() == '품의서') {
			if(!frm.formPurpose.checkValidity()) {
				alert("품의목적을 입력해주세요.")
				checkForm = false;
				return;
			}
		}
		if($('input[name=formType]').val() == '구매품의서') {
			if(!frm.formPurpose.checkValidity()) {
				alert("품의목적을 입력해주세요.")
				checkForm = false;
				return;
			}
			if(!frm.budget.checkValidity()) {
				alert("예산을 입력해주세요.")
				checkForm = false;
				return;
			}
		}
		if($('input[name=formType]').val() == '휴가신청서') {
			if($('#selectVacationType option:selected').val() == '반차') {
				if(!frm.halfDate.checkValidity()) {
					alert("반차 일자를 선택해주세요.")
					checkForm = false;
					return;
				}
			}
			if($('#selectVacationType option:selected').val() == ''){
				alert("휴가 종류를 입력해주세요.")
				checkForm = false;
				return;
			}
			if($('#selectVacationType option:selected').val() == '연차' || $('selectVacationType option:selected').val() == '월차') {
				if(!frm.startDate.checkValidity()) {
					alert("휴가 시작 일을 선택해주세요.")
					checkForm = false;
					return;
				}
				if(!frm.endDate.checkValidity()) {
					alert("휴가 마지막 일을 선택해주세요.")
					checkForm = false;
					return;
				}
			}
		}
		if($('input[name=formType]').val() == '사유서' || $('input[name=formType]').val() == '지각/결근사유서') {
			if(!frm.drafterName.checkValidity()) {
				alert("이름을 입력해주세요.");
				checkForm = false;
				return;
			}
			if(!frm.drafterDepartment.checkValidity()) {
				alert("직급을 입력해주세요.");
				checkForm = false;
				return;
			}
		} 
		
		var decisionMakerCnt = (document.getElementsByName('makerName').length - 1);
		frm.decisionMakerCnt.value = decisionMakerCnt;
		if(decisionMakerCnt > 0) {
				var makerPosition = new Array();
				var makerName = new Array();
				var makerOrder = new Array();
				var makerNo = new Array();
			for(var i = 0; i<decisionMakerCnt;i++) {
				makerPosition[i] = $('input[name=makerPosition]').eq(i).val();
				makerName[i] = $('input[name=makerName]').eq(i).val();
				makerNo[i] = $('input[name=makerNo]').eq(i).val();
				makerOrder[i] = i+1;
			}
			frm.makerPositionArr.value = makerPosition;		
			frm.makerNameArr.value = makerName;		
			frm.makerOrderArr.value = makerOrder;
			frm.makerNoArr.value = makerNo;
			alert(makerNo);
		}
		else {
			alert("결재란을 작성해주세요.");
			checkForm = false;
		}
		
		var fileBoxSize =(document.getElementsByClassName('approval-file').length);
		for(var i = 1; i<fileBoxSize ;i++) {
			if($('input[name=approvalFile]').eq(i).val() == "") {
				$('input[name=approvalFile]').eq(i).remove();
			}	
		}
		
		if(frm.formType.value == '휴가신청서') {
			frm.vacationType.value = $('#selectVacationType option:selected').val(); 
			if(frm.vacationType.value == '반차') {
				alert('asd');
				frm.startDate.value = frm.halfDate.value;
				frm.endDate.value = frm.halfDate.value;
				frm.halfDayType.value = $('input:radio[name=halfTimeType]:checked').val();
			}
		}
		
		if(checkForm) {
			alert("정상적으로 등록되었습니다.");
			frm.action = '/approvalUpdateR';
			frm.submit();
		}
		})
		
		
		/*insert버튼 기능 구현*/
		$('#btnApprovalInsertR').on('click', function() {
			frm.enctype = 'multipart/form-data';
			isChange = false;
			var checkForm = true;
		//유효성 검사
	
		if(!frm.formTitle.checkValidity()) {
			alert("제목을 입력해주세요.")
			checkForm = false;
			return;
		}
		
		if(!frm.formDoc.checkValidity()) {
			alert("내용을 입력해주세요.")
			checkForm = false;
			return;
		}
		if($('input[name=formType]').val() == '품의서') {
			if(!frm.formPurpose.checkValidity()) {
				alert("품의목적을 입력해주세요.")
				checkForm = false;
				return;
			}
		}
		if($('input[name=formType]').val() == '구매품의서') {
			if(!frm.formPurpose.checkValidity()) {
				alert("품의목적을 입력해주세요.")
				checkForm = false;
				return;
			}
			if(!frm.budget.checkValidity()) {
				alert("예산을 입력해주세요.")
				checkForm = false;
				return;
			}
		}
		if($('input[name=formType]').val() == '휴가신청서') {
			if($('#selectVacationType option:selected').val() == '반차') {
				if(!frm.halfDate.checkValidity()) {
					alert("반차 일자를 선택해주세요.")
					checkForm = false;
					return;
				}
			}
			if($('#selectVacationType option:selected').val() == ''){
				alert("휴가 종류를 입력해주세요.")
				checkForm = false;
				return;
			}
			if($('#selectVacationType option:selected').val() == '연차' || $('selectVacationType option:selected').val() == '월차') {
				if(!frm.startDate.checkValidity()) {
					alert("휴가 시작 일을 선택해주세요.")
					checkForm = false;
					return;
				}
				if(!frm.endDate.checkValidity()) {
					alert("휴가 마지막 일을 선택해주세요.")
					checkForm = false;
					return;
				}
			}
		}
		if($('input[name=formType]').val() == '사유서' || $('input[name=formType]').val() == '지각/결근사유서') {
			if(!frm.drafterName.checkValidity()) {
				alert("이름을 입력해주세요.");
				checkForm = false;
				return;
			}
			if(!frm.drafterDepartment.checkValidity()) {
				alert("직급을 입력해주세요.");
				checkForm = false;
				return;
			}
		} 
		
		var decisionMakerCnt = (document.getElementsByName('makerName').length - 1);
		frm.decisionMakerCnt.value = decisionMakerCnt;
		if(decisionMakerCnt > 0) {
				var makerPosition = new Array();
				var makerName = new Array();
				var makerOrder = new Array();
				var makerNo = new Array();
			for(var i = 0; i<decisionMakerCnt;i++) {
				makerPosition[i] = $('input[name=makerPosition]').eq(i).val();
				makerName[i] = $('input[name=makerName]').eq(i).val();
				makerNo[i] = $('input[name=makerNo]').eq(i).val();
				makerOrder[i] = i+1;
			}
			frm.makerPositionArr.value = makerPosition;		
			frm.makerNameArr.value = makerName;		
			frm.makerOrderArr.value = makerOrder;
			frm.makerNoArr.value = makerNo;
		}
		else {
			alert("결재란을 작성해주세요.");
			checkForm = false;
		}
		
		var fileBoxSize =(document.getElementsByClassName('approval-file').length);
		for(var i = 1; i<fileBoxSize ;i++) {
			if($('input[name=approvalFile]').eq(i).val() == "") {
				$('input[name=approvalFile]').eq(i).remove();
			}	
		}
		
		if(frm.formType.value == '휴가신청서') {
			frm.vacationType.value = $('#selectVacationType option:selected').val(); 
			if(frm.vacationType.value == '반차') {
				frm.startDate.value = frm.halfDate.value;
				frm.endDate.value = frm.halfDate.value;
				frm.halfDayType.value = $('input:radio[name=halfTimeType]:checked').val();
			}
		}
		
		if(checkForm) {
			alert("정상적으로 등록되었습니다.");
			frm.action = '/approvalInsertR';
			frm.submit();
		}
		})
		
		
		/*tempInsert 버튼 기능 구현*/
		$('#btnApprovalTempInsertR').on('click', function() {
		if(!isChange) {
			alert("작성된 내용이 없습니다.");
			return;
		}
		else {
			isChange = false;
		}
		frm.enctype = 'multipart/form-data';
		
		//결재란 퍼블리싱
		var decisionMakerCnt = (document.getElementsByName('makerName').length - 1);
		frm.decisionMakerCnt.value = decisionMakerCnt;
		if(decisionMakerCnt > 0) {
				var makerPosition = new Array();
				var makerName = new Array();
				var makerOrder = new Array();
				var makerNo = new Array();
			for(var i = 0; i<decisionMakerCnt;i++) {
				makerPosition[i] = $('input[name=makerPosition]').eq(i).val();
				makerName[i] = $('input[name=makerName]').eq(i).val();
				makerNo[i] = $('input[name=makerNo]').eq(i).val();
				makerOrder[i] = i+1;
			}
			frm.makerPositionArr.value = makerPosition;		
			frm.makerNameArr.value = makerName;		
			frm.makerOrderArr.value = makerOrder;
			frm.makerNoArr.value = makerNo;
		}
		
		//첨부파일 퍼블리싱
		var fileBoxSize =(document.getElementsByClassName('approval-file').length);
		for(var i = 1; i<fileBoxSize ;i++) {
			if($('input[name=approvalFile]').eq(i).val() == "") {
				$('input[name=approvalFile]').eq(i).remove();
			}	
		}
		
		//휴가신청서 퍼블리싱
		if(frm.formType.value == '휴가신청서') {
			frm.vacationType.value = $('#selectVacationType option:selected').val(); 
			if(frm.vacationType.value == '반차') {
				frm.startDate.value = frm.halfDate.value;
				frm.endDate.value = frm.halfDate.value;
				frm.halfDayType.value = $('input:radio[name=halfTimeType]:checked').val();
			}
		}
		
		alert('임시저장함에 저장되었습니다.')
		frm.action = '/approvalTempInsert';
		frm.submit();
	})
	
		$(window).on('beforeunload', function() {
			if(isChange) {
				return "form에 변경사항이 생겼습니다.";
			}
		})
	})
}



function checkFormValidity() {
	var frm = document.frmApproval;
	var checkForm = false;
	
	if(!frm.formTitle.checkValidity()) {
		checkForm = true;
	}
	
	if(frm.formDoc.checkValidity()) {
		checkForm = true;
	}
	
	if($('input[name=formType]').val() == '품의서') {
		if(!frm.formPurpose.checkValidity()) {
			checkForm = true;
		}
	}
	
	if($('input[name=formType]').val() == '구매품의서') {
		if(!frm.formPurpose.checkValidity()) {
			checkForm = true;
		}
		if(!frm.budget.checkValidity()) {
			checkForm = true;
		}
	}
	
	if($('input[name=formType]').val() == '휴가신청서') {
		if($('#selectVacationType option:selected').val() == '반차') {
			if(!frm.halfDate.checkValidity()) {
				checkForm = true;
			}
		}
		if($('#selectVacationType option:selected').val() == ''){
			checkForm = true;
		}
		if($('#selectVacationType option:selected').val() == '연차' || $('selectVacationType option:selected').val() == '월차') {
			if(!frm.startDate.checkValidity()) {
				checkForm = true;
			}
			if(!frm.endDate.checkValidity()) {
				checkForm = true;
			}
		}
	}
	return checkForm;
}


/* 상세 보기 */
var goView = function(formNo, formType) {
	var frm = document.frmApproval;
	frm.formNo.value = formNo;
	frm.formType.value = formType;
	frm.action = "/approvalSelectView";
	frm.submit();	
}

/* btn 기능 퍼블리싱 */
function funcApproval() {
		var frm = document.frmApproval;
		
		
	/* 검색 버튼 클릭 시 퍼블리싱*/
	$('#btnApprovalFind').on('click', function() {
		frm.findType.value = $('#selectFormType option:selected').val();
		if(frm.nowPlace.value == 'indexPlace') {
			frm.acrion = '/approvalIndex';
			frm.submit();
		}
		if(frm.nowPlace.value == 'searchPlace') {
			frm.acrion = '/approvalGoList';
			frm.submit();
		}
		
	})
		
		
	/*승인 버튼 클릭 시 퍼블리싱*/
	$('#btnFormApproval').on('click', function() {
		if(!frm.approvalComment.checkValidity()){
			alert("상세 사유를 입력해주세요.");
			return;
		}
		else {
			frm.makerComment.value = frm.approvalComment.value;
			frm.decisionState.value = 1;
			frm.action = '/updateDecisionState';
			frm.submit();
		}
	})

	/*반려 버튼 클릭 시 퍼블리싱*/
	
	$('#btnFormReject').on('click', function() {
		if(!frm.rejectComment.checkValidity()){
			alert("상세 사유를 입력해주세요.");
			return;
		}
		else {
			frm.makerComment.value = frm.rejectComment.value;
			frm.decisionState.value = -1;
			frm.action = '/updateDecisionState';
			frm.submit();
		}
	})
	
	/*삭제 버튼 클릭*/
	$('#btnApprovalDelete').on('click', function() {
		var deleteConfirm = confirm("정말로 삭제하시겠습니까?");
		if(deleteConfirm) {
			frm.action = '/approvalDeleteForm';
			frm.submit();
		}
	})
	
	
	/*상신취소 버튼 클릭.*/
	$('#btnApprovalCancelReport').on('click', function() {
		var cancelConfirm = confirm("작성 문서는 임시저장 상태로 변경됩니다. 진행하시겠습니까?");
		if(cancelConfirm) {
			frm.action = '/approvalUpdateForm';
			frm.submit();
		}
	})
		
	$('#btnFind').on('click',function() {
		frm.selectFormType.value = $('#selectFormType option:selected').val();
		frm.selectFormState.value = $('#selectFormState option:selected').val();
		frm.action = '/approvalIndex';
	})
	/*select 버튼*/
	$('input[name=btnApprovalSelect]').on('click', function() {
		var prevPlace = frm.nowPlace.value;
		if(prevPlace == 'indexPlace') {
			frm.action = '/approvalIndex';
		}
		else {
			frm.action = '/approvalGoList';
		}
		frm.submit();
	})	 

		$('#btnChangeFormType').on('click', function() {
			if( $('#selectChangeFormType option:selected').val() != '0') {
				frm.formType.value = $('#selectChangeFormType option:selected').val();
				frm.action = '/approvalGoFormType';
				frm.submit();
			}
			else {
				alert('결재 양식 종류를 선택해주세요.');
			}
		})
		/*view > update 버튼	*/
		$('#btnApprovalUpdate').on('click', function() {
			frm.action = '/approvalUpdate';
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
	inputPosition.setAttribute("name", "makerPosition");
	inputPosition.setAttribute("id", "makerContent");
	inputPosition.setAttribute("value", "");
	inputPosition.setAttribute("readonly", "readonly");
	
	tdPosition.appendChild(inputPosition);
	trPosition.appendChild(tdPosition);
	makerBox.appendChild(trPosition);
	
	
	//직원조회란 생성
	var trSign = document.createElement("tr");
	
	var tdSign= document.createElement("td");
	tdSign.setAttribute("height", "80px;");
	tdSign.setAttribute("width", "75px;");
	
	
	var aSign= document.createElement("input");
	aSign.setAttribute("id", "makerSignBtn");
	aSign.setAttribute("name", "makerSignBtn" + boxCnt);
	aSign.setAttribute("type", "button");
	aSign.setAttribute("value", "직원조회");
	
	//직원 조회 버튼 생성
	aSign.onclick = function() {   
		var winWidth = "500";
		var winHeight = "600";
		var url = '/approvalSelectMember';
		
		var winLeft = Math.ceil((window.screen.width - winWidth)/2);
		var winTop = Math.ceil((window.screen.height- winHeight)/2);
		var win = window.open(url, 'win', 'width=' + winWidth + ', height=' + winHeight + ', left=' + winLeft + ', top = ' + winTop );
		
		win.onbeforeunload = function(){
			inputName.value = $('#TempMakerName').val();
			inputPosition.value = $('#TempMakerPosition').val();
			inputMakerNo.value = $('#TempMakerNo').val();
			
			var checkName = $('.makerBox:last input[id=makerSignBtn]').attr('name');
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
	inputName.setAttribute("name", "makerName");
	inputName.setAttribute("id", "makerContent");
	inputName.setAttribute("value", "");
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
		alert(zone.childNodes.length);
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
	
	var makerOrder = document.createElement("input");
	makerOrder.setAttribute("type", "hidden");
	makerOrder.setAttribute("name", "makerOrder");
	makerOrder.setAttribute("value", boxCnt);
	tdSign.appendChild(makerOrder);
	
	var inputMakerNo = document.createElement("input");
	inputMakerNo.setAttribute("type", "hidden");	
	inputMakerNo.setAttribute("name", "makerNo");	
	inputMakerNo.setAttribute("value", "");	
	tdSign.appendChild(inputMakerNo);
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
	var vacationType = $('#selectVacationType option:selected').val();
	
	if(vacationType == '반차') {
		$('#startDate').attr('readOnly', 'readOnly');
		$('#endDate').attr('readOnly', 'readOnly');
		$("#halfTimeType").removeAttr('disabled');
		$("#halfDate").removeAttr('readOnly',);
		frm.vacationCnt.value = 0.5;
	}
	else if( vacationType == '연차' || vacationType == '월차'){
		$('#startDate').removeAttr('readOnly');
		$('#endDate').removeAttr('readOnly');
		$("#halfTimeType").attr('disabled', 'disabled');
		$("input[name=halfTimeType]").eq(0).attr('disabled', 'disabled');
		$("input[name=halfTimeType]").eq(1).attr('disabled', 'disabled');
		$("#halfDate").attr('readOnly', 'readOnly');
		frm.vacationCnt.value = null;
	}
}


function appendFile(zone, fileCnt) {
	var fileCnt = fileCnt;
	var div = document.createElement('div');
	div.setAttribute('class', 'fileContent');
	var divF = document.createElement('div');
	var divS = document.createElement('div');

	var fileInput = document.createElement('input');
	fileInput.setAttribute('type', 'file');
	fileInput.setAttribute('name', 'approvalFile');
	fileInput.setAttribute('class', 'approval-file');
	fileInput.setAttribute('id', 'approvalFile' + fileCnt);
	fileInput.setAttribute('multiple', 'multiple');
	fileInput.onchange = function() {
		$(this).next().html($(this).val());
	}
	
	var fileLabel = document.createElement('label');
	fileLabel.setAttribute('for', 'approvalFile' + fileCnt);
	fileLabel.setAttribute('class', 'approval-file-label');
	fileLabel.innerText = "파일 선택";
	var fileText = document.createElement('span');
	
	var createBtn = document.createElement('input');
	createBtn.setAttribute('type', 'button');
	createBtn.setAttribute('id', 'createBtnFile');
	createBtn.setAttribute('value', '파일 추가');
	createBtn.onclick = function() {
		var checkId = $('.fileContent:last input[type=file]').attr('id');
		if(zone.childNodes.length >= 2) {
			 if(zone.childNodes.length == 5) {
				alert('최대 4개까지 첨부 가능합니다.');
				return;
			}
		else {
			fileCnt++;
			appendFile(zone,fileCnt)
			}
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
		else if(zone.childNodes.length >= 6) {
			ele = event.srcElement;
			eleParent = ele.parentNode;
			zone. removeChild(eleParent);
			fileCnt++;
			appendFile(zone,fileCnt)
		}
		else {
			ele = event.srcElement;
			eleParent = ele.parentNode;
			zone. removeChild(eleParent);
		}
	}
	divF.appendChild(fileLabel);
	divF.appendChild(fileInput);	
	divF.appendChild(fileText);
	div.appendChild(divF);
	divS.appendChild(createBtn);	
	divS.appendChild(delBtn);	
	div.appendChild(divS);
	zone.appendChild(div);
}

function createFile(fileZone) {
	var zone = document.getElementById(fileZone);
	var fileCnt = 1;
	appendFile(zone, fileCnt)
}

function calculationDate() {
	var frm = document.frmApproval;
	var startDateStr = frm.startDate.value;
	var endDateStr = frm.endDate.value;
	
	var startDateArr = startDateStr.split('-');
	var endDateArr = endDateStr.split('-');
	
	var startDate = new Date(startDateArr[0], startDateArr[1]-1, startDateArr[2]);
	var endDate = new Date(endDateArr[0], endDateArr[1]-1, endDateArr[2]);
	if(startDate != "" && endDate != "") {
		var dateDiff = Math.ceil((endDate.getTime() - startDate.getTime())/(1000*3600*24));
		if(dateDiff < 0) {
			alert('기간을 다시 입력해주세요.');
		}
		else if(dateDiff > 0) {
			frm.vacationCnt.value = dateDiff;
		}
	}
}

function goPage(page) {
	var frm = document.frmApproval;
	frm.nowPage.value = page;
	frm.action = '/approvalIndex';
	frm.submit();
}

function goChooseSelectPage(page) {
	var frm =document.frmApproval;
	frm.nowChooseSelectPage.value = page;
	
	frm.action = "/approvalGoList";
	frm.submit();
}

function goOutgoingPage(page) {
	var frm = document.frmApproval;
	frm.nowOutgoingPage.value = page;
	frm.action= "/approvalIndex";
	frm.submit();
}
function receiverPage(page) {
	var frm = document.frmApproval;
	frm.nowReceiverPage.value = page;
	frm.action= "/approvalIndex";
	frm.submit();
}

function goMemberPage(page) {
	var frm = document.frmMember;
	frm.nowPage.value = page;
	frm.action= "/approvalSelectMember";
	frm.submit();
}
function updateChooseMaker() {
	var winWidth = "500";
	var winHeight = "600";
	var ele = event.srcElement;

	
	var winLeft = Math.ceil((window.screen.width - winWidth)/2);
	var winTop = Math.ceil((window.screen.height- winHeight)/2);
	var win = window.open('/approvalSelectMember', 'win', 'width=' + winWidth + ', height=' + winHeight + ', left=' + winLeft + ', top = ' + winTop );

	win.onbeforeunload = function(){TempMakerPosition
		$(ele).parent().parent().prev().children().children().val($('#TempMakerPosition').val());
		$(ele).parent().parent().next().children().children().val($('#TempMakerName').val());
		$(ele).next().next().next().val($('#TempMakerName').val());
	}
}

function deleteChooseMaker() {
	var aaa = event.srcElement;
	var p = aaa.parentNode.parentNode.parentNode.parentNode;
	var pp = p.parentNode;
	pp.removeChild(p);
}

function goFormList(formType) {
	var frm = document.frmApproval;
	frm.formType.value = formType;
	frm.action='/approvalGoFormType';
	frm.submit();
}