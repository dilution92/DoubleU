/**
 * 공통적으로 필요한 스크립팅
* 작성자 : 송연주
* 작성일 :  21.02.17
  내용 : 
	1. 전체 선택을 눌렀을 때 모든 체크박스 클릭
	2. 항목을 눌렀을 때 체크박스가 클릭 되지 않았다면 alert창 띄우기
	3. 메일 읽을 때 ☆ -> ★ 로 변경되기
	4. 메일 편지 모양을 누르면 열림 표시로 변경
	5. 체크박스를 클릭하고 읽음을 눌렀을 때 아이콘 변경(미완성)
	   - 전체적으로 바뀌는 것들이 문제

	추가 : 21.02.18
	6. 메일쓰기 백엔드 작업
	 - 메일 쓰고 result.jsp 확인 버튼 눌렀을 때 function() 추가;

	추가 : 21.02.19
	7. 메일 검색 Bar
 */



// 1.전체 선택을 눌렀을 때 모든 체크박스 클릭
 selectChkBox = function(selectAll) {
	
	var check_count = document.getElementsByName("chkBox");
	check_count.forEach((checkbox) => {
		checkbox.checked = selectAll.checked;
	})
		
}


// 2.항목을 눌렀을 때 체크박스가 클릭 되지 않았다면 alert창 띄우기

var selectSideBtn = function() {
	
	// 스팸차단
	$("#emailSpamBlockBtn").click( function(){   
            if($(".chkBoxClass").is(":checked") == false){
                swal("메일을 선택해주세요.")
                return false;
            }

     });

	// 답장하기
	$("#emailSendBtn").click( function(){ 
	            if($(".chkBoxClass").is(":checked") == false){
	                swal("메일을 선택해주세요.")
	                return false;
	            }
	     });
	
	// 삭제하기
	$("#emailDeleteBtn").click( function(){  
	            if($(".chkBoxClass").is(":checked") == false){
	                swal("메일을 선택해주세요.")
	                return false;
	            }
	     });
	
	// 전달하기
	$("#emailPassBtn").click( function(){ 
	            if($(".chkBoxClass").is(":checked") == false){
	                swal("메일을 선택해주세요.")
	                return false;
	            }
	     });
	
	// 읽음
	$("#emailReadBtn").click( function(){ 
	            if($(".chkBoxClass").is(":checked") == false){
	                swal("메일을 선택해주세요.")
	                return false;
	            }

	     });

}

// 3.즐겨찾기

var favoritesBtn = function() {
	
	$(".bi-star").click(function () { 
		$(this).toggleClass("bi-star-color"); 
	});
}

// 4. 메일 읽음 아이콘 변경
var readBtn = function() {
	$(".bi-envelope").click(function () { 
		$(this).toggleClass("bi-envelope bi-envelope-open"); 
	});

}

// 5. 읽음 버튼을 눌렀을 때 아이콘 변경 (전체 클릭되는 문제...)

var sidebarReadBtn= function(){
	
	$("#emailReadBtn").click( function(){ 
		$('input:checkbox[name=chkBox]:checked').each(function() {
			
			var test = $('input:checkbox[name=chkBox]:checked');
			console.log(test)
			
			 $('.bi-envelope').toggleClass("bi-envelope bi-envelope-open");
		})
		
     });
	
}



// 6. result.jsp 확인 function()
var goRevMainBtn = function() {
		var goRevMailBtn = document.querySelector('#goRevMailBtn');
		var goBtnHandler = function() {
		location.href = "/emailIndex";
	}
	
	goRevMailBtn.addEventListener('click', goBtnHandler);
}
	
	

// 7. 검색Bar

var searchEmailBar = function() {
	
	var emailFindStr = document.querySelector('#emailFindStr');
	var emailSearchTitle = document.querySelector('#emailSearchTitle');
	var emailForm = document.EmailForm;
	
	
	// 이벤트 핸들러
	var emailFindStrHandler = function() {
		emailForm.action = '/selectFindStr';
		emailForm.submit();
	}
	
	emailSearchTitle.addEventListener('click', emailFindStrHandler);
}












