/**
 * 
 */

function goApprovalView() {
	alert("goApprovalView");
	var frm = document.frmMainIndex;
	frm.formNo.value = formNo;
	frm.formType.value = formType;
	frm.action = "/approvalSelectView";
	frm.submit();	
}
