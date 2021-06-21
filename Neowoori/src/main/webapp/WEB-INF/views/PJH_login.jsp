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
                  	<input type="text" placeholder="ID 를 입력하세요.">
                  </td>
                </tr>
                <tr>
                  <th>비밀번호</th>
                  <td><input type="text" placeholder="비밀번호를 입력해주세요."></td>
                </tr>
                <tr>
                	<th></th>
                	<td><a href="javascript:;" class="btn_confirm" style="position: relative;margin:15px 0 10px 0px;">로그인</a></td>
                </tr>
                <tr>
                <th></th>
                  <td><a class="link" href="">아이디/비밀번호 찾기</a>
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <a class="link" href="">회원가입</a></td>
                </tr>
                <tr>
                	<th></th>
     				<td>
     					<a class="btn_confirm" href="" style="margin:15px 0 10px 0px; background-color:#FAE100"><img src="resources/img/kakao.PNG" style="float: left; width:48px; height:48px;">카카오로그인</a>                	
     				<td>
          		</tr>
          		<tr>
                	<th></th>
     				<td>
     					<a class="btn_confirm" href="" style="background-color:#2DB400"><img src="resources/img/naver.PNG" style="float: left; width:48px; height:48px;">네이버로그인</a></td>
                	<td>
          		</tr>
          		<tr>
                	<th></th>
     				<td>
     					<a class="btn_confirm" href="" style="margin:0px 0 100px 0px; background-color:white"><img src="resources/img/google.PNG" style="float: left; width:48px; height:48px;">구글로그인</a></td>
                	<td>
          		</tr>
          	  </tbody>
          </table>
          </div>
        </div>
      </div>
</div>
<jsp:include page="/module/footer.jsp" flush="false" />
</body>
</html>