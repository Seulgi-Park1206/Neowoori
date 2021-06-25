<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<link rel="stylesheet" href="resources/pjh/signup.css" type="text/css" >
<body>
<jsp:include page="/module/nav.jsp" flush="false" />
  <div class="wrap wd668">
      <div class="container">
        <div class="form_txtInput">
          <h2 class="sub_tit_txt">회원가입</h2>
          <p class="exTxt">회원가입시 이메일 인증을 반드시 진행하셔야 합니다.</p>
          <div class="join_form" >
            <table>
              <colgroup>
                <col width="30%"/>
                <col width="auto"/>
              </colgroup>
              <tbody>
                <tr>
                  <th><span>아이디</span></th>
                  <td>
                  	<input type="text" id=id placeholder="ID 를 입력하세요.">
                  	<a href="javascript:;" id=duplcheck class="btn_confirm" style="position: relative;">중복확인</a>	
                  </td>
                </tr>
                <tr>
                	<th></th>
               	 	<td><div class="id regex" style="font-size: 10px;"></div></td>
                </tr>
                <tr>
                  <th><span>이름</span></th>
                  <td><input type="text" id=name placeholder=""></td>
                </tr>
                <tr>
                	<th></th>
               	 	<td><div class="name regex" style="font-size: 10px;"></div></td>
                </tr>
                <tr>
                  <th><span>비밀번호</span></th>
                  <td><input type="password" id=pw placeholder="비밀번호를 입력해주세요."></td>
                </tr>
                <tr>
                	<th></th>
               	 	<td><div class="pw regex" style="font-size: 10px;"></div></td>
                </tr>
                <tr>
                  <th><span>비밀번호 확인</span></th>
                  <td><input type="password" id=repw placeholder="비밀번호를 확인하세요"></td>
                </tr>
                <tr>
                	<th></th>
                	<td><div class="repw regex" style="font-size: 10px;"></div></td>
                </tr>
                <tr>
                  <th><span>닉네임</span></th>
                  <td>
                  	<input type="text" id=nick placeholder="닉네임을 입력하세요">
                  	<a href="javascript:;" id=duplcheck1 class="btn_confirm" style="position: relative;">중복확인</a>
                  </td>
                </tr>
                <tr>
                	<th></th>
               	 	<td><div class="nick regex" style="font-size: 10px;"></div></td>
                </tr>
                <tr>
                  <th><span>생일</span></th>
                  <td><input type="date" id=birth min="1950-01-01" max="2020-12-31"></td>
                </tr>
                <tr>
                  <th><span>휴대폰 번호</span></th>
                  <td><input type="text" id=mobile placeholder="모바일 번호를 입력해주세요."></td>
                </tr>
                <tr>
                	<th></th>
                	<td><div class="mobile regex" style="font-size: 10px;"></div></td>
                </tr>
                <tr>
                  <th><span>성별</span></th>
                  <td>
                  <select id=gender class="gender">
                  <option value="">선택</option>
                  <option value="남자">남자</option>
                  <option value="여자">여자</option>
                  </select>
                  </td>
                </tr>
                
                <tr class="email">
                  <th><span>이메일</span></th>
                  
                  <td>
               
                    <input type="text"  id=email name=email class="email" placeholder=""><span class="mar10">@</span>
					<input type="text" id=email2 name="email2" class="email email2" readonly>
					<select class="email3" id=email3 onChange="selectEmail(this)">
						<option value="">선택</option>
						<option value="naver.com">naver.com</option>
						<option value="gmail.com">gmail.com</option>
						<option value="daum.net">daum.net</option>
						<option value="1">직접입력</option>
					</select>
                    <a href="javascript:;" id=btn_con class="btn_confirm">인증번호 발송</a>
                    
                  </td>
                  
                </tr>
                
                <tr>
                	<th></th>
                	<td><div class="email regex" style="font-size: 10px;"></div></td>
                </tr>
                <tr id=send_num style="display:none">
                  <th><span>인증번호 확인</span></th>
                  <td><input type="text" id=send_number class="send_number">
                    <a href="javascript:;" id=btn_num class="btn_confirm" >인증번호 확인</a>
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
									<th></th>
									<td>
									    <input type="hidden" id="confmKey" name="confmKey" value=""  >
										<input type="hidden" id="zipNo" name="zipNo"  style="width:100px">
										<input type="button"  value="주소검색" onclick="goPopup();">
									</td>
								</tr>
								<tr>
									<th><label><span>도로명주소</span></label></th>
									<td><input type="text" id="roadAddrPart1" style="width:85%"></td>
								</tr>
								<tr>
									<th><span>상세주소</span></th>
									<td>
										<input type="text" id="addrDetail" style="width:40%" value="">
										<input type="text" id="roadAddrPart2"  style="width:40%" value="">
									</td>
								</tr>
								<tr>
<!-- 									<th><span>좌표정보</span></th> -->
									<td>
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
            <a href="javascript:;" id=signupbtn>회원 가입</a>
          </div>
        </div> <!-- form_txtInput E -->
      </div><!-- content E-->
    </div> <!-- container E -->
<jsp:include page="/module/footer.jsp" flush="false" />
</body>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<!-- 포트번호 8080 인증키 : 4b0f94866b0f233c25fbdc0d8ed3c881 -->
<!-- 포트번호 8181 인증키 : (주혁) -->
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
}
/*--------------------------카카오 주소 찾기---------------------------------*/
/*--------------------------이메일 직접입력만 글쓰기 가능---------------------------------*/
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
/*--------------------------이메일 직접입력만 글쓰기 가능---------------------------------*/
/*--------------------------인증번호 누를시 input보이게하기---------------------------------*/
var code="";

$("#btn_con ").on("click",function(){

 	var email = $("#email").val();
 	var email2 = $("#email2").val();
	
 	var email_rule =  /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	
 	var mail = email+"@"+email2;
 	   $("#mail").val(mail);  
 	   console.log(email);
 	   console.log(email2);
 	   console.log(mail);
 	   if(!email_rule.test(mail)){
 	       alert("이메일을 형식에 맞게 입력해주세요.");
 	     return false;
 	   }else{
 		   alert("해당 이메일로 인증번호를 발급했습니다.");
 		   $("#send_num").css("display","");
 		   
 		   $.ajax({
 				
 				type:"GET",
 				url:"mailCheck?email=" + mail,
 				success:function(data){
 					
 					console.log("data : " + data);
 					code = data;
 					
 				}
 						
 			});
 		   
 	   }
 })
/*--------------------------인증번호 누를시 input보이게하기---------------------------------*/
/*--------------------------인증번호 유효성 검사(임시)---------------------------------*/
$("#btn_num ").on("click",function(){
	
	if($("#send_number").val()==code){
		if(code!=""){
			alert("인증에 성공하였습니다.");
			$('#send_number').attr("readonly",true);
			$('#zipNo').focus();			
		}
		
	}
	
	else if($('#send_number').val()==""){
		alert("인증번호가 입력되지 않았습니다.\n인증번호를 입력해주세요.");
		$('#send_number').focus();
	}
	else if($("#send_number").val()!=code){
		alert("인증에 실패하였습니다.\n인증번호를 다시 입력해주세요.");
		$('#send_number').val("");
		$('#send_number').focus();
	}
	
		
})
/*--------------------------인증번호 유효성 검사(임시)---------------------------------*/
/*--------------------------유효성 검사 & 아이디,닉네임 중복검사(임시)---------------------------------*/
$(function(){
   //중복확인 & id 유효성검사   
    $("#duplcheck").on("click",function(){
    	var id = $("#id").val();
        if(id == ""){
        	$(".id.regex").html("아이디를 입력해주세요.");
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
    	         $(".id.regex").html("사용하실 수 있는 아이디입니다.");
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
        	$(".nick.regex").html("닉네임를 입력해주세요.");
            $(".nick.regex").css("color","red")
        	return;
        }
        
        var regex = /^[가-힣a-zA-Z]+$/;
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
    });
    
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
	
/*--------------------------유효성 검사(임시)---------------------------------*/
 	
 
 
 
/*---------------------------회원가입 AJAX 영역(json배열로 넘길예정)-------------------------*/	
	
	function signupajax(){
		
		/*--------------------------카카오 경도 위도 찾기 ---------------------------------*/
		/*
		var coords = new kakao.maps.Coords($('#entX').val(),$('#entY').val()); 
		coords.toLatLng().toString(); // (33.45067375096625, 126.5706721005115)
		cut = coords.toLatLng().toString().replace(/\(/g,'').replace(/\)/g,'');
		var arr = cut.split(','); // ","기점으로 두개로 나눔
		var lati = arr[0]; //위도
		var longi = arr[1]; //경도
		console.log(lati);
		console.log(longi);
		*/
		//210625 석봉수정
		var geocoder = new kakao.maps.services.Geocoder();
		var callback = function(result, status) {
		if (status === kakao.maps.services.Status.OK) {
			var lati=result[0].y;
			var longi=result[0].x;
		}
	};
	geocoder.addressSearch($("#roadAddrPart1").val(), callback);
		/*--------------------------카카오 경도 위도 찾기 ---------------------------------*/
		/*-----이메일------*/
		var email = $("#email").val();
		var email2 = $("#email2").val();
		var mail = email+"@"+email2;
		/*-----이메일------*/
		
		/*-----생년월일------*/
		var birth = $('#birth').val();
		var year = birth.substring(0,4);
		var birthday1 = birth.substring(5,7);
		var birthday2 = birth.substring(8,11);
		var birthday = birthday1+birthday2;
		console.log(birthday);
		console.log(year);
		/*-----생년월일------*/
		
		/*-----주소------*/
		var juso = $('#roadAddrPart1').val()+" "+$('#addrDetail').val();
		/*-----주소------*/
		
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
		if($('#send_number').val()==""){
			alert("인증번호를 입력해주세요.");
			return false;
		}
		if($('#send_number').val()!=code){
			alert("인증번호가 일치하지 않습니다.");
			return false;
		}
	   signupajax();
   
})
/*--------------------------회원 가입 클릭시 유효성 검사(임시)---------------------------------*/
</script>
</html>
