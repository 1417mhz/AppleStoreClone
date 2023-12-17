<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="icon" type="image/png" href="../img/logo2.png">
    <link rel="stylesheet" type="text/css" href="../css/apple.css?after4">
    <title>비밀번호 변경</title>
</head>
<script>
    const compareAndSubmit = () => {
        const newPw = document.getElementById('new-password').value;
        const confirmPw = document.getElementById('confirm-password').value;
        if(confirm('정말 변경하시겠습니까?')) {
            if (newPw === confirmPw) {
                const form = document.getElementById('submitForm');
                form.submit();
            } else {
                alert('새로운 비밀번호와 확인 비밀번호가 일치하지 않습니다!');
            }
        }
    };
</script>
<body>
<%@ include file="../modules/header.jsp"%>
<div class="password-change-container">
    <h1 class="password-change-title">비밀번호 수정</h1>
    <form action="${pageContext.request.contextPath}/user/pw-change-proc" class="password-change-form" method="post" id="submitForm">
        <div>
            <label for="current-password"></label>
            <input type="password" id="current-password" name="currentPw" placeholder="현재 비밀번호" required>
        </div>
        <div>
            <label for="new-password"></label>
            <input type="password" id="new-password" name="newPw" placeholder="새로운 비밀번호" required>
        </div>
        <div>
            <label for="confirm-password"></label>
            <input type="password" id="confirm-password" name="confirmPw" placeholder="새로운 비밀번호 확인" required>
        </div>
        <button class="password-change-button" onclick="compareAndSubmit()" type="button">변경</button>
        <button class="password-change-button" onclick="location.href='/'" type="button">취소</button>
    </form>
</div>
<%@ include file="../modules/footer.jsp"%>
</body>
</html>