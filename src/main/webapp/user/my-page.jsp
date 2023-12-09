<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="../css/apple.css?after3">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap">
    <title>Apple Korea</title>
    <style>
        .mypage-button {
            background-color: #D3D3D3; /* 버튼의 배경 색깔을 연한 회색으로 설정 */
            border: none; /* 테두리 없음 */
            color: black; /* 글자 색깔 */
            padding: 15px 32px; /* 패딩 */
            text-align: center; /* 텍스트 가운데 정렬 */
            text-decoration: none; /* 텍스트 밑줄 없음 */
            display: flex; /* Flexbox 사용 */
            justify-content: center; /* 가로 중앙 정렬 */
            align-items: center; /* 세로 중앙 정렬 */
            font-size: 16px; /* 폰트 크기 */
            margin: 0px 2px; /* 위아래 간격을 10px로 설정 */
            cursor: pointer; /* 마우스 포인터 */
            border-radius: 12px; /* 버튼 모서리 둥글게 */
            width: 150px; /* 버튼의 폭을 늘림 */
            height: 45px; /* 버튼의 높이를 늘림 */
        }


        .mypage-button:active {
            background-color: #A9A9A9; /* 버튼 클릭 시 배경 색깔을 진한 회색으로 설정 */
        }
        /*--------------------------------------------------------------------------*/
        .main-user {
            display: flex; /* flex 레이아웃 활성화 */

        }

        .mypage-container {
            margin-left: 20%;
            width: 40%; /* 너비 설정 */
        }

        .mypage-admin {
            margin-left: 2%; /* .mypage-container와의 간격 조절 */
            margin-right: 15%; /* 오른쪽으로 30% 떨어지게 만듬 */
            width: 60%; /* 너비 설정 */
        }
        .mypage-admin {
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
        }

        .admin-table tr:nth-child(even) {
            background-color: #f2f2f2; /* 짝수 행 배경색 설정 */
        }

        .admin-section-title {
            font-size: 20px;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .admin-action-button {
            background-color: #007aff; /* 버튼 배경색 설정 */
            color: white; /* 버튼 글자색 설정 */
            border: none;
            border-radius: 5px;
            padding: 5px 10px;
            font-size: 14px;
            cursor: pointer;
        }


    </style>
</head>
<script>
    const confirmLeave = () => {
        if (confirm('정말 탈퇴하시겠습니까?')) window.location.href = '/user/leave';
    }
    const confirmCancel = (orderNo) => {
        if (confirm('정말로 취소 처리하시겠습니까?')) {
            window.location.href = '/order-cancel?orderNo=' + orderNo;
        }
    }
    const chatWinOpen = (chatId) => {
        window.open("../chatclient/ChatWindow.jsp?chatId=" + chatId, "", "width=320,height=400");
    }
</script>
<body>
<%@ include file="../modules/header.jsp"%>
<section class="main-user">
    <div class="mypage-container">
        <h1 class="mypage-title">마이페이지</h1>
        <div class="mypage-menu">
            <ul>
                <li>${userBean.userEmail}</li>
                <li>등급 - ${userBean.userRole}</li>
                <li>잔고 - ${userBean.userBalance}</li>
                <li>구매금액 - ${userBean.payAmount}</li>
            </ul>
        </div>
        <div class="mypage-menu">
            <ul>
                <li><a href="#">주문내역</a></li>
                <li><a href="${pageContext.request.contextPath}/user/info-update">개인정보 변경</a></li>
                <li><a href="${pageContext.request.contextPath}/user/pw-change">비밀번호 변경</a></li>
            </ul>
        </div>
        <button class="mypage-button" type="button" onclick="chatWinOpen('user')">실시간 상담</button><br>
        <button class="mypage-button" onclick="confirmLeave()" type="button">회원 탈퇴</button><br>
        <c:if test="${not empty sessionScope.isAdmin}">
            <button class="mypage-button" type="button" onclick="location.href='/admin-page'">관리자</button>
        </c:if>
    </div>
    <div class="mypage-admin">
        <h2 class="admin-section-title">주문 관리</h2>
        <table class="admin-table">
            <thead>
            <tr>
                <th>주문 번호</th>
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
</section>
<%@ include file="../modules/footer.jsp"%>
</body>
</html>