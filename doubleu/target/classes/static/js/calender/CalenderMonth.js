/**
 * 
 */




$(function(){
	$(".calender_modal").click(function(){
    	var param = $(this).attr("id");
    	/*var urlId = "/CalenderMonthModal?id="+param;
*/
		var no = $(this).children().eq(0).val();
		var startDate = $(this).children().eq(1).val();
		var startTime = $(this).children().eq(2).val();
		var endDate = $(this).children().eq(3).val();
		var endTime = $(this).children().eq(4).val();
		var type = $(this).children().eq(5).val();
		var subject = $(this).children().eq(6).val();
		var content = $(this).children().eq(7).val();
		var place = $(this).children().eq(8).val();
		var writer = $(this).children().eq(9).val();
		var group = $(this).children().eq(10).val();
		var time = $(this).children().eq(11).val();
		
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

$(document).ready(function(){
	var month = $("#monthcome").val();
	
	 $("#month").val(month).attr("selected","selected");
})

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
