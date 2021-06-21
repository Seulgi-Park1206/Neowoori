<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test page</title>
</head>
<body>
<div id="map" style="width:100%;height:350px;"></div>

</body>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4b0f94866b0f233c25fbdc0d8ed3c881"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
mapOption = { 
    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
    level: 5 // 지도의 확대 레벨
};

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

$(document)
.ready(function(){
	$.ajax({
        url:'findMap.do'
        , method : 'POST'
        , data: {}
        , contentType : 'application/json; charset=UTF-8'
        , dataType : 'json'
        , success :
        	function(resp){
        	console.log(resp);
        	if (navigator.geolocation) {
        	    
        	    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
        	    navigator.geolocation.getCurrentPosition(function(position) {
        	        
        	        var lat = position.coords.latitude, // 위도
        	            lon = position.coords.longitude; // 경도
        	        
        	        var locPosition = new kakao.maps.LatLng(lat, lon) // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
        	            //message = '<div style="padding:5px;">여기에 계신가요?!</div>'; // 인포윈도우에 표시될 내용입니다
        	        
        	        // 마커와 인포윈도우를 표시합니다
        	        displayMarker(locPosition);
        	            
        	      });
        	    
        	} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
        	    
        	    var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
        	        message = 'geolocation을 사용할수 없어요..'
        	        
        	    displayMarker(locPosition);
        	}

        	// 지도에 마커와 인포윈도우를 표시하는 함수입니다
        	function displayMarker(locPosition) {

        	    // 마커를 생성합니다
        	    var marker = new kakao.maps.Marker({  
        	        map: map, 
        	        position: locPosition
        	    }); 
        	    /*
        	    var iwContent = message, // 인포윈도우에 표시할 내용
        	        iwRemoveable = true;

        	    // 인포윈도우를 생성합니다
        	    var infowindow = new kakao.maps.InfoWindow({
        	        content : iwContent,
        	        removable : iwRemoveable
        	    });
        	    
        	    // 인포윈도우를 마커위에 표시합니다 
        	    infowindow.open(map, marker);
        	    */
        	    // 지도 중심좌표를 접속위치로 변경합니다
        	    map.setCenter(locPosition);      
        	};
        	
	        	$.each(resp, function (i, item){
	        		console.log(item.lati);
	        		var positions = [
		        			{ content: '<div>'+item.mName+'</div>', 
		        	        latlng: new kakao.maps.LatLng(item.lati, item.longi)
		        			}
	        			]
	        		 // 마커를 생성합니다
	        	    var marker = new kakao.maps.Marker({
	        	        map: map, // 마커를 표시할 지도
	        	        position: positions[0].latlng // 마커의 위치
	        	    });

	        	    // 마커에 표시할 인포윈도우를 생성합니다 
	        	    var infowindow = new kakao.maps.InfoWindow({
	        	        content: positions[0].content // 인포윈도우에 표시할 내용
	        	    });

	        	    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
	        	    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
	        	    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
	        	    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
	        	    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
	        	})
        	
        	}
	})
});
// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
function makeOverListener(map, marker, infowindow) {
    return function() {
        infowindow.open(map, marker);
    };
}

// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
function makeOutListener(infowindow) {
    return function() {
        infowindow.close();
    };
}

</script>
</html>