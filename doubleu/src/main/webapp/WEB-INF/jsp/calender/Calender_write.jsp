<%@page import="com.doubleu.calender.vo.CalenderParticiptant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- bootstrap CDN -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
<script
  src="https://code.jquery.com/jquery-3.5.1.js"
  integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
  crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>


<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
	
<link rel="stylesheet" href="/css/calender/Calender.css">

<!-- main page CSS -->
<link rel="stylesheet" href="/css/MainIndex.css">
</head>

<body>
	<!-- 그룹웨어 GNB -->
	<header class="container-fluid main-gnb">
		<jsp:include page="../MainPage/header.jsp"></jsp:include>
	 </header>
	 <!-- 그룹웨어 GNB code 끝 -->
	 
	 
<aside id="calender_aside">
	<!-- 일정 사이드바  -->
	<jsp:include page="Calender_aside.jsp"></jsp:include>
</aside>

<main id="calender_main">
    <div id="calender_main_content">
    	<h2>일정 입력</h2>
    	<form action="/CalenderInsertR" method="post" id="InsertForm">
    		<input type="hidden" value="${member.memberName }" name="calenderWriter">
			<table class="table table-bordered" >
    			<tr>
    				<td width="20%">제목</td>
    				<td width="80%"> <input type="text" name="calenderSubject"> </td>
    			</tr>
    			<tr>
    				<td>기간</td>
    				<td> 
    				<input type="date" name="calenderDateStart">
    				<input type="time" name="calenderTimeStart">
    				<input type="date" name="calenderDateEnd"> 
    				<input type="time" name="calenderTimeEnd">
    				
    				
    				<input type="hidden" name="calenderStartYear">
    				<input type="hidden" name="calenderStartMonth">
    				<input type="hidden" name="calenderStartDay">
    				<input type="hidden" name="calenderStartTime">
    				<input type="hidden" name="calenderStartMinute">
    				<input type="hidden" name="calenderEndYear">
    				<input type="hidden" name="calenderEndMonth">
    				<input type="hidden" name="calenderEndDay">
    				<input type="hidden" name="calenderEndTime">
    				<input type="hidden" name="calenderEndMinute">
    				
    				<input type="hidden" name="calenderType" value="">
    				
    				</td>
    			</tr>
    			<tr>
    				<td>그룹분류</td>
    				<td> 
    					<select name="calenderGroup">
    						<option value="">그룹선택</option>
						    <option value="그룹일정">그룹일정</option>
						    <option value="내일정">내 일정</option>
    					</select>
    				</td>
    			</tr>
    			<!-- <tr>
    				<td>참석자
							<input type="button" class="btn btn-outline-primary btn-sm"
								data-toggle="modal" data-target="#Calender_parti_modal" role="button"
								value="주소록">
    				</td>
    				<td> <input type="text" name="calPartiList1">  
    					<input type="text" name="calPartiList1">
    				</td>
    			</tr> -->
    			<tr>
    				<td>장소</td>
    				<td> <input type="text" name="calenderPlace"> </td>
    			</tr>
    			<tr>
    				<td>내용</td>
    				<td> <textarea rows="10" cols="80" name="calenderContent"></textarea> </td>
    			</tr>
			</table>
				<div>
					<input type="button" class="btn btn-primary" value="일정작성" id="InsertFormSubmit">
					<input type="button" class="btn btn-primary" value="돌아가기">
				</div>
    	</form>
    </div>
    
    <!--  저장 모달창 -->
	<div class="modal fade" id="Calender_insert_modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
 		<jsp:include page="Calender_write_pop_modal.jsp"></jsp:include>
	</div>	
	
	<!-- 참석자 모달창 -->
	<div class="modal fade" id="Calender_parti_modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
 		<jsp:include page="Calender_parti_modal.jsp"></jsp:include>
	</div>
	
</main>
<script type="text/javascript">
$(function(){
	$("#InsertFormSubmit").click(function(){
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
		
        $('#Calender_insert_modal').modal();
    });
    
    $("#modal_insert").click(function(){
        $('#InsertForm').submit();
    })
    
    $("calenderDateStart").click(function(){
        console.log(document.getElementsByName("calenderDateStart")[0].value);
    })
    
    
    // 전부체크 버튼
    
    $("input:checkbox[name=allchk]").click(function(){
	   var checked = $(this).is(':checked');
	   if(checked){
		   $('input:checkbox[name=memberchk]').prop('checked',true);
	   }else{
		   $('input:checkbox[name=memberchk]').prop('checked',false);
	   }
	});
    
    $("#inputButton").click(function(){
   	 	var checked = $('.memberChk').is(':checked');
   	 	
   	 	if(checked){
   	 	var team = $(this).next().val();
   		var name = $(this).next().next().val();
   		var position = $(this).next().next().next().val();
   		
   		console.log(team+"@@@@@@@@@@@@@@@@@@@@@@@");
    	console.log(name+"@@@@@@@@@@@@@@@@@@@@@@@");
   	 	}
   	 	
   	/* 	 if(("input:checkbox[name=memberchk]").is(":checked") ==true){
   			var team = $(this).parent().find('span').eq(0).val();
        	var name = $(this).parent().find('span').eq(1).val();
        	var position = $(this).parent().find('span').eq(2).val();
        	
        	
        	
        	var c1 = document.createElement('span');
        	var c2 = document.createElement('span');
        	var c3 = document.createElement('span');
        	
        	c1.append(team);
        	c2.append(name);
        	c3.append(position);
        	
        	$(".outputMember").append(c1);
        	$(".outputMember").append(c2);
        	$(".outputMember").append(c3);
   		 } */
    		
    	
    })
    
})



</script>

</body>
</html>