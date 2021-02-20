<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!-- 이동 모달창 -->
<div class="modal fade bs-example-modal-lg" id="moveEmailRev" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
   <div class="modal-dialog modal-lg" style="margin: 30px auto;">
       <div class="modal-content modalMoveContent">
           <div class="modalMoveBtn">
               <h4>이동</h4>
               
               <ul style="font-size: 20px;">
                   <li>메일함</li>
                   <li class="btn btn-outline-primary btn-sm">받은 메일함</li>
                   <li class="btn btn-outline-primary btn-sm">중요 메일함</li>
                   <li class="btn btn-outline-primary btn-sm">임시 보관함</li>
                   <li class="btn btn-outline-primary btn-sm">내가 쓴 메일함</li>
                   <li class="btn btn-outline-primary btn-sm">스팸 메일함</li>
                   <li class="btn btn-outline-primary btn-sm">휴지통</li>
               </ul>
               
               <ul style="font-size: 20px;">
                   <li>내 메일함</li>
                   <li class="btn btn-outline-primary btn-sm">NOTES</li>
                   <li class="btn btn-outline-primary btn-sm">보관함</li>
               </ul>

               <div class="modalMoveEmailBtn">
                   <button class="btn btn-primary btn-lg btn-primary btn-sm" role="button">이동하기</button>
            	<button class="btn btn-primary btn-lg btn-primary btn-sm" role="button">취소하기</button>
               </div>
           </div>
           
       </div>
   </div>
   </div>