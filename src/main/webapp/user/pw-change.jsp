<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="../css/apple.css?after4">
    <title>Apple Korea</title>
    <%@ include file="../modules/header.jsp"%>
</head>
<script>
    const compareAndSubmit = () => {
        const newPw = document.getElementById('newPw').value;
        const confirmPw = document.getElementById('confirmPw').value;

        if (newPw === confirmPw) {
            const form = document.getElementById('submitForm');
            form.submit();
        } else {
            alert('새로운 비밀번호와 확인 비밀번호가 일치하지 않습니다!');
        }
    };
</script>
<body>
<div class="password-change-container">
    <h1 class="password-change-title">비밀번호 수정</h1>
    <form action="${pageContext.request.contextPath}/user/pw-change-proc" class="password-change-form" method="post" id="submitForm">
        <div>
            <label for="current-password">현재 비밀번호</label>
            <input type="password" id="current-password" name="currentPw" required>
        </div>
        <div>
            <label for="new-password">변경할 비밀번호</label>
            <input type="password" id="new-password" name="newPw" required>
        </div>
        <div>
            <label for="confirm-password">비밀번호 확인</label>
            <input type="password" id="confirm-password" name="confirmPw" required>
        </div>
        <button class="password-change-button" onclick="compareAndSubmit()" type="button">변경</button>
        <button class="password-change-button" onclick="location.href='/'" type="button">취소</button>
    </form>
</div>
<%@ include file="../modules/footer.jsp"%>
</body>
</html>