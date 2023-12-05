<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
                    <li><a href="#">iPhone</a></li>
                    <li><a href="#">iPad</a></li>
                    <li><a href="#">Watch</a></li>
                    <li><a href="#">Mac</a></li>
                    <li><a href="#">액세서리</a></li>
                    <%
                        if((String)session.getAttribute("isLogin") != null) {
                            String userId = (String) session.getAttribute("userId");
                            out.print("<li style=\"text-decoration-line: underline\"><a href=\"user/my-page\">" + userId + "</a></li>");

                        if(session.getAttribute("kakaoLogin") != null) {
                    %>
                            <li><a href="#" onclick="confirmLogout('kakao')">로그아웃</a></li>
                    <%
                        } else if(session.getAttribute("naverLogin") != null) {
                    %>
                            <li><a href="#" onclick="confirmLogout('none')">로그아웃</a></li>
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