<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../css/apple.css?after3">
<title>Apple Korea</title>
</head>
<script>
  const confirmUpdate = () => {
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
    <form action="${pageContext.request.contextPath}/user/info-update-proc" method="post" id="submitForm">
      <div class="form-group">
        <label for="userEmail">이메일</label>
        <input type="email" id="userEmail" name="userEmail">
      </div>
      <div class="form-group">
        <label for="userName">이름</label>
        <input type="text" id="userName" name="userName">
      </div>
      <div class="form-group">
        <label for="userDob">생년월일</label>
        <input type="date" id="userDob" name="userDob">
      </div>
      <div class="form-group">
        <label for="userContact">연락처</label>
        <input type="tel" id="userContact" name="userContact">
      </div>
      <div class="form-group">
        <button type="button" onclick="confirmUpdate()">변경</button>
        <button type="button" onclick="location.href='/user/my-page'">취소</button>
      </div>
    </form>
  </div>
<%@ include file="../modules/footer.jsp"%>
</body>
</html>
