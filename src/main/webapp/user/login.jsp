<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="../css/apple.css?after2">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap">
    <title>로그인</title>
    <style>
        /*--- 로그인 --- */
        .login-body{
            font-family: 'Roboto', sans-serif; /* 폰트 설정 */
        }

        .t1-login{
            font-size: 38px;
            display: flex;
            font-weight: bold;
            justify-content: center;  /* 가로축 가운데 정렬 */
            align-items: center;  /* 세로축 가운데 정렬 */
        }

        .t2-login{
            font-size: 18px;
            display: flex;
            font-weight: bold;
            justify-content: center;  /* 가로축 가운데 정렬 */
            align-items: center;  /* 세로축 가운데 정렬 */
        }
        .main3-login {
            width: 400px;
            margin: 0 auto;
            padding: 20px;
            border: none; /* 테두리 없애기 */
            border-radius: 5px;

        }
        .login-t1 {
            font-weight: bold; /* 텍스트를 진하게 */
        }

        .main3-login label {
            display: block;
            margin-bottom:5px;
        }

        .main3-login input[type="text"],
        .main3-login input[type="password"]{
            width: 100%;
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
            outline: none;
            margin-bottom:8px;
        }

    </style>
</head>
<script>
    // 아이디 input에 영어만 입력되도록
    const typeOnlyEng = (target) => {
        target.value = target.value .replace(/[^\\!-z]/gi,"");
    }
</script>
<body class="login-body">
<%@ include file="../modules/header.jsp"%>
<section class="main1-login">
    <div class="main1-message">
        <h1 class="t1-login">더욱 빠르게 결제하시려면 로그인하세요.</h1>
    </div>
</section> <!-- section main1 -->
<section class="main2-login">
    <h3 class="t2-login">Apple Store에 로그인하세요</h3>
</section>
<section class="main3-login">
    <form action="${pageContext.request.contextPath}/user/loginProc" method="post">
        <div class="input-group">
            <label for="userId" class="login-t1" >아이디 &nbsp&nbsp</label>
            <input type="text" id="userId" name="userId" oninput="typeOnlyEng(this)" required>
        </div>
        <div class="input-group">
            <label for="userPw" class="login-t1" >비밀번호</label>
            <input type="password" id="userPw" name="userPw" placeholder="" required>
        </div>
        <div class="button-group1">
            <button type="submit">로그인</button>
            <button onclick="location.href='/'" type="button">취소</button>
        </div>
        <div class="button-group2">
            <h4>아직 회원이 아니신가요?</h4><br>
            <button onclick="location.href='signup.jsp'" type="button">회원가입</button>

        </div>
    </form>
    <div class="button-group3">
        <button class="kakao" onclick="location.href='/user/kakao-login'">카카오 로그인</button>
        <button class="naver" onclick="location.href='/user/naver-login'">네이버 로그인</button>
    </div>
</section>
<%@ include file="../modules/footer.jsp"%>
</body>
</html>