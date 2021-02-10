/**
 * 
 */

var goView = function(formNo) {
	var frm = document.frmApproval;
	frm.formNo.value = formNo;
	
	frm.action = "/approvalGoView"
	frm.submit();	
}

function funcApproval() {
		var frm = document.frmApproval;
		
	$('#btnApprovalSave').on('click', function() {
		alert('정상적으로 등록되었습니다.');
		frm.action = '/approvalInsert';
		frm.submit();
	})
	
	$('#btnApprovalTempSave').on('click', function() {
		alert('임시저장함에 저장되었습니다.')
		frm.action = '/approvalTempInsert';
		frm.submit();
	}) 
}

function chooseMakers() {
	var win = window.open('ElectrinicApproval/E_Approval_choose_decisionMakers.jsp', 'win', 'width=400px, height=100px, left=300px, top=300px;')
}
