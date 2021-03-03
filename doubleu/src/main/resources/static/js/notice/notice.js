/* 공지사항 insert 게시기한 radio 선택시 활성/비활성 */ 
$(document).ready(function(){
 
    // 라디오버튼 클릭시 이벤트 발생
    $("input:radio[name=noticePostType]").click(function(){
        if($("input[name=noticePostType]:checked").val() == "설정"){
           $("#searchDateOne").attr("readonly",false);
		   $("#searchDateTwo").attr("readonly",false);
            // radio 버튼의 value 값이 설정이면 활성화
 
        }else if($("input[name=noticePostType]:checked").val() == "영구"){
              $("#searchDateOne").attr("readonly",true);
              $("#searchDateTwo").attr("readonly",true);
            // radio 버튼의 value 값이 영구면 비활성화
        }
    });
});

/* 경조사 insert 게시기한 radio 선택시 활성/비활성 */
$(document).ready(function(){
 
    // 라디오버튼 클릭시 이벤트 발생
    $("input[name=familyeventPostType]").click(function(){
        if($("input[name=familyeventPostType]:checked").val() == "설정"){
           $("#searchDateOne").attr("readonly",false);
		   $("#searchDateTwo").attr("readonly",false);
            // radio 버튼의 value 값이 설정이면 활성화
 
        }else if($("input[name=familyeventPostType]:checked").val() == "영구"){
			  $("#searchDateOne").val('');
			  $("#searchDateTwo").val('');
              $("#searchDateOne").attr("readonly",true);
              $("#searchDateTwo").attr("readonly",true);
            // radio 버튼의 value 값이 영구면 비활성화
        }
    });
});

/* notice_insert 게시기한 날짜 비교 */
$(function(){
    $('#searchDateTwo').change(function (){
        var date1 = $('#searchDateOne').val();
        var date2 = $('#searchDateTwo').val();
		if(date1.valueOf() != "" && date2.valueOf() != ""){
			if(date1.valueOf() > date2.valueOf()){
			alert("날짜를 다시 확인해주세요!!");
			$('#searchDateOne').val("");
			$('#searchDateTwo').val("");			
			}
   	 	}
	})
})

/* notice_insert 저장하기 모달 이후 submit */
$(function(){
   $("#noticeSubmit1").click(function(){
        $('#staticBackdrop').modal();
    });
    
    $("#noticeSubmit2").click(function(){
        $('#noticeInsertForm').submit();
    })
})

$(function(){
   $("#familyevnetSubmit1").click(function(){
        $('#staticBackdrop').modal();
    });
    
    $("#noticeSubmit2").click(function(){
        $('#familyeventInsertForm').submit();
    })
})

/* notice_update 수정하기 모달 이후 submit */
$(function(){
   $("#noticeUpdate1").click(function(){
        $('#staticBackdrop1').modal();
    });
    
    $("#noticeUpdate2").click(function(){
        $('#noticeUpdateForm').submit();
    })
})

$(function(){
   $("#familyevnetUpdate1").click(function(){
        $('#staticBackdrop1').modal();
    });
    
    $("#noticeUpdate2").click(function(){
        $('#familyeventUpdateForm').submit();
    })
})

/* notice_update 게시기한 값 끌어오기 */
$(document).ready(function(){
	if($("#familyeventPostTypehidden").val() == "설정"){
   	   $("#r2").attr("checked",true);
    }else if($("familyeventPostTypehidden").val() != "설정"){
       $("#r1").attr("checked",true);
    }
});

/* notice_update 분류 값 끌어오기 */
$(document).ready(function(){
	if($("#familyeventTypehidden").val() == "결혼"){
   	   $("#결혼").attr("selected",true);
    }else if($("#familyeventTypehidden").val() != "결혼"){
       $("#부고").attr("selected",true);
    }
});

/* notice_update 수정 모달 이후 submit */
$(function(){
   $("#noticeUpdate1").click(function(){
        $('#staticBackdrop1').modal();
    });
    
    $("#noticeUpdate2").click(function(){
        $('#noticeUpdateForm').submit();
    })
})
/* notice_delete 삭제 모달 이후 submit */
$(function(){
   $("#noticedelete1").click(function(){
        $('#staticBackdrop2').modal();
    	})
    })

$(function(){
   $("#familyevnetdelete1").click(function(){
        $('#staticBackdrop2').modal();
    	})
    })

/* 파일명 읽기 */
$(function(){
	$('#validatedCustomFile').on('change',function(){
	    //get the file name
	    var fileName = $(this).val();
	    //replace the "Choose a file" label
	    $(this).next('.custom-file-label').html(fileName);
	})
})

/* 임시저장 -> 해야함..*/
$(function(){
   $("#temporaryStorage").click(function(){
	alert("'ㅅ'");
	localStorage.setItem(temporaryStorage, temporaryStorageArr);
	temporaryStorageArr = [{
		"#exampleFormControlSelect1":"${obj.familyeventSubject }",
		
		}]
		alert("${obj.familyeventSubject }")

	})
})

/* 페이징 */
function goPage1(page) {
	console.log(page);
	var frm = document.noticeForm;
	frm.nowPage.value = page;
	frm.action = '/noticeIndex';
	frm.submit();
}

function goPage(page) {
	console.log(page);
	var frm = document.noticeForm;
	console.log(frm);
	frm.nowPage.value = page;
	frm.action = '/familyeventIndex';
	frm.submit();
}

/* 중요공지 상단 고정 색상 지정 */
$(function(){
   if($(td.eq(1)).val() == "중요공지"){
	  $("#noticeTypeColor").css("background-color","blue");
	}else if($(td.eq(1)).val() != "중요공지"){
	  $("#noticeTypeColor").css("background-color", "");
}});