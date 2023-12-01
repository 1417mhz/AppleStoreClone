<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="../css/apple.css?after4">
    <title>로그인</title>
</head>
<script>
    // 아이디 input에 영어만 입력되도록
    const typeOnlyEng = (target) => {
        target.value = target.value .replace(/[^\\!-z]/gi,"");
    }
</script>
<body>
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
            <label for="userId">아이디 &nbsp&nbsp</label>
            <input type="text" id="userId" name="userId" oninput="typeOnlyEng(this)" required>
        </div>
        <div class="input-group">
            <label for="userPw">비밀번호</label>
            <input type="password" id="userPw" name="userPw" placeholder="" required>
        </div>
        <div class="button-group">
            <button type="submit">로그인</button>
            <button onclick="location.href='/'" type="button">취소</button>
        </div>
        <div>
            <h4>아직 회원이 아니신가요?</h4><br>
            <button onclick="location.href='/user/login'" type="button">회원가입</button>
        </div>
    </form>
    <div class="social-login">
        <button class="kakao" onclick="location.href='/user/kakao-login'">카카오 로그인</button>
        <button class="naver" onclick="">네이버 로그인</button>
    </div>
</section>
<%@ include file="../modules/footer.jsp"%>
</body>
</html>