/**
 * 
 */

var view = function(serial) {
	var frm = document.frmApproval;
	frm.viewSerial.value = serial;
	
	frm.action = "E_Approval_home.jsp?mainJob=E_Approval_view_work.jsp"
	frm.submit();	
}