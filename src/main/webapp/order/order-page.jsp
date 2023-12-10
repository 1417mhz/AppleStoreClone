<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="../css/apple.css?after6">
    <title>Apple 결제 페이지</title>
    <style>
        .h1-order {
            text-align: center;
            font-family: "Apple SD Gothic Neo", Arial, sans-serif;
        }
        .h3-order{
            margin-left: 24%;
        }
        .image-section-order {
            display: flex;
            align-items: center;
        }

        .image-container {
            display: flex;
            justify-content: center;
            align-items: center;
            text-align: center;
            margin-left: 20%;
        }
        .item-container{
            margin-left: 250px;
        }

        .buy-image {
            width: 400px;
            height: 400px;
            border-radius: 15px; /* 모서리 둥글게 만들기 */
        }

        .text-container p {
            margin: 5px 0;
        }


        .s-order option {
            padding: 5px;
        }

        hr {
            margin-top: 30px;
            margin-bottom: 30px;
            margin-left: 300px;
            margin-right: 300px;
        }
        .submit-btn {
            display: inline-block;
            width: 120px; /* 라벨의 너비와 동일 */
            height: 30px; /* 라벨의 높이와 동일 */
            line-height: 30px;  /* 라벨의 line-height와 동일, 텍스트를 수직 중앙에 배치 */
            background-color: #ccc; /* 연한 회색 */
            color: #fff; /* 텍스트 색상 */
            border: none;
            border-radius: 4px;
            cursor: pointer;
            text-align: center;  /* 텍스트를 수평 중앙에 배치 */
            transition: transform 0.3s ease; /* 버튼 크기가 부드럽게 변하도록 설정 */
        }


        .submit-btn:hover {
            background-color: #555; /* 진한 회색 */
            transform: scale(1.1); /* 마우스를 올렸을 때 버튼 크기를 1.1배로 설정 */
        }
        .item-container input[type="radio"] {
            transition: transform 0.3s ease; /* 라디오 버튼 크기가 부드럽게 변하도록 설정 */
        }

        .item-container input[type="radio"]:hover {
            transform: scale(1.2); /* 마우스를 올렸을 때 라디오 버튼 크기를 1.2배로 설정 */
        }


        /*------------------------------------------------------------- */

        .list-tr img {
            max-width: 100px;
            max-height: 100px;
        }
        .list-table {
            border-collapse: collapse;  /* 테두리 선이 겹치도록 설정 */
            width: 60%;  /* 테이블 너비를 100%로 설정 */
            margin: 0 auto;  /* 테이블을 페이지 가운데에 정렬 */
        }


        .list-td {
            padding: 8px;  /* 셀 내부의 패딩 설정 */
            text-align: center;  /* 텍스트를 가운데 정렬 */
            overflow: hidden;  /* 내용이 넘치면 숨김 */
            text-overflow: ellipsis;  /* 내용이 넘치면 '...'로 표시 */
            white-space: nowrap;  /* 텍스트를 한 줄에 표시 */
        }
        .list-td a img {
            transition: transform 0.3s ease-in-out; /* 움직임 효과를 부드럽게 만들기 위한 속성 */
        }

        .list-td a img:hover {
            transform: scale(1.1); /* 이미지를 1.1배 확대 */
        }
        /*---------------------------------------------------------------------*/


        .buy-image {
            transition: transform 0.3s ease; /* 이미지 크기가 부드럽게 변하도록 설정 */
        }

        .buy-image:hover {
            transform: scale(1.1); /* 마우스를 올렸을 때 이미지 크기를 1.1배로 설정 */
        }
        /*---------------------상체--------------------*/
        .capacity-selection select {
            width: 200px;
            height: 35px;
            padding: 5px;
            border: 1px solid #aaa;
            border-radius: 5px;
            background-color: #f0f0f0;
            font-size: 16px;
            color: #333;
            outline: none;
        }

        .capacity-selection select:focus {
            border-color: #f35429;
        }
        .color-selection input[type="radio"] {
            display: none;
        }

        .color-selection label {
            display: inline-block;
            width: 30px;
            height: 30px;
            margin-right: 10px;
            border-radius: 50%;
            border: 2px solid #ddd;
            cursor: pointer;
        }

        .color-selection #red + label {
            background-color: red;
        }

        .color-selection #blue + label {
            background-color: blue;
        }

        .color-selection #black + label {
            background-color: black;
        }

        .color-selection #white + label {
            background-color: white;
        }

        .color-selection input[type="radio"]:checked + label {
            border: 2px solid #f35429;
        }



    </style>
    <script>
        window.onload = function() {
            var tds = document.querySelectorAll('.list-td');  // 'list-td' 클래스를 가진 모든 요소를 선택

            tds.forEach(function(td) {
                var title = td.innerText;  // 각 요소의 텍스트를 가져옴
                if (title.length > 10) {  // 텍스트가 20자를 초과하면
                    td.innerText = title.substring(0, 10) + "...";  // 처음 20자만 남기고 나머지는 '...'로 대체
                }
            });
        };
    </script>

</head>
<body>
<%@ include file="../modules/header.jsp" %>
<h1 class="h1-order">iPhone15 Pro 구매하기</h1>
<form action="${pageContext.request.contextPath}/order-proc"  method="post">
    <section class="image-section-order">
        <div class="image-container">
            <img class="buy-image"src="${pageContext.request.contextPath}/img/iPhone15Pro.png" alt="iPhone15" />
            <div class="item-container">
                <div class="color-selection">
                    <h3>색상.맘에 드는 색상을 선택하세요</h3>
                    <input type="radio" id="red" name="color" value="red">
                    <label for="red"></label>
                    <input type="radio" id="blue" name="color" value="blue">
                    <label for="blue"></label>
                    <input type="radio" id="black" name="color" value="black">
                    <label for="black"></label>
                    <input type="radio" id="white" name="color" value="white">
                    <label for="white"></label>
                </div>
                <div class="capacity-selection">
                    <h3>저장 용량.당신에게 알맞은 저장 용량은?</h3>
                    <select name="capacity">
                        <option value="128GB">128GB</option>
                        <option value="256GB">256GB</option>
                        <option value="512GB">512GB</option>
                        <option value="1T">1T</option>
                    </select>
                </div>
                <h3>모든 주문에 무료 배송 서비스가 제공됩니다.</h3>
                <input type="submit" value="구매" class="submit-btn">
            </div>
        </div>
    </section>
</form>
<hr>
<h3 class="h3-order">추천 Apple 상품</h3>
<table class="list-table">
    <tr class="list-tr">
        <c:forEach var="shopDataList" items="${shopData}" varStatus="status" > <!-- for문 JSTL -->
            <c:if test="${status.index < 5}">
                <td class="list-td"><a href="${shopDataList.itemUrl}"><img src="${shopDataList.itemImgUrl}" alt="상품 이미지"></a></td>
            </c:if>
        </c:forEach>
    </tr>
    <tr class="list-tr">
        <c:forEach var="shopDataList" items="${shopData}" varStatus="status" > <!-- for문 JSTL -->
            <c:if test="${status.index < 5}">
                <td class="list-td">${shopDataList.itemTitle}</td>
            </c:if>
        </c:forEach>
    </tr>
    <tr class="list-tr">
        <c:forEach var="shopDataList" items="${shopData}" varStatus="status" > <!-- for문 JSTL -->
            <c:if test="${status.index < 5}">
                <td class="list-td">${shopDataList.itemPrice}원</td>
            </c:if>
        </c:forEach>
    </tr>
    <!-- 5번째 이후의 상품 데이터를 넣는 부분 -->
    <tr class="list-tr">
        <c:forEach var="shopDataList" items="${shopData}" varStatus="status" > <!-- for문 JSTL -->
            <c:if test="${status.index >= 5}">
                <td class="list-td"><a href="${shopDataList.itemUrl}"><img src="${shopDataList.itemImgUrl}" alt="상품 이미지"></a></td>
            </c:if>
        </c:forEach>
    </tr>
    <tr class="list-tr">
        <c:forEach var="shopDataList" items="${shopData}" varStatus="status" > <!-- for문 JSTL -->
            <c:if test="${status.index >= 5}">
                <td class="list-td">${shopDataList.itemTitle}</td>
            </c:if>
        </c:forEach>
    </tr>
    <tr class="list-tr">
        <c:forEach var="shopDataList" items="${shopData}" varStatus="status" > <!-- for문 JSTL -->
            <c:if test="${status.index >= 5}">
                <td class="list-td">${shopDataList.itemPrice}원</td>
            </c:if>
        </c:forEach>
    </tr>
</table>
<%@ include file="../modules/footer.jsp" %>
</body>
</html>