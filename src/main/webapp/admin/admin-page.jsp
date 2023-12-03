<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../css/apple.css?after1">
<title>Apple Korea</title>
</head>
<script>
  const chatWinOpen = (chatId) => {
    window.open("../chatclient/ChatWindow.jsp?chatId=" + chatId, "", "width=320,height=400");
  }
</script>
<body>
  <%@ include file="../modules/header.jsp"%>

  <div class="admin-container">
    <h1 class="admin-title">관리자 페이지</h1>

    <!-- 회원 관리 섹션 -->
    <div class="admin-section">
      <h2 class="admin-section-title">회원 관리</h2>
      <table class="admin-table">
        <thead>
          <tr>
            <th>회원명</th>
            <th>이메일</th>
            <th>등급</th>
            <th>조작</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>홍길동</td>
            <td>honggildong@example.com</td>
            <td>일반 회원</td>
            <td>
              <div class="admin-actions">
                <button class="admin-action-button">등급 변경</button>
                <button class="admin-action-button delete">탈퇴</button>
              </div>
            </td>
          </tr>
          <!-- 다른 회원들의 정보도 동일한 형식으로 추가 -->
        </tbody>
      </table>
    </div>

    <!-- 주문 관리 섹션 -->
    <div class="admin-section">
      <h2 class="admin-section-title">주문 관리</h2>
      <table class="admin-table">
        <thead>
          <tr>
            <th>주문 번호</th>
            <th>주문 날짜</th>
            <th>주문 내역</th>
            <th>조작</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>12345</td>
            <td>2023-11-01</td>
            <td>상품 A, 상품 B</td>
            <td>
              <div class="admin-actions">
                <button class="admin-action-button">상세 보기</button>
                <button class="admin-action-button delete">삭제</button>
              </div>
            </td>
          </tr>
          <!-- 다른 주문들의 정보도 동일한 형식으로 추가 -->
        </tbody>
      </table>
    </div>

    <div class="admin-section">
      <button type="button" onclick="chatWinOpen('admin')">실시간 상담 입장</button>
    </div>
    </div>
<%@ include file="../modules/footer.jsp"%>
</body>
</html>
