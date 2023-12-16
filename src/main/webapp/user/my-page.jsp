<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="../css/apple.css?after5">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap">
    <title>Apple Korea</title>
    <style>

        /*--------------------------------------------------------------------------*/
        body {
            font-family: 'San Francisco', 'Helvetica Neue', Arial, sans-serif; /* 애플 사이트에서 사용하는 폰트 */
            background-color: #fff; /* 흰색 배경 */
            color: #333; /* 어두운 텍스트 색상 */
        }
        .main-user {
            display: flex; /* Flexbox 사용 */
            justify-content: space-between; /* 두 요소 사이에 공간 추가 */
            padding: 0 10%; /* 양쪽에 10%의 패딩을 추가하여 총 너비가 100%가 되도록 함 */
            height: 100%;
        }

        .mypage-container{
            width: 17%; /* 너비를 20%로 설정 */
            box-sizing: border-box; /* 패딩과 테두리가 너비에 포함되도록 설정 */
        }
        .mypage-admin{
            width: 75%; /* 너비를 40%로 설정 */
            box-sizing: border-box; /* 패딩과 테두리가 너비에 포함되도록 설정 */
        }
        .admin-table {
            width: 100%; /* 테이블 너비를 100%로 설정 */
            border-collapse: collapse; /* 테이블 셀의 테두리를 합치도록 설정 */
        }

        .admin-table th, .admin-table td {
            border: 1px solid #ccc; /* 테이블 셀에 테두리 추가 */
            padding: 10px; /* 테이블 셀에 패딩 추가 */
            text-align: left; /* 텍스트를 왼쪽으로 정렬 */
        }
        .mypage-title {
            font-size: 2em;
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }

        .mypage-menu-t ul {
            list-style: none;
            padding: 0;
            margin: 0;
            font-size: 1em;
            color: #666;
        }

        .mypage-menu-t li {
            padding: 10px 0;
            border-bottom: 1px solid #ddd;
        }

        .mypage-menu ul {
            list-style: none;
            padding: 0;
            margin: 20px 0;
        }

        .mypage-menu li {
            padding: 10px 0;
            /* border-bottom: 1px solid #ddd; */ /* 주석 처리하여 밑줄 제거 */
        }

        .mypage-menu a {
            color: #0070c9;
            text-decoration: none;
        }

        .mypage-menu a:hover {
            text-decoration: underline;
        }

        .mypage-button {
            width: 100%;
            padding: 10px;
            /* background-color: #0070c9; */ /* 주석 처리하여 기존 배경색 제거 */
            background-color: #d3d3d3; /* 버튼 배경색을 연한 회색으로 변경 */
            color: #fff;
            border: none;
            cursor: pointer;
            margin-bottom: 10px;
            border-radius: 5px;
        }

        .mypage-button:hover {
            /* background-color: #005999; */ /* 주석 처리하여 기존 호버 색상 제거 */
            background-color: #b3b3b3; /* 버튼 호버 시 색상을 보다 어두운 회색으로 변경 */
        }



        .admin-table {
            table-layout: fixed; /* 테이블 레이아웃을 고정 */
            width: 1000px; /* 테이블 너비를 1000px로 설정, 원하는 값으로 변경 가능 */
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
            font-size: 1.5em; /* 제목 크기 설정 */
            font-weight: bold; /* 굵은 폰트 설정 */
            border-bottom: 2px solid #333; /* 제목 밑에 두꺼운 선 추가 */
            padding-bottom: 10px; /* 제목과 선 사이의 간격 설정 */
            margin-bottom: 20px; /* 제목과 테이블 사이의 간격 설정 */
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
        window.open("../chatclient/ChatWindow.jsp?chatId=" + chatId, "", "width=301,height=378");
    }
</script>
<body>
<%@ include file="../modules/header.jsp"%>
<section class="main-user">
    <div class="mypage-container">
        <h1 class="mypage-title">마이페이지</h1>
        <div class="mypage-menu-t">
            <ul>
                <li>${userBean.userEmail}</li>
                <li>.${userBean.userRole}</li>
                <li>포인트: ${userBean.userBalance}</li>
                <li>구매금액: ${userBean.payAmount}</li>
            </ul>
        </div>
        <div class="mypage-menu">
            <ul>
                <li>주문내역</li>
                <li><a href="${pageContext.request.contextPath}/user/info-update">개인정보 변경</a></li>
                <li><a href="${pageContext.request.contextPath}/user/pw-change">비밀번호 변경</a></li>
            </ul>
        </div>
        <button class="mypage-button" type="button" onclick="chatWinOpen('user')">실시간 상담</button><br>
        <button class="mypage-button" onclick="confirmLeave()" type="button">회원 탈퇴</button><br>
        <c:if test="${not empty sessionScope.isAdmin}">
            <button class="mypage-button" type="button" onclick="location.href='/admin-page'">관리자 페이지</button>
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