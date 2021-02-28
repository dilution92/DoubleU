<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>    
<!DOCTYPE html>
<html>
<head>
<script src="/js/email/email_write.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="modal fade bs-example-modal-lg" id="EmailAddress"
			tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
			aria-hidden="true">
			<div class="modal-dialog modal-lg">
				<div class="modal-content modalEmailAddressEmail"
					style="margin-left: -30px;">
					<div class="modalAddressEmailFolder">
						<h4>주소록</h4>
					
						<div class="search-btn">
							<select class="form-control form-control-sm" name="selectFindStr" id="selectFindStr" style="width: 70px;">
								<option value="이름">이름</option>
								<option value="부서">부서</option>
							</select> 
							<input class="form-control form-control-sm col-3" type="text"
								placeholder="Search" aria-label="Search" id="memberFindStr" name="memberFindStr">
							<input class="btn btn-outline-primary btn-sm " name="onname"
								type="button" value="검색"
								id="test"
								onclick="memberFindStr()"
								 />
						</div>

						<div class="search-btn-address" id="selectMemberStr">
							<div class="search-btn-address-btn-one col-5">
								<label class="btn btn-outline-primary btn-sm"> 
								<input type="checkbox" onclick="selectChkBox(this)" style="margin-right: 5px;" /> 전체선택
								</label>
								<c:forEach var="listMember" items="${memberList }">
									<div class="address-name">
										<input type="checkbox" name="emailAddressChk" id="test"
										value="${listMember.memberName } ${listMember.memberEmail} ${listMember.memberTeam }"/>
										
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
										<c:forEach begin="0" end="30">
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
										<c:forEach begin="0" end="30">
											<div id="resultRef">
											</div>
										</c:forEach>	
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="modalAddressEmailFolderBtn">
							<button class="btn btn-primary btn-lg btn-primary btn-sm"
								role="button">추가하기</button>
							<button class="btn btn-primary btn-lg btn-primary btn-sm"
								role="button">취소하기</button>
						</div>
					</div>

				</div>
			</div>
		</div>
</body>
<script>

var memberFindStr = function() {

	var findValueOne = $('#memberFindStr').val();
	var findValueTwo = $('#selectFindStr').val();
	
	
	var frm = document.frm;
	
	frm.memberFindStr.value = findValueOne;
	frm.memberOption.value = findValueTwo;

	frm.action = "/selectMemberFindStr"
	frm.submit();
}



function getCheckboxValue()  {
	  // 선택된 목록 가져오기
	  
	  const query = 'input[name="emailAddressChk"]:checked';
	  const selectedEls = 
	      document.querySelectorAll(query);

	  var ResultContents = new Array();  
	  // 선택된 목록에서 value 찾기
	  
	   for(var i=0; i<selectedEls.length; i++) {
		   ResultContents[i] = selectedEls[i].value;

		  var node = document.createElement('span');              
		  var textnode = document.createTextNode(ResultContents[i]);         
		  var appendNode = node.appendChild(textnode);

			//부모
		  document.getElementById('result').appendChild(node); 
	  }
		  console.log(ResultContents)

}

function getSendDel()  {
	  // 선택된 목록 가져오기
	  
	  const query = 'input[name="emailAddressChk"]:checked';
	  const selectedEls = 
	      document.querySelectorAll(query);

	  var ResultContents = new Array();  

	   for(var i=0; i<selectedEls.length; i++) {
		   ResultContents[i] = selectedEls[i].value;

		  var parent = document.getElementById('result');
		  var child = parent.getElementsByTagName('span');      
		   parent.remove();
	  }

}




function getCheckboxValueRef()  {
	  // 선택된 목록 가져오기
	  
	  const query = 'input[name="emailAddressChk"]:checked';
	  const selectedEls = 
	      document.querySelectorAll(query);

	  var ResultContents = new Array();  
	
	   for(var i=0; i<selectedEls.length; i++) {
		   ResultContents[i] = selectedEls[i].value;

		  var node = document.createElement('span');
		  console.log("node " + node)              
		  var textnode = document.createTextNode(ResultContents[i]);         
		  var appendNode = node.appendChild(textnode);

		  //부모
		  document.getElementById('resultRef').appendChild(node); 
	  }
		
}


function getSendDelRef()  {
	  // 선택된 목록 가져오기
	  
	  const query = 'input[name="emailAddressChk"]:checked';
	  const selectedEls = 
	      document.querySelectorAll(query);
		
	  var ResultContents = new Array();  


	   for(var i=0; i<selectedEls.length; i++) {
		   ResultContents[i] = selectedEls[i].value;

		  var parent = document.getElementById('resultRef');
		  var child = parent.getElementsByTagName('span');  
		  console.log("child" + child);    
		  parent.remove();
	  }

}





</script>
</html>