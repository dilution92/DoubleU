<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>임시 저장 모달창</title>
</head>
<body>
<div class="modal fade bs-example-modal-lg"
			id="temporaryEmailContents" tabindex="-1" role="dialog"
			aria-labelledby="myLargeModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg">
				<div class="modal-content modalTemporaryEmail">
					<div class="modalTemporaryEmailFolder">
						<div>
						</div>
						<h4>작성하신 메일이 임시 저장되었습니다.</h4>
						<h6><span>제목 : </span><span id="emailTemp"></span></h6>
						<p>
							<strong>임시저장된 메일 보내기</strong><br /> <br /> 1. 왼쪽 메뉴에서 ‘임시보관함’을
							선택하세요.
						</p>
						<div class="modalTemporaryEmailFolderBtn">
							<button class="btn btn-primary btn-lg btn-primary btn-sm"
								role="button" name="tempBtn" onclick="tempSendEmail()" >확인</button>
							<button class="btn btn-primary btn-lg btn-primary btn-sm"
								role="button">쓰던 페이지로 가기</button>
						</div>
					</div>

				</div>
			</div>
		</div>
</body>
</html>