<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 로그인</title>
</head>
<link rel="stylesheet" href="resources/pjh/login.css" type="text/css" >
<body>
<jsp:include page="/module/nav.jsp" flush="false" />
<div class="wrap wd668">
      <div class="container">
        <div class="form_txtInput">
          <h2 class="sub_tit_txt">관리자 로그인</h2>
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
                	<td><a href="javascript:;" class="btn_confirm" style="position: relative;margin:15px 0 10px 0px;">메인화면으로 이동</a></td>
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