<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>메인페이지</title>
</head>
<link rel="stylesheet" href="${path}/resources/psg/css/form.css" type="text/css">
<link rel="stylesheet" href="${path}/resources/psg/css/meetadmin.css" type="text/css">
<body>
<jsp:include page="/module/nav.jsp" flush="false" />
<div style="text-align:center;">
	<img src="${path}/resources/img/searchSmall.png" width="80" height="120">
</div>
<div>
<p style="font-size:50px; text-align:center;">스터디찾기</p>
</div>

<div>
<center>
	<select name=interest id=interest style="text-align:center; height:30px;">
		<option value=0>대분류</option>
		<option value=1>프로그래밍</option>
		<option value=2>언어</option>
		<option value=3>디자인,영상,사진,음향</option>
	</select>
	&nbsp;
	>
	&nbsp;
	<select name=interest2 id=interest2 style="text-align:center; height:30px;">
		<option value=default>중분류</option>
		
	</select>
	&nbsp;&nbsp;&nbsp;
	<input type="button" value=관심분야검색 id=interest_button>
</center><br>
<center>
<input type=text value="지도검색">&nbsp;&nbsp;
<input type="button" value=위치검색 id=location_button>&nbsp;
<button type="button" id="getMyPositionBtn" onclick="getCurrentPosBtn()">내 위치 검색</button>
</center>
</div><br>

<br>
<div id="map" style="width:750px;height:350px; margin:0 auto; text-align:center; display:none;" ></div>
<jsp:include page="/module/footer.jsp" flush="false" />
	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4b0f94866b0f233c25fbdc0d8ed3c881"></script>
	<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div
    mapOption = {
        center: new kakao.maps.LatLng(37.56646, 126.98121), // 지도의 중심좌표
        level: 3, // 지도의 확대 레벨
        mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
    };
	
	// 지도를 생성한다
	var map = new kakao.maps.Map(mapContainer, mapOption);
	//map controller 생성
	var mapTypeControl = new kakao.maps.MapTypeControl();
	map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
	var zoomControl = new kakao.maps.ZoomControl();
	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
	
	function locationLoadSuccess(pos){
	    // 현재 위치 받아오기
	    var currentPos = new kakao.maps.LatLng(pos.coords.latitude,pos.coords.longitude);
			
	    // 지도 이동(기존 위치와 가깝다면 부드럽게 이동)
	    map.panTo(currentPos);
		
	    
	    // 마커 생성
	    var marker = new kakao.maps.Marker({
	        position: currentPos,
	    });	
	    // 기존에 마커가 있다면 제거
	    marker.setMap(null);
	    marker.setMap(map);
	};
	
	
	function locationLoadError(pos){
	    alert('위치 정보를 가져오는데 실패했습니다.');
	};
	
	// 위치 가져오기 버튼 클릭시
	function getCurrentPosBtn(){
	    navigator.geolocation.getCurrentPosition(locationLoadSuccess,locationLoadError);
	};
	
	
	</script>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script>
$(document)
.on('click','#getMyPositionBtn',function(){
	/*$('#getMyPositionBtn').on('click',function(){
		$('#getMyPositionBtn').trigger('click');
	});*/
	window.setTimeout(function(){
		map.relayout();
	},0);
	
	$('#map').show();
	//$('#getMyPositionBtn').show();
})

.ready(function(){
	$('#interest').on('change',function(){
		if(this.value=='1'){
			$('#interest2').empty();
			$('#interest2').append("<option value=0>중분류</option>");
			$('#interest2').append("<option value=java>java</option>");
			$('#interest2').append("<option value=python>Python</option>");
			$('#interest2').append("<option value=spring>Spring</option>");
			$('#interest2').append("<option value=django>Django</option>");
			$('#interest2').append("<option value=r>R</option>");
		}
		if(this.value=='2'){
			$('#interest2').empty();
			$('#interest2').append("<option value=0>중분류</option>");
			$('#interest2').append("<option value=english>영어</option>");
			$('#interest2').append("<option value=france>불어</option>");
			$('#interest2').append("<option value=china>중국어</option>");
			$('#interest2').append("<option value=spain>스페인어</option>");
			$('#interest2').append("<option value=arab>아랍어</option>");
		}
		if(this.value=='3'){
			$('#interest2').empty();
			$('#interest2').append("<option value=0>중분류</option>");
			$('#interest2').append("<option value=photoshop>포토샵</option>");
			$('#interest2').append("<option value=pr>프리미어</option>");
			$('#interest2').append("<option value=finalcut>파이널컷</option>");
		}
	})
	
/*.on('click','#interest_button',function(){
	let text=$('#interest option:selected').val();
	console.log(text);
})*/

})




</script>
	
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=999776cb53f71de054b91ce661eb628c"></script>
	<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</body>
</html>