/**
 *
 * 작성일 : 21.03.01 
 * 작성자 : 송연주 
 * 항목 : 메일 쓰기

	임시 저장 js
 */


var goViewTemp =  function(EmailNo) {
	var frm = document.emailForm;
	frm.emailNoBtn.value = EmailNo;
	
	console.log(frm.emailNoBtn.value);
	
	frm.action = '/emailTempRead';
	frm.submit();
}
