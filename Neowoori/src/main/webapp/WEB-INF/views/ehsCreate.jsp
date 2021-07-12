<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 스터디 만들기</title>
</head>
<link rel="stylesheet" href="${path}/resources/psg/css/createstudy.css" type="text/css" >
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js" integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT" crossorigin="anonymous"></script>
<body>
<jsp:include page="/module/nav.jsp" flush="false" />
<input type="hidden" id="hid" value=<%=session.getAttribute("userid")%>>
   <div class="wrap wd668">
     <!--  <div class="container"> -->
        <!-- <div class="form_txtInput">-->
          <h2 >스터디 만들기</h2>
          <div class="join_form" >
            <table>
              <colgroup>
                <col width="30%"/>
                <col width="auto"/>
              </colgroup>
              <tbody>
                <tr>
                  <th><span>스터디명</span></th>
                  <td colspan='2'>
                  	<input type="text" id=studyName name=studyName style="width:70%;" placeholder="스터디명을 입력해주세요.">
                  	<input type="button" id=MNameeCheck class='btn btn-outline-secondary' value="중복확인" style="position: relative;width:20%;">
                  	<!-- <a href="javascript:;" id=MNameeCheck class="btn_confirm" style="position: relative;">중복확인</a> -->
                  	</td>
                  	
                </tr>
                <tr>
                	<th></th>
               	 	<td><div class="nameChkView" style="font-size: 10px;"></div></td>
                </tr>
                <tr>
                  <th ><span>관심분야</span></th>
                  <td style="hight:100px;">
                	<div class="btn-group" role="group" aria-label="Basic radio toggle button group" >
                	
					  <input onclick=btnBigClick(1) type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off">
					  <label id="labelBig1" class="btn btn-outline-success btn-sm" for="btnradio1">독서</label>
					
					  <input onclick=btnBigClick(2) type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off">
					  <label id="labelBig2" class="btn btn-outline-success btn-sm" for="btnradio2">문화생활</label>
					
					  <input onclick=btnBigClick(3) type="radio" class="btn-check" name="btnradio" id="btnradio3" autocomplete="off">
					  <label id="labelBig3" class="btn btn-outline-success btn-sm" for="btnradio3">어학</label>
					  
					  <input onclick=btnBigClick(4) type="radio" class="btn-check" name="btnradio" id="btnradio4" autocomplete="off">
					  <label id="labelBig4" class="btn btn-outline-success btn-sm" for="btnradio4">취업</label>
					  
					  <input onclick=btnBigClick(5) type="radio" class="btn-check" name="btnradio" id="btnradio5" autocomplete="off">
					  <label id="labelBig5" class="btn btn-outline-success btn-sm" for="btnradio5">토론</label>
					  
					  <input onclick=btnBigClick(6) type="radio" class="btn-check" name="btnradio" id="btnradio6" autocomplete="off">
					  <label id="labelBig6" class="btn btn-outline-success btn-sm" for="btnradio6">코딩</label>
					  
					  <input onclick=btnBigClick(7) type="radio" class="btn-check" name="btnradio" id="btnradio7" autocomplete="off" >
					  <label id="labelBig7" class="btn btn-outline-success btn-sm" for="btnradio7">기타</label>
					</div>
					<input type=hidden id="bigSel">
					<br>
					<!-- 여기 코딩화 되는 부분 -->
					<div id="btnGroupSm" class="btn-group" role="group" aria-label="Basic radio toggle button group">

					</div>
					<input type=hidden id="smSel">
					
                </tr>
                 <tr>
                	<th></th>
               	 	<td><div class="carChkView" style="font-size: 10px;"></div></td>
                </tr>
                <tr>
                  <th><span>활동요일</span></th>
                  <td>
                	<div id="btnCheckOn" class="btn-group" role="group" aria-label="Basic checkbox toggle button group">
					  <input type="checkbox" name="chkWeek" class="btn-check" id="btncheck1" value="1" />
					  <label class="btn btn-outline-success btn-sm" for="btncheck1">월</label>
					
					  <input type="checkbox" name="chkWeek" class="btn-check" id="btncheck2" value="2" />
					  <label class="btn btn-outline-success btn-sm" for="btncheck2">화</label>
					
					  <input type="checkbox" name="chkWeek" class="btn-check" id="btncheck3" value="3" />
					  <label class="btn btn-outline-success btn-sm" for="btncheck3">수</label>
					  
					  <input type="checkbox" name="chkWeek" class="btn-check" id="btncheck4" value="4" />
					  <label class="btn btn-outline-success btn-sm" for="btncheck4">목</label>
					
					  <input type="checkbox" name="chkWeek" class="btn-check" id="btncheck5" value="5" />
					  <label class="btn btn-outline-success btn-sm" for="btncheck5">금</label>
					
					  <input type="checkbox" name="chkWeek" class="btn-check" id="btncheck6" value="6" />
					  <label class="btn btn-outline-success btn-sm" for="btncheck6">토</label>
					  
					  <input type="checkbox" name="chkWeek" class="btn-check" id="btncheck7" value="7" />
					  <label class="btn btn-outline-success btn-sm" for="btncheck7">일</label>
					</div>
					<!-- 
					<input type=button onclick=checkboxArr()> -->
                  </td>
                </tr>
                <tr>
                	<th></th>
               	 	<td><div class="dayChkView" style="font-size: 10px;"></div></td>
                </tr>
                <tr>
                  <th><span>스터디 시간</span></th>
                  <td>
                  	  <div class="input-group mb-3" style="width:60%;">
					<input id="studyTime" type="number" class="form-control" value="19" max="23" min="0">
					<span class="input-group-text">시</span>
					<input id="studyMin" type="number" class="form-control" value="30" max="59" min="0" step="10">
					<span class="input-group-text">분</span>
					
					</div>
				  </td>
                </tr>
                <tr>
                	<th></th>
               	 	<td><div class="time regex" style="font-size: 10px;"></div></td>
                </tr>
                <tr>
                  <th><span>스터디 진행 시간</span></th>
                  <td>
 					<div class="input-group mb-3" style="width:100%;">
					<input id="playTime" type="number" class="form-control" value="1" max="23" min="0">
					<span class="input-group-text">시간</span>
					<input id="playMin" type="number" class="form-control" value="20" max="59" min="0" step="10">
					<span class="input-group-text">분 동안 진행되요</span>
					</div>
                  </td>
                </tr>
                <tr>
                	<th></th>
               	 	<td><div class="play regex" style="font-size: 10px;"></div></td>
                </tr>
                <tr>
                  <th><span>최대 인원</span></th>
                  <td>
					<div class="input-group mb-3" style="width:30%;">
					<input id="personnel" type="number" class="form-control" value="2" max="10" min="2">
					</div>
				  </td>
                </tr>
                <tr>
                  <th><span>난이도</span></th>
                  <td>
                  <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
					  <input onclick=btnLevel(1) type="radio" class="btn-check" name="btnradio3" id="btnradio21" autocomplete="off">
					  <label id="btnLevel1" class="btn btn-outline-success btn-sm" for="btnradio21">상</label>
					
					  <input onclick=btnLevel(2) type="radio" class="btn-check" name="btnradio3" id="btnradio22" autocomplete="off">
					  <label id="btnLevel2" class="btn btn-outline-success btn-sm" for="btnradio22">중</label>
					
					  <input onclick=btnLevel(3) type="radio" class="btn-check" name="btnradio3" id="btnradio23" autocomplete="off">
					  <label id="btnLevel3" class="btn btn-outline-success btn-sm" for="btnradio23">하</label>
					</div>
					<input type=hidden id="lvlSel">
                  </td>
                </tr>
				<tr>
                	<th></th>
               	 	<td><div class="level regex" style="font-size: 10px;"></div></td>
                </tr>
                <tr>
                  <th><span>모임 설명 및 목표</span></th>
                  <td>
                	<div class="form-floating">
					<textarea class="form-control" placeholder="" id="Textarea" style="height: 100px"></textarea>
					<label for="Textarea">모임에 대한 설명이나 목표에 대해 적어주세요.</label>
					</div>
                  </td>
                </tr>
                <form name="form" id="form" method="post">
					<table>
							<colgroup>
								<col width=30% />
								<col width="auto"/>
							</colgroup>
							<tbody>
								<tr>
									<th><span>우편번호</span></th>
									<td>
									    <input type="hidden" id="confmKey" name="confmKey" value=""  >
										<input type="text" id="zipNo" name="zipNo"  style="width:100px">
										<input type="button"  value="주소검색" onclick="goPopup();" style="width:30%">
									</td>
								</tr>
								<tr>
									<th><label><span>도로명주소</span></label></th>
									<td><input type="text" id="roadAddrPart1" style="width:96%"></td>
								</tr>
								<tr>
									<th><span>상세주소</span></th>
									<td>
										<input type="text" id="addrDetail" style="width:48%" value=""> 
										<input type="text" id="roadAddrPart2"  style="width:48%" value="">
										<input type="hidden" id="entX" style="width:40%" value="">
										<input type="hidden" id="entY"  style="width:40%" value="">
									</td>
								</tr>
							</tbody>
						</table>
				</form>
              </tbody>
            </table>
          </div><!-- join_form E  -->
          <div class="btn_wrap">
            <a href="javascript:;" id=signupbtn>만들기</a>
          </div>
        </div> <!-- form_txtInput E -->
      </div><!-- content E-->
    </div> <!-- container E -->
<jsp:include page="/module/footer.jsp" flush="false" />
</body>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4b0f94866b0f233c25fbdc0d8ed3c881&libraries=services,clusterer,drawing"></script>
<script language='javascript'>
/*--------------------------카카오 주소 찾기---------------------------------*/
var lati;
var longi;
var tmpAdd;
var chkName=1;
function goPopup(){
	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://www.juso.go.kr/addrlink/addrCoordUrl.do)를 호출하게 됩니다.
    var pop = window.open("jusoPopup","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
}
function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn
						, detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno
						, emdNo, entX, entY){
	// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
	document.form.roadAddrPart1.value = roadAddrPart1;
	document.form.roadAddrPart2.value = roadAddrPart2;
	document.form.addrDetail.value = addrDetail;
	document.form.zipNo.value = zipNo;
	document.form.entX.value = entX;
	document.form.entY.value = entY;
	var geocoder = new kakao.maps.services.Geocoder();
	var callback = function(result, status) {
		if (status === kakao.maps.services.Status.OK) {
			console.log(result);
			console.log(result[0].y+","+result[0].x)
			lati=result[0].y;
			longi=result[0].x;
		}
	};
	geocoder.addressSearch($("#roadAddrPart1").val(), callback);
//	console.log(lati);
//	console.log(longi);
}

/*--------------------------카카오 주소 찾기---------------------------------*/

/*---------------------------회원가입 AJAX 영역(json배열로 넘길예정)-------------------------*/	
	
function signupajax(){
	/*-----주소------*/
	var juso = $('#roadAddrPart1').val()+" "+$('#addrDetail').val();
	var tmpStudyTime =  $('#studyTime').val()+'시'+$('#studyMin').val()+"분";
	var tmpPlayTime =  $('#playTime').val()+'시간'+$('#playMin').val()+"분";
//	요일 배열화
	chkWekkArry="";
	var val = document.getElementsByName("chkWeek");
	for(var i=0;i<val.length;i++){
		if(val[i].checked){
			if(val[i].value==1) chkWekkArry+="월";
			if(val[i].value==2) chkWekkArry+="화";
			if(val[i].value==3) chkWekkArry+="수";
			if(val[i].value==4) chkWekkArry+="목";
			if(val[i].value==5) chkWekkArry+="금";
			if(val[i].value==6) chkWekkArry+="토";
			if(val[i].value==7) chkWekkArry+="일";
	}}
//	console.log("로그인 아이디:"+$("#hid").val());
//	console.log(juso);
	/*-----주소------*/
	//활동요일은 homeController에서 사용
	$.ajax({
    url: "jsbCreate.do",
    type: "POST",
    data: {
    	"studyName" : $('#studyName').val(), // 스터디명
    	"bigSel" : $('#bigSel').val(), // 카테고리1
    	"smSel" : $('#smSel').val(), // 카테고리2
    	"week" : chkWekkArry,
    	"studyTime" : tmpStudyTime, // 시작시간
    	"playTime" : tmpPlayTime, // 진행시간
    	"lvlSel" : $('#lvlSel').val(), // 난이도
    	"contents" : $("#Textarea").val(), //
    	"personnel" : $("#personnel").val(), //
//		"uyear" : year, // 생년
//    	"ubirthday" : birthday, //월일
//    	"uemail" : mail, //이메일
    	"ujuso" : $('#roadAddrPart1').val(), // 주소
    	"ujuso2": $('#roadAddrPart2').val(),
    	"ujuso3": $('#addrDetail').val(),
    	"ulati" : lati, // 위도
    	"ulongi" : longi, //경도
    	"userId" : $("#hid").val()
    },
    success : function(data){
 //   	console.log("내부데이터:"+data);
    	//성공시 meeting 테이블 insert data
    	$.ajax({
    	    url: "jsbCreateToMeet.do",
    	    type: "POST",
    	    data: {
    	    	"studyName" : $('#studyName').val(), // 스터디명
    	    	"userId" : $("#hid").val()
    	    },
    	    success : function(data){
    	    	if (data != 0){
    	    		location.href='${path}/meetList/'+data;
    	    	}else{
    	    		alert("스터디는 최대 10개까지만 만들 수 있습니다.");
    	    	}
    	    	
    	    },
    	    error : function(){	
    	    }
    		});
    },
    error : function(){	
    }
	});
}
	
/*---------------------------AJAX 영역-------------------------*/	    
 
 
 
/*--------------------------회원 가입 클릭시 유효성 검사(임시)---------------------------------*/
        
	//회원가입 버튼 눌렀을 때, 빈칸 있으면 다시 유효성 검사진행
	//
	//$('input:checkbox[name=chkWeek]').is(':checked');
$("#signupbtn").on("click",function(){
	var studyName=$("#studyName").val();
	var bigSel=$("#bigSel").val(); //null일 가능성이없음
	var smSel=$("#smSel").val(); //null일 가능성이없음
	var chkweek=$('input:checkbox[name=chkWeek]').is(':checked'); // true false 확인
	var studyTime=$("#studyTime").val();
	var studyMin=$("#studyMin").val();
	var playTime=$("#playTime").val();
	var playMin=$("#playMin").val();
	var lvlSel=$("#lvlSel").val();
	
//	var idregex = /^[a-z][a-z\d]{4,11}$/;
//	var pwregex = /^[A-Za-z\d]{8,12}$/;
//	var nameregex = /[가-힣]{2,}/;
//	var phoneregex = /^01\d\d{3,4}\d{4}$/;


	if(studyName==""){ // 스터디명
		alert("스터디 확인해주세요.");
		return;
	}
	if(chkweek == false){ // 스터디요일
		alert("요일을 선택해주세요.");
		return;
	}
//	console.log(studyTime);
	if(studyTime=="" || studyTime>"23"){
		alert("스터디 시간(시) 확인해주세요.");
		return;
	}
	if(studyMin=="" || studyMin>"59"){
		alert("스터디 시간(분) 확인해주세요.");
		return;
	}
	if(playTime==""){
		alert("진행 시간(시) 확인해주세요.");
		return;
	}
	if(playMin=="" || playMin>"59"){
		alert("진행 시간(분) 확인해주세요.");
		return;
	}
	if(chkName==1){
		alert("스터디명 중복확인해주세요.");
		return;
	}
	
	if(personnel<=11){
		alert("인원 수 확인해주세요.");
		return;
	}
	signupajax();
   
})

/*--------------------------회원 가입 클릭시 유효성 검사(임시)---------------------------------*/


//전석봉 영역
function btnBigClick(who){
	if (who==1) btnBigSelect1(); //소 분류 무조건 전체
	if (who==2) btnBigSelect2();
	if (who==3) btnBigSelect3();
	if (who==4) btnBigSelect4();
	if (who==5) btnBigSelect5();
	if (who==6) btnBigSelect6();
	if (who==7) btnBigSelect7();
//	$('#calTwo').trigger('click');
}
function btnLevel(who){
	if (who==1) $("#lvlSel").val("상");
	if (who==2) $("#lvlSel").val("중");
	if (who==3) $("#lvlSel").val("하");
}
 //카테고리 대 선택후 소 버튼 생성
 //bigSel, smSel, lvlSel hidden에 값들어감
function btnBigSelect1(){
	$("#bigSel").val($("#labelBig1").text());
	$("#btnGroupSm").show();
   	$('#btnGroupSm').empty();
   	$("#btnGroupSm").append('<input onclick=btnSmClick(1) type="radio" class="btn-check" name="btnradio2" id="btnradio11" autocomplete="off"><label id="labelSm1" class="btn btn-outline-success btn-sm" for="btnradio11">인문학</label>');
   	$("#btnGroupSm").append('<input onclick=btnSmClick(2) type="radio" class="btn-check" name="btnradio2" id="btnradio12" autocomplete="off"><label id="labelSm2" class="btn btn-outline-success btn-sm" for="btnradio12">심리학</label>');
   	$("#btnGroupSm").append('<input onclick=btnSmClick(3) type="radio" class="btn-check" name="btnradio2" id="btnradio13" autocomplete="off"><label id="labelSm3" class="btn btn-outline-success btn-sm" for="btnradio13">철학</label>');
   	$("#btnGroupSm").append('<input onclick=btnSmClick(4) type="radio" class="btn-check" name="btnradio2" id="btnradio14" autocomplete="off"><label id="labelSm4" class="btn btn-outline-success btn-sm" for="btnradio14">역사</label>');
   	$("#btnGroupSm").append('<input onclick=btnSmClick(5) type="radio" class="btn-check" name="btnradio2" id="btnradio15" autocomplete="off"><label id="labelSm5" class="btn btn-outline-success btn-sm" for="btnradio15">시사/경제</label>');
   	$("#btnGroupSm").append('<input onclick=btnSmClick(6) type="radio" class="btn-check" name="btnradio2" id="btnradio16" autocomplete="off"><label id="labelSm6" class="btn btn-outline-success btn-sm" for="btnradio16">소설</label>');
	$("#btnGroupSm").append('<input onclick=btnSmClick(7) type="radio" class="btn-check" name="btnradio2" id="btnradio17" autocomplete="off"><label id="labelSm7" class="btn btn-outline-success btn-sm" for="btnradio17">기타</label>');
//	$("#btnGroupSm").append('<input onclick=btnSmClick(8) type="radio" class="btn-check" name="btnradio2" id="btnradio18" autocomplete="off"><label id="labelSm8" class="btn btn-outline-success btn-sm" for="btnradio18"></label>');
	$('#btnradio11').trigger('click');
}
function btnBigSelect2(){
	$("#bigSel").val($("#labelBig2").text());
	$("#btnGroupSm").show();
	$('#btnGroupSm').empty();
	$("#btnGroupSm").append('<input onclick=btnSmClick(1) type="radio" class="btn-check" name="btnradio2" id="btnradio11" autocomplete="off"><label id="labelSm1" class="btn btn-outline-success btn-sm" for="btnradio11">뮤지컬/오페라</label>');
	$("#btnGroupSm").append('<input onclick=btnSmClick(2) type="radio" class="btn-check" name="btnradio2" id="btnradio12" autocomplete="off"><label id="labelSm2" class="btn btn-outline-success btn-sm" for="btnradio12">영화</label>');
	$("#btnGroupSm").append('<input onclick=btnSmClick(3) type="radio" class="btn-check" name="btnradio2" id="btnradio13" autocomplete="off"><label id="labelSm3" class="btn btn-outline-success btn-sm" for="btnradio13">전시회</label>');
	$("#btnGroupSm").append('<input onclick=btnSmClick(4) type="radio" class="btn-check" name="btnradio2" id="btnradio14" autocomplete="off"><label id="labelSm4" class="btn btn-outline-success btn-sm" for="btnradio14">파티/페스티벌</label>');
	$("#btnGroupSm").append('<input onclick=btnSmClick(5) type="radio" class="btn-check" name="btnradio2" id="btnradio15" autocomplete="off"><label id="labelSm5" class="btn btn-outline-success btn-sm" for="btnradio15">기타</label>');
//	$("#btnGroupSm").append('<input onclick=btnSmClick(6) type="radio" class="btn-check" name="btnradio2" id="btnradio16" autocomplete="off"><label id="labelSm6" class="btn btn-outline-success btn-sm" for="btnradio16"></label>');
//	$("#btnGroupSm").append('<input onclick=btnSmClick(7) type="radio" class="btn-check" name="btnradio2" id="btnradio17" autocomplete="off"><label id="labelSm7" class="btn btn-outline-success btn-sm" for="btnradio17"></label>');
//	$("#btnGroupSm").append('<input onclick=btnSmClick(8) type="radio" class="btn-check" name="btnradio2" id="btnradio18" autocomplete="off"><label id="labelSm8" class="btn btn-outline-success btn-sm" for="btnradio18"></label>');
	$('#btnradio11').trigger('click');
}
function btnBigSelect3(){
	$("#bigSel").val($("#labelBig3").text());
	$("#btnGroupSm").show();
	$('#btnGroupSm').empty();
	$("#btnGroupSm").append('<input onclick=btnSmClick(1) type="radio" class="btn-check" name="btnradio2" id="btnradio11" autocomplete="off"><label id="labelSm1" class="btn btn-outline-success btn-sm" for="btnradio11">영어</label>');
	$("#btnGroupSm").append('<input onclick=btnSmClick(2) type="radio" class="btn-check" name="btnradio2" id="btnradio12" autocomplete="off"><label id="labelSm2" class="btn btn-outline-success btn-sm" for="btnradio12">일본어</label>');
	$("#btnGroupSm").append('<input onclick=btnSmClick(3) type="radio" class="btn-check" name="btnradio2" id="btnradio13" autocomplete="off"><label id="labelSm3" class="btn btn-outline-success btn-sm" for="btnradio13">중국어</label>');
	$("#btnGroupSm").append('<input onclick=btnSmClick(4) type="radio" class="btn-check" name="btnradio2" id="btnradio14" autocomplete="off"><label id="labelSm4" class="btn btn-outline-success btn-sm" for="btnradio14">프랑스어</label>');
	$("#btnGroupSm").append('<input onclick=btnSmClick(5) type="radio" class="btn-check" name="btnradio2" id="btnradio15" autocomplete="off"><label id="labelSm5" class="btn btn-outline-success btn-sm" for="btnradio15">스페인어</label>');
	$("#btnGroupSm").append('<input onclick=btnSmClick(6) type="radio" class="btn-check" name="btnradio2" id="btnradio16" autocomplete="off"><label id="labelSm6" class="btn btn-outline-success btn-sm" for="btnradio16">기타</label>');
//	$("#btnGroupSm").append('<input onclick=btnSmClick(7) type="radio" class="btn-check" name="btnradio2" id="btnradio17" autocomplete="off"><label id="labelSm7" class="btn btn-outline-success btn-sm" for="btnradio17"></label>');
//	$("#btnGroupSm").append('<input onclick=btnSmClick(8) type="radio" class="btn-check" name="btnradio2" id="btnradio18" autocomplete="off"><label id="labelSm8" class="btn btn-outline-success btn-sm" for="btnradio18"></label>');
	$('#btnradio11').trigger('click');
}
function btnBigSelect4(){
	$("#bigSel").val($("#labelBig4").text());
	$("#btnGroupSm").show();
	$('#btnGroupSm').empty();
	$("#btnGroupSm").append('<input onclick=btnSmClick(1) type="radio" class="btn-check" name="btnradio2" id="btnradio11" autocomplete="off"><label id="labelSm1" class="btn btn-outline-success btn-sm" for="btnradio11">공무원</label>');
	$("#btnGroupSm").append('<input onclick=btnSmClick(2) type="radio" class="btn-check" name="btnradio2" id="btnradio12" autocomplete="off"><label id="labelSm2" class="btn btn-outline-success btn-sm" for="btnradio12">토익/토플</label>');
	$("#btnGroupSm").append('<input onclick=btnSmClick(3) type="radio" class="btn-check" name="btnradio2" id="btnradio13" autocomplete="off"><label id="labelSm3" class="btn btn-outline-success btn-sm" for="btnradio13">임용고시</label>');
	$("#btnGroupSm").append('<input onclick=btnSmClick(4) type="radio" class="btn-check" name="btnradio2" id="btnradio14" autocomplete="off"><label id="labelSm4" class="btn btn-outline-success btn-sm" for="btnradio14">인적성검사</label>');
	$("#btnGroupSm").append('<input onclick=btnSmClick(5) type="radio" class="btn-check" name="btnradio2" id="btnradio15" autocomplete="off"><label id="labelSm5" class="btn btn-outline-success btn-sm" for="btnradio15">기타</label>');
//	$("#btnGroupSm").append('<input onclick=btnSmClick(6) type="radio" class="btn-check" name="btnradio2" id="btnradio16" autocomplete="off"><label id="labelSm6" class="btn btn-outline-success btn-sm" for="btnradio16"></label>');
//	$("#btnGroupSm").append('<input onclick=btnSmClick(7) type="radio" class="btn-check" name="btnradio2" id="btnradio17" autocomplete="off"><label id="labelSm7" class="btn btn-outline-success btn-sm" for="btnradio17"></label>');
//	$("#btnGroupSm").append('<input onclick=btnSmClick(8) type="radio" class="btn-check" name="btnradio2" id="btnradio18" autocomplete="off"><label id="labelSm8" class="btn btn-outline-success btn-sm" for="btnradio18"></label>');
	$('#btnradio11').trigger('click');
}
function btnBigSelect5(){
	$("#bigSel").val($("#labelBig5").text());
	$("#btnGroupSm").show();
	$('#btnGroupSm').empty();
	$("#btnGroupSm").append('<input onclick=btnSmClick(1) type="radio" class="btn-check" name="btnradio2" id="btnradio11" autocomplete="off"><label id="labelSm1" class="btn btn-outline-success btn-sm" for="btnradio11">경제</label>');
	$("#btnGroupSm").append('<input onclick=btnSmClick(2) type="radio" class="btn-check" name="btnradio2" id="btnradio12" autocomplete="off"><label id="labelSm2" class="btn btn-outline-success btn-sm" for="btnradio12">문화</label>');
	$("#btnGroupSm").append('<input onclick=btnSmClick(3) type="radio" class="btn-check" name="btnradio2" id="btnradio13" autocomplete="off"><label id="labelSm3" class="btn btn-outline-success btn-sm" for="btnradio13">정치</label>');
	$("#btnGroupSm").append('<input onclick=btnSmClick(4) type="radio" class="btn-check" name="btnradio2" id="btnradio14" autocomplete="off"><label id="labelSm4" class="btn btn-outline-success btn-sm" for="btnradio14">환경</label>');
	$("#btnGroupSm").append('<input onclick=btnSmClick(5) type="radio" class="btn-check" name="btnradio2" id="btnradio15" autocomplete="off"><label id="labelSm5" class="btn btn-outline-success btn-sm" for="btnradio15">기타</label>');
//	$("#btnGroupSm").append('<input onclick=btnSmClick(6) type="radio" class="btn-check" name="btnradio2" id="btnradio16" autocomplete="off"><label id="labelSm6" class="btn btn-outline-success btn-sm" for="btnradio16"></label>');
//	$("#btnGroupSm").append('<input onclick=btnSmClick(7) type="radio" class="btn-check" name="btnradio2" id="btnradio17" autocomplete="off"><label id="labelSm7" class="btn btn-outline-success btn-sm" for="btnradio17"></label>');
//	$("#btnGroupSm").append('<input onclick=btnSmClick(8) type="radio" class="btn-check" name="btnradio2" id="btnradio18" autocomplete="off"><label id="labelSm8" class="btn btn-outline-success btn-sm" for="btnradio18"></label>');
	$('#btnradio11').trigger('click');
}
function btnBigSelect6(){
	$("#bigSel").val($("#labelBig6").text());
	$("#btnGroupSm").show();
	$('#btnGroupSm').empty();
	$("#btnGroupSm").append('<input onclick=btnSmClick(1) type="radio" class="btn-check" name="btnradio2" id="btnradio11" autocomplete="off"><label id="labelSm1" class="btn btn-outline-success btn-sm" for="btnradio11">JAVA</label>');
	$("#btnGroupSm").append('<input onclick=btnSmClick(2) type="radio" class="btn-check" name="btnradio2" id="btnradio12" autocomplete="off"><label id="labelSm2" class="btn btn-outline-success btn-sm" for="btnradio12">C</label>');
	$("#btnGroupSm").append('<input onclick=btnSmClick(3) type="radio" class="btn-check" name="btnradio2" id="btnradio13" autocomplete="off"><label id="labelSm3" class="btn btn-outline-success btn-sm" for="btnradio13">C#,C++</label>');
	$("#btnGroupSm").append('<input onclick=btnSmClick(4) type="radio" class="btn-check" name="btnradio2" id="btnradio14" autocomplete="off"><label id="labelSm4" class="btn btn-outline-success btn-sm" for="btnradio14">Python</label>');
	$("#btnGroupSm").append('<input onclick=btnSmClick(5) type="radio" class="btn-check" name="btnradio2" id="btnradio15" autocomplete="off"><label id="labelSm5" class="btn btn-outline-success btn-sm" for="btnradio15">Java script</label>');
//	$("#btnGroupSm").append('<input onclick=btnSmClick(6) type="radio" class="btn-check" name="btnradio2" id="btnradio16" autocomplete="off"><label id="labelSm6" class="btn btn-outline-success btn-sm" for="btnradio16"></label>');
//	$("#btnGroupSm").append('<input onclick=btnSmClick(7) type="radio" class="btn-check" name="btnradio2" id="btnradio17" autocomplete="off"><label id="labelSm7" class="btn btn-outline-success btn-sm" for="btnradio17"></label>');
//	$("#btnGroupSm").append('<input onclick=btnSmClick(8) type="radio" class="btn-check" name="btnradio2" id="btnradio18" autocomplete="off"><label id="labelSm8" class="btn btn-outline-success btn-sm" for="btnradio18"></label>');
	$('#btnradio11').trigger('click');
}
function btnBigSelect7(){
	$("#bigSel").val($("#labelBig7").text());
	$("#btnGroupSm").hide();
	$('#btnGroupSm').empty();
	$("#btnGroupSm").append('<input onclick=btnSmClick(1) type="radio" class="btn-check" name="btnradio2" id="btnradio11" autocomplete="off" checked><label id="labelSm1" class="btn btn-outline-success btn-sm" for="btnradio11">기타</label>');
//	$("#btnGroupSm").append('<input onclick=btnSmClick(2) type="radio" class="btn-check" name="btnradio2" id="btnradio12" autocomplete="off"><label id="labelSm2" class="btn btn-outline-success btn-sm" for="btnradio12"></label>');
//	$("#btnGroupSm").append('<input onclick=btnSmClick(3) type="radio" class="btn-check" name="btnradio2" id="btnradio13" autocomplete="off"><label id="labelSm3" class="btn btn-outline-success btn-sm" for="btnradio13"></label>');
//	$("#btnGroupSm").append('<input onclick=btnSmClick(4) type="radio" class="btn-check" name="btnradio2" id="btnradio14" autocomplete="off"><label id="labelSm4" class="btn btn-outline-success btn-sm" for="btnradio14"></label>');
//	$("#btnGroupSm").append('<input onclick=btnSmClick(5) type="radio" class="btn-check" name="btnradio2" id="btnradio15" autocomplete="off"><label id="labelSm5" class="btn btn-outline-success btn-sm" for="btnradio15"></label>');
//	$("#btnGroupSm").append('<input onclick=btnSmClick(6) type="radio" class="btn-check" name="btnradio2" id="btnradio16" autocomplete="off"><label id="labelSm6" class="btn btn-outline-success btn-sm" for="btnradio16"></label>');
//	$("#btnGroupSm").append('<input onclick=btnSmClick(7) type="radio" class="btn-check" name="btnradio2" id="btnradio17" autocomplete="off"><label id="labelSm7" class="btn btn-outline-success btn-sm" for="btnradio17"></label>');
//	$("#btnGroupSm").append('<input onclick=btnSmClick(8) type="radio" class="btn-check" name="btnradio2" id="btnradio18" autocomplete="off"><label id="labelSm8" class="btn btn-outline-success btn-sm" for="btnradio18"></label>');
	$('#btnradio11').trigger('click');
}

function btnSmClick(who){
	if (who==1) $("#smSel").val($("#labelSm1").text());
	if (who==2) $("#smSel").val($("#labelSm2").text());
	if (who==3) $("#smSel").val($("#labelSm3").text());
	if (who==4) $("#smSel").val($("#labelSm4").text());
	if (who==5) $("#smSel").val($("#labelSm5").text());
	if (who==6) $("#smSel").val($("#labelSm6").text());
	if (who==7) $("#smSel").val($("#labelSm7").text());
	if (who==8) $("#smSel").val($("#labelSm8").text());
//	console.log($("#smSel").val())
}
$(document)
.ready(function(){
	$('#btnradio1').trigger('click');
	$('#btncheck1').trigger('click');
	$('#btnradio22').trigger('click');
	$("#hid").val("seulgi");
//	console.log($("#hid").val());
})
.on("click","#MNameeCheck",function(){
	checkMName();
})
.on("input","#MNameeCheck",function(){
	chkName=1;
})
/* 체크박스는 homeControl에서 확인합시다.
var chk=[];
$(document)
.on("click","#btnTest",function({
	let interest=$('#checkbox').val();
	console.log(interest);
	
	$("input:checkbox[name=chkWeek]:checked").each(function() {
		console.log($(this).val());
		var test=$(this).val();
		chk.push(test);
		console.log(chk);
		})
	
})
*/
function checkboxArr(){
	chkWekkArry="";
	var val = document.getElementsByName("chkWeek");
	for(var i=0;i<val.length;i++){
		if(val[i].checked){
			if(val[i].value==1) chkWekkArry+="월";
			if(val[i].value==2) chkWekkArry+="화";
			if(val[i].value==3) chkWekkArry+="수";
			if(val[i].value==4) chkWekkArry+="목";
			if(val[i].value==5) chkWekkArry+="금";
			if(val[i].value==6) chkWekkArry+="토";
			if(val[i].value==7) chkWekkArry+="일";
		}
	}
	//console.log(chkWekkArry);
}
function checkMName(){
	$.ajax({
	    url: "jsbfindStudyName.do",
	    type: "POST",
	    data: {
	    	"studyName" : $('#studyName').val() // 스터디명
	    },
	    success : function(data){
	    	if(data==0) {
	    		chkName=0;
	    		alert("사용가능한 스티디명입니다.");
	    	}else{
	    		chkName=1;
	    		alert("이미 존재하는 스티디명입니다.");
	    	}
//	    	console.log("chkName 0 & 1:"+chkName);
	    },
	    error : function(){	
	    }
		});
}
/*
function btnTest(){
	$('input:checkbox[name=chkWeek]').is(':checked');
	console.log($('input:checkbox[name=chkWeek]').is(':checked'));
}
*/

</script>
</html>