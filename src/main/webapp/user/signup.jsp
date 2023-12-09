<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="../css/apple.css?after2">
    <title>Apple Korea</title>
</head>
<script>
    // 아이디 input에 영어만 입력되도록
    const typeOnlyEng = (target) => {
        target.value = target.value .replace(/[^\\!-z]/gi,"");
    }
    const confirmSignup = () => {
        if (confirm('정말 가입하시겠습니까?')) {
            const form = document.getElementById('submitForm');
            form.submit();
        }
    }
</script>
<%!
    HashMap<String, Object> userInfo;
%>
<%
    boolean infoDelivered = false;
    String currentType = "";
    if(request.getAttribute("kakaoUser") != null) {
        userInfo = (HashMap<String, Object>)request.getAttribute("kakaoUser");
        infoDelivered = true;
        currentType = "kakao";
    }
    if(request.getAttribute("naverUser") != null) {
        userInfo = (HashMap<String, Object>)request.getAttribute("naverUser");
        infoDelivered = true;
        currentType = "naver";
    }
%>
<body>
<%@ include file="../modules/header.jsp"%>
<section class="signup-form">
    <h1 class="h1-s">Apple ID 생성</h1><br>
    <h3 class="h3-s">하나의 Apple ID로 모든 Apple 서비스를 이용할 수 있습니다.</h3>
    <form action="${pageContext.request.contextPath}/user/signupProc" method="post" id="submitForm">
        <div class="input-group">
            <label for="userId">아이디 &nbsp&nbsp</label>
            <input type="text" id="userId" name="userId" oninput="typeOnlyEng(this)" required>
        </div>
        <div class="input-group">
            <%
                if(!infoDelivered) {
            %>
            <label for="userPw">비밀번호</label>
            <input type="password" id="userPw" name="userPw" placeholder="" required>
            <%
                }
            %>
        </div>
        <div class="input-group">
            <label for="userEmail">이메일 &nbsp&nbsp</label>
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
        <div class="input-group">
            <label for="userName">성명 &nbsp&nbsp&nbsp&nbsp&nbsp</label>
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
        <div class="input-group">
            <label for="userDob">생년월일</label>
            <input type="date" id="userDob" name="userDob" placeholder="" required>
        </div>
        <div class="input-group">
            <label for="userContact">연락처 &nbsp&nbsp</label>
            <input type="text" id="userContact" name="userContact" placeholder="" required>
        </div>
        <%
            if(infoDelivered) {
        %>
        <div>
            <div>
                <label for="socialType">소셜로그인 타입</label>
                <input type="text" id="socialType" name="socialType" value="<%= currentType %>" readonly>
            </div>
        </div>
        <div>
            <div>
                <label for="socialId">소셜로그인 ID</label>
                <input type="text" id="socialId" name="socialId" value="<%= userInfo.get("socialId") %>" readonly>
            </div>
        </div>
        <%
            }
        %>

        <div class="button-group">
            <button type="button" onclick="confirmSignup()">회원가입</button>
            <button onclick="location.href='/'" type="button">취소</button>
            <button type="reset">초기화</button>
        </div>
    </form>
</section>
<%@ include file="../modules/footer.jsp"%>
</body>
</html>