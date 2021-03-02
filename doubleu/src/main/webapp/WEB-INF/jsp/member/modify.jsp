<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Checkout example · Bootstrap v5.0</title>
<link rel="stylesheet" href="/css/member/member_modify.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">

<!-- awesome font CDN(W icon) -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css"
	integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA=="
	crossorigin="anonymous" />

<!-- favicon -->
<link rel="shortcut icon" href="../images/w_icon.ico">
<link rel="icon" href="w_icon.ico">

<!-- bootstrap CDN -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">

<!-- bootstrap script, Jquery CDN -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
	crossorigin="anonymous"></script>
<!-- ****************************** -->

<!-- Custom styles for this template -->
<link href="form-validation.css" rel="stylesheet">
<!-- main page CSS -->
<link rel="stylesheet" href="/css/MainIndex.css">
<!-- 전사게시판 CSS -->
<link rel="stylesheet" href="/css/notice/notice.css">
</head>
<body class="bg-light">
	<!-- main-GNB -->
	<!-- 그룹웨어 GNB -->
	<header class="container-fluid main-gnb">
		<jsp:include page="../MainPage/header.jsp"></jsp:include>
	</header>
	<!-- 그룹웨어 GNB code 끝 -->

	<section class="e-approval-container">
		<!-- e-approval-lnb code -->
		<!-- e-approval-lnb code -->
		<jsp:include page="member_aside.jsp" />
		<!-- lnb code 끝 -->
		<div class="container">
			<main>

				<div class="row g-3">
					<form action="/memberUpdate" method="post">
					<div class="main">
						<h5 class="mb-3">회원정보 수정</h5>
						<form class="needs-validation" novalidate>
							<div class="row g-3">
							<input name="memberNo" type="hidden" value="${member.memberNo}">
								<div class="col-sm-12">
									<label for="Name" class="form-label">이름</label> <input name="memberName"
										type="text" class="form-control" id="Name"
										placeholder="이름을 입력하세요." value="${member.memberName}" required>
									<div class="invalid-feedback">이름은 필수 정보입니다.</div>
								</div>

								<div class="col-12">
									<label for="email" class="form-label">이메일</label> <input name="memberEmail"
										type="text" class="form-control" id="email"
										placeholder="you@example.com" value="${member.memberEmail}">
									<div class="invalid-feedback">이메일은 필수 정보입니다.</div>
								</div>

								<div class="col-12">
									<label for="department" class="form-label">부서<span
										class="text-muted">(수정불가)</span></label>
									<div class="input-group">
										<label for="department" class="form-label">${member.memberDepartment}</label>
									</div>
								</div>

								<div class="col-12">
									<label for="number" class="form-label">휴대폰 번호</label> <input name="memberPhoneNumber"
										type="text" class="form-control" id="number"
										placeholder="010OOOOOOOO" value="${member.memberPhoneNumber}"
										required>
									<div class="invalid-feedback">휴대폰 번호는 필수 정보입니다.</div>
								</div>

								<div class="col-12">
									<label for="address2" class="form-label">주소 <span
										class="text-muted">(선택)</span></label>
								<div class="form-group">
									<input class="form-control"
										style="width: 40%; display: inline;" placeholder="우편번호"
										name="memberZipcode" id="addr1" type="text" readonly="readonly">
									<button type="button" class="btn btn-default"
										onclick="execPostCode();">
										<i class="fa fa-search"></i> 우편번호 찾기
									</button>
								</div>
								<div class="form-group">
									<input class="form-control" style="top: 5px;"
										placeholder="도로명 주소" name="memberAddress" id="addr2" type="text"
										readonly="readonly" />
								</div>

								<div class="invalid-feedback">주소를 입력하세요.</div>
							</div>
					</div>

					<hr class="my-4">

					<div class="form-check">
						<input type="checkbox" class="form-check-input" id="same-address">
						<label class="form-check-label" for="same-address">개인정보
							수집이용 동의</label>
					</div>

					<div class="form-check">
						<input type="checkbox" class="form-check-input" id="save-info">
						<label class="form-check-label" for="save-info">그룹웨어 이용약관</label>
					</div>

					<hr class="my-4">


					<hr class="my-4">

					<button class="w-100 btn btn-primary btn-lg" type="submit">저장</button>

				</div>
				</form>
		</div>




		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
		<script src="/static/js/member_modify.js"></script>
		<script>
		function execPostCode() {
	         new daum.Postcode({
	             oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	 
	                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
	                var extraRoadAddr = ''; // 도로명 조합형 주소 변수
	 
	                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraRoadAddr += data.bname;
	                }
	                // 건물명이 있고, 공동주택일 경우 추가한다.
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                if(extraRoadAddr !== ''){
	                    extraRoadAddr = ' (' + extraRoadAddr + ')';
	                }
	                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
	                if(fullRoadAddr !== ''){
	                    fullRoadAddr += extraRoadAddr;
	                }
	 
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	       
	                
	                $("[name=memberZipcode]").val(data.zonecode);
	                $("[name=memberAddress]").val(fullRoadAddr);
	                document.getElementById('sample3_postcode').value = data.zonecode; //5자리 새우편번호 사용
	                document.getElementById('sample3_address').value = fullAddr;

	            }
	         }).open();
	     }
		</script>

		<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
			integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
			crossorigin="anonymous"></script>
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
			crossorigin="anonymous"></script>
		<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
			integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
			crossorigin="anonymous"></script>
</body>
</html>