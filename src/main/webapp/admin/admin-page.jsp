<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <link rel="stylesheet" type="text/css" href="../css/apple.css?after9">
  <title>Apple Korea</title>
  <style>
    /*-----관리자 페이지 ------*/
    .admin-btn {
      background-color: #D3D3D3; /* 버튼의 배경 색깔을 연한 회색으로 설정 */
      border: none; /* 버튼의 테두리를 제거 */
      display: flex; /* Flexbox 사용 */
      justify-content: center; /* 가로 중앙 정렬 */
      align-items: center; /* 세로 중앙 정렬 */
      font-size: 16px; /* 폰트 크기 */
      margin: 0px 2px; /* 위아래 간격을 10px로 설정 */
      cursor: pointer; /* 마우스 포인터 */
      border-radius: 12px; /* 버튼 모서리 둥글게 */
      width: 150px; /* 버튼의 폭을 늘림 */
      height: 45px; /* 버튼의 높이를 늘림 */
      cursor: pointer; /* 마우스를 올렸을 때 커서가 손가락 모양으로 바뀌게 설정 */
      transition: all 0.3s ease; /* 버튼의 색상과 크기가 부드럽게 변하게 설정 */
    }

    .admin-btn:active {
      background-color: #333; /* 버튼을 클릭했을 때 배경색을 진한 회색으로 설정 */
      transform: scale(1.1); /* 버튼을 클릭했을 때 버튼의 크기를 10% 증가시킴 */
    }
    .admin-container {
      font-family: 'Roboto', sans-serif; /* 폰트 설정 */
    }

    .admin-table {
      width: 100%;
      border-collapse: collapse;
      margin: 20px 0;
    }

    .admin-table th, .admin-table td {
      text-align: left;
      padding: 10px;
      border-bottom: 1px solid #ddd; /* 테두리 설정 */
    }

    .admin-table th {
      background-color: #f6f6f6; /* 헤더 배경색 설정 */
      color: #333; /* 헤더 글자색 설정 */
      white-space: nowrap; /* 긴 글자를 한 줄로 유지 */
    }

    .admin-table tr:nth-child(even) {
      background-color: #f2f2f2; /* 짝수 행 배경색 설정 */
    }

    .admin-section {
      margin-bottom: 30px;
    }

    .admin-section-title {
      font-size: 20px;
      font-weight: bold;
      margin-bottom: 10px;
    }

    .admin-action-button {
      white-space: nowrap; /* 긴 글자를 한 줄로 유지 */
      background-color: #007aff; /* 버튼 배경색 설정 */
      color: white; /* 버튼 글자색 설정 */
      border: none;
      border-radius: 5px;
      padding: 5px 10px;
      font-size: 14px;
      cursor: pointer;
    }
    /*-----관리자 페이지 ------*/
  </style>
</head>
<script>
  const chatWinOpen = (chatId) => {
    window.open("../chatclient/ChatWindow.jsp?chatId=" + chatId, "", "width=305,height=385");
  }
  const ifNotAdmin = () => {
    alert('접근 실패! 권한을 확인하세요.');
    window.location.href = '/';
  }
  const confirmLeave = (leaveId) => {
    if (confirm('정말로 탈퇴 처리하시겠습니까?')) {
      window.location.href = '/admin/user-leave?leaveUser=' + leaveId;
    }
  }
  const confirmCancel = (orderNo) => {
    if (confirm('정말로 취소 처리하시겠습니까?')) {
      window.location.href = '/admin/order-cancel?orderNo=' + orderNo;
    }
  }
  <c:if test="${empty sessionScope.isAdmin}">
  ifNotAdmin();
  </c:if>
</script>
<body>
<%@ include file="../modules/header.jsp"%>

<div class="admin-container">
  <h1 class="admin-title">관리자 페이지</h1> <!-- 회원 관리 섹션 -->
  <div class="admin-section">
    <h2 class="admin-section-title">회원 관리</h2>
    <table class="admin-table">
      <thead>
      <tr>
        <th>회원 번호</th>
        <th>아이디</th>
        <th>이메일</th>
        <th>잔고</th>
        <th>등급</th>
        <th>상태</th>
        <th>조작</th>
      </tr>
      </thead>
      <tbody>
      <c:forEach var="user" items="${userList}">
        <tr>
          <td>${user.userNo}</td>
          <td>${user.userId}</td>
          <td>${user.userEmail}</td>
          <td>${user.userBalance}</td>
          <td>${user.userRole}</td>
          <c:if var="userState" test="${user.userState eq 'active'}">
            <td>활성</td>
          </c:if>
          <c:if var="userState" test="${user.userState eq 'inactive'}">
            <td>탈퇴</td>
          </c:if>
          <td>
            <c:if var="isActive" test="${user.userState eq 'active'}">
              <div class="admin-actions">
                  <%--                    <button type="button" class="admin-action-button">등급 변경</button>--%>
                <button type="button" class="admin-action-button" onclick="confirmLeave('${user.userId}')">탈퇴</button>
              </div>
            </c:if>
          </td>
        </tr>
      </c:forEach>
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
        <th>구매자</th>
        <th>주문 제품</th>
        <th>결제 금액</th>
        <th>주문 날짜</th>
        <th>취소 날짜</th>
        <th>상태</th>
        <th>조작</th>
      </tr>
      </thead>
      <tbody>
      <c:forEach var="order" items="${orderList}">
        <tr>
          <td>${order.orderNo}</td>
          <td>${order.buyer}</td>
          <td>${order.productTitle}</td>
          <td>${order.orderPrice}</td>
          <td>${order.orderDate}</td>
          <td>${order.orderCancelDate}</td>
          <c:if var="orderState" test="${order.orderState eq 'active'}">
            <td>활성</td>
          </c:if>
          <c:if var="orderState" test="${order.orderState eq 'canceled'}">
            <td>취소</td>
          </c:if>
          <td>
            <c:if var="isActive" test="${order.orderState eq 'active'}">
              <div class="admin-actions">
                  <%-- <button class="admin-action-button">상세 보기</button> --%>
                <button class="admin-action-button delete" onclick="confirmCancel('${order.orderNo}')">취소</button>
              </div>
            </c:if>
          </td>
        </tr>
      </c:forEach>
      </tbody>
    </table>
  </div>



  <div class="admin-section">
    <button class="admin-btn" type="button" onclick="chatWinOpen('admin')">실시간 상담 입장</button>
  </div>
</div>
<%@ include file="../modules/footer.jsp"%>
</body>
</html>
