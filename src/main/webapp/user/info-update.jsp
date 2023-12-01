<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../css/apple.css?after3">
<title>Apple Korea</title>
</head>
<body style="overflow-x: hidden">
  <%@ include file="../modules/header.jsp"%>
  <div class="form-container">
    <h1>개인정보 변경</h1>
    <form action="${pageContext.request.contextPath}/user/info-update-proc" method="post">
      <div class="form-group">
        <label for="email">이메일</label>
        <input type="email" id="email" name="email" required>
      </div>
      <div class="form-group">
        <label for="name">이름</label>
        <input type="text" id="name" name="name" required>
      </div>
      <div class="form-group">
        <label for="birthdate">생년월일</label>
        <input type="date" id="birthdate" name="birthdate" required>
      </div>
      <div class="form-group">
        <label for="phone">연락처</label>
        <input type="tel" id="phone" name="phone" required>
      </div>
      <div class="form-group">
      <button type="submit">변경</button>
      </div>
    </form>
  </div>
<%@ include file="../modules/footer.jsp"%>
</body>
</html>
