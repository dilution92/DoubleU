<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <div class="modal fade bs-example-modal-lg"  id="deleteEmail" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
	   <div class="modal-dialog modal-lg">
	       <div class="modal-content modalSpamEmail">
	           <div class="modalSpamEmailFolder">
	               <h4>삭제하기</h4>

	               <br>
	               <p>해당 메일을 정말 삭제하시겠습니까?</p>
	               
	               <br>
	               <div class="modalSpamEmailFolderBtn">
	                   <button onclick="DeleteBtn()" class="btn btn-primary btn-lg btn-primary btn-sm" role="button">삭제하기</button>
	                   <button class="btn btn-primary btn-lg btn-primary btn-sm" onclick="location.href='/emailIndex'" role="button">취소하기</button>
	               </div>
	           </div>
	       </div>
	   </div>  
  </div>
  
  <script>

  </script>