<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <link rel="icon" type="image/png" href="../img/logo2.png">
  <link rel="stylesheet" type="text/css" href="../css/apple.css?after3">
  <title>개인정보 변경</title>
</head>
<script>
  const updateConfirm = () => {
    if (confirm('정말 변경하시겠습니까?')) {
      const form = document.getElementById('submitForm');
      form.submit();
    }
  }
</script>
<body style="overflow-x: hidden">
  <%@ include file="../modules/header.jsp"%>
  <div class="form-container">
    <h1>개인정보 변경</h1>
    <form action="${pageContext.request.contextPath}/user/info-update-proc" method="post">
      <div class="form-group">
        <label for="userEmail"></label>
        <input type="email" id="userEmail" name="userEmail" placeholder="이메일을 입력하세요" required>
      </div>
      <div class="form-group">
        <label for="userName"></label>
        <input type="text" id="userName" name="userName" placeholder="이름을 입력하세요" required>
      </div>
      <div class="form-group">
        <label for="userDob"></label>
        <input type="date" id="userDob" name="userDob" placeholder="생년월일을 입력하세요" required>
      </div>
      <div class="form-group">
        <label for="userContact"></label>
        <input type="tel" id="userContact" name="userContact" placeholder="연락처를 입력하세요" required>
      </div>
      <div class="form-group">
      <button type="button" onclick="updateConfirm()" id="submitForm">변경</button>
      <button type="button" onclick="location.href='/user/my-page'">취소</button>
      </div>
    </form>
  </div>
<%@ include file="../modules/footer.jsp"%>
</body>
</html>
