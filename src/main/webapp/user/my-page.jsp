<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="../css/apple.css?after3">
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
        }

        .mypage-container{
            width: 17%; /* 너비를 20%로 설정 */
            box-sizing: border-box; /* 패딩과 테두리가 너비에 포함되도록 설정 */
        }
        .mypage-admin{
            width: 65%; /* 너비를 40%로 설정 */
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
            font-size: 2em; /* 제목 크기 */
            font-weight: bold; /* 굵은 폰트 */
            border-bottom: 1px solid #333; /* 제목 밑줄 */
            margin-bottom: 20px; /* 제목과 내용 사이의 간격 */
        }

        .mypage-menu {
            margin-bottom: 20px; /* 메뉴 간 간격 */
        }

        .mypage-menu ul {
            list-style: none; /* 리스트 스타일 제거 */
            padding: 0; /* 리스트 패딩 제거 */
        }

        .mypage-menu li {
            margin-bottom: 10px; /* 리스트 아이템 간 간격 */
        }

        .mypage-menu a {
            color: #0070c9; /* 링크 색상 */
            text-decoration: none; /* 링크 밑줄 제거 */
        }

        .mypage-menu a:hover {
            text-decoration: underline; /* 링크에 마우스를 올렸을 때 밑줄 추가 */
        }

        .mypage-button {
            background-color: #d3d3d3; /* 버튼 배경색을 연한 회색으로 변경 */
            color: #000; /* 버튼 텍스트 색상을 검은색으로 변경 */
            border: none; /* 버튼 테두리 제거 */
            padding: 10px 20px; /* 버튼 내부 여백 */
            margin-bottom: 10px; /* 버튼 간 간격 */
            cursor: pointer; /* 마우스를 올렸을 때 커서가 손가락 모양으로 바뀌게 설정 */
            width: 150px; /* 버튼의 너비를 100px로 설정 */
            height: 40px; /* 버튼의 높이를 40px로 설정 */
            border-radius: 10px; /* 모서리를 둥글게 만듦 */
            text-align: center; /* 텍스트를 가운데 정렬 */
        }

        .mypage-button:hover {
            background-color: #a9a9a9; /* 마우스를 올렸을 때 버튼 배경색을 진한 회색으로 변경 */
        }

        .mypage-button:active {
            background-color: #696969; /* 버튼을 클릭할 때 배경색을 더 진한 회색으로 변경 */
        }


        /*--------------------------------------------------------------------------*/
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
        window.open("../chatclient/ChatWindow.jsp?chatId=" + chatId, "", "width=301,height=378");
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