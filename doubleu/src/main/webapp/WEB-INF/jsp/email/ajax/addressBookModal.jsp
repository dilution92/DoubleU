<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>    
<!DOCTYPE html>
<html>
<head>

<script src="/js/email/email_write.js"></script>
<script src="/js/email/email_addressBook.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="search-btn-address" id="selectMemberStr">
		<div class="search-btn-address-btn-one col-5">
			<label class="btn btn-outline-primary btn-sm"> 
			<input type="checkbox" onclick="selectChkBox(this)" style="margin-right: 5px;" /> 전체선택
			</label>
			<c:forEach var="listMember" items="${memberNameList }">
				<div class="address-name">
					<input type="checkbox" name="emailAddressChk" id="test"
					value="${listMember.memberEmail}"/>
					
					<span class="badge rounded-pill bg-light text-dark">${listMember.memberName }</span>  
					<span class="badge rounded-pill bg-light text-dark">${listMember.memberEmail}</span>
					<span class="badge rounded-pill bg-light text-dark">${listMember.memberTeam }</span>
				</div>
			</c:forEach>
		</div>

		<div class="search-btn-address-btn-two col-1">
			<div class="search-btn-address-btn-two-align">
				<button type="button" onclick="getCheckboxValue()" class="btn btn-outline-primary btn-sm">
					<i class="bi bi-plus"></i>
				</button>
				<button type="button" onclick="getSendDel()" class="btn btn-outline-primary btn-sm">
					<i class="bi bi-dash"></i>
				</button>
			</div>

			<div class="search-btn-address-btn-two-ref-align">
				<button type="button"  onclick="getCheckboxValueRef()" class="btn btn-outline-primary btn-sm">
					<i class="bi bi-plus"></i>
				</button>
				<button type="button" onclick="getSendDelRef()" class="btn btn-outline-primary btn-sm">
					<i class="bi bi-dash"></i>
				</button>
			</div>
		</div>

		<div class="search-btn-address-btn-one col-5">

			<div>받는 사람</div>
			<div class="rev-mail-one">
				<div class="rev-align-scroll">
					
					<c:forEach begin="0" end="50">
						<!-- 받는 사람 -->
						
						<div id="resultDual">
							<div id="result">
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
			
			<div style="margin-top: 10px">참조</div>
			<div class="ref-mail-two">
				<div class="rev-align-scroll">
					<div id="resultRefDual">
					<c:forEach begin="0" end="50">
						<div id="resultRef">
						</div>
					</c:forEach>	
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>