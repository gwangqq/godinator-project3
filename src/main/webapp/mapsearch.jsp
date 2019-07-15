<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>키워드로 장소검색하기</title>
    
</head>
<body>
<div id="map" style="width:100%;height:350px;"></div>
<input type="text" id = "search">

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f22525e443605fce310be835dea5bdc2&libraries=services,clusterer,drawing"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
var latitude = 36.46;
var longtitude = 123.45;

var mapContainer = document.getElementById('maparea'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(latitude, longtitude), // 지도의 중심좌표
        level: 4
// 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 마커가 표시될 위치입니다 
var markerPosition  = new kakao.maps.LatLng(latitude, longtitude); 

var imageSrc = 'https://i.ya-webdesign.com/images/address-icon-png-8.png', // 마커이미지의 주소입니다    
imageSize = new kakao.maps.Size(64, 69), // 마커이미지의 크기입니다
imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
  
// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
markerPosition = new kakao.maps.LatLng(latitude, longtitude); // 마커가 표시될 위치입니다 

var marker = new kakao.maps.Marker({
    position: markerPosition,
    image: markerImage
});

// 마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);

// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
// marker.setMap(null);  

 
</script> 
</body>
</html>