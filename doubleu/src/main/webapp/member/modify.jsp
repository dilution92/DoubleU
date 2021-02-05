<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Double U</title>
    <style>
        /*전역 설정 시작*/
        html, body{
            margin:0;
            background-color: #f1f1f1;
        }

        *,*::before, *::after{
            box-sizing:border-box;
        }
        p{
            margin:0;
        }
        /*전역 설정 끝 */

        .logo-box>img{
        cursor: pointer;
           width : 70%;
           height:70%;
           display:block;
          
       }

        .form-container{
            max-width: 400px;
            height: 200vh;
            background-color: white;
            margin: 0 auto;
            padding : 0 45px 100px 45px;
        }

        .sign-up-header{
            text-align: center;
            padding: 60px 0 26px 0;
        }

        .sign-up-header>h2{
            font-size:1.1rem;
            font-weight: 600;
        }

        .form-box-field{
            margin-bottom: 1rem;
        }
        .form-box-field>.form-box-field-input{
            width:100%;
            height:40px;
            outline:none;
            border: 1px solid #e5e5e5;
            font-size:0.8rem;
            text-indent:0.5rem;
        }

        .form-box-field>.form-box-field-input::placeholder{
            color:#cccccc;
        }

        .form-box-field>.form-box-field-input:focus{
            border-color: #aaaaaa;
            transition: [어떤속성][전환시간][];
            transition: border 0.3s ease-in-out;
        }
        .form-box-field>.form-box-email-input{
            width:45%;
            height:40px;
            outline:none;
            border: 1px solid #e5e5e5;
            font-size:0.8rem;
            text-indent:0.5rem;
            margin-top: 1rem;
        }
        .form-box-field>.form-box-email-input::placeholder{
            color:#cccccc;
        }
        .form-box-field>.form-box-email-input:focus{
            border-color: #aaaaaa;
            transition: [어떤속성][전환시간][];
            transition: border 0.3s ease-in-out;
        }
        .join-btn>.join-btn-disabled{
            height: 40px;
            color: black;
            border-color: black;
            background-color: white;
        }
        .field-required{
            display: inline-block;
            width: 3px;
            height: 3px;
            background-color: red;
            border-radius: 100%;
            text-indent: -999999999999999px;
        }
        .form-box-field.warn>.present-email{
            display: block;
            border:0;
            background-color: white;
            color:blue;
            position:absolute;
        }
        
        .form-box-field>.warn-info{
            margin-top: 0.5rem;
            font-size: 0.8rem;
            color: red;
            display:none;
        }

        .form-box-field.warn > .warn-info{
            display:block;
        }
        .form-box-field>label{
            display: inline-block;
            margin-bottom: 1rem;
        }

        .terms-box input{
            display:block;
            width: 0;
            height:0;
            overflow: hidden;
            visibility: hidden;
            position: absolute;
            
        }

        .terms-box label{
            display: inline-block;
            padding-left: 1.5rem;
            line-height: 1;
            vertical-align: middle;
            position: relative;
            cursor: pointer;
            user-select: none; /*체크박스 아닌거 누르면 선택X*/
        }

        .terms-box label::before{
            content:'';
            display: block;
            position: absolute;
            background-color: cornflowerblue;
            top: 0;
            left: 0;
            width: 18px;
            height: 18px;
            border-radius: 100%;
            border: 1px solid #cccccc;
            background-color: #f1f1f1;
        }

        .terms-box div{
            display: inline-block;
            margin-bottom: 1rem;
        }
        .terms-box input:checked ~label::before{
            background-color: #0078ff;
            border-color: #0078ff;
        }

        .terms-box label::after{
            content: '';
            display: block;
            position: absolute;
            width: 6px;
            height: 3px;
            border-left: 1px solid white;
            border-bottom: 1px solid white;
            top:7px;
            left:7px;
            transform: rotate(-45deg);
            visibility: hidden;
        }

        .terms-box input:checked ~ label::after{
            visibility: visible;
        }

        .join-btn{
            display:block;
            width: 100%;
            height:50px;
            border:1px solid white;
            line-height: 47px;
            box-sizing: border-box;
            color:#ffffff;
            text-align:center;
            padding: 1px 10px 0 10px;
           
        }
        
        .join-btn-disabled{
            border-color: #eee;
            background-color: #eee;
            color:#aaaaaa;
            
        }
        .non-memeber-btn>.non-member{
            display: block;
            border:0;
            background-color: white;
            color:blue;
            position:absolute;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <header class="sign-up-header">
            <div class="logo-box">
                <img src="Double U.png">
            </div>

            <h2>회원정보 수정</h2>
        </header>
        <main>
            <form class="form-box" name="sign-up-form">
                <div class="form-box-field warn">
                    <label>
                        아이디
                        <span class="field-required">이 글을 읽을 수 있다면 당신은 개발자입니다.</span>
                    </label>
                    <input class="form-box-field-input" 
                    type="text"
                    placeholder="아이디" />
                    <p class="warn-info">아이디는 필수정보입니다.</p>
                </div>
                <div class="form-box-field warn">
                    <label>
                        비밀번호
                        <span class="field-required">이 글을 읽을 수 있다면 당신은 개발자입니다.</span>
                    </label>
                    <input class="form-box-field-input" 
                    type="text"
                    placeholder="비밀번호" />
                    <p class="warn-info">비밀번호는 필수정보입니다.</p>
                </div>
                
                <div class="form-box-field warn">
                    <label>
                        이메일
                        <span class="field-required">이 글을 읽을 수 있다면 당신은 개발자입니다.</span>
                    </label>
                        <input class="form-box-email-input" type="text" placeholder="이메일" maxlength="50">
                        @
                        <select class="form-box-email-input" id="mail2">
                            <option value="naver.com">naver.com</option>
                            <option value="gmail.com">gmail.com</option>
                            <option value="daum.net" >daum.net</option>
                            <option value="nate.com">nate.com</option>                        
                        </select>
                    
                    <p class="warn-info">이메일은 필수정보입니다.</p>
                </div>
                
                <div class="terms-box">
                     <div>
                        <input id="all-dong-eui" type="checkbox">
                        <label for="all-dong-eui">약관 전체</label>
                     </div>
                    <div class="terms-box">
                         <div>
                              <input id="privacy" type="checkbox">
                              <label for="privacy">개인정보 수집 이용동의(필수) </label>
                         </div>
                    <div class="terms-box">
                    <div>
                         <input id="use-dong-dui" type="checkbox">
                         <label for="use-dong-eui">그룹웨어 이용약관(필수)</label>
                     </div>
                     <div class="terms-box">
                        <div>
                            <input id="marketing" type="checkbox">
                            <label for="marketing">마케팅 활용 및 광고성 정보 수신 동의(선택)</label>
                        </div>
                          <div class="terms-box">
                              <div>
                                 <input id="no-kids" type="checkbox">
                                 <label for="no-kids">만 19세 미만 가입 제한(필수)</label>
                              </div>
                    </div>
                    </div>
                </div>
                <div class="join-btn">
                    <button id="join" class="join-btn-disabled">회원정보 수정</button>
                </div>
                <p class="memeber-info">본인인증이 어려운 경우, 아래의 서비스를 통해 주문하실 수 있습니다.</p>
                <div class="non-memeber-btn">
                <button type="button" class="non-member"><u>자세히 보기</u></button>
                 </div>
            </form>
        </main>
    </div>
</body>
</html>