<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Apple Store</title>
    <link rel="stylesheet" type="text/css" href="css/apple.css?after1">
</head>
<script>
    const confirmLogout = (type) => {
        if (confirm('로그아웃 하시겠습니까?')) {
            if(type !== 'none') {
                window.location.href = '/user/' + type + '-logout';
            } else {
                window.location.href = '/user/logout';
            }
        }
    }
</script>
<body style="overflow-x: hidden">
<header>
    <div class="container">
        <a href="${pageContext.request.contextPath}/"><img src="${pageContext.request.contextPath}/img/logo2.png" alt="로고" style="width: 30px; height: 30px;"></a>
        <nav class="top_menu">
            <ul>
                <li><a href="${pageContext.request.contextPath}/#sec_iphone">iPhone</a></li>
                <li><a href="${pageContext.request.contextPath}/#sec_ipad">iPad</a></li>
                <li><a href="${pageContext.request.contextPath}/#sec_watch">Watch</a></li>
                <li><a href="${pageContext.request.contextPath}/#sec_mac">Mac</a></li>
                <li><a href="${pageContext.request.contextPath}/store/findStore">스토어</a></li>
                <%
                    if((String)session.getAttribute("isLogin") != null) {
                        String userId = (String) session.getAttribute("userId");
                        out.print("<li style=\"text-decoration-line: underline\"><a href=\"user/my-page\">" + userId + "</a></li>");
                        String loginType = session.getAttribute("loginType").toString();
                        if(loginType.equals("kakao")) {
                %>
                <li><a href="#" onclick="confirmLogout('kakao')">로그아웃</a></li>
                <%
                } else {
                %>
                <li><a href="#" onclick="confirmLogout('none')">로그아웃</a></li>
                <%
                    }
                } else {
                %>
                <li class="green"><a href="${pageContext.request.contextPath}/user/login">로그인</a></li>
                <li class="green"><a href="${pageContext.request.contextPath}/user/signup">회원가입</a></li>
                <%
                    }
                %>
            </ul>
        </nav> <!-- top_menu -->
    </div>
</header>
</body>
</html>