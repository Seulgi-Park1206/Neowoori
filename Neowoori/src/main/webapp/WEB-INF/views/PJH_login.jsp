<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<link rel="stylesheet" href="resources/pjh/login.css" type="text/css" >
<body>
<jsp:include page="/module/nav.jsp" flush="false" />
<div class="wrap wd668">
      <div class="container">
        <div class="form_txtInput">
          <h2 class="sub_tit_txt">로그인</h2>
          <div class="join_form">
          <table>
              <colgroup>
                <col width="30%"/>
                <col width="auto"/>
              </colgroup>
              <tbody>
              <tr>
                  <th>아이디</th>
                  <td>
                  	<input onkeyup="enterkey();" type="text" id=id placeholder="ID 를 입력하세요.">
                  </td>
                </tr>
                <tr>
                  <th>비밀번호</th>
                  <td><input onkeyup="enterkey();" type="password" id=pw placeholder="비밀번호를 입력해주세요."></td>
                </tr>
                <tr>
                	<th></th>
                	<td><a href="javascript:;" id="btn_login" class="btn_confirm" style="position: relative;margin:15px 0 10px 0px;">로그인</a></td>
                </tr>
                 <tr>
                	<th></th>
                	<td><a href="javascript:;" id=btn_main class="btn_confirm" style="position: relative;margin:15px 0 10px 0px;">메인화면으로 이동</a></td>
                </tr>
                <tr>
                <th></th>
                  <td><a class="link" id=findid onclick="find_id();" href="">아이디 찾기</a><a class="link" id=findpw onclick="find_pw();" href="">비밀번호 찾기</a>
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <a class="link" id=signup onclick="signup();">회원가입</a><br><br><br><br><br><br><br><br></td>
                </tr>
          	  </tbody>
          </table>
          </div>
        </div>
      </div>
</div>
<jsp:include page="/module/footer.jsp" flush="false" />
</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script>
function signup(){
	location.href='signup';
}

function login(){
	$.ajax({
	    url: 'login.do',
	    type: 'POST',
	    dataType: 'json', //서버로부터 내가 받는 데이터의 타입
	    data: {
	    	   uid : $('#id').val(),
	    	   upw : $('#pw').val(),
	    		}, 
	    success: function(data){
	    	var se = '<%=session.getAttribute("userid")%>';
	    	if(data == 1){
	        	 //alert($('#id').val()+" 님 환영합니다.");
	        	 location.href = document.referrer;
	         }else{
	        	 alert("아이디를 다시 입력해주세요.");
	         }
	    },
	    error: function (){        
	    }
	  })
}
$(document)
//로그인 체크
.on('click','#btn_login',function(){
	login();
	
})

function enterkey() {
        if (window.event.keyCode == 13) {
 
             // 엔터키가 눌렸을 때 실행할 내용
             login();
        }
}



function find_id(){
	var url = "findidPopup";
	var name = "findidPopup";
	var option = "width = 570, height = 200, left=300, top=180, location=no";
	window.open(url,name,option);
}

function find_pw(){
	var url = "findpwPopup";
	var name = "findpwPopup";
	var option = "width = 570, height = 280, left=300, top=180, location=no";
	window.open(url,name,option);
}

</script>
</html>