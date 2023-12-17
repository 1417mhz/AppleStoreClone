<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <link rel="icon" type="image/png" href="../img/logo2.png">
    <link rel="stylesheet" type="text/css" href="../css/apple.css?after10">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap">
    <title>Apple Store - 로그인</title>
    <style>
        .login-container {
            justify-content: center;
            height: 75%;
        }

        .container-div {
            margin-top: 20%;
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
            margin-bottom: 100px;
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
        .button-group2 span {
            color: black; /* 텍스트 색상을 검정색으로 설정 */
        }

        .button-group2 .create-link {
            color: blue !important; /* 텍스트 색상을 파란색으로 설정하며, !important 키워드를 사용하여 이 스타일이 덮어쓰이는 것을 방지 */
            text-decoration: none; /* 밑줄을 제거 */
            cursor: pointer; /* 마우스를 올렸을 때 커서가 손가락 모양으로 바뀌게 설정 */
        }

        .button-group2 .create-link:hover {
            text-decoration: underline; /* 마우스를 올렸을 때 밑줄 추가 */
        }

        .button-group1 {
            display: flex; /* 로그인과 취소 버튼을 가로로 나열하기 위해 flexbox를 사용합니다. */
            justify-content: space-between; /* 로그인과 취소 버튼을 동일한 간격으로 가로로 정렬합니다. */
        }

        .button-group1 .login-btn1,
        .button-group1 .login-btn2 {
            background-color: #999999; /* 버튼의 배경색을 회색으로 지정합니다. */
            color: white; /* 버튼의 텍스트 색상을 흰색으로 지정합니다. */
            padding: 10px 80px; /* 버튼의 내부 여백을 조정합니다. */
            border: none; /* 버튼의 테두리를 제거합니다. */
            cursor: pointer; /* 마우스를 올리면 커서 모양이 포인터로 변경됩니다. */
            border-radius: 5px; /* 버튼의 모서리를 5px만큼 둥글게 설정합니다. */
            font-size: 13px;
            margin-top: 5px;
        }

        .button-group1 .login-btn1,
        .button-group1 .login-btn2:hover {
            background-color: darkgray; /* 마우스를 올렸을 때 버튼의 배경색을 어둡게 변경합니다. */
        }

        .button-group3 {
            display: flex;
            justify-content: space-between;
        }

        .button-group3 .naver,
        .button-group3 .kakao {
            padding: 11px 60px; /* 버튼의 내부 여백을 조정합니다. */
            font-size: 12px;
            font-weight: bold;
            text-align: center;
            border-radius: 5px; /* 버튼의 모서리를 5px만큼 둥글게 설정합니다. */
            border: none; /* 검은색 테두리를 없앱니다. */
            margin-bottom: 20px;
            cursor: pointer;
        }

        .button-group3 .naver {
            background-color: #2DB400;
            color: white;
        }

        .button-group3 .kakao {
            background-color: #FEE500;
            color: black;
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
    <div class="login-container">
        <div class="container-div">
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
                        <label for="userId" class="login-t1"></label>
                        <input type="text" id="userId" name="userId" oninput="typeOnlyEng(this)" placeholder="아이디를 입력하세요" required>
                    </div>

                    <div class="input-group">
                        <label for="userPw" class="login-t1" ></label>
                        <input type="password" id="userPw" name="userPw" placeholder="비밀번호를 입력하세요" required>
                    </div>
                    <div class="button-group1">
                        <button class="login-btn1" type="submit">로그인</button>
                        <button class="login-btn2" onclick="location.href='/'" type="button">&nbsp취소&nbsp</button>
                    </div>
                </form>
                <div class="button-group3">
                    <button class="kakao" onclick="location.href='/user/kakao-login'">카카오 로그인</button>
                    <button class="naver" onclick="location.href='/user/naver-login'">네이버 로그인</button>
                </div>
                <div class="button-group2">
                    <span>Apple ID가 없으십니까?</span>
                    <a href="${pageContext.request.contextPath}/user/signup" class="create-link">지금 만드세요!</a>
                </div>
            </section>
        </div>
    </div>
    <%@ include file="../modules/footer.jsp"%>
</body>
</html>