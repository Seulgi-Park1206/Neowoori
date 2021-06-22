<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js" integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT" crossorigin="anonymous"></script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/module/nav.jsp" flush="false" />
<input type=text id="session" value="login"><br>
<button id=on>확인</button><br>

<div class="col text-center">
 모이고 싶은 모임의 주제를 선택하세요!
 </div>
<div class="container-sm ">
	<div class="accordion accordion-flush" id="accordionExample">
		<div class="col text-center">
		  <div class=".container-sm accordion-item">
		  	
			    <h2 class="accordion-header" id="headingOne">
			  <button id="calOne" name="btnOne" class="btn .btn-outline-*" type="button" data-bs-toggle="collapse" data-bs-target="#colOne" aria-expanded="true" aria-controls="collapseOne"></button> 
			    <!-- <input type='button' id="calOne" name="btnOne" class="btn .btn-outline-*" type="button" data-bs-toggle="collapse" data-bs-target="#colOne" aria-expanded="true" aria-controls="collapseOne">-->
			    </h2>
		    
		    <div id="colOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
		      <div class="accordion-body">
		      	<div class="btn-group-vertical" id=btnGroupBig>
			    	<button id=selBig1 class="btn btn-outline-success btn-sm" onclick=btnBigClick(1)>전체</button>
					<button id=selBig2 class="btn btn-outline-success btn-sm" onclick=btnBigClick(2)>독서</button>
					<button id=selBig3 class="btn btn-outline-success btn-sm" onclick=btnBigClick(3)>문화생활</button>
					<button id=selBig4 class="btn btn-outline-success btn-sm" onclick=btnBigClick(4)>어학</button>
					<button id=selBig5 class="btn btn-outline-success btn-sm" onclick=btnBigClick(5)>취업</button>
					<button id=selBig6 class="btn btn-outline-success btn-sm" onclick=btnBigClick(6)>토론</button>
					<button id=selBig7 class="btn btn-outline-success btn-sm" onclick=btnBigClick(7)>코딩</button>
				</div>
				<!-- 
				<br>
		        <select id=interest style="text-align:center; height:30px;" onchange="chageLangSelect()">
					<option value="프로그래밍">프로그래밍</option>
					<option value="언어">언어</option>
					<option value="디자인">디자인,영상,사진,음향</option>
					<option value="영상">영상</option>
					<option value="사진">사진</option>
					</select>
				 -->
		      </div>
		    </div>
		  </div>
		  <div class="accordion-item" id=itemTwo>
		    <h2 class="accordion-header" id="headingTwo">
		      <button id="calTwo" name="btnTwo" class="btn .btn-outline-*" type="button" data-bs-toggle="collapse" data-bs-target="#colTwo" aria-expanded="false" aria-controls="collapseTwo"></button>
		    </h2>
		    <div id="colTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
		      <div class="accordion-body">
		        <div class="btn-group-vertical" id=btnGroupSm>
				 
				</div>
		      </div>
		    </div>
		    </div>
		  </div>
		  <!-- 
		  <div class="accordion-item" id=itemThree>
		    <h2 class="accordion-header" id="headingThree">
		      <button id="calThree" class="btn .btn-outline-*" type="button" data-bs-toggle="collapse" data-bs-target="#colThree" aria-expanded="false" aria-controls="collapseTwo">
		        
		      </button>
		    </h2>
		    <div id="colThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
		      <div class="accordion-body">
		        
		      </div>
		    </div>
		  </div>
		 -->
	</div>
</div>

<div id="map" style="width:750px;height:350px; margin:0 auto; text-align:center;" ></div>
		      	<div id="map2"></div>

<jsp:include page="/module/footer.jsp" flush="false" />

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
	$("#map").hide();
})
.on("click","#calOne",function(){
	$("#map").hide();
})
.on("click","#calTwo",function(){
	$("#map").hide();
})

function mapView(){
	//btnOne,btnTwo
	console.log($("#calOne").text());
	console.log($("#calTwo").text());
	//var sendData = JSON.stringify({type:$('#type').val(), complete:$('#complete').val(), page:$('#page').val()});
	$.ajax({
        url:'findMap.do'
        , method : 'POST'
        , data: {'one':$("#calOne").text(),'two':$("#calTwo").text()}
        //, contentType : 'application/json; charset=UTF-8'
        //, dataType : 'json'
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
        	    
        	} else { 
        	    var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
        	        message = 'geolocation에러'
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
	        		//console.log(item.lati);
	        		var positions = [
			        		{
			        			content: '<div>'+item.mName+'</div>', 
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
};
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
/*
function chageLangSelect(){
	$("#calOne").text($("#interest").val());
	 $('#calTwo').trigger('click');
}
*/
function btnBigClick(who){
	if (who==1) btnBigSelect1(); //소 분류 무조건 전체
	if (who==2) btnBigSelect2();
	if (who==3) btnBigSelect3();
	if (who==4) btnBigSelect4();
	if (who==5) btnBigSelect5();
	if (who==6) btnBigSelect6();
	if (who==7) btnBigSelect7();
	$('#calTwo').trigger('click');
}

//카테고리 대 선택후 소 버튼 생성
function btnBigSelect1(){
	$("#calOne").text($("#selBig1").text());
	$('#btnGroupSm').empty();
	$("#btnGroupSm").append('<button id=selSm1 class="btn btn-outline-success btn-sm" onclick=btnSmClick(1)>전체</button>');
}
function btnBigSelect2(){
	$("#calOne").text($("#selBig2").text());
	$('#btnGroupSm').empty();
	$("#btnGroupSm").append('<button id=selSm1 class="btn btn-outline-success btn-sm" onclick=btnSmClick(1)>전체</button>');
	$("#btnGroupSm").append('<button id=selSm2 class="btn btn-outline-success btn-sm" onclick=btnSmClick(2)>인문학</button>');
	$("#btnGroupSm").append('<button id=selSm3 class="btn btn-outline-success btn-sm" onclick=btnSmClick(3)>심리학</button>');
	$("#btnGroupSm").append('<button id=selSm4 class="btn btn-outline-success btn-sm" onclick=btnSmClick(4)>철학</button>');
	$("#btnGroupSm").append('<button id=selSm5 class="btn btn-outline-success btn-sm" onclick=btnSmClick(5)>역사</button>');
	$("#btnGroupSm").append('<button id=selSm6 class="btn btn-outline-success btn-sm" onclick=btnSmClick(6)>시사/경제</button>');
	$("#btnGroupSm").append('<button id=selSm7 class="btn btn-outline-success btn-sm" onclick=btnSmClick(7)>소설</button>');
	$("#btnGroupSm").append('<button id=selSm8 class="btn btn-outline-success btn-sm" onclick=btnSmClick(8)>기타</button>');
}
function btnBigSelect3(){
	$("#calOne").text($("#selBig3").text());
	$('#btnGroupSm').empty();
	$("#btnGroupSm").append('<button id=selSm1 class="btn btn-outline-success btn-sm" onclick=btnSmClick(1)>전체</button>');
	$("#btnGroupSm").append('<button id=selSm2 class="btn btn-outline-success btn-sm" onclick=btnSmClick(2)>뮤지컬/오페라</button>');
	$("#btnGroupSm").append('<button id=selSm3 class="btn btn-outline-success btn-sm" onclick=btnSmClick(3)>영화</button>');
	$("#btnGroupSm").append('<button id=selSm4 class="btn btn-outline-success btn-sm" onclick=btnSmClick(4)>전시회</button>');
	$("#btnGroupSm").append('<button id=selSm5 class="btn btn-outline-success btn-sm" onclick=btnSmClick(5)>파티/페스티벌</button>');
	$("#btnGroupSm").append('<button id=selSm6 class="btn btn-outline-success btn-sm" onclick=btnSmClick(6)>기타</button>');
//	$("#btnGroupSm").append('<button id=selSm7 class="btn btn-outline-success btn-sm" onclick=btnSmClick(7)></button>');
//	$("#btnGroupSm").append('<button id=selSm8 class="btn btn-outline-success btn-sm" onclick=btnSmClick(8)></button>');
}
function btnBigSelect4(){
	$("#calOne").text($("#selBig4").text());
	$('#btnGroupSm').empty();
	$("#btnGroupSm").append('<button id=selSm1 class="btn btn-outline-success btn-sm" onclick=btnSmClick(1)>전체</button>');
	$("#btnGroupSm").append('<button id=selSm2 class="btn btn-outline-success btn-sm" onclick=btnSmClick(2)>영어</button>');
	$("#btnGroupSm").append('<button id=selSm3 class="btn btn-outline-success btn-sm" onclick=btnSmClick(3)>일본어</button>');
	$("#btnGroupSm").append('<button id=selSm4 class="btn btn-outline-success btn-sm" onclick=btnSmClick(4)>중국어</button>');
	$("#btnGroupSm").append('<button id=selSm5 class="btn btn-outline-success btn-sm" onclick=btnSmClick(5)>프랑스어</button>');
	$("#btnGroupSm").append('<button id=selSm6 class="btn btn-outline-success btn-sm" onclick=btnSmClick(6)>스페인어</button>');
	$("#btnGroupSm").append('<button id=selSm7 class="btn btn-outline-success btn-sm" onclick=btnSmClick(7)>기타</button>');
//	$("#btnGroupSm").append('<button id=selSm8 class="btn btn-outline-success btn-sm" onclick=btnSmClick(8)></button>');
}
function btnBigSelect5(){
	$("#calOne").text($("#selBig5").text());
	$('#btnGroupSm').empty();
	$("#btnGroupSm").append('<button id=selSm1 class="btn btn-outline-success btn-sm" onclick=btnSmClick(1)>전체</button>');
	$("#btnGroupSm").append('<button id=selSm2 class="btn btn-outline-success btn-sm" onclick=btnSmClick(2)>공무원</button>');
	$("#btnGroupSm").append('<button id=selSm3 class="btn btn-outline-success btn-sm" onclick=btnSmClick(3)>토익/토플</button>');
	$("#btnGroupSm").append('<button id=selSm4 class="btn btn-outline-success btn-sm" onclick=btnSmClick(4)>임용고시</button>');
	$("#btnGroupSm").append('<button id=selSm5 class="btn btn-outline-success btn-sm" onclick=btnSmClick(5)>인적성검사</button>');
	$("#btnGroupSm").append('<button id=selSm6 class="btn btn-outline-success btn-sm" onclick=btnSmClick(6)>기타</button>');
//	$("#btnGroupSm").append('<button id=selSm7 class="btn btn-outline-success btn-sm" onclick=btnSmClick(7)></button>');
//	$("#btnGroupSm").append('<button id=selSm8 class="btn btn-outline-success btn-sm" onclick=btnSmClick(8)></button>');
}
function btnBigSelect6(){
	$("#calOne").text($("#selBig6").text());
	$('#btnGroupSm').empty();
	$("#btnGroupSm").append('<button id=selSm1 class="btn btn-outline-success btn-sm" onclick=btnSmClick(1)>전체</button>');
	$("#btnGroupSm").append('<button id=selSm2 class="btn btn-outline-success btn-sm" onclick=btnSmClick(2)>경제</button>');
	$("#btnGroupSm").append('<button id=selSm3 class="btn btn-outline-success btn-sm" onclick=btnSmClick(3)>문화</button>');
	$("#btnGroupSm").append('<button id=selSm4 class="btn btn-outline-success btn-sm" onclick=btnSmClick(4)>정치</button>');
	$("#btnGroupSm").append('<button id=selSm5 class="btn btn-outline-success btn-sm" onclick=btnSmClick(5)>환경</button>');
	$("#btnGroupSm").append('<button id=selSm6 class="btn btn-outline-success btn-sm" onclick=btnSmClick(6)>기타</button>');
//	$("#btnGroupSm").append('<button id=selSm7 class="btn btn-outline-success btn-sm" onclick=btnSmClick(7)></button>');
//	$("#btnGroupSm").append('<button id=selSm8 class="btn btn-outline-success btn-sm" onclick=btnSmClick(8)></button>');
}
function btnBigSelect7(){
	$("#calOne").text($("#selBig7").text());
	$('#btnGroupSm').empty();
	$("#btnGroupSm").append('<button id=selSm1 class="btn btn-outline-success btn-sm" onclick=btnSmClick(1)>전체</button>');
	$("#btnGroupSm").append('<button id=selSm2 class="btn btn-outline-success btn-sm" onclick=btnSmClick(2)>JAVA</button>');
	$("#btnGroupSm").append('<button id=selSm3 class="btn btn-outline-success btn-sm" onclick=btnSmClick(3)>C</button>');
	$("#btnGroupSm").append('<button id=selSm4 class="btn btn-outline-success btn-sm" onclick=btnSmClick(4)>C#,C++</button>');
	$("#btnGroupSm").append('<button id=selSm5 class="btn btn-outline-success btn-sm" onclick=btnSmClick(5)>Python</button>');
	$("#btnGroupSm").append('<button id=selSm6 class="btn btn-outline-success btn-sm" onclick=btnSmClick(6)>Java script</button>');
//	$("#btnGroupSm").append('<button id=selSm7 class="btn btn-outline-success btn-sm" onclick=btnSmClick(7)></button>');
//	$("#btnGroupSm").append('<button id=selSm8 class="btn btn-outline-success btn-sm" onclick=btnSmClick(8)></button>');
}

//카테고리 소 버튼 액션
function btnSmClick(who){
	if (who==1) $("#calTwo").text($("#selSm1").text());
	if (who==2) $("#calTwo").text($("#selSm2").text());
	if (who==3) $("#calTwo").text($("#selSm3").text());
	if (who==4) $("#calTwo").text($("#selSm4").text());
	if (who==5) $("#calTwo").text($("#selSm5").text());
	if (who==6) $("#calTwo").text($("#selSm6").text());
	if (who==6) $("#calTwo").text($("#selSm7").text());
	if (who==6) $("#calTwo").text($("#selSm8").text());
	$('#calTwo').trigger('click');//닫기
	$("#map").show();
	mapView();
}


</script>
</html>