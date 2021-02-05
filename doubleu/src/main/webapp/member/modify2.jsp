<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>회원정보 수정</title>
    
    <style>
        h3{
            margin-left:auto; 
            margin-right:auto;  
        }
        table{
            margin-left:auto; 
            margin-right:auto;
            border:7px solid white;
        }
        
        td{
            border:2px solid black
        }
        
        #title{
            background-color:white
        }
    </style>
    
</head>
<body onload="init()">
 
        <br><br>
        <h3><font size="6" color="gray">회원정보 수정</font></h3>

        <br><br><br>
        
        <!-- 입력한 값을 전송하기 위해 form 태그를 사용한다 -->
        <!-- 값(파라미터) 전송은 POST 방식 -->
        <form method="post"  name="userInfo" onsubmit="return checkValue()">
                
            <table>
                <tr>
                    <td id="title">아이디</td>
                    <td id="title"></td>
                </tr>
                <tr>
                    <td id="title">비밀번호</td>
                    <td>
                        <input type="password" name="password" maxlength="50" 
                            value="">
                    </td>
                </tr>
            </table>    
            <br><br>    
            <table>
 
                <tr>
                    <td id="title">이름</td>
                    <td></td>
                </tr>
                    
                <tr>
                    <td id="title">성별</td>
                    <td></td>
                </tr>
                    
                <tr>
                    <td id="title">생일</td>
                    <td>
                            년 
                            월 
                            일
                    </td>
                </tr>
                    
                <tr>
                    <td id="title">이메일</td>
                    <td>
                        <input type="text" name="mail1" maxlength="50">
                        @
                        <select name="mail2" id="mail2">
                            <option value="naver.com">naver.com</option>
                            <option value="gmail.com">gmail.com</option>
                            <option value="daum.net" >daum.net</option>
                            <option value="nate.com">nate.com</option>                        
                        </select>
                    </td>
                </tr>
                    
                <tr>
                    <td id="title">휴대전화</td>
                    <td>
                        <input type="text" name="phone" value=""/>
                    </td>
                </tr>
                <tr>
                    <td id="title">주소</td>
                    <td>
                        <input type="text" size="50" name="address"
                            value=""/>
                    </td>
                </tr>
            </table>
            <br><br>
            <input type="button" value="취소" onclick="javascript:window.location='MainForm.jsp'">
            <input type="submit" value="수정"/>  
        </form>
        
</body>
</html>

