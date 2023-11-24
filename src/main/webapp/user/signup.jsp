<%@ page import="java.util.HashMap" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>회원가입</title>
</head>
<body>
<%!
    HashMap<String, Object> userInfo;
%>
<%
    boolean infoDelivered = false;
    if(request.getAttribute("kakaoUser") != null) {
        userInfo = (HashMap<String, Object>)request.getAttribute("kakaoUser");
        infoDelivered = true;
    }
%>
<form action="${pageContext.request.contextPath}/user/signupProc" method="post">
    <div>
        <label for="userId">아이디</label>
        <input type="text" id="userId" name="userId" oninput="typeOnlyEng(this)" required>
    </div>
    <div>
        <label for="userPw">비밀번호</label>
        <input type="password" id="userPw" name="userPw" placeholder="" required>
    </div>
    <div>
        <label for="userEmail">이메일</label>
        <%
            if(infoDelivered) {
        %>
                <input type="email" id="userEmail" name="userEmail" value="<%= userInfo.get("email") %>" readonly>
        <%
            } else {
        %>
                <input type="email" id="userEmail" name="userEmail" placeholder="" required>
        <%
            }
        %>
    </div>
    <div>
        <label for="userName">성명</label>
        <%
            if(infoDelivered) {
        %>
                <input type="text" id="userName" name="userName" value="<%= userInfo.get("nickname") %>" required>
        <%
            } else {
        %>
                <input type="text" id="userName" name="userName" placeholder="" required>
        <%
            }
        %>
    </div>
    <div>
        <label for="userDob">생년월일</label>
        <input type="date" id="userDob" name="userDob" placeholder="" required>
    </div>
    <div>
        <label for="userContact">연락처</label>
        <input type="text" id="userContact" name="userContact" placeholder="" required>
    </div>

    <div class="row">
        <div class="col">
            <button type="submit">회원가입</button>
        </div>
        <div class="col">
            <button onclick="location.href='/'" type="button">취소</button>
        </div>
        <div class="col">
            <button type="reset">초기화</button>
        </div>
    </div>
</form>
</body>
</html>
