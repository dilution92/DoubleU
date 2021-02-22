/**
 작성자 : 송연주
 작성일 : 21.02.22


 로그인 시 데이터 유효성 검사 	

*/

var btnLoginClick = function() {

	var btn = document.querySelector('#loginBtn');

	// 이벤트 핸들러	
	btn.addEventListener('click', function() {
		
		
		var LoginForm = document.querySelector('#LoginFormId');
		var userId = LoginForm.querySelector('#userId');
		var userPwd = LoginForm.querySelector('#userPwd');
	
		// 데이터 유효성
		if(userId.value == "") {
			swal('아이디를 확인해주세요.')
			userId.focus();
			return;
		}
		
		if(userPwd.value == "") {
			swal('비밀번호를 확인해주세요.');
			userPwd.focus();
			return;
		}
		
		LoginForm.action = "/loginCheck";
		LoginForm.submit();
		
	});
}
 



