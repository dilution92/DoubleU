<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 댓글</title>

<!-- awesome font CDN(W icon) -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA==" crossorigin="anonymous" />

</head>
<body>

<div id="repl-move">
	<div class="row">
		<table width="950px" height="70px">
			<tr>
				<td rowspan="2" width="50px">
					<span style="font-size:60px; margin-right:10px; color:#BBBBBB"><i class="fas fa-user"></i></span>
				</td>
				<td colspan="2">
				<div class="input-group">
					<input type="text" class="form-control" placeholder="댓글을 입력하세요." aria-label="Recipient's username with two button addons" aria-describedby="button-addon4">
					<div class="input-group-append" id="button-addon4">
					<button class="btn btn-primary" type="button">댓글</button>
					<button class="btn btn-outline-secondary" type="button">취소</button>
					</div>
				</div>
				</td>
			</tr>
		</table>
		<table width="950px" height="70px">
			<tr>
				<td rowspan="2" width="50px">
					<span style="font-size:60px; margin-right:10px; color:#BBBBBB"><i class="fas fa-user"></i></span>
				</td>
				<th class="repl-who">영업부 누구</th>
				<td class="repl-when">2021.02.07   10:11</td>
				<td rowspan="2" class="text-right">
					<!-- <input type="button" class="btn btn-primary" value="답글" onclick="location.href=''"> -->
					<!-- <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal1" data-whatever="@getbootstrap">답글</button> -->
					<button type="button" class="btn btn-outline-secondary" data-toggle="modal" data-target="#exampleModal2">삭제</button>
				</td>
			</tr>
			<tr>
				<td class="repl-say" colspan="2">축하해요축하해요</td>
			</tr>
			<tr>
				<td rowspan="2" width="50px">
					<span style="font-size:60px; margin-right:10px; color:#BBBBBB"><i class="fas fa-user"></i></span>
				</td>
				<th class="repl-who">관리부 누구</th>
				<td class="repl-when">2021.02.07   9:11</td>
				<td rowspan="2" class="text-right">
					<!-- <input type="button" class="btn btn-primary" value="답글" onclick="location.href=''"> -->
					<!-- <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal1" data-whatever="@getbootstrap">답글</button> -->
					<button type="button" class="btn btn-outline-secondary" data-toggle="modal" data-target="#exampleModal2">삭제</button>
				</td>
			</tr>
			<tr>
				<td class="repl-say" colspan="2">츄카</td>
			</tr>
			<tr>
				<td colspan="4" class="text-right">
				<br><br><br>
		        </td>
		    </tr>
	        <tr>
				<td colspan="4" class="text-right">
					<input type="button" class="btn btn-secondary" value="목록보기" onclick="location.href='familyeventIndex'">
		        </td>
		    </tr>
		</table>
		<br><br><br>
	</div>
	
 			<!-- 게시판 답글, 댓글 삭제 모달창 -->
 			<jsp:include page="./modal/notice_comment_modal.jsp"/>
 			<!-- ========== -->
 			
</div>
</body>
</html>