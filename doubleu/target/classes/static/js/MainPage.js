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
$(function(){
	$(".size_chk").filter(function(){
		return this.value != "0";
	}).next().css('background-color','skyblue');
});