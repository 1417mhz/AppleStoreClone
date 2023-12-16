<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<body>
<%@ include file="../modules/header.jsp"%>
<section class="signup-form">
    <h1 class="h1-s">Apple ID 생성</h1><br>
    <h3 class="h3-s">하나의 Apple ID로 모든 Apple 서비스를 이용할 수 있습니다.</h3>
    <form action="${pageContext.request.contextPath}/user/signupProc" method="post" id="submitForm">
        <div class="input-group">
            <label for="userId"></label>
            <input type="text" id="userId" name="userId" oninput="typeOnlyEng(this)" placeholder="아이디를 입력하세요" required>
        </div>
        <c:if test="${empty signupUser}">
        <div class="input-group">
            <label for="userPw"></label>
            <input type="password" id="userPw" name="userPw" placeholder="비밀번호를 입력하세요" required>
        </div>
        </c:if>
        <div class="input-group">
            <label for="userEmail"></label>
            <c:choose>
                <c:when test="${not empty signupUser}">
                    <input type="email" id="userEmail" name="userEmail" value="${signupUser.userEmail}" readonly>
                </c:when>
                <c:otherwise>
                    <input type="email" id="userEmail" name="userEmail" placeholder="이메일을 입력하세요" required>
                </c:otherwise>
            </c:choose>
        </div>
        <div class="input-group">
            <label for="userName"></label>
            <c:if test="${not empty signupUser}">
                <input type="text" id="userName" name="userName" value="${signupUser.userName}" placeholder="이름을 입력하세요" required>
            </c:if>
            <c:if test="${empty signupUser}">
                <input type="text" id="userName" name="userName" placeholder="이름을 입력하세요" required>
            </c:if>
        </div>
        <div class="input-group">
            <label for="userDob"></label>
            <input type="date" id="userDob" name="userDob"  placeholder="생년원일을 입력하세요" required>
        </div>
        <div class="input-group">
            <label for="userContact"></label>
            <input type="text" id="userContact" name="userContact" placeholder="연락처를 입력하세요" required>
        </div>
        <c:if test="${not empty signupUser}">
            <input type="hidden" id="socialType" name="socialType" value="${signupUser.socialType}">
            <input type="hidden" id="socialId" name="socialId" value="${signupUser.socialId}">
        </c:if>
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