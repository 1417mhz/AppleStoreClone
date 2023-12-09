<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <link rel="stylesheet" type="text/css" href="css/apple.css?after4">
  <title>Apple Korea</title>
</head>
<style>
  html {
    scroll-behavior: smooth;
  }
</style>
<script>
  document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function (e) {
      e.preventDefault();
      const targetId = this.getAttribute('href').substring(1);
      const targetElement = document.getElementById(targetId);
      if (targetElement) {
        targetElement.scrollIntoView({
          behavior: 'smooth'
        });
      }
    });
  });
</script>
<body style="overflow-x: hidden">
<%@ include file="modules/header.jsp"%>
<section class="main1">
  <div class="main1_store">
    <h1 class="t1">스토어.최고의 연말연시. 설렘의 시작.</h1>
  </div>
</section>
<!-- section main1 -->
<section class="main2">
  <h3 class="t2">많이 찾으시는 제품</h3>
</section>
<section class="main3">
  <div class="item1">
    <ul>
      <li><img width="200" height="130" alt="iphone"
               src="https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/store-card-13-iphone-nav-202309?wid=200&amp;hei=130&amp;fmt=png-alpha&amp;.v=1692971740452"
               srcset="https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/store-card-13-iphone-nav-202309?wid=200&amp;hei=130&amp;fmt=png-alpha&amp;.v=1692971740452, https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/store-card-13-iphone-nav-202309?wid=400&amp;hei=260&amp;fmt=png-alpha&amp;.v=1692971740452 2x"></li>
      <li class="subject">iPhone</li>
    </ul>
  </div>
  <div class="item1">
    <ul>
      <li><img width="200" height="130" alt="ipad"
               src="https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/store-card-13-ipad-nav-202210?wid=200&amp;hei=130&amp;fmt=png-alpha&amp;.v=1664912135437"
               srcset="https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/store-card-13-ipad-nav-202210?wid=200&amp;hei=130&amp;fmt=png-alpha&amp;.v=1664912135437, https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/store-card-13-ipad-nav-202210?wid=400&amp;hei=260&amp;fmt=png-alpha&amp;.v=1664912135437 2x"></li>
      <li class="subject">iPad Pro</li>
    </ul>
  </div>
  <div class="item1">
    <ul>
      <li><img width="200" height="130" alt="watch"
               src="https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/store-card-13-watch-nav-202309_GEO_KR?wid=200&amp;hei=130&amp;fmt=png-alpha&amp;.v=1693703814022"
               srcset="https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/store-card-13-watch-nav-202309_GEO_KR?wid=200&amp;hei=130&amp;fmt=png-alpha&amp;.v=1693703814022, https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/store-card-13-watch-nav-202309_GEO_KR?wid=400&amp;hei=260&amp;fmt=png-alpha&amp;.v=1693703814022 2x"></li>
      <li class="subject">Watch9</li>
    </ul>
  </div>
  <div class="item1">
    <ul>
      <li><img width="200" height="130" alt="macbook"
               src="https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/store-card-13-mac-nav-202310?wid=200&amp;hei=130&amp;fmt=png-alpha&amp;.v=1696964122666"
               srcset="https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/store-card-13-mac-nav-202310?wid=200&amp;hei=130&amp;fmt=png-alpha&amp;.v=1696964122666, https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/store-card-13-mac-nav-202310?wid=400&amp;hei=260&amp;fmt=png-alpha&amp;.v=1696964122666 2x"></li>
      <li class="subject">MacBook</li>
    </ul>
  </div>
  <div class="item1">
    <ul>
      <li><img width="200" height="130" alt="airpods"
               src="https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/store-card-13-airpods-nav-202209?wid=200&amp;hei=130&amp;fmt=png-alpha&amp;.v=1660676485885"
               srcset="https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/store-card-13-airpods-nav-202209?wid=200&amp;hei=130&amp;fmt=png-alpha&amp;.v=1660676485885, https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/store-card-13-airpods-nav-202209?wid=400&amp;hei=260&amp;fmt=png-alpha&amp;.v=1660676485885 2x"></li>
      <li class="subject">AirPods</li>
    </ul>
  </div>
  <div class="item1">
    <ul>
      <li><img width="200" height="130" alt=""
               src="https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/store-card-13-airpods-nav-202209?wid=200&amp;hei=130&amp;fmt=png-alpha&amp;.v=1660676485885"
               srcset="https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/store-card-13-airpods-nav-202209?wid=200&amp;hei=130&amp;fmt=png-alpha&amp;.v=1660676485885, https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/store-card-13-airpods-nav-202209?wid=400&amp;hei=260&amp;fmt=png-alpha&amp;.v=1660676485885 2x"></li>
      <li class="subject">AirTag</li>
    </ul>
  </div>
  <div class="item1">
    <ul>
      <li><img width="200" height="130" alt=""
               src="https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/store-card-13-airtags-nav-202108?wid=200&amp;hei=130&amp;fmt=png-alpha&amp;.v=1625783380000"
               srcset="https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/store-card-13-airtags-nav-202108?wid=200&amp;hei=130&amp;fmt=png-alpha&amp;.v=1625783380000, https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/store-card-13-airtags-nav-202108?wid=400&amp;hei=260&amp;fmt=png-alpha&amp;.v=1625783380000 2x"></li>
      <li class="subject">AppleTV 4K</li>
    </ul>
  </div>
</section>
<!-- section main2 -->
<section class="main4">
  <h3 class="t2">최신 제품. 주고싶은 특별한 누군가를 위한 선물</h3>
</section>
<section class="main4" id="sec_iphone">
  <h3 class="t5">iPhone</h3>
</section>
<section class="main5">
  <div class="item2">
    <div class="slideshow">
      <ul>
        <li><img width="480" height="500"
                 alt="프로급 카메라 시스템을 보여주는 티타늄 iPhone 15 Pro 주변에 종이로 꾸민 행성들이 있는 모습"
                 src="https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/store-card-50-holiday-iphone-15-pro-202311?wid=480&amp;hei=500&amp;fmt=p-jpg&amp;qlt=95&amp;.v=1696863030449"
                 srcset="https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/store-card-50-holiday-iphone-15-pro-202311?wid=480&amp;hei=500&amp;fmt=p-jpg&amp;qlt=95&amp;.v=1696863030449, https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/store-card-50-holiday-iphone-15-pro-202311?wid=960&amp;hei=1000&amp;fmt=p-jpg&amp;qlt=95&amp;.v=1696863030449 2x"
                 class="rf-ccard-img-full"></li>
        <li class="subject">iPhone15 Pro</li>
        <li class="buy-button"><a href="${pageContext.request.contextPath}/order">구매하기</a></li>
      </ul>
    </div>
    <div class="slideshow">
      <ul>
        <li><img width="480" height="500"
                 alt="첨단 듀얼 카메라 시스템을 보여주는 핑크 iPhone 15이 종이로 꾸민 구름 위에 떠 있는 모습"
                 src="https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/store-card-50-holiday-iphone-15-202311?wid=480&amp;hei=500&amp;fmt=p-jpg&amp;qlt=95&amp;.v=1698188084112"
                 srcset="https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/store-card-50-holiday-iphone-15-202311?wid=480&amp;hei=500&amp;fmt=p-jpg&amp;qlt=95&amp;.v=1698188084112, https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/store-card-50-holiday-iphone-15-202311?wid=960&amp;hei=1000&amp;fmt=p-jpg&amp;qlt=95&amp;.v=1698188084112 2x"
                 class="rf-ccard-img-full"></li>
        <li class="subject">iPhone15</li>
        <li class="buy-button"><a href="#">구매하기</a></li>
      </ul>
    </div>
  </div>
</section>
<section class="main4" id="sec_ipad">
  <h3 class="t5">iPad</h3>
</section>
<section class="main5">
  <div class="item2">
    <div class="slideshow">
      <ul>
        <li><img width="480" height="500"
                 alt="전면 화면 디자인의 핑크 iPad의 앞면과 12MP 와이드 카메라를 보여주는 블루 iPad의 뒷면을 종이로 꾸민 파형 무늬가 둘러싸고 있는 모습"
                 src="https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/store-card-50-holiday-ipad-202311?wid=480&amp;hei=500&amp;fmt=p-jpg&amp;qlt=95&amp;.v=1696863030352"
                 srcset="https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/store-card-50-holiday-ipad-202311?wid=480&amp;hei=500&amp;fmt=p-jpg&amp;qlt=95&amp;.v=1696863030352, https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/store-card-50-holiday-ipad-202311?wid=960&amp;hei=1000&amp;fmt=p-jpg&amp;qlt=95&amp;.v=1696863030352 2x"
                 class="rf-ccard-img-full"></li>
        <li class="subject">iPad</li>
        <li class="buy-button"><a href="#">구매하기</a></li>
      </ul>
    </div>
    <div class="slideshow">
      <ul>
        <li><img width="480" height="500"
                 alt="Liquid Retina 디스플레이, 12MP 와이드 카메라를 갖춘 퍼플 iPad Air의 뒷면과 앞면 주변을 종이로 꾸민 구름이 둘러싸고 있는 모습"
                 src="https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/store-card-50-holiday-ipad-air-202311?wid=480&amp;hei=500&amp;fmt=p-jpg&amp;qlt=95&amp;.v=1696863032946"
                 srcset="https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/store-card-50-holiday-ipad-air-202311?wid=480&amp;hei=500&amp;fmt=p-jpg&amp;qlt=95&amp;.v=1696863032946, https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/store-card-50-holiday-ipad-air-202311?wid=960&amp;hei=1000&amp;fmt=p-jpg&amp;qlt=95&amp;.v=1696863032946 2x"
                 class="rf-ccard-img-full"></li>
        <li class="subject">iPad Air</li>
        <li class="buy-button"><a href="#">구매하기</a></li>
      </ul>
    </div>
  </div>
</section>
<section class="main4" id="sec_watch">
  <h3 class="t5">Watch</h3>
</section>
<section class="main5">
  <div class="item2">
    <div class="slideshow">
      <ul>
        <li><img width="480" height="500" alt=""
                 src="https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/store-card-50-holiday-watch-s9-202311_GEO_KR?wid=480&amp;hei=500&amp;fmt=p-jpg&amp;qlt=95&amp;.v=1697055183686"
                 srcset="https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/store-card-50-holiday-watch-s9-202311_GEO_KR?wid=480&amp;hei=500&amp;fmt=p-jpg&amp;qlt=95&amp;.v=1697055183686, https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/store-card-50-holiday-watch-s9-202311_GEO_KR?wid=960&amp;hei=1000&amp;fmt=p-jpg&amp;qlt=95&amp;.v=1697055183686 2x"
                 class="rf-ccard-img-full"></li>
        <li class="subject">Apple Watch Series 9</li>
        <li class="buy-button"><a href="#">구매하기</a></li>
      </ul>
    </div>
    <div class="slideshow">
      <ul>
        <li><img width="480" height="500" alt=""
                 src="https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/store-card-50-holiday-watch-ultra-2-202311_GEO_KR?wid=480&amp;hei=500&amp;fmt=p-jpg&amp;qlt=95&amp;.v=1698766693786"
                 srcset="https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/store-card-50-holiday-watch-ultra-2-202311_GEO_KR?wid=480&amp;hei=500&amp;fmt=p-jpg&amp;qlt=95&amp;.v=1698766693786, https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/store-card-50-holiday-watch-ultra-2-202311_GEO_KR?wid=960&amp;hei=1000&amp;fmt=p-jpg&amp;qlt=95&amp;.v=1698766693786 2x"
                 class="rf-ccard-img-full"></li>
        <li class="subject">Apple Watch Ultra 2</li>
        <li class="buy-button"><a href="#">구매하기</a></li>
      </ul>
    </div>
  </div>
</section>
<section class="main4" id="sec_mac">
  <h3 class="t5">Mac</h3>
</section>
<section class="main5">
  <div class="item2">
    <div class="slideshow">
      <ul>
        <li><img width="480" height="500" alt=""
                 src="https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/store-card-50-holiday-macbook-pro-202311?wid=480&amp;hei=500&amp;fmt=p-jpg&amp;qlt=95&amp;.v=1696872235281"
                 srcset="https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/store-card-50-holiday-macbook-pro-202311?wid=480&amp;hei=500&amp;fmt=p-jpg&amp;qlt=95&amp;.v=1696872235281, https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/store-card-50-holiday-macbook-pro-202311?wid=960&amp;hei=1000&amp;fmt=p-jpg&amp;qlt=95&amp;.v=1696872235281 2x"
                 class="rf-ccard-img-full"></li>
        <li class="subject">MacBook Pro</li>
        <li class="buy-button"><a href="#">구매하기</a></li>
      </ul>
    </div>
    <div class="slideshow">
      <ul>
        <li><img width="480" height="500"
                 alt="회색 종이 구름과 날고 있는 새에 둘러싸인 놀랍도록 얇은 MacBook Air의 열린 상태 옆모습."
                 src="https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/store-card-50-holiday-macbook-air-202311?wid=480&amp;hei=500&amp;fmt=p-jpg&amp;qlt=95&amp;.v=1696863032996"
                 srcset="https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/store-card-50-holiday-macbook-air-202311?wid=480&amp;hei=500&amp;fmt=p-jpg&amp;qlt=95&amp;.v=1696863032996, https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/store-card-50-holiday-macbook-air-202311?wid=960&amp;hei=1000&amp;fmt=p-jpg&amp;qlt=95&amp;.v=1696863032996 2x"
                 class="rf-ccard-img-full"></li>
        <li class="subject">MacBook Air</li>
        <li class="buy-button"><a href="#">구매하기</a></li>
      </ul>
    </div>
  </div>
</section>
<!-- section main -->
<%@ include file="modules/footer.jsp"%>
</body>
</html>