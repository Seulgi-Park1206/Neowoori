<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js" integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT" crossorigin="anonymous"></script>
<head>
<meta charset="UTF-8">
<title>test page</title>
</head>
<body>
<input type="hidden" id="hid" value=<%=session.getAttribute("userid")%>>
<div id="map" style="width:100%;height:350px;"></div>

<div class="modal fade" id="exampleModalToggle" aria-hidden="true" aria-labelledby="exampleModalToggleLabel" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h6 class="modal-title" id="exampleModalToggleLabel">Modal 1</h6>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" id="modal-body1">
        1
      </div>
      <div class="modal-footer">
        <button class="btn btn-primary" data-bs-target="#exampleModalToggle2" data-bs-toggle="modal" data-bs-dismiss="modal">쪽지보내기</button>
      </div>
    </div>
  </div>
</div>
<div class="modal fade" id="exampleModalToggle2" aria-hidden="true" aria-labelledby="exampleModalToggleLabel2" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h6 class="modal-title" id="exampleModalToggleLabel2">Modal 2</h6>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" id="modal-body2">
		<form>
          <div class="mb-3">
            <label for="recipient-name" class="col-form-label">Recipient:</label>
            <input type="text" class="form-control" id="recipient-name">
          </div>
          <div class="mb-3">
            <label for="message-text" class="col-form-label">Message:</label>
            <textarea class="form-control" id="message-text"></textarea>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary">Send message</button>
        <button class="btn btn-primary" data-bs-target="#exampleModalToggle" data-bs-toggle="modal" data-bs-dismiss="modal">Back</button>
      </div>
    </div>
  </div>
</div>
<a id="bbtn" class="btn btn-primary" data-bs-toggle="modal" href="#exampleModalToggle" role="button">Open first modal</a>
<input type=button onclick=btnTest()>
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
        	        var locPosition = new kakao.maps.LatLng(lat, lon)
        	            //message = '';
        	        displayMarker(locPosition);

        	      });
        	} else {
        	    var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
        	        message = 'geolocation에러.'        	    
        	    displayMarker(locPosition);
        	}
        	function displayMarker(locPosition) {
        	    var marker = new kakao.maps.Marker({  
        	        map: map, 
        	        position: locPosition
        	    }); 
        	    map.setCenter(locPosition);      
        	};
	        	$.each(resp, function (i, item){
	        		//console.log(item.lati);
	        		var positions = [
			        		{
			        			content: '<div>'+item.mName+'</div>', 
			        	        latlng: new kakao.maps.LatLng(item.lati, item.longi)
			        		}
	        			]
	        	    var marker = new kakao.maps.Marker({
	        	        map: map,
	        	        position: positions[0].latlng // 마커의 위치
	        	    });

	        	    var infowindow = new kakao.maps.InfoWindow({
	        	        content: positions[0].content // 인포윈도우에 표시할 내용
	        	    });
	        	    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
	        	    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
	        	    kakao.maps.event.addListener(marker, 'click', function() {
	        	        // 마커 위에 인포윈도우를 표시합니다
	        	        console.log(item.mName);
	        	        console.log(item.mNum);
	        	        addModal(item.mName,item.category1,item.category2,item.mContents,item.mDay,item.mLevel,item.mPtime,item.mTime,item.mWhere,item.mNum);
	        	        btnTest();
	        	    });
	        	})
        	
        	}
	})
})
.ready(function(){
	$("#hid").val("human1");
})
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

function btnTest(){
	$('#bbtn').get(0).click();
}
function addModal(mName,category1,category2,mContents,mDay,mLevel,mPtime,mTime,mWhere,mNum){
   	$('#modal-body1').empty();
   	$('#exampleModalToggleLabel').text(mName);
	$("#modal-body1").append("카테고리: "+category1+"-"+category2+"<br>");
	$("#modal-body1").append("주소: "+mWhere+"<br>");
	$("#modal-body1").append("활동요일: "+mDay+"<br>");
	$("#modal-body1").append("시작시간: "+mTime+", 진행시간: "+mPtime+"<br>");
	$("#modal-body1").append("난이도: "+mLevel+"<br>");
	$("#modal-body1").append("스터디 소개<br>"+mContents+"<br>");
}
</script>
</html>
