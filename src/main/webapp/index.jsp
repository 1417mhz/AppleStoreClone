<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <link rel="stylesheet" type="text/css" href="css/main.css">
  <title>Apple Korea</title>
  <style type="text/css" >
    a:link, a:visited, a:hover, a:active {color:#333;}
    .container {
      width: 100px;
      margin:0 auto;
      height: 85px;
      display: flex;
      align-items: center;
      justify-content: center; /* 가로로 가운데 정렬하는 속성 */
    }

    header nav ul {
      display:flex;
      text-align: center;
    }
    header nav ul li {
      padding: 20px 10px;
      width: 88px;
      list-style-type: none; /* 점을 없애는 속성 */
    }
    header nav ul li a {
      font-weight: bold;
      font-size:1.0625rem;
      text-decoration: none; /* 밑줄을 없애는 속성 */
    }
    footer {
      margin-top: 60px; /* 상단 여백의 크기를 조정하세요 */
      border-top: 1px solid #ccc; /* 상단에 1픽셀 두께의 선 추가 */
      background-color: #f5f5f5; /* 배경색 설정 */
      padding: 20px; /* 내부 여백 설정 */
      color: #333; /* 글자 색상 설정 */
      display: flex;
      flex-direction: column;
    }
    footer #footer_address {
      width:990px;
      margin:auto;
    }
    .subject{
      font-family: "Roboto", Arial, sans-serif;
      font-weight: 700;
      font-size: 16px;
    }
    .t1{
      font-size: 38px;
      display: inline;
      padding-left: 100px; /* 왼쪽 여백 설정 */
    }
    .t2{
      font-size: 18px;
      display: inline;
      padding-left: 250px; /* 왼쪽 여백 설정 */
      font-weight: bold;  /* 진한 글씨*/
    }
    .t3{
      font-size: 18px;
      padding-left: 250px; /* 왼쪽 여백 설정 */
      list-style-type: none; /* 점 제거 */
      font-weight: bold;  /* 진한 글씨*/
      margin-bottom: 5px; /* 하단 여백의 크기를 조정하세요 */
      margin-top: 8px; /* 상단 여백의 크기를 조정하세요 */
    }
    .t4{
      font-size: 15px;
      padding-left: 250px; /* 왼쪽 여백 설정 */
      list-style-type: none; /* 점 제거 */


    }
    .t5{
      font-size: 18px;
      display: inline;
      padding-left: 730px; /* 왼쪽 여백 설정 */
      font-weight: bold;  /* 진한 글씨*/
      margin-bottom: 20px; /* 하단 여백의 크기를 조정하세요 */
      margin-top: 20px; /* 상단 여백의 크기를 조정하세요 */
    }


    .main1 {
      text-align: center; /* 가운데 정렬 */
    }
    .main2 {
      display: flex;
    }
    .main3 {
      display: flex;
      justify-content: center;
      align-items: center;
      text-align: center;
    }
    .main4 {
      display: flex;
    }
    .main5 {
      display: flex;
      justify-content: center;
      align-items: center;
      text-align: center;

    }

    section nav ul li {
      padding: 20px 10px;
      width: 88px;
      list-style-type: none; /* 점을 없애는 속성 */
    }
    .item1 li {
      list-style-type: none; /* 점 제거 */
      font-weight: bold;  /* 진한 글씨*/
    }
    .item1 img {
      width: 100px; /* 이미지 가로 크기 설정 */
      height: auto; /* 이미지 세로 크기 자동 조정 */
    } /*-------img1-----*/

    .main5 .item2 {
      display: flex; /* 내부 요소를 가로로 배열하기 위해 flex 사용 */
    }

    .main5 .item2 .slideshow {
      flex: 1; /* 내부 요소의 크기를 동일하게 설정 */
      margin-right: 10px; /* 오른쪽 여백 설정 */
    }

    .main5 .item2 .slideshow:last-child {
      margin-right: 0; /* 마지막 요소에는 오른쪽 여백 제거 */
    }

    .main5 .item2 .slideshow ul {

      list-style: none; /* 리스트 스타일 제거 */
      padding: 0;
      margin: 0;
    }
    .main5 .item2 .slideshow li {
      flex: 1; /* 내부 요소의 크기를 동일하게 설정 */
      margin-right: 10px; /* 오른쪽 여백 설정 */
      margin-top: 20px; /* 상단 여백의 크기를 조정하세요 */
    }

    .main5 .item2 .slideshow li:last-child {
      margin-right: 0; /* 마지막 요소에는 오른쪽 여백 제거 */

    }

    .main5 .item2 .slideshow img {
      width: 100%; /* 이미지 너비 100%로 설정 */
      height: auto; /* 이미지 높이 자동으로 설정 */
      border-radius: 20px; /* 모서리의 둥글기 정도를 조정하세요 */
    }

    /*-------img2-----*/

    .buy-button {
      display: inline-block; /* 인라인 블록 요소로 표시 */
      background-color: #007bff; /* 배경색 설정 */
      color: #fff; /* 텍스트 색상 설정 */
      padding: 10px 20px; /* 내부 여백 설정 */
      border-radius: 5px; /* 테두리 반경 설정 */
      text-decoration: none; /* 텍스트에 밑줄 제거 */
      margin-top: 10px; /* 상단 여백의 크기를 조정하세요 */
    }

    .buy-button:hover {
      background-color: #0056b3; /* 호버 상태 배경색 설정 */
    }
    .buy-button a {
      color: #fff; /* 링크 텍스트 색상 설정 */
      text-decoration: none; /* 링크 텍스트에 밑줄 제거 */
    }


  </style>

</head>
<body style="overflow-x: hidden">
<header>
  <div class="container">
    <img src="img/pngegg.png" alt="로고" style="width: 30px; height: 30px;">
    <nav class="top_menu">
      <ul>
        <li><a href="#">iPhone</a></li>
        <li><a href="#">iPad</a></li>
        <li><a href="#">Watch</a></li>
        <li><a href="#">Mac</a></li>
        <li><a href="#">액세서리</a></li>
        <%
          if((String)session.getAttribute("isLogin") != null) {
            String userId = (String) session.getAttribute("userId");
            out.print("<li style=\"text-decoration-line: underline\"><a href=\"#\">" + userId + "</a></li>");
        %>
        <%
          if(session.getAttribute("kakaoLogin") != null) {
            //out.print("<li><a href=\"" + SensInfoProvider.getLogoutRedirectUrl() + "\">로그아웃</a></li>");
            out.print("<li><a href=\"user/kakao-logout\">로그아웃</a></li>");
          } else {
        %>
        <li><a href="user/logout">로그아웃</a></li>
        <%
          }
        } else {
        %>
        <li class="green"><a href="${pageContext.request.contextPath}/user/login">로그인</a></li>
        <li class="green"><a href="${pageContext.request.contextPath}/user/signup">회원가입</a></li>
        <%
          }
        %>
      </ul>
    </nav> <!-- top_menu -->
  </div>
</header>
<section class="main1">
  <div class="main1_store">
    <h1 class="t1">스토어. 최고의 연말연시. 설렘의 시작.</h1>
  </div>
</section> <!-- section main1 -->
<section class="main2">
  <h3 class="t2">많이 찾으시는 제품</h3>
</section>
<section class="main3">
  <div class="item1">
    <ul>
      <li><img width="200" height="130" alt="iphone" src="https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/store-card-13-iphone-nav-202309?wid=200&amp;hei=130&amp;fmt=png-alpha&amp;.v=1692971740452" srcset="https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/store-card-13-iphone-nav-202309?wid=200&amp;hei=130&amp;fmt=png-alpha&amp;.v=1692971740452, https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/store-card-13-iphone-nav-202309?wid=400&amp;hei=260&amp;fmt=png-alpha&amp;.v=1692971740452 2x"></li>
      <li class="subject">iPhone</li>
    </ul>
  </div>
  <div class="item1">
    <ul>
      <li><img width="200" height="130" alt="ipad" src="https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/store-card-13-ipad-nav-202210?wid=200&amp;hei=130&amp;fmt=png-alpha&amp;.v=1664912135437" srcset="https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/store-card-13-ipad-nav-202210?wid=200&amp;hei=130&amp;fmt=png-alpha&amp;.v=1664912135437, https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/store-card-13-ipad-nav-202210?wid=400&amp;hei=260&amp;fmt=png-alpha&amp;.v=1664912135437 2x"></li>
      <li class="subject">iPad Pro</li>
    </ul>
  </div>
  <div class="item1">
    <ul>
      <li><img width="200" height="130" alt="watch" src="https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/store-card-13-watch-nav-202309_GEO_KR?wid=200&amp;hei=130&amp;fmt=png-alpha&amp;.v=1693703814022" srcset="https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/store-card-13-watch-nav-202309_GEO_KR?wid=200&amp;hei=130&amp;fmt=png-alpha&amp;.v=1693703814022, https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/store-card-13-watch-nav-202309_GEO_KR?wid=400&amp;hei=260&amp;fmt=png-alpha&amp;.v=1693703814022 2x"></li>
      <li class="subject">Watch9</li>
    </ul>
  </div>
  <div class="item1">
    <ul>
      <li><img width="200" height="130" alt="macbook" src="https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/store-card-13-mac-nav-202310?wid=200&amp;hei=130&amp;fmt=png-alpha&amp;.v=1696964122666" srcset="https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/store-card-13-mac-nav-202310?wid=200&amp;hei=130&amp;fmt=png-alpha&amp;.v=1696964122666, https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/store-card-13-mac-nav-202310?wid=400&amp;hei=260&amp;fmt=png-alpha&amp;.v=1696964122666 2x"></li>
      <li class="subject">MacBook</li>
    </ul>
  </div>
  <div class="item1">
    <ul>
      <li><img width="200" height="130" alt="airpods" src="https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/store-card-13-airpods-nav-202209?wid=200&amp;hei=130&amp;fmt=png-alpha&amp;.v=1660676485885" srcset="https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/store-card-13-airpods-nav-202209?wid=200&amp;hei=130&amp;fmt=png-alpha&amp;.v=1660676485885, https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/store-card-13-airpods-nav-202209?wid=400&amp;hei=260&amp;fmt=png-alpha&amp;.v=1660676485885 2x"></li>
      <li class="subject">AirPods</li>
    </ul>
  </div>
  <div class="item1">
    <ul>
      <li><img width="200" height="130" alt="" src="https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/store-card-13-airpods-nav-202209?wid=200&amp;hei=130&amp;fmt=png-alpha&amp;.v=1660676485885" srcset="https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/store-card-13-airpods-nav-202209?wid=200&amp;hei=130&amp;fmt=png-alpha&amp;.v=1660676485885, https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/store-card-13-airpods-nav-202209?wid=400&amp;hei=260&amp;fmt=png-alpha&amp;.v=1660676485885 2x"></li>
      <li class="subject">AirTag</li>
    </ul>
  </div>
  <div class="item1">
    <ul>
      <li><img width="200" height="130" alt="" src="https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/store-card-13-airtags-nav-202108?wid=200&amp;hei=130&amp;fmt=png-alpha&amp;.v=1625783380000" srcset="https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/store-card-13-airtags-nav-202108?wid=200&amp;hei=130&amp;fmt=png-alpha&amp;.v=1625783380000, https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/store-card-13-airtags-nav-202108?wid=400&amp;hei=260&amp;fmt=png-alpha&amp;.v=1625783380000 2x"></li>
      <li class="subject">AppleTV 4K</li>
    </ul>
  </div>
</section> <!-- section main2 -->
<section class= "main4">
  <h3 class="t2">최신 제품. 주고싶은 특별한 누군가를 위한 선물</h3>
</section>
<section class= "main4">
  <h3 class="t5">iPhone</h3>
</section>
<section class ="main5">
  <div class="item2">
    <div class="slideshow">
      <ul>
        <li><img width="480" height="500" alt="프로급 카메라 시스템을 보여주는 티타늄 iPhone 15 Pro 주변에 종이로 꾸민 행성들이 있는 모습" src="https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/store-card-50-holiday-iphone-15-pro-202311?wid=480&amp;hei=500&amp;fmt=p-jpg&amp;qlt=95&amp;.v=1696863030449" srcset="https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/store-card-50-holiday-iphone-15-pro-202311?wid=480&amp;hei=500&amp;fmt=p-jpg&amp;qlt=95&amp;.v=1696863030449, https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/store-card-50-holiday-iphone-15-pro-202311?wid=960&amp;hei=1000&amp;fmt=p-jpg&amp;qlt=95&amp;.v=1696863030449 2x" class="rf-ccard-img-full"></li>
        <li class="subject">iPhone15 Pro</li>
        <li class="buy-button"><a href="#">구매하기</a></li>
      </ul>
    </div>
    <div class="slideshow">
      <ul>
        <li><img width="480" height="500" alt="첨단 듀얼 카메라 시스템을 보여주는 핑크 iPhone 15이 종이로 꾸민 구름 위에 떠 있는 모습" src="https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/store-card-50-holiday-iphone-15-202311?wid=480&amp;hei=500&amp;fmt=p-jpg&amp;qlt=95&amp;.v=1698188084112" srcset="https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/store-card-50-holiday-iphone-15-202311?wid=480&amp;hei=500&amp;fmt=p-jpg&amp;qlt=95&amp;.v=1698188084112, https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/store-card-50-holiday-iphone-15-202311?wid=960&amp;hei=1000&amp;fmt=p-jpg&amp;qlt=95&amp;.v=1698188084112 2x" class="rf-ccard-img-full"></li>
        <li class="subject">iPhone15 </li>
        <li class="buy-button"><a href="#">구매하기</a></li>
      </ul>
    </div>
  </div>
</section>
<section class= "main4">
  <h3 class="t5">iPad</h3>
</section>
<section class ="main5">
  <div class="item2">
    <div class="slideshow">
      <ul>
        <li><img width="480" height="500" alt="전면 화면 디자인의 핑크 iPad의 앞면과 12MP 와이드 카메라를 보여주는 블루 iPad의 뒷면을 종이로 꾸민 파형 무늬가 둘러싸고 있는 모습" src="https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/store-card-50-holiday-ipad-202311?wid=480&amp;hei=500&amp;fmt=p-jpg&amp;qlt=95&amp;.v=1696863030352" srcset="https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/store-card-50-holiday-ipad-202311?wid=480&amp;hei=500&amp;fmt=p-jpg&amp;qlt=95&amp;.v=1696863030352, https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/store-card-50-holiday-ipad-202311?wid=960&amp;hei=1000&amp;fmt=p-jpg&amp;qlt=95&amp;.v=1696863030352 2x" class="rf-ccard-img-full"></li>
        <li class="subject">iPad </li>
        <li class="buy-button"><a href="#">구매하기</a></li>
      </ul>
    </div>
    <div class="slideshow">
      <ul>
        <li><img width="480" height="500" alt="Liquid Retina 디스플레이, 12MP 와이드 카메라를 갖춘 퍼플 iPad Air의 뒷면과 앞면 주변을 종이로 꾸민 구름이 둘러싸고 있는 모습" src="https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/store-card-50-holiday-ipad-air-202311?wid=480&amp;hei=500&amp;fmt=p-jpg&amp;qlt=95&amp;.v=1696863032946" srcset="https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/store-card-50-holiday-ipad-air-202311?wid=480&amp;hei=500&amp;fmt=p-jpg&amp;qlt=95&amp;.v=1696863032946, https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/store-card-50-holiday-ipad-air-202311?wid=960&amp;hei=1000&amp;fmt=p-jpg&amp;qlt=95&amp;.v=1696863032946 2x" class="rf-ccard-img-full"></li>
        <li class="subject">iPad Air </li>
        <li class="buy-button"><a href="#">구매하기</a></li>
      </ul>
    </div>
  </div>
</section>
<section class= "main4">
  <h3 class="t5">Watch</h3>
</section>
<section class ="main5">
  <div class="item2">
    <div class="slideshow">
      <ul>
        <li><img width="480" height="500" alt="" src="https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/store-card-50-holiday-watch-s9-202311_GEO_KR?wid=480&amp;hei=500&amp;fmt=p-jpg&amp;qlt=95&amp;.v=1697055183686" srcset="https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/store-card-50-holiday-watch-s9-202311_GEO_KR?wid=480&amp;hei=500&amp;fmt=p-jpg&amp;qlt=95&amp;.v=1697055183686, https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/store-card-50-holiday-watch-s9-202311_GEO_KR?wid=960&amp;hei=1000&amp;fmt=p-jpg&amp;qlt=95&amp;.v=1697055183686 2x" class="rf-ccard-img-full"></li>
        <li class="subject">Apple Watch Series 9 </li>
        <li class="buy-button"><a href="#">구매하기</a></li>
      </ul>
    </div>
    <div class="slideshow">
      <ul>
        <li><img width="480" height="500" alt="" src="https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/store-card-50-holiday-watch-ultra-2-202311_GEO_KR?wid=480&amp;hei=500&amp;fmt=p-jpg&amp;qlt=95&amp;.v=1698766693786" srcset="https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/store-card-50-holiday-watch-ultra-2-202311_GEO_KR?wid=480&amp;hei=500&amp;fmt=p-jpg&amp;qlt=95&amp;.v=1698766693786, https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/store-card-50-holiday-watch-ultra-2-202311_GEO_KR?wid=960&amp;hei=1000&amp;fmt=p-jpg&amp;qlt=95&amp;.v=1698766693786 2x" class="rf-ccard-img-full"></li>
        <li class="subject">Apple Watch Ultra 2 </li>
        <li class="buy-button"><a href="#">구매하기</a></li>
      </ul>
    </div>
  </div>
</section>
<section class= "main4">
  <h3 class="t5">Mac</h3>
</section>
<section class ="main5">
  <div class="item2">
    <div class="slideshow">
      <ul>
        <li><img width="480" height="500" alt="" src="https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/store-card-50-holiday-macbook-pro-202311?wid=480&amp;hei=500&amp;fmt=p-jpg&amp;qlt=95&amp;.v=1696872235281" srcset="https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/store-card-50-holiday-macbook-pro-202311?wid=480&amp;hei=500&amp;fmt=p-jpg&amp;qlt=95&amp;.v=1696872235281, https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/store-card-50-holiday-macbook-pro-202311?wid=960&amp;hei=1000&amp;fmt=p-jpg&amp;qlt=95&amp;.v=1696872235281 2x" class="rf-ccard-img-full"></li>
        <li class="subject">MacBook Pro </li>
        <li class="buy-button"><a href="#">구매하기</a></li>
      </ul>
    </div>
    <div class="slideshow">
      <ul>
        <li><img width="480" height="500" alt="회색 종이 구름과 날고 있는 새에 둘러싸인 놀랍도록 얇은 MacBook Air의 열린 상태 옆모습." src="https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/store-card-50-holiday-macbook-air-202311?wid=480&amp;hei=500&amp;fmt=p-jpg&amp;qlt=95&amp;.v=1696863032996" srcset="https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/store-card-50-holiday-macbook-air-202311?wid=480&amp;hei=500&amp;fmt=p-jpg&amp;qlt=95&amp;.v=1696863032996, https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/store-card-50-holiday-macbook-air-202311?wid=960&amp;hei=1000&amp;fmt=p-jpg&amp;qlt=95&amp;.v=1696863032996 2x" class="rf-ccard-img-full"></li>
        <li class="subject">MacBook Air </li>
        <li class="buy-button"><a href="#">구매하기</a></li>
      </ul>
    </div>
  </div>
</section>
</section> <!-- section main -->
<footer>
  <section class="footer"> <!-- footer -->
    <p>Copyright ⓒ 2023 Apple Korea</br>
      사업자등록번호 : 120-81-84429 | 통신판매업신고번호 : 제 2011-서울강남-00810호</br>
      대표이사 : PETER DENWOOD | 주소 : 서울 특별시 강남구 영동대로 517</br>
      대표전화 : 080-330-8877 | 팩스 : 02-6928-0000</br>
      1. 이용 약관</br>
      위 할부 서비스는 Apple 온라인 스토어 , Apple 전화 판매 및 Apple 리테일 매장에서 구입하는 경우에만 이용할 수 있습니다 </br>
      해외 신용 카드(한국 외 다른 국가 또는 지역에서 발급 받은 신용 카드), 직불/체크 카드 및 현지 발급/제휴 법인 카드는 할부 서비스를 이용할 수 없습니다.</br>
      할부는 광고 가격 또는 정찰 가격을 기준으로 합니다. </br>
      모든 주문 제품은 무료 배송됩니다.</br>
      이 정보는 2021년 03월 16일 기준 최신 정보입니다.</p>
  </section> <!-- section footer_address -->
</footer>
</body>
</html>