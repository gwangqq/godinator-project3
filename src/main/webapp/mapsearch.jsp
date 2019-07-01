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


$(document).ready(function() {
    // ID를 alpreah_input로 가지는 곳에서 키를 누를 경우
    
    var place = "";
    $("#search").keydown(function(key) {
        //키의 코드가 13번일 경우 (13번은 엔터키)
        if (key.keyCode == 13) {
            
        place = $("#search").val();
        	//경고창을 출력한다.
            //alert(place);

         // 키워드로 장소를 검색합니다
         ps.keywordSearch(place, placesSearchCB); 
	        $("#search").empty();	
         
         
        }
    });
    
    



});



	// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
	var infowindow = new kakao.maps.InfoWindow({zIndex:1});
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  
	
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	var mapTypeControl = new kakao.maps.MapTypeControl();
	
	//지도에 컨트롤을 추가해야 지도위에 표시됩니다
	//kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
	map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
	
	//지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
	var zoomControl = new kakao.maps.ZoomControl();
	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
	// 장소 검색 객체를 생성합니다
	var ps = new kakao.maps.services.Places(); 

	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	
// 키워드 검색 완료 시 호출되는 콜백함수 입니다
function placesSearchCB (data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        var bounds = new kakao.maps.LatLngBounds();

        for (var i=0; i<data.length; i++) {
            displayMarker(data[i]);    
            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
        }       

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
        map.setBounds(bounds);
    } 
}



// 지도에 마커를 표시하는 함수입니다
function displayMarker(place) {
    
    // 마커를 생성하고 지도에 표시합니다
    var marker = new kakao.maps.Marker({
        map: map,
        position: new kakao.maps.LatLng(place.y, place.x)
    });

    
	var searchresult = "";
	// 마커에 클릭이벤트를 등록합니다
	kakao.maps.event.addListener(marker, 'click', function(mouseEvent) {
	   	searchresult = place.place_name;
		// 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
	    infowindow.setContent('<div class = "result" style="padding:5px;font-size:12px;">' + searchresult + '</div>');
	    infowindow.open(map, marker); 
    	
	    alert(searchresult);
/* 	    
	    var latlng = mouseEvent.latLng; 
	    var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
	    message += '경도는 ' + latlng.getLng() + ' 입니다';
	    alert(message); */
		
	});
	
	alert(searchresult);
	
	geocoder.addressSearch(searchresult, function(result, status) {

        // 정상적으로 검색이 완료됐으면 
         if (status === kakao.maps.services.Status.OK) {

            var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			
            alert(coords);
        } 
    });     
	
	}

 
</script> 
</body>
</html>