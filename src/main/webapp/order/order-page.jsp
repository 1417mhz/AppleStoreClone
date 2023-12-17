<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <link rel="icon" type="image/png" href="../img/logo2.png">
    <link rel="stylesheet" type="text/css" href="../css/apple.css?after6">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300&display=swap" rel="stylesheet">
    <title>Apple Store - iPhone 15 Pro</title>
    <style>
        .h1-order {
            text-align: center;
            font-family: "Apple SD Gothic Neo", Arial, sans-serif;
        }
        .payment-amount {
            display: block;
            margin-block-start: 1.33em;
            margin-block-end: 1.33em;
            margin-inline-start: 0px;
            margin-inline-end: 0px;
            font-weight: bold;
        }
        .h3-order{
            width: 100%;
        }
        .image-section-order {
            display: flex;
            align-items: center;
            justify-content: center; /* 수평 방향으로 가운데 정렬 */
        }

        .image-container {
            display: flex;
            justify-content: center;
            align-items: center;
            text-align: center;
            margin-top: 40px;
        }
        .item-container{
            margin-left: 50px;
        }

        .buy-image {
            width: 520px;
            height: 421px;
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
            width: 820px;
        }

        .submit-btn {
            display: inline-block;
            width: 120px; /* 라벨의 너비와 동일 */
            height: 38px; /* 라벨의 높이와 동일 */
            line-height: 30px;  /* 라벨의 line-height와 동일, 텍스트를 수직 중앙에 배치 */
            background-color: #999999; /* 짙은 회색 */
            color: white; /* 텍스트 색상 */
            border: none;
            border-radius: 4px;
            cursor: pointer;
            text-align: center;  /* 텍스트를 수평 중앙에 배치 */
            transition: transform 0.3s ease; /* 버튼 크기가 부드럽게 변하도록 설정 */
        }


        .submit-btn:hover {
            background-color: #555; /* 진한 회색 */
        }
        .item-container input[type="radio"] {
            transition: transform 0.3s ease; /* 라디오 버튼 크기가 부드럽게 변하도록 설정 */
        }

        .item-container input[type="radio"]:hover {
            transform: scale(1.2); /* 마우스를 올렸을 때 라디오 버튼 크기를 1.2배로 설정 */
        }

        .recommend-list-container {
            margin-bottom: 40px;
            display: flex;
            justify-content: center;
        }

        .recommend-list {
            width: 820px;
            display: block;
            align-items: center;
            justify-content: center;
        }

        .list-tr img {
            max-width: 100px;
            max-height: 100px;
        }
        .list-table {
            border-collapse: collapse;  /* 테두리 선이 겹치도록 설정 */
            width: 100%;  /* 테이블 너비를 100%로 설정 */
            /*margin: 0 auto;  !* 테이블을 페이지 가운데에 정렬 *!*/
            font-size: 0.9em;
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

        .capacity-selection select {
            width: 160px;
            height: 40px;
            padding: 5px;
            border: 1px solid #aaa;
            border-radius: 5px;
            background-color: #f0f0f0;
            font-size: 0.9em;
            color: #333;
            outline: none;
            text-align: center;
        }

        .capacity-selection select:focus {
            border-color: #f0f0f0;
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

        .color-selection #naturalTitanium + label {
            background-color: #B9B5AA;
        }

        .color-selection #blueTitanium + label {
            background-color: #4D525F;
        }

        .color-selection #whiteTitanium + label {
            background-color: #F2F3ED;
        }

        .color-selection #blackTitanium + label {
            background-color: #4C4D4F;
        }

        .color-selection input[type="radio"]:checked + label {
            border: 2px solid black;
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

        document.addEventListener("DOMContentLoaded", function () {
            var colorSelection = document.querySelector('.color-selection');
            var h4Element = document.getElementById('color-picking');

            colorSelection.addEventListener('click', function (event) {
                if (event.target.type === 'radio') {
                    var colorName = event.target.value;
                    h4Element.textContent = "색상 - " + colorName;
                }
            });
        });
    </script>

</head>
<body>
<%@ include file="../modules/header.jsp" %>
<form action="${pageContext.request.contextPath}/order-proc"  method="post">
    <section class="image-section-order">
        <div class="image-container">
            <img class="buy-image"src="${pageContext.request.contextPath}/img/iPhone15Pro_final.png" alt="15 Pro"/>            <div class="item-container">
            <div class="color-selection">
                <h2 class="h1-order">iPhone 15 Pro</h2>
                <h5 id="color-picking">색상</h5>
                <input type="radio" id="naturalTitanium" name="color" value="내추럴 티타늄">
                <label for="naturalTitanium"></label>
                <input type="radio" id="blueTitanium" name="color" value="블루 티타늄">
                <label for="blueTitanium"></label>
                <input type="radio" id="whiteTitanium" name="color" value="화이트 티타늄">
                <label for="whiteTitanium"></label>
                <input type="radio" id="blackTitanium" name="color" value="블랙 티타늄">
                <label for="blackTitanium"></label>
            </div>
            <div class="capacity-selection">
                <h5>저장 용량</h5>
                <select name="capacity">
                    <option value="128GB">128GB</option>
                    <option value="256GB">256GB</option>
                    <option value="512GB">512GB</option>
                    <option value="1TB">1TB</option>
                </select>
            </div>
            <div class="payment-amount">
                <p>결제금액: 1,550,000원</p>
            </div>
            <h4>무료 배송 서비스가 제공됩니다</h4>
            <input type="submit" value="구매" class="submit-btn">
        </div>
        </div>
    </section>
</form>
<hr>
<section class="recommend-list-container">
    <div class="recommend-list">
        <h3 class="h3-order">추천 악세사리</h3><p style="font-size: 0.7em; font-weight: bold;">by 네이버 쇼핑</p>
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
    </div>
</section>
<%@ include file="../modules/footer.jsp" %>
</body>
</html>