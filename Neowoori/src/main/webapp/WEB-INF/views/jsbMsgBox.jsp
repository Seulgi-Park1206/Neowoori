<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쪽지함</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet"  href="${path}/resources/jsb/main.css">
</head>
<body>
<div class="w3-bar w3-light-grey">
  <a href="#" class="w3-bar-item w3-button" onclick="post_get();">받은 쪽지</a>
  <a href="#" class="w3-bar-item w3-button" onclick="post_set();">보낸 쪽지</a>
  <a href="#" class="w3-bar-item w3-button" onclick="post_box();">보관함</a>
  <input type="text" class="w3-bar-item w3-input" placeholder="Search..">
  <a href="#" class="w3-bar-item w3-button w3-green" onclick=post_find()>검색</a>
</div>
	<div class="w3-bar w3-border">
	  <button class="w3-bar-item w3-button w3-tiny">보관</button>
	  <button class="w3-bar-item w3-button w3-tiny">수신거부</button>
	  <button class="w3-bar-item w3-button w3-tiny">신고하기</button>
	  <button class="w3-bar-item w3-button w3-tiny">삭제하기</button>
	</div>
<table class="table table-hover">
  <thead class="thead-light">
    <tr>
      <th class="jsb_table_width1"><input type="checkBox"></th>
      <th class="jsb_table_width2">No</th>
      <th class="jsb_table_width3">보낸사람</th>
      <th class="jsb_table_width4">쪽지내용</th>
      <th class="jsb_table_width5">수신날짜</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><input type="checkBox"></td>
      <td>000</td>
      <td>가나다라마바</td>
      <td>쪽지내용입</td>
      <td>2021/06/15</td>
    </tr>
    <tr>
      <td><input type="checkBox"></td>
      <td>000</td>
      <td>가나다라마바</td>
      <td>쪽지내용입</td>
      <td>2021/06/15</td>
    </tr>
    <tr>
      <td><input type="checkBox"></td>
      <td>000</td>
      <td>가나다라마바</td>
      <td>쪽지내용입</td>
      <td>2021/06/15</td>
    </tr>
  </tbody>
</table>

	<div class="w3-bar" style="text-align:center;">
	  <a href="#" class="w3-button">«</a>
	  <a href="#" class="w3-button w3-green">1</a>
	  <a href="#" class="w3-button">2</a>
	  <a href="#" class="w3-button">3</a>
	  <a href="#" class="w3-button">4</a>
	  <a href="#" class="w3-button">»</a>
	</div>

<table>
</table>

</body>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
function post_get(){
	location.href='msgGetBox';
}
function post_set(){
	location.href='msgSetBox';
}
function post_box(){
	location.href='msgBox';
}
function post_find(){
	
}
</script>
</html>