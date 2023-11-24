<%@ page contentType="text/html;charset=UTF-8" language="java" import="com.ysw.applestoreclone.sensitiveinfo.SensInfoProvider" %>
<html>
<head>
    <title>오프라인 스토어 검색</title>
</head>
<style>
    html, body {
        height: 100%;
        margin: 0;
    }
    .full-page {
        width: 100%;
        height: 100%;
    }
</style>
<body>
<!-- 지도가 표시될 곳 -->
<div id="map" class="full-page"></div>

<!-- API KEY는 외부 클래스에서 받아옴 -->
<script type="text/javascript" src=//dapi.kakao.com/v2/maps/sdk.js?appkey=<%=SensInfoProvider.getJsApiKey()%>></script>
<script type="text/javascript">
    var lat = "";
    var lon = "";

    var container = document.getElementById('map'); // 지도를 담을 영역의 DOM 레퍼런스
    var options = { //지도를 생성할 때 필요한 기본 옵션
        center: new kakao.maps.LatLng(37.5665, 126.9781), // 지도의 중심좌표
        level: 7 //지도의 레벨(확대, 축소 정도)
    };
    var map = new kakao.maps.Map(container, options); // 지도 생성 및 객체 리턴

    // HTML5의 geolocation으로 사용할 수 있는지 확인
    if (navigator.geolocation) {
        // GeoLocation을 이용해서 접속 위치를 얻어옴
        navigator.geolocation.getCurrentPosition(function(position) {
            lat = position.coords.latitude; // 위도
            lon = position.coords.longitude; // 경도

            // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성
            var locPosition = new kakao.maps.LatLng(lat, lon),
                message = '<div style="padding:4px;">현재 위치</div>';

            // 마커를 표시
            displayMarker(locPosition, message);
        });
    } else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정
        var locPosition = new kakao.maps.LatLng(37.5665, 126.9781),
            message = '<div style="padding:5px;">현재 위치 확인 불가</div>';
        displayMarker(locPosition, message);
    }

    // 지도에 현재 위치 마커를 표시하는 함수
    function displayMarker(locPosition, message) {

        // 마커를 생성
        var marker = new kakao.maps.Marker({
            map: map,
            position: locPosition
        });

        var iwContent = message, // 인포윈도우에 표시할 내용
            iwRemoveable = true;

        // 인포윈도우를 생성
        var infowindow = new kakao.maps.InfoWindow({
            content : iwContent,
            removable : iwRemoveable
        });

        // 인포윈도우를 마커위에 표시
        infowindow.open(map, marker);

        // 지도 중심좌표를 접속위치로 변경
        map.setCenter(locPosition);
    }

    // 기본 마커를 위한 코드

    // 마커를 표시할 위치와 title 객체 배열
    var positions = [
        { title: '가로수길점',
            latlng: new kakao.maps.LatLng(37.5209, 127.0227) },
        { title: '여의도점',
            latlng: new kakao.maps.LatLng(37.5255, 126.9263) },
        { title: '명동점',
            latlng: new kakao.maps.LatLng(37.5645, 126.9829) },
        { title: '잠실점',
            latlng: new kakao.maps.LatLng(37.5139, 127.1041) },
        { title: '강남점',
            latlng: new kakao.maps.LatLng(37.5036, 127.0253) } ];

    // 마커 이미지의 이미지 주소
    var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";

    var markers = [];
    positions.forEach(function(branch) {
        // 마커 이미지의 이미지 크기
        var imageSize = new kakao.maps.Size(28, 39);

        // 마커 이미지를 생성
        var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

        // 마커를 생성
        var marker = new kakao.maps.Marker({
            map: map, // 마커를 표시할 지도
            position: branch.latlng, // 마커를 표시할 위치
            title : branch.title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됨
            image : markerImage // 마커 이미지
        });

        // 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
        var iwContent = '<a href="https://map.kakao.com/link/to/' + branch.title + ',' + branch.latlng.getLat() + ',' + branch.latlng.getLng() + '" style="padding:5px;" target="_blank">길찾기</a>';
        var iwRemoveable = true;

        // 인포윈도우를 생성합니다
        var infowindow = new kakao.maps.InfoWindow({
            content : iwContent,
            removable : iwRemoveable
        });

        // 마커와 인포윈도우를 배열에 저장
        markers.push({
            marker: marker,
            infowindow: infowindow
        });

        // 마커에 클릭이벤트를 등록합니다
        kakao.maps.event.addListener(marker, 'click', makeClickListener(infowindow, map, marker));
    });

    function makeClickListener(infowindow, map, marker) {
        return function() {
            // 열려있는 다른 지점 인포윈도우가 있다면 닫기
            closeAllInfoWindows();

            infowindow.open(map, marker);
        }
    }

    // 지점 인포윈도우를 닫는 함수
    function closeAllInfoWindows() {
        markers.forEach(function(marker) {
            marker.infowindow.close();
        });
    }
</script>
</body>
</html>
