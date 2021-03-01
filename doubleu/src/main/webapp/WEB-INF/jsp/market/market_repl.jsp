<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:set var="writer" value="${vo.marketWriter }"/>
			<form name="market_repl_list">
				<c:forEach var='vo' items='${marketRepllist }' >
						<c:choose>
							<c:when test="${vo.replWriter eq writer }">
							<div class="shadow-sm p-3 mb-5 bg-white rounded market-repl-each alert alert-primary" role="alert"
							style="border: #cce5ff 3px solid;">
								<div>
									<div class="text-muted float-left" style="font-weight:1000;">작성자</div>	
									<div class='float-right' >${vo.replDate}</div>
								</div>
								<div class="market-repl-each-doc" >${vo.replDoc }</div>
						
							<input type = "hidden" name="replNo" value="${vo.replNo }" />
							<c:if test="${vo.replWriter == member.memberName }">
								<button type="button" class="btn btn-outline-primary" style="font-size: 1px;margin-top: 30px;"
								onclick="replModify('${vo.replDoc}', '${vo.replNo }')">수정</button> 			
								<button type="button" class="btn btn-outline-primary" style="font-size: 1px;margin-top: 30px;"
								onclick="location.href='/marketReplDel?replNo=${vo.replNo}&marketNo=${vo.marketNo }'"
								>삭제</button> 	
							</c:if>
							</div>
							</c:when>
							<c:otherwise >
							<div class="shadow-sm p-3 mb-5 bg-white rounded market-repl-each">
								<div>
									<div class="text-muted float-left">${vo.replWriter}</div>	
									<div class='float-right' >${vo.replDate}</div>
								</div>
								<div class="market-repl-each-doc" >${vo.replDoc }</div>
						
							<input type = "hidden" name="replNo" value="${vo.replNo }" />
							<c:if test="${vo.replWriter == member.memberName }">
								<button type="button" class="btn btn-outline-primary" style="font-size: 1px;margin-top: 30px;"
								onclick="replModify('${vo.replDoc}', '${vo.replNo }')">수정</button> 			
								<button type="button" class="btn btn-outline-primary" style="font-size: 1px;margin-top: 30px;"
								onclick="location.href='/marketReplDel?replNo=${vo.replNo}&marketNo=${vo.marketNo }'"
								>삭제</button> 	
							</c:if>
							</div>
							</c:otherwise>
						</c:choose>
				</c:forEach>
				<input type = "hidden" name="replDoc1" />
				</form>
			<div class="market-repl-form">
			<form class="form-inline" name="frm_market_repl" action="/marketReplInsert" method="post">
				  <div class="form-group mb-1" style="padding-left: 1rem!important;">
					   <input type="text" readonly class="form-control-plaintext" id="staticEmail2"  name="replWriter" value=${member.memberName }>
					  </div>
					  <div class=" p-3 bg-white ">
					  <textarea class="form-control" id="exampleFormControlTextarea1" name="replDoc"style="width: 900px;"></textarea>
					  </div>
					  <button type="submit" class="btn btn-primary mb-2">댓글달기</button>
					 <!-- hidden -->
				<input type='hidden' name='findStr' value='${page.findStr }'/>
				<input type='hidden' name='nowPage' value='${page.nowPage }'/>
				<input type='hidden' name='marketNo'  value='${vo.marketNo}'/>
				<input type='hidden' name='dibUser'  value='${member.memberName}'/>
			</form>
			</div>	
			
<!-- 수정 ㅁ돨 -->
			
<div class="modal fade" id="replModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content" style="width: 80%; height: 330px; top: 100px;">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">댓글 수정</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
        <form action="/marketReplModi?marketNo=${vo.marketNo }" name="market_repl_modi">
	      <div class="modal-body">
	          <div class="form-group">
	            <textarea class="form-control" id="market-message-text" name="replDocmodi" style="height:150px;"></textarea>
	          </div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
	        <button type="submit" class="btn btn-primary" name="replModi">수정</button>
	      </div>
	      	<input type='hidden' name='marketNo'  value='${vo.marketNo}'/>
	      	<input type='hidden' name='replNo' />
        </form>
    </div>
  </div>
</div>


<!-- 삭제모달 -->
<div class="modal fade" id="replDelModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content" style="width: 80%; height: 330px; top: 100px;">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">삭제</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
	      <div class="modal-body">
	          <div class="form-group">
	            <textarea class="form-control" id="market-message-text" name="replDocmodi" style="height:150px;"></textarea>
	          </div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
	        <button type="submit" class="btn btn-primary" name="replModi">수정</button>
	      </div>
	      	<input type='hidden' name='marketNo'  value='${vo.marketNo}'/>
	      	<input type='text' name='replNo' />
    </div>
  </div>
</div>
</body>
</html>