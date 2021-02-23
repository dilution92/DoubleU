<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="modal fade" id="exampleModal_approval" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">New message</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <div class="form-group">
            <label for="message-text" class="col-form-label">상세 사유</label>
            <textarea class="form-control" name="approvalComment" id="message-text" style="height: 100px;" required="required"></textarea>
          </div>
      </div>
      <div class="modal-footer">
        <input type="button" class="btn btn-secondary btn-sm" data-dismiss="modal" value="취소">
        <input type="button" name="btnFormApproval" id="btnFormApproval" class="btn btn-primary btn-sm" value="제출">
      </div>
    </div>
  </div>
</div>
<div class="modal fade" id="exampleModal_reject" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">New message</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <div class="form-group">
            <label for="message-text" class="col-form-label">상세 사유</label>
            <textarea class="form-control" name="rejectComment" id="message-text" style="height: 100px;" required="required"></textarea>
          </div>
      </div>
      <div class="modal-footer">
        <input type="button" class="btn btn-secondary btn-sm" data-dismiss="modal" value="취소">
        <input type="button" name="btnFormReject" id="btnFormReject" class="btn btn-primary btn-sm" value="제출">
      </div>
    </div>
  </div>
</div>

<script type="text/javascript">
$('#exampleModal_approval').on('show.bs.modal', function (event) {
	  var button = $(event.relatedTarget) // Button that triggered the modal
	  var recipient = button.data('whatever') // Extract info from data-* attributes
	  // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
	  // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
	  var modal = $(this)
	  modal.find('.modal-title').text('결재 승인')
	  modal.find('.modal-body input').val(recipient)
	})
$('#exampleModal_reject').on('show.bs.modal', function (event) {
  var button = $(event.relatedTarget) // Button that triggered the modal
  var recipient = button.data('whatever') // Extract info from data-* attributes
  // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
  // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
  var modal = $(this)
  modal.find('.modal-title').text('결재 반려')
  modal.find('.modal-body input').val(recipient)
})
</script>
</body>
</html>