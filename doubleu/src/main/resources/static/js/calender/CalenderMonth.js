/**
 * 
 */


/* 월간 일정*/

// 이전 다음 버튼
$(function(){
    $("#month").change(function(){
    	var changedMonth = parseInt($('#month').val());
    	var url = "/MonthSelectedMonth?changedMonth="+changedMonth;
    	location.href=url;
    })
    
    $("#year").change(function(){
    	var changedyear = parseInt($('#year').val());
    	var url = "/MonthSelectedYear?changedYear="+changedyear;
    	location.href=url;
    })
    
})


/* 주간 일정*/

// 이전 다음 버튼
$(function(){
    $("#month").change(function(){
    	var changedMonth = parseInt($('#month').val());
    	var url = "/WeekSelectedMonth?changedMonth="+changedMonth;
    	location.href=url;
    })
    
    $("#year").change(function(){
    	var changedyear = parseInt($('#year').val());
    	var url = "/WeekSelectedYear?changedYear="+changedyear;
    	location.href=url;
    })
})






/* 공통 부분 */

// 모달 창
$(function(){
	$(".calender_modal").click(function(){
    	var param = $(this).attr("id");
    	/*var urlId = "/CalenderMonthModal?id="+param;
*/
		var no = $(this).children().eq(1).val();
		var startDate = $(this).children().eq(2).val();
		var startTime = $(this).children().eq(3).val();
		var endDate = $(this).children().eq(4).val();
		var endTime = $(this).children().eq(5).val();
		var type = $(this).children().eq(6).val();
		var subject = $(this).children().eq(7).val();
		var content = $(this).children().eq(8).val();
		var place = $(this).children().eq(9).val();
		var writer = $(this).children().eq(10).val();
		var group = $(this).children().eq(11).val();
		var time = $(this).children().eq(12).val();
		
    	$/*.ajax({
    		type: "GET",
    		url: urlId,
    		success: function(){
    			alert('모달 성공')
    		}, error: function(){
    			alert('모달 실패')
    		}
    		
    	})*/
		$('#modalCalenderNo').val(no);
		$('#modalCalenderDateStart').val(startDate);
		$('#modalCalenderTimeStart').val(startTime);
		$('#modalCalenderDateEnd').val(endDate);
		$('#modalCalenderTimeEnd').val(endTime);
		$('#modalCalenderType').val(type);
		$('#modalCalenderSubject').val(subject);
		$('#modalCalenderContent').val(content);
		$('#modalCalenderPlace').val(place);
		$('#modalCalenderWriter').val(writer);
		$('#modalCalenderGroup').val(group);
		$('#modalCalenderTime').val(time);
		
		$('#Calender_detail_modal').modal("show");
    })
})

// 해당 날짜 파란색 테두리
$(document).ready(function(){
	var year = $("#year").val();
	var month = $("#monthcome").val();
	if(month<10){
		month = "0"+month;
	}
	var day = $("#daycome").val();
	if(day<10){
		day = "0"+day;
	}
	var targetToday = document.getElementsByClassName(year+month+day)[0];
	targetToday.style.border="5px skyblue solid";
})

// 월 셀렉박스 월 받아오기
$(document).ready(function(){
	var month = $("#monthcome").val();
	
	 $("#month").val(month).attr("selected","selected");
})
/* document.getElementById("testDiv").style.backgroundColor = "#000000";  //RGB코드
*/
/*$(document).ready(function(){
	var myColor = document.getElementsByClassName("내일정");
	var groupColor = document.getElementsByClassName("그룹일정");
	var allColor = document.getElementsByClassName("전사일정");
	myColor.attr("class", "bi bi-diamond bi-diamond-color1");
	groupColor.attr("class", "bi bi-diamond bi-diamond-color2");
	allColor.attr("class", "bi bi-diamond bi-diamond-color3");
})*/

