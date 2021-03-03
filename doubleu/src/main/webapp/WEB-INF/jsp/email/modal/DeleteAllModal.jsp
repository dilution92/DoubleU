<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <div class="modal fade bs-example-modal-lg"  id="deleteAllEmail" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
	   <div class="modal-dialog modal-lg">
	       <div class="modal-content modalSpamEmail">
	           <div class="modalSpamEmailFolder">
	               <h4>삭제하기</h4>
	               <p>정말로 모든 메일을 삭제하시겠습니까?</p>
					<br>
	               <div class="modalSpamEmailFolderBtn">
	                   <button class="btn btn-primary btn-lg btn-primary btn-sm" onclick="deleteAllBtn()" role="button">삭제하기</button>
	                   <button class="btn btn-primary btn-lg btn-primary btn-sm" role="button">취소하기</button>
	               </div>
	           </div>
	       </div>
	   </div>  
  </div>
  <script>
  var deleteAllBtn = function() {

		var valueArr = new Array();
		var list = $('input:checkbox[name=chkBox]:checked')
		
		for(var i=0; i<list.length; i++) {
			if(list[i].checked) {
				valueArr.push(list[i].value)
			};
		}
		
		var frm = document.emailForm;
		var deleteList = frm.deleteBtnList;
		deleteList.value = valueArr;
		console.log(deleteList.value)
		frm.action = "/emailDeleteAll"
		frm.submit();
  }
  </script>