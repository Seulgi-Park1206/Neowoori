<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js" integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT" crossorigin="anonymous"></script>
<link rel="stylesheet"  href="${path}/resources/jsb/custOverlay.css">
<head>
<meta charset="UTF-8">
<title>jsb test page</title>
</head>
<body>
<!-- 

 -->
<input type="hidden" id="hid" value=<%=session.getAttribute("userid")%>>
<div id="map" style="width:80%;height:550px;"></div>

<div class="modal fade" id="exampleModalToggle" aria-hidden="true" aria-labelledby="exampleModalToggleLabel" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h6 class="modal-title" id="exampleModalToggleLabel">Modal 1</h6>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" id="modal-body1">
        
      </div>
      <div class="modal-footer" id=modal-footerBtn1>
      	
      </div>
    </div>
  </div>
</div>
<div class="modal fade" id="exampleModalToggle2" aria-hidden="true" aria-labelledby="exampleModalToggleLabel2" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h6 class="modal-title" id="exampleModalToggleLabel2">쪽지보내기</h6>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" id="modal-body2">
		<form>
			<div class="form-floating">
			  <textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea1" disabled></textarea>
			  <label for="floatingTextarea2" id=studyAdminNick>닉네임</label>
			</div>
			<div class="form-floating">
			  <textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea2" style="height: 200px"></textarea>
			  <label for="floatingTextarea2">쪽지 내용</label>
			</div>
        </form>
      </div>
      <div class="modal-footer" id=modal-footerBtn2>
       </div>
    </div>
  </div>
</div>
<a id="bbtn" class="btn btn-primary" data-bs-toggle="modal" href="#exampleModalToggle" role="button" style="display:none;">Open first modal</a>
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
        	var imageSrc = '${path}/resources/jsb/icon_0001.png', // 마커이미지의 주소입니다    
            imageSize = new kakao.maps.Size(38, 42), // 마커이미지의 크기입니다
            imageOption = {offset: new kakao.maps.Point(17, 42)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
        	
            var markerImage1 = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption)
        	
        	function displayMarker(locPosition) {
        	    var marker = new kakao.maps.Marker({  
        	        map: map, 
        	        position: locPosition,
        	        image: markerImage1
        	    }); 
        	    map.setCenter(locPosition);      
        	};
	        	$.each(resp, function (i, item){
	        		//console.log(item.lati);
	        		var positions = [
			        		{
			        			//content: '<div class="customoverlay"><a><span class="title">'+item.mName+'</span></a></div>', 
			        	        latlng: new kakao.maps.LatLng(item.lati, item.longi)
			        		}
	        			]

	            	var imageSrc2 = '${path}/resources/jsb/icon_0002.png', // 마커이미지의 주소입니다    
	                imageSize2 = new kakao.maps.Size(38, 42), // 마커이미지의 크기입니다
	                imageOption2 = {offset: new kakao.maps.Point(17, 42)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
	            	
	                var markerImage2 = new kakao.maps.MarkerImage(imageSrc2, imageSize2, imageOption2)

	        	    var marker = new kakao.maps.Marker({
	        	        map: map,
	        	        position: positions[0].latlng, // 마커의 위치
	        	        image: markerImage2
	        	    });
					/*
	        	    var infowindow = new kakao.maps.InfoWindow({
	        	        content: positions[0].content // 인포윈도우에 표시할 내용
	        	    });
	        	    */
	        	    var infowindow = new kakao.maps.InfoWindow({
	        	        content: '<div style="padding:5px;font-size:12px;">'+item.mName+'</div>' // 인포윈도우에 표시할 내용
	        	    });
	        	    
	        	    
	        	    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
	        	    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
	        	    kakao.maps.event.addListener(marker, 'click', function() {
	        	        // 마커 위에 인포윈도우를 표시합니다
	        	        //console.log(item.mName);
	        	        //console.log(item.mNum);
	        	        addModal(item.unick,item.mName,item.category1,item.category2,item.mContents,item.mDay,item.mLevel,item.mPtime,item.mTime,item.mWhere,item.mNum,item.mWhere2,item.mWhere3);
	        	        addModalBtn();
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
function addModal(uNick,mName,category1,category2,mContents,mDay,mLevel,mPtime,mTime,mWhere,mNum,mWhere2,mWhere3){
   	$('#modal-body1').empty();
   	$('#exampleModalToggleLabel').text(mName);
   	$("#modal-body1").append("<input type='hidden' name='mNum' id='mNumHid'>");
   	$("#mNumHid").val(mNum);
   	$("#modal-body1").append("<table border='2'>");
   	$("#modal-body1").append("<tr><td><p class='text-primary'>카테고리&nbsp</p></td><td>&nbsp"+category1+"-"+category2+"</td></tr>");
   	$("#modal-body1").append("<tr><td><p class='text-primary'>스터디장&nbsp</p></td><td>&nbsp"+uNick+"</td></tr>");
   	$("#modal-body1").append("<tr><td><p class='text-primary'>주소&nbsp</p></td><td>&nbsp"+mWhere+" "+mWhere3+"</td></tr>");
   	$("#modal-body1").append("<tr><td><p class='text-primary'>활동요일</p></td><td>&nbsp"+mDay+"</td></tr>");
   	$("#modal-body1").append("<tr><td><p class='text-primary'>시작시간</p></td><td>&nbsp"+mTime+"</td></tr>");
   	$("#modal-body1").append("<tr><td><p class='text-primary'>진행시간</p></td><td>&nbsp"+mPtime+"</td></tr>");
   	$("#modal-body1").append("<tr><td><p class='text-primary'>난이도</p></td><td>&nbsp"+mLevel+"</td></tr>");
   	$("#modal-body1").append("<tr><td><p class='text-primary'>소개</p></td><td></td></tr><tr><td colspan='2'>"+mContents+"</td></tr>");
	$("#modal-body1").append("</table>");
	$("#studyAdminNick").text(uNick);
}
function addModalBtn(){ // state를 확인해야함... 10인가 20인가
	$('#modal-footerBtn1').empty();
	$('#modal-footerBtn2').empty();
	$.ajax({
	    url: "jsbFindMeetStudy.do",
	    type: "POST",
	    data: {
	    	"mNumHid" : $('#mNumHid').val(), // 스터디명
	    	"userId" : $("#hid").val()	    	
	    },
	    success : function(data){
	    	//0=가입안함,10=가입신청중,20=가입완료,30=해당 스터디장
	    	//console.log(data);
	    	if (data==0){
	    		$("#modal-footerBtn1").append("<button class='btn btn-primary' onclick=btnJoinStudy() >가입신청</button>");
	    		$("#modal-footerBtn1").append("<button class='btn btn-primary' data-bs-target='#exampleModalToggle2' data-bs-toggle='modal' data-bs-dismiss='modal'>쪽지보내기</button>");
	    	}else if(data==10){
	    		$("#modal-footerBtn1").append("<button class='btn btn-primary' onclick=btnCancelJoin() >가입신청취소</button>");
	    		$("#modal-footerBtn1").append("<button class='btn btn-primary' data-bs-target='#exampleModalToggle2' data-bs-toggle='modal' data-bs-dismiss='modal'>쪽지보내기</button>");
	    	}else if(data==20){
	    		$("#modal-footerBtn1").append("<button class='btn btn-primary' onclick=btnOutStudy() >스터디탈퇴</button>");
	    		$("#modal-footerBtn1").append("<button class='btn btn-primary' data-bs-target='#exampleModalToggle2' data-bs-toggle='modal' data-bs-dismiss='modal'>쪽지보내기</button>");
	    	}else if(data==30){
	    		//해당 스터디장인데 버튼 추가해야될까?
	    	}else{
	    		console.log("addModalBtn함수 data값 이상");
	    	}
	    	$("#modal-footerBtn2").append("<button type='button' class='btn btn-primary' onclick=btnSendMsg() >메시지 보내기</button>");
	    	$("#modal-footerBtn2").append("<button class='btn btn-primary' data-bs-target='#exampleModalToggle' data-bs-toggle='modal' data-bs-dismiss='modal'>정보보기</button>");
	    },
	    error : function(){	
	    }
		});
}
function btnJoinStudy(){ //가입신청
	$.ajax({
		url: "jsbJoinStudy.do",
		type: "POST",
		data: {
			"mNumHid" : $('#mNumHid').val(), // 스터디명
			"userId" : $("#hid").val()	    	
	    },
	    success : function(data){
	    	alert("성공(임시 alert)");
	    	$('#modal-footerBtn1').empty();
	    	$("#modal-footerBtn1").append("<button class='btn btn-primary' onclick=btnCancelJoin() >가입신청취소</button>");
	    	$("#modal-footerBtn1").append("<button class='btn btn-primary' data-bs-target='#exampleModalToggle2' data-bs-toggle='modal' data-bs-dismiss='modal'>쪽지보내기</button>");
	    },
	    error : function(){	
	    }
		});
}
function btnCancelJoin(){ // 가입신청취소
	$.ajax({
		url: "jsbCancelJoin.do",
		type: "POST",
		data: {
			"mNumHid" : $('#mNumHid').val(), // 스터디명
			"userId" : $("#hid").val()	    	
	    },
	    success : function(data){
	    	alert("성공(임시 alert)");
	    	$('#modal-footerBtn1').empty();
	    	$("#modal-footerBtn1").append("<button class='btn btn-primary' onclick=btnJoinStudy() >가입신청</button>");
	    	$("#modal-footerBtn1").append("<button class='btn btn-primary' data-bs-target='#exampleModalToggle2' data-bs-toggle='modal' data-bs-dismiss='modal'>쪽지보내기</button>");
	    },
	    error : function(){	
	    }
		});
}
function btnOutStudy(){ // 스터디탈되
	$.ajax({
		url: "jsbJoinOut.do",
		type: "POST",
		data: {
			"mNumHid" : $('#mNumHid').val(), // 스터디명
			"userId" : $("#hid").val()	    	
	    },
	    success : function(data){
	    	alert("성공(임시 alert)");
	    	$('#modal-footerBtn1').empty();
	    	$("#modal-footerBtn1").append("<button class='btn btn-primary' onclick=btnJoinStudy() >가입신청</button>");
	    	$("#modal-footerBtn1").append("<button class='btn btn-primary' data-bs-target='#exampleModalToggle2' data-bs-toggle='modal' data-bs-dismiss='modal'>쪽지보내기</button>");
	    },
	    error : function(){	
	    }
		});
}

function btnSendMsg(){ // 메시지보내기
	//floatingTextarea1 , floatingTextarea2
	console.log($("#hid").val());
	console.log($("#floatingTextarea2").val());
	console.log($("#studyAdminNick").text());
	$.ajax({
		url: "jsbSendModalMsg.do",
		type: "POST",
		data: {
			"userId" : $("#hid").val(), // 보내는 사람 id
			"cont" : $("#floatingTextarea2").val(),
			"mAdminNick" : $("#studyAdminNick").text() // 닉네임으로 받는사람 num구해야됨
	    },
	    success : function(data){
	    	alert("성공(임시 alert)");
	    },
	    error : function(){	
	    }
		});
}
/*
 
 */
</script>
</html>
