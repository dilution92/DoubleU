<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- 삭제 Button trigger modal
<div class="modal fade" id="staticBackdrop2" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">


<!-- 공지사항 삭제 Modal -->
  <div class="modal-dialog">
    <div class="modal-content" style="margin-top:310px;">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel">삭제</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">해당 게시물을 삭제하시겠습니까?</div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="noticedelete2" onclick="location.href='/noticeDeleteR?no='+${obj.noticeNo }">삭제</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
  
</body>
</html>