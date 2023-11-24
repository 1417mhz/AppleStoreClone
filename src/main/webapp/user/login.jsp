<%@ page contentType="text/html;charset=UTF-8" language="java"
         import="com.ysw.applestoreclone.sensitiveinfo.SensInfoProvider" %>
<html>
<head>
    <title>로그인</title>
</head>
<script>
    // 아이디 input에 영어만 입력되도록
    const typeOnlyEng = (target) => {
        target.value = target.value .replace(/[^\\!-z]/gi,"");
    }
</script>
<body>
    <form action="${pageContext.request.contextPath}/user/loginProc" method="post">
        <div>
            <label for="userId">아이디</label>
            <input type="text" id="userId" name="userId" oninput="typeOnlyEng(this)" required>
        </div>
        <div>
            <label for="userPw">비밀번호</label>
            <input type="password" id="userPw" name="userPw" placeholder="" required>
        </div>
        <div class="row">
            <div class="col">
                <button type="submit">로그인</button>
            </div>
            <div class="col">
                <button onclick="location.href='/'" type="button">취소</button>
            </div>
            <div class="col">
                <button type="reset">초기화</button>
            </div>
        </div>
        <div class="row">
            <div class="col">
                <a href="<%= SensInfoProvider.getLoginRedirectUrl() %>"><img src="${pageContext.request.contextPath}/img/kakao_login_medium_narrow.png" alt="카카오 로그인"></a>
            </div>
        </div>
    </form>
</body>
</html>
