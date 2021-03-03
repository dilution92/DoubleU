/**
 * 
 */


/* 월간 일정*/

// 이전 다음 버튼
$(function(){
    $("#Mmonth").change(function(){
    	var changedMonth = parseInt($('#Mmonth').val());
    	var url = "/MonthSelectedMonth?changedMonth="+changedMonth;
    	location.href=url;
    })
    
    $("#Myear").change(function(){
    	var changedyear = parseInt($('#Myear').val());
    	var url = "/MonthSelectedYear?changedYear="+changedyear;
    	location.href=url;
    })
    
})


// 해당 날짜 파란색 테두리
$(document).ready(function(){
	var year = $("#Myear").val();
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
	
	 $("#Mmonth").val(month).attr("selected","selected");
})

/* 주간 일정*/

// 이전 다음 버튼
$(function(){
    $("#Wmonth").change(function(){
    	var changedMonth = parseInt($('#Wmonth').val());
    	var url = "/WeekSelectedMonth?changedMonth="+changedMonth;
    	location.href=url;
    })
    
    $("#Wyear").change(function(){
    	var changedyear = parseInt($('#Wyear').val());
    	var url = "/WeekSelectedYear?changedYear="+changedyear;
    	location.href=url;
    })
})
// 월 셀렉박스 월 받아오기
$(document).ready(function(){
	var month = $("#monthcome").val();
	
	 $("#month").val(month).attr("selected","selected");
})

// 해당 날짜 파란색 테두리
$(document).ready(function(){
	var year = $("#Wyear").val();
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
	
	 $("#Wmonth").val(month).attr("selected","selected");
})



/* 일간 일정 */

// 이전 다음 버튼
$(function(){
     $("#month").change(function(){
    	var changedMonth = parseInt($('#month').val());
    	console.log(month+"셀렉박스 월 값");
    	var url = "/DaySelectedMonth?changedMonth="+changedMonth;
    	location.href=url;
    })
    
    $("#year").change(function(){
    	var changedyear = parseInt($('#year').val());
    	console.log(changedyear+"셀렉박스 년 값");
    	var url = "/DaySelectedYear?changedYear="+changedyear;
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
$(".calender_modal").click(function(){
	$('#btn_modify').submit();
})



$(function(){
	$("#btn_modify").click(function(){
		/* 기간 쪼개기 */
		var cds = document.getElementsByName("calenderDateStart")[0].value;
		var cts = document.getElementsByName("calenderTimeStart")[0].value;
		var cde = document.getElementsByName("calenderDateEnd")[0].value;
		var cte = document.getElementsByName("calenderTimeEnd")[0].value;

		var cdsList = cds.split('-');
		var cds1 =  cdsList[0];
		var cds2 =  cdsList[1];
		var cds3 =  cdsList[2];

		var ctsList = cts.split(':');
		var cts1 = ctsList[0];
		var cts2 = ctsList[1];

		var cdeList = cde.split('-');
		var cde1 =  cdeList[0];
		var cde2 =  cdeList[1];
		var cde3 =  cdeList[2];

		var cteList = cte.split(':');
		var cte1 = cteList[0];
		var cte2 = cteList[1];

		document.getElementsByName("calenderStartYear")[0].value = cds1;
		document.getElementsByName("calenderStartMonth")[0].value = cds2;
		document.getElementsByName("calenderStartDay")[0].value = cds3;

		document.getElementsByName("calenderStartTime")[0].value = cts1;
		document.getElementsByName("calenderStartMinute")[0].value = cts2;

		document.getElementsByName("calenderEndYear")[0].value = cde1;
		document.getElementsByName("calenderEndMonth")[0].value = cde2;
		document.getElementsByName("calenderEndDay")[0].value = cde3;

		document.getElementsByName("calenderEndTime")[0].value = cte1;
		document.getElementsByName("calenderEndMinute")[0].value = cte2;
		
		
		var c1 = cde1+cde2+cde3;
		var c2 = cds1+cds2+cds3;
		console.log(c1+"c1");
		console.log(c2+"c2");
	
		if(cds!=null){
			
			var chkperiod = parseInt(c1)-parseInt(c2);
			
			var c3 = parseInt(chkperiod);
			
			var v1 = "장기";
			var v2 = "단기";
			if(c3>0){
				document.getElementsByName("calenderType")[0].value = v1;
			}else{
				document.getElementsByName("calenderType")[0].value = v2;
			}
		}
		
		$("#frm_modify").submit();
	})
	
	$("#btn_delete").click(function(){
		/* 기간 쪼개기 */
		var cds = document.getElementsByName("calenderDateStart")[0].value;
		var cts = document.getElementsByName("calenderTimeStart")[0].value;
		var cde = document.getElementsByName("calenderDateEnd")[0].value;
		var cte = document.getElementsByName("calenderTimeEnd")[0].value;

		var cdsList = cds.split('-');
		var cds1 =  cdsList[0];
		var cds2 =  cdsList[1];
		var cds3 =  cdsList[2];

		var ctsList = cts.split(':');
		var cts1 = ctsList[0];
		var cts2 = ctsList[1];

		var cdeList = cde.split('-');
		var cde1 =  cdeList[0];
		var cde2 =  cdeList[1];
		var cde3 =  cdeList[2];

		var cteList = cte.split(':');
		var cte1 = cteList[0];
		var cte2 = cteList[1];

		document.getElementsByName("calenderStartYear")[0].value = cds1;
		document.getElementsByName("calenderStartMonth")[0].value = cds2;
		document.getElementsByName("calenderStartDay")[0].value = cds3;

		document.getElementsByName("calenderStartTime")[0].value = cts1;
		document.getElementsByName("calenderStartMinute")[0].value = cts2;

		document.getElementsByName("calenderEndYear")[0].value = cde1;
		document.getElementsByName("calenderEndMonth")[0].value = cde2;
		document.getElementsByName("calenderEndDay")[0].value = cde3;

		document.getElementsByName("calenderEndTime")[0].value = cte1;
		document.getElementsByName("calenderEndMinute")[0].value = cte2;
		
		
		var c1 = cde1+cde2+cde3;
		var c2 = cds1+cds2+cds3;
		console.log(c1+"c1");
		console.log(c2+"c2");
	
		if(cds!=null){
			
			var chkperiod = parseInt(c1)-parseInt(c2);
			
			var c3 = parseInt(chkperiod);
			
			var v1 = "장기";
			var v2 = "단기";
			if(c3>0){
				document.getElementsByName("calenderType")[0].value = v1;
			}else{
				document.getElementsByName("calenderType")[0].value = v2;
			}
		}
		$("#frm_modify").attr("action", "/CalenderDelete");
		
		
		$('#Calender_delete_modal').modal();
		$("#modal_delete").click(function(){
			$("#frm_modify").submit();
		})
	})
})

$(function(){
	$('#all_con').change(function(){
	console.log("일정변경 시작");
	if($('#all_con').is(":checked")){
		console.log("일정 체크된 경우");
		$('.전사일정').show();
	}else{
		console.log("일정 체크 안된 경우");
		$('.전사일정').hide();
	}
	})
	$('#group_con').change(function(){
	console.log("일정변경 시작");
	if($('#group_con').is(":checked")){
		console.log("일정 체크된 경우");
		$('.그룹일정').show();
	}else{
		console.log("일정 체크 안된 경우");
		$('.그룹일정').hide();
	}
	})
	$('#my_con').change(function(){
	console.log("일정변경 시작");
	if($('#my_con').is(":checked")){
		console.log("일정 체크된 경우");
		$('.내일정').show();
	}else{
		console.log("일정 체크 안된 경우");
		$('.내일정').hide();
	}
})

})
