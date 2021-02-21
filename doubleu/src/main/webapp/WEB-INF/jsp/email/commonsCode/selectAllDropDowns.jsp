<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%--email_index.jsp --%>
<ul class="email-select-list">
	<li>
		<label class="btn btn-outline-primary btn-sm">
		<input type="checkbox" name="chkBox" id="chkBoxId" onclick="selectChkBox(this)"/>전체선택
		</label>
	</li>
     <li>
      	<span class="btn btn-outline-primary btn-sm" id="emailSpamBlockBtn"  data-toggle="modal" data-target="#spamEmailRev">스팸차단</span>
     </li>
     <li>
           <span class="btn btn-outline-primary btn-sm" id="emailSendBtn">답장하기</span>
      </li>

      <li>
          <span class="btn btn-outline-primary btn-sm" id="emailDeleteBtn">삭제하기</span>
      </li>

      <li>
          <span class="btn btn-outline-primary btn-sm" id="emailPassBtn">전달하기</span>
      </li>

      <li>
          <span class="btn btn-outline-primary btn-sm" id="emailReadBtn">읽음</span>
      </li>

      <li>
	      <div class="input-group mb-3">
			  <div class="input-group-prepend">
			    <button class="btn btn-outline-primary btn-sm" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">이동</button>
			    <div class="dropdown-menu">
			      <a class="dropdown-item" href="#">받은 메일함</a>
			      <a class="dropdown-item" href="#">별표 메일함</a>
			      <a class="dropdown-item" href="#">임시 보관함</a>
			      <a class="dropdown-item" href="#">보낸 메일함</a>
			      <a class="dropdown-item" href="#">스팸 메일함</a>
			      <a class="dropdown-item" href="#">휴지통</a>
			      <div role="separator" class="dropdown-divider"></div>
			      <a class="dropdown-item" href="#">NOTES</a>
			    </div>
			  </div>
		</div>
     </li>	
</ul>