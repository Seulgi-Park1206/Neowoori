<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 스터디 만들기</title>
</head>
<link rel="stylesheet" href="resources/pjh/signup.css" type="text/css" >
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js" integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT" crossorigin="anonymous"></script>
<body>
<jsp:include page="/module/nav.jsp" flush="false" />
  <div class="wrap wd668">
      <div class="container">
        <div class="form_txtInput">
          <h2 class="sub_tit_txt">스터디 만들기</h2>
          <div class="join_form" >
            <table>
              <colgroup>
                <col width="30%"/>
                <col width="auto"/>
              </colgroup>
              <tbody>
                <tr>
                  <th><span>스터디명</span></th>
                  <td>
                  	<input type="text" id=id placeholder="스터디명을 입력해주세요.">
                  </td>
                </tr>
                <tr>
                	<th></th>
               	 	<td><div class="id regex" style="font-size: 10px;"></div></td>
                </tr>
                <tr>
                  <th><span>관심분야</span></th>
                  <td>
                	<div class="btn-group" role="group" aria-label="Basic radio toggle button group">
                	
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
               	 	<td><div class="name regex" style="font-size: 10px;"></div></td>
                </tr>
                <tr>
                  <th><span>활동요일</span></th>
                  <td>
                	<div class="btn-group" role="group" aria-label="Basic checkbox toggle button group">
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
                  </td>
                </tr>
                <tr>
                	<th></th>
               	 	<td><div class="pw regex" style="font-size: 10px;"></div></td>
                </tr>
                <tr>
                  <th><span>스터디 시간</span></th>
                  <td>
                  	  <div class="input-group mb-3" style="width:60%;">
					<input type="number" class="form-control" value="19" max="23" min="0">
					<span class="input-group-text">시</span>
					<input type="number" class="form-control" value="30" max="59" min="0" step="10">
					<span class="input-group-text">분</span>
					
					</div>
				  </td>
                </tr>
                <tr>
                  <th><span>스터디 진행 시간</span></th>
                  <td>
 					<div class="input-group mb-3" style="width:75%;">
					<input type="number" class="form-control" value="1" max="23" min="0">
					<span class="input-group-text">시간</span>
					<input type="number" class="form-control" value="20" max="59" min="0" step="10">
					<span class="input-group-text">분 동안 진행되요</span>
					</div>
                  </td>
                </tr>

                <tr>
                  <th><span>난이도</span></th>
                  <td>
                  <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
					  <input onclick=btnLevel(1) type="radio" class="btn-check" name="btnradio" id="btnradio21" autocomplete="off">
					  <label id="btnLevel1" class="btn btn-outline-success btn-sm" for="btnradio21">상</label>
					
					  <input onclick=btnLevel(2) type="radio" class="btn-check" name="btnradio" id="btnradio22" autocomplete="off">
					  <label id="btnLevel2" class="btn btn-outline-success btn-sm" for="btnradio22">중</label>
					
					  <input onclick=btnLevel(3) type="radio" class="btn-check" name="btnradio" id="btnradio23" autocomplete="off">
					  <label id="btnLevel3" class="btn btn-outline-success btn-sm" for="btnradio23">하</label>
					</div>
					<input type=hidden id="lvlSel">
                  </td>
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
            <div class="exform_txt"><span>표시는 필수적으로 입력해주셔야 가입이 가능합니다.</span></div>
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
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4b0f94866b0f233c25fbdc0d8ed3c881&libraries=LIBRARY"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4b0f94866b0f233c25fbdc0d8ed3c881&libraries=services"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4b0f94866b0f233c25fbdc0d8ed3c881&libraries=services,clusterer,drawing"></script>
<script language='javascript'>
/*--------------------------카카오 주소 찾기---------------------------------*/

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
	var coords = new kakao.maps.Coords($('#entX').val(),$('#entY').val()); 
	coords.toLatLng().toString(); // (33.45067375096625, 126.5706721005115)
	cut = coords.toLatLng().toString().replace(/\(/g,'').replace(/\)/g,'');
	var arr = cut.split(','); // ","기점으로 두개로 나눔
	var lati = arr[0]; //위도
	var longi = arr[1]; //경도
	console.log(lati);
	console.log(longi);
}

/*--------------------------카카오 주소 찾기---------------------------------*/


/*--------------------------이메일 직접입력만 글쓰기 가능---------------------------------*/
/*
function selectEmail(ele){ 
	var $ele = $(ele);
	var $email2 = $('input[name=email2]');
	// '1'인 경우 직접입력 
	if($ele.val() == "1"){ 
		$email2.attr('readonly', false);
		$email2.val('');
		} else { 
			$email2.attr('readonly', true);
			$email2.val($ele.val()); 
		} 
	}
*/
/*--------------------------이메일 직접입력만 글쓰기 가능---------------------------------*/


/*--------------------------인증번호 누를시 input보이게하기---------------------------------*/

// $("#btn_con ").on("click",function(){ 
// 	var email = $("#email").val();
// 	var email2 = $("#email2").val();
	
// 	var email_rule =  /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	
// 	var mail = email+"@"+email2;
// 	   $("#mail").val(mail);  
// 	   console.log(email);
// 	   console.log(email2);
// 	   console.log(mail);
// 	   if(!email_rule.test(mail)){
// 	       alert("이메일을 형식에 맞게 입력해주세요.");
// 	     return false;
// 	   }else{
// 		   alert("해당 이메일로 인증번호를 발급했습니다.");
// 		   $("#send_num").css("display","");
// 	   }
// })

/*--------------------------인증번호 누를시 input보이게하기---------------------------------*/


/*--------------------------인증번호 유효성 검사(임시)---------------------------------*/
/*
$("#btn_num ").on("click",function(){
	if($("#send_number").val()==""){
		alert("안증번호를 다시 입력해주세요");
	}
})
*/
/*--------------------------인증번호 유효성 검사(임시)---------------------------------*/


/*--------------------------유효성 검사 & 아이디,닉네임 중복검사(임시)---------------------------------*/
/*
$(function(){
	
   //중복확인 & id 유효성검사   
    $("#duplcheck").on("click",function(){
    	var id = $("#id").val();
        if(id == ""){
        	$(".id.regex").html("스터디명을 입력해주세요.");
            $(".id.regex").css("color","red")
        	return;
        }
        
    	var regex = /^[a-z][a-z\d]{4,11}$/;
    	var result = regex.exec(id);
        
    	 if(result != null){
             $(".id.regex").html("");
         }else{
             $(".id.regex").html("영어 소문자,숫자 4-12자리");
             $(".id.regex").css("color","red")
             return;
         }
    	$.ajax({
    	    url: 'ID_Check.do',
    	    type: 'POST',
    	    dataType: 'text', //서버로부터 내가 받는 데이터의 타입
    	    contentType : 'text/plain; charset=utf-8;',//내가 서버로 보내는 데이터의 타입
    	    data: id ,

    	    success: function(data){
    	         if(data == 0){
    	         $(".id.regex").html("사용하실 수 있는 스터디명입니다.");
    	         $(".id.regex").css("color","green")
    	         }else{
    	         	 $(".id.regex").html("중복된 아이디가 존재합니다.");
    	         	 $(".id.regex").css("color","red")
    	         }
    	    },
    	    error: function (){        
    	    }
    	  })
    })

     //중복확인 & 닉네임 유효성검사             
    $("#duplcheck1").on("click",function(){
    	var nick = $("#nick").val();
        if(nick == ""){
        	$(".id.regex").html("닉네임를 입력해주세요.");
            $(".id.regex").css("color","red")
        	return;
        }
        
        var regex = /[가-힣]{2,}/;
    	var result = regex.exec(nick);
        
    	 if(result != null){
             $(".nick.regex").html("");
         }else{
             $(".nick.regex").html("올바른 닉네임이 아닙니다.");
             $(".nick.regex").css("color","red")
             return;
         }
    	$.ajax({
    	    url: 'Nick_Check.do',
    	    type: 'POST',
    	    dataType: 'text', //서버로부터 내가 받는 데이터의 타입
    	    contentType : 'text/plain1; charset=utf-8;',//내가 서버로 보내는 데이터의 타입
    	    data: nick ,

    	    success: function(data){
    	         if(data == 0){
    	         $(".nick.regex").html("사용하실 수 있는 닉네임입니다.");
    	         $(".nick.regex").css("color","green")
    	         }else{
    	         	 $(".nick.regex").html("중복된 아이디가 존재합니다.");
    	         	 $(".nick.regex").css("color","red")
    	         }
    	    },
    	    error: function (){        
    	    }
    	  })
    }) 
 
//비밀번호 유효성검사
	
    $("#pw").on("input",function(){
        var regex = /^[A-Za-z\d]{8,12}$/;
        var result = regex.exec($("#pw").val())
        
        if(result != null){
            $(".pw.regex").html("");
        }else{
            $(".pw.regex").html("영어대소문자,숫자 8-11자리");
            $(".pw.regex").css("color","red");
        }
    })
    
   //비밀번호 확인  
   
       $("#repw").on("keyup",function(){
            if($("#pw").val()==$("#repw").val()){
               $(".repw.regex").html("비밀번호가 일치합니다");
               $(".repw.regex").css("color","black");
            }else{
             $(".repw.regex").html("비밀번호가 일치하지않습니다");
             $(".repw.regex").css("color","red");
            }
       })
    
    //이름 유효성검사
        $("#name").on("input",function(){
            var regex = /[가-힣]{2,}/;
            var result = regex.exec($("#name").val());
            
            if(result != null){
               $(".name.regex").html("");  
            }else{
                $(".name.regex").html("한글만 입력 가능합니다.");
            }
            
        })
    
    //전화번호 유효성검사
        $("#mobile").on("input",function(){
             var regex = /^01\d\d{3,4}\d{4}$/;
             var result = regex.exec($("#mobile").val());
            
            if(result != null){
               $(".mobile.regex").html("");  
            }else{
                $(".mobile.regex").html("올바른 번호가 아닙니다.('-' 를 빼고 입력해주세요.)");
                $(".mobile.regex").css("color","red");
            }
            
        })

        
       //이메일 유효성 검사
	$("#email,#email2,#email3").on("click",function(){
       var email_rule =  /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
       var email =$("#email").val();
       var email2 =$("#email2").val();
       
       if(!email){
    	 $(".email.regex").html("이메일을 입력해주세요");
       }
       if(!email2){
    	 $(".email.regex").html("도메인을 입력해주세요");
       }
       if(email != "" && email2 != ""){
    	 $(".email.regex").html("");
       }
	})
})
*/
	
/*--------------------------유효성 검사(임시)---------------------------------*/
 	
 
 
 
/*---------------------------회원가입 AJAX 영역(json배열로 넘길예정)-------------------------*/	
	
function signupajax(){
	/*-----주소------*/
	var juso = $('#roadAddrPart1').val()+" "+$('#addrDetail').val();
	/*-----주소------*/
	//활동요일은 homeController에서 사용
	$.ajax({
    url: "sign.do",
    type: "POST",
    data: {
    	"uid" : $('#id').val(), // 아이디
    	"uname" : $('#name').val(), // 이름
    	"upw" : $('#pw').val(), // 비빌번호
    	"unick" : $('#nick').val(), // 닉네임
    	"umobile" : $('#mobile').val(), // 모바일번호
    	"ugender" : $('#gender').val(), // 성별
    	"uyear" : year, // 생년
    	"ubirthday" : birthday, //월일
    	"uemail" : mail, //이메일
    	"ujuso" : juso, // 주소
    	"ulati" : lati, // 위도
    	"ulongi" : longi //경도
    },
    success : function(data){
      alert("회원가입 성공")
    },
    error : function(){
      alert("회원가입 실패")		
    }
	});
}
	
/*---------------------------AJAX 영역-------------------------*/	    
 
 
 
/*--------------------------회원 가입 클릭시 유효성 검사(임시)---------------------------------*/
        
	//회원가입 버튼 눌렀을 때, 빈칸 있으면 다시 유효성 검사진행    
   $("#signupbtn").on("click",function(){
	   var id = $("#id").val();
	   var pw = $("#pw").val();
	   var name = $("#name").val();
	   var mobile = $("#mobile").val();
	   var email = $("#email").val();
	   var email2 = $("#email2").val();
	   var mail = email+"@"+email2;
	   var addr1 = $("#zipNo").val();
	   var addr2 = $("#roadAddrPart1").val();
	   var addr3 = $("#addrDetail").val();
	   var birth = $("#birth").val();
	   var gender = $("#gender").val();
	   
	   var idregex = /^[a-z][a-z\d]{4,11}$/;
	   var pwregex = /^[A-Za-z\d]{8,12}$/;
	   var nameregex = /[가-힣]{2,}/;
	   var phoneregex = /^01\d\d{3,4}\d{4}$/;
	   
	   var idregex = idregex.exec(id);
	   if(idregex == null){ // 아이디
		   alert("아이디양식을 다시 확인해주세요");
		   return;
	   }
	   var nameregex = nameregex.exec(name);
	   if(nameregex == null){ // 이름
		   alert("이름양식을 다시 확인해주세요");
		   retrun;
	   }
	   var pwregex = pwregex.exec(pw);
	   if(pwregex == null){ // 비밀번호
		   alert("비밀번호양식을 다시 확인해주세요");
		   retrun;
	   }
	   var phoneregex = phoneregex.exec(mobile);
	   if(phoneregex == null){ // 핸드폰 번호
		   alert("핸드폰번호양식을 다시 확인해주세요");
		   retrun;
	   }
	   if(addr1.length == 0 || addr2.length == 0 || addr3.length == 0 ){ // 주소
	        alert("주소를 다시 확인해주세요");
	        return false;
	    }
	   if(birth.length == 0){ // 생일
	        alert("생일을 다시 확인해주세요");
	        return false;
	    }
		if(gender.length == 0){ // 성별
	        alert("성별을 다시 확인해주세요");
	        return false;
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
	console.log($("#lvlSel").val());
}
 //카테고리 대 선택후 소 버튼 생성
 //bigSel, smSel, lvlSel hidden에 값들어감
function btnBigSelect1(){
	$("#bigSel").val($("#labelBig1").text());
	console.log($("#bigSel").val());
   	$('#btnGroupSm').empty();
   	$("#btnGroupSm").append('<input onclick=btnSmClick(1) type="radio" class="btn-check" name="btnradio2" id="btnradio11" autocomplete="off" checked><label id="labelSm1" class="btn btn-outline-success btn-sm" for="btnradio11">인문학</label>');
   	$("#btnGroupSm").append('<input onclick=btnSmClick(2) type="radio" class="btn-check" name="btnradio2" id="btnradio12" autocomplete="off"><label id="labelSm2" class="btn btn-outline-success btn-sm" for="btnradio12">심리학</label>');
   	$("#btnGroupSm").append('<input onclick=btnSmClick(3) type="radio" class="btn-check" name="btnradio2" id="btnradio13" autocomplete="off"><label id="labelSm3" class="btn btn-outline-success btn-sm" for="btnradio13">철학</label>');
   	$("#btnGroupSm").append('<input onclick=btnSmClick(4) type="radio" class="btn-check" name="btnradio2" id="btnradio14" autocomplete="off"><label id="labelSm4" class="btn btn-outline-success btn-sm" for="btnradio14">역사</label>');
   	$("#btnGroupSm").append('<input onclick=btnSmClick(5) type="radio" class="btn-check" name="btnradio2" id="btnradio15" autocomplete="off"><label id="labelSm5" class="btn btn-outline-success btn-sm" for="btnradio15">시사/경제</label>');
   	$("#btnGroupSm").append('<input onclick=btnSmClick(6) type="radio" class="btn-check" name="btnradio2" id="btnradio16" autocomplete="off"><label id="labelSm6" class="btn btn-outline-success btn-sm" for="btnradio16">소설</label>');
	$("#btnGroupSm").append('<input onclick=btnSmClick(7) type="radio" class="btn-check" name="btnradio2" id="btnradio17" autocomplete="off"><label id="labelSm7" class="btn btn-outline-success btn-sm" for="btnradio17">기타</label>');
//	$("#btnGroupSm").append('<input onclick=btnSmClick(8) type="radio" class="btn-check" name="btnradio2" id="btnradio18" autocomplete="off"><label id="labelSm8" class="btn btn-outline-success btn-sm" for="btnradio18"></label>');
   }
function btnBigSelect2(){
	$("#bigSel").val($("#labelBig2").text());
	console.log($("#bigSel").val());
	$('#btnGroupSm').empty();
	$("#btnGroupSm").append('<input onclick=btnSmClick(1) type="radio" class="btn-check" name="btnradio2" id="btnradio11" autocomplete="off" checked><label id="labelSm1" class="btn btn-outline-success btn-sm" for="btnradio11">뮤지컬/오페라</label>');
	$("#btnGroupSm").append('<input onclick=btnSmClick(2) type="radio" class="btn-check" name="btnradio2" id="btnradio12" autocomplete="off"><label id="labelSm2" class="btn btn-outline-success btn-sm" for="btnradio12">영화</label>');
	$("#btnGroupSm").append('<input onclick=btnSmClick(3) type="radio" class="btn-check" name="btnradio2" id="btnradio13" autocomplete="off"><label id="labelSm3" class="btn btn-outline-success btn-sm" for="btnradio13">전시회</label>');
	$("#btnGroupSm").append('<input onclick=btnSmClick(4) type="radio" class="btn-check" name="btnradio2" id="btnradio14" autocomplete="off"><label id="labelSm4" class="btn btn-outline-success btn-sm" for="btnradio14">파티/페스티벌</label>');
	$("#btnGroupSm").append('<input onclick=btnSmClick(5) type="radio" class="btn-check" name="btnradio2" id="btnradio15" autocomplete="off"><label id="labelSm5" class="btn btn-outline-success btn-sm" for="btnradio15">기타</label>');
//	$("#btnGroupSm").append('<input onclick=btnSmClick(6) type="radio" class="btn-check" name="btnradio2" id="btnradio16" autocomplete="off"><label id="labelSm6" class="btn btn-outline-success btn-sm" for="btnradio16"></label>');
//	$("#btnGroupSm").append('<input onclick=btnSmClick(7) type="radio" class="btn-check" name="btnradio2" id="btnradio17" autocomplete="off"><label id="labelSm7" class="btn btn-outline-success btn-sm" for="btnradio17"></label>');
//	$("#btnGroupSm").append('<input onclick=btnSmClick(8) type="radio" class="btn-check" name="btnradio2" id="btnradio18" autocomplete="off"><label id="labelSm8" class="btn btn-outline-success btn-sm" for="btnradio18"></label>');
   }
function btnBigSelect3(){
	$("#bigSel").val($("#labelBig3").text());
	console.log($("#bigSel").val());
	$('#btnGroupSm').empty();
	$("#btnGroupSm").append('<input onclick=btnSmClick(1) type="radio" class="btn-check" name="btnradio2" id="btnradio11" autocomplete="off" checked><label id="labelSm1" class="btn btn-outline-success btn-sm" for="btnradio11">영어</label>');
	$("#btnGroupSm").append('<input onclick=btnSmClick(2) type="radio" class="btn-check" name="btnradio2" id="btnradio12" autocomplete="off"><label id="labelSm2" class="btn btn-outline-success btn-sm" for="btnradio12">일본어</label>');
	$("#btnGroupSm").append('<input onclick=btnSmClick(3) type="radio" class="btn-check" name="btnradio2" id="btnradio13" autocomplete="off"><label id="labelSm3" class="btn btn-outline-success btn-sm" for="btnradio13">중국어</label>');
	$("#btnGroupSm").append('<input onclick=btnSmClick(4) type="radio" class="btn-check" name="btnradio2" id="btnradio14" autocomplete="off"><label id="labelSm4" class="btn btn-outline-success btn-sm" for="btnradio14">프랑스어</label>');
	$("#btnGroupSm").append('<input onclick=btnSmClick(5) type="radio" class="btn-check" name="btnradio2" id="btnradio15" autocomplete="off"><label id="labelSm5" class="btn btn-outline-success btn-sm" for="btnradio15">스페인어</label>');
	$("#btnGroupSm").append('<input onclick=btnSmClick(6) type="radio" class="btn-check" name="btnradio2" id="btnradio16" autocomplete="off"><label id="labelSm6" class="btn btn-outline-success btn-sm" for="btnradio16">기타</label>');
//	$("#btnGroupSm").append('<input onclick=btnSmClick(7) type="radio" class="btn-check" name="btnradio2" id="btnradio17" autocomplete="off"><label id="labelSm7" class="btn btn-outline-success btn-sm" for="btnradio17"></label>');
//	$("#btnGroupSm").append('<input onclick=btnSmClick(8) type="radio" class="btn-check" name="btnradio2" id="btnradio18" autocomplete="off"><label id="labelSm8" class="btn btn-outline-success btn-sm" for="btnradio18"></label>');
   }
function btnBigSelect4(){
	$("#bigSel").val($("#labelBig4").text());
	console.log($("#bigSel").val());
	$('#btnGroupSm').empty();
	$("#btnGroupSm").append('<input onclick=btnSmClick(1) type="radio" class="btn-check" name="btnradio2" id="btnradio11" autocomplete="off" checked><label id="labelSm1" class="btn btn-outline-success btn-sm" for="btnradio11">공무원</label>');
	$("#btnGroupSm").append('<input onclick=btnSmClick(2) type="radio" class="btn-check" name="btnradio2" id="btnradio12" autocomplete="off"><label id="labelSm2" class="btn btn-outline-success btn-sm" for="btnradio12">토익/토플</label>');
	$("#btnGroupSm").append('<input onclick=btnSmClick(3) type="radio" class="btn-check" name="btnradio2" id="btnradio13" autocomplete="off"><label id="labelSm3" class="btn btn-outline-success btn-sm" for="btnradio13">임용고시</label>');
	$("#btnGroupSm").append('<input onclick=btnSmClick(4) type="radio" class="btn-check" name="btnradio2" id="btnradio14" autocomplete="off"><label id="labelSm4" class="btn btn-outline-success btn-sm" for="btnradio14">인적성검사</label>');
	$("#btnGroupSm").append('<input onclick=btnSmClick(5) type="radio" class="btn-check" name="btnradio2" id="btnradio15" autocomplete="off"><label id="labelSm5" class="btn btn-outline-success btn-sm" for="btnradio15">기타</label>');
//	$("#btnGroupSm").append('<input onclick=btnSmClick(6) type="radio" class="btn-check" name="btnradio2" id="btnradio16" autocomplete="off"><label id="labelSm6" class="btn btn-outline-success btn-sm" for="btnradio16"></label>');
//	$("#btnGroupSm").append('<input onclick=btnSmClick(7) type="radio" class="btn-check" name="btnradio2" id="btnradio17" autocomplete="off"><label id="labelSm7" class="btn btn-outline-success btn-sm" for="btnradio17"></label>');
//	$("#btnGroupSm").append('<input onclick=btnSmClick(8) type="radio" class="btn-check" name="btnradio2" id="btnradio18" autocomplete="off"><label id="labelSm8" class="btn btn-outline-success btn-sm" for="btnradio18"></label>');
   }
function btnBigSelect5(){
	$("#bigSel").val($("#labelBig5").text());
	console.log($("#bigSel").val());
	$('#btnGroupSm').empty();
	$("#btnGroupSm").append('<input onclick=btnSmClick(1) type="radio" class="btn-check" name="btnradio2" id="btnradio11" autocomplete="off" checked><label id="labelSm1" class="btn btn-outline-success btn-sm" for="btnradio11">경제</label>');
	$("#btnGroupSm").append('<input onclick=btnSmClick(2) type="radio" class="btn-check" name="btnradio2" id="btnradio12" autocomplete="off"><label id="labelSm2" class="btn btn-outline-success btn-sm" for="btnradio12">문화</label>');
	$("#btnGroupSm").append('<input onclick=btnSmClick(3) type="radio" class="btn-check" name="btnradio2" id="btnradio13" autocomplete="off"><label id="labelSm3" class="btn btn-outline-success btn-sm" for="btnradio13">정치</label>');
	$("#btnGroupSm").append('<input onclick=btnSmClick(4) type="radio" class="btn-check" name="btnradio2" id="btnradio14" autocomplete="off"><label id="labelSm4" class="btn btn-outline-success btn-sm" for="btnradio14">환경</label>');
	$("#btnGroupSm").append('<input onclick=btnSmClick(5) type="radio" class="btn-check" name="btnradio2" id="btnradio15" autocomplete="off"><label id="labelSm5" class="btn btn-outline-success btn-sm" for="btnradio15">기타</label>');
//	$("#btnGroupSm").append('<input onclick=btnSmClick(6) type="radio" class="btn-check" name="btnradio2" id="btnradio16" autocomplete="off"><label id="labelSm6" class="btn btn-outline-success btn-sm" for="btnradio16"></label>');
//	$("#btnGroupSm").append('<input onclick=btnSmClick(7) type="radio" class="btn-check" name="btnradio2" id="btnradio17" autocomplete="off"><label id="labelSm7" class="btn btn-outline-success btn-sm" for="btnradio17"></label>');
//	$("#btnGroupSm").append('<input onclick=btnSmClick(8) type="radio" class="btn-check" name="btnradio2" id="btnradio18" autocomplete="off"><label id="labelSm8" class="btn btn-outline-success btn-sm" for="btnradio18"></label>');
   }
function btnBigSelect6(){
	$("#bigSel").val($("#labelBig6").text());
	console.log($("#bigSel").val());
	$('#btnGroupSm').empty();
	$("#btnGroupSm").append('<input onclick=btnSmClick(1) type="radio" class="btn-check" name="btnradio2" id="btnradio11" autocomplete="off" checked><label id="labelSm1" class="btn btn-outline-success btn-sm" for="btnradio11">JAVA</label>');
	$("#btnGroupSm").append('<input onclick=btnSmClick(2) type="radio" class="btn-check" name="btnradio2" id="btnradio12" autocomplete="off"><label id="labelSm2" class="btn btn-outline-success btn-sm" for="btnradio12">C</label>');
	$("#btnGroupSm").append('<input onclick=btnSmClick(3) type="radio" class="btn-check" name="btnradio2" id="btnradio13" autocomplete="off"><label id="labelSm3" class="btn btn-outline-success btn-sm" for="btnradio13">C#,C++</label>');
	$("#btnGroupSm").append('<input onclick=btnSmClick(4) type="radio" class="btn-check" name="btnradio2" id="btnradio14" autocomplete="off"><label id="labelSm4" class="btn btn-outline-success btn-sm" for="btnradio14">Python</label>');
	$("#btnGroupSm").append('<input onclick=btnSmClick(5) type="radio" class="btn-check" name="btnradio2" id="btnradio15" autocomplete="off"><label id="labelSm5" class="btn btn-outline-success btn-sm" for="btnradio15">Java script</label>');
//	$("#btnGroupSm").append('<input onclick=btnSmClick(6) type="radio" class="btn-check" name="btnradio2" id="btnradio16" autocomplete="off"><label id="labelSm6" class="btn btn-outline-success btn-sm" for="btnradio16"></label>');
//	$("#btnGroupSm").append('<input onclick=btnSmClick(7) type="radio" class="btn-check" name="btnradio2" id="btnradio17" autocomplete="off"><label id="labelSm7" class="btn btn-outline-success btn-sm" for="btnradio17"></label>');
//	$("#btnGroupSm").append('<input onclick=btnSmClick(8) type="radio" class="btn-check" name="btnradio2" id="btnradio18" autocomplete="off"><label id="labelSm8" class="btn btn-outline-success btn-sm" for="btnradio18"></label>');
   }
function btnBigSelect7(){
	$("#bigSel").val($("#labelBig7").text());
	console.log($("#bigSel").val());
	$('#btnGroupSm').empty();
//	$("#btnGroupSm").append('<input onclick=btnSmClick(1) type="radio" class="btn-check" name="btnradio2" id="btnradio11" autocomplete="off" checked><label id="labelSm1" class="btn btn-outline-success btn-sm" for="btnradio11"></label>');
//	$("#btnGroupSm").append('<input onclick=btnSmClick(2) type="radio" class="btn-check" name="btnradio2" id="btnradio12" autocomplete="off"><label id="labelSm2" class="btn btn-outline-success btn-sm" for="btnradio12"></label>');
//	$("#btnGroupSm").append('<input onclick=btnSmClick(3) type="radio" class="btn-check" name="btnradio2" id="btnradio13" autocomplete="off"><label id="labelSm3" class="btn btn-outline-success btn-sm" for="btnradio13"></label>');
//	$("#btnGroupSm").append('<input onclick=btnSmClick(4) type="radio" class="btn-check" name="btnradio2" id="btnradio14" autocomplete="off"><label id="labelSm4" class="btn btn-outline-success btn-sm" for="btnradio14"></label>');
//	$("#btnGroupSm").append('<input onclick=btnSmClick(5) type="radio" class="btn-check" name="btnradio2" id="btnradio15" autocomplete="off"><label id="labelSm5" class="btn btn-outline-success btn-sm" for="btnradio15"></label>');
//	$("#btnGroupSm").append('<input onclick=btnSmClick(6) type="radio" class="btn-check" name="btnradio2" id="btnradio16" autocomplete="off"><label id="labelSm6" class="btn btn-outline-success btn-sm" for="btnradio16"></label>');
//	$("#btnGroupSm").append('<input onclick=btnSmClick(7) type="radio" class="btn-check" name="btnradio2" id="btnradio17" autocomplete="off"><label id="labelSm7" class="btn btn-outline-success btn-sm" for="btnradio17"></label>');
//	$("#btnGroupSm").append('<input onclick=btnSmClick(8) type="radio" class="btn-check" name="btnradio2" id="btnradio18" autocomplete="off"><label id="labelSm8" class="btn btn-outline-success btn-sm" for="btnradio18"></label>');
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
	console.log($("#smSel").val())
}

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

</script>
</html>