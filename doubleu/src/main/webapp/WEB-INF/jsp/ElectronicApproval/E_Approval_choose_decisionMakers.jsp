<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous">
	</script>
</head>
<body>
	<form action="">
		<input type="text" value="정해준" id="makerName">
		<input type="text" value="직급" id="makerPosition">
		<input type="button" value="확인" id="btnApprovalChooseMaker">
	</form>

<script type="text/javascript">
	$('#btnApprovalChooseMaker').on('click', function() {
		var makerName = $('#makerName').val();
		var makerPosition = $('#makerPosition').val();
		
		$(opener.document).find('#TempMakerPosition').val(makerPosition);
		$(opener.document).find('#TempMakerName').val(makerName);
/* 		var grpl = $(opener.document).find("input[name=makerPosition]").length;
		for (var i = 0; i < grpl; i++) {
			var tempPosition = $(opener.document).find('input[name=makerPosition]').eq(i).val();
			var tempName = $(opener.document).find('input[name=makerName]')
			if(tempPosition === null || tempPosition === "" || makerPosition !== tempPosition || makerName !== tempName) {
				$(opener.document).find('input[name=makerPosition]').eq(i).val(makerPosition);
				$(opener.document).find('input[name=makerName]').eq(i).val(makerName);
				break;
			}
		} */
		self.close();
	});

</script>
</body>
</html>