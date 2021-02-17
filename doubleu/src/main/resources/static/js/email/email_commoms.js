/**
 * 공통적으로 필요한 스크립팅
* 작성자 : 송연주
* 작성일 :  21.02.17
  내용 : 
	1.전체 선택을 눌렀을 때 모든 체크박스 클릭
	2. 항목을 눌렀을 때 체크박스가 클릭 되지 않았다면 alert창 띄우기
 */





// 전체 선택을 눌렀을 때 모든 체크박스 클릭
 selectChkBox = function(selectAll) {
	
	var check_count = document.getElementsByName("chkBox");
	check_count.forEach((checkbox) => {
		checkbox.checked = selectAll.checked;
	})
		
}


// 항목을 눌렀을 때 체크박스가 클릭 되지 않았다면 alert창 띄우기

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
	$("#emailWriteBtn").click( function(){ 
	            if($(".chkBoxClass").is(":checked") == false){
	                swal("메일을 선택해주세요.")
	                return false;
	            }
	     });

}

// 즐겨찾기

var test = function() {
	for(var i=0; i< biStar.length; i++) {
			console.log(biStar.length);
			biStar[i].style.backgroundColor = 'yellow';
			biStar[i].style.borderRadius = '15px'
		}
}

var favoritesBtn = function() {
	var biStar = document.querySelectorAll('.bi-star');
	console.log(biStar);
	
}

            