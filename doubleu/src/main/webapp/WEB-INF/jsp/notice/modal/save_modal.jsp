<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- 저장 Button trigger modal
	<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal1" data-whatever="@getbootstrap">답글</button>
-->

<!-- 저장 Button trigger modal
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#staticBackdrop">저장</button> -->


<!-- 저장 Modal -->
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel">저장</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">해당 게시물을 저장하시겠습니까?</div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="noticeSubmit2">저장</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
  
</body>
</html>