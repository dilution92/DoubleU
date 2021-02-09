/**
 * 
 */

var view = function(serial) {
	var frm = document.frmApproval;
	frm.viewSerial.value = serial;
	
	frm.action = "E_Approval_home.jsp?mainJob=E_Approval_view_work.jsp"
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