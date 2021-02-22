<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- bootstrap CDN -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">


<!-- main page CSS -->
<link rel="stylesheet" href="/css/MainIndex.css">

<!-- 로그인 css -->
<link rel="stylesheet" href="/css/email/login.css">
</head>

<body>
	<div class="login-align">
		<form name="LoginFormName" id="LoginFormId" action="" method="POST">
		
		 <!-- 로그인 이미지 -->
		 	<div class="login-img-align">
		    	<img src="../img/DoubleULogo.png"/>
		    	<h2>DoubleU</h2>
		    </div>
			
		  <div class="form-row align-items-center" style="display: block;">
		   
		    <!-- 아이디 -->
		    <div class="col-auto">
		      <label class="sr-only" for="inlineFormInputGroup">UserID</label>
		      <div class="input-group mb-2">
		        <div class="input-group-prepend">
		          <div class="input-group-text"><i class="bi bi-person-circle"></i></div>
		        </div>
		        <input type="text" class="form-control" name="memberMid" id="inlineFormInputGroup" placeholder="UserId">
		      </div>
		    </div>
		    
		    <div class="col-auto">
		      <label class="sr-only" for="inlineFormInputGroup">Password</label>
		      <div class="input-group mb-2">
		        <div class="input-group-prepend">
		          <div class="input-group-text"><i class="bi bi-key-fill"></i></div>
		        </div>
		        <input type="password" class="form-control" name="memberPwd" id="inlineFormInputGroup" placeholder="Password">
		      </div>
		    </div>
		    
		    <div class="col-auto">
		      <button type="submit" class="btn btn-primary mb-2">로그인</button>
		    </div>
		    
		      <div class="form-check mb-2 mr-sm-2 form-account">
			    <input class="form-check-input" type="checkbox" id="inlineFormCheck">
			    <label class="form-check-label" for="inlineFormCheck">
			      계정 저장
			    </label>
			  </div>

		    
		  </div>
		</form>
	</div>
</body>
</html>