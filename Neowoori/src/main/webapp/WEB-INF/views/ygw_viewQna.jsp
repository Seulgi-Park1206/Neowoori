<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View QNA</title>
</head>
<style>
table{
	width: 	100%;
    border: 1px solid #000000;
    border-collapse: collapse;
    text-align:center;
}
table,td{
	border: 1px solid #000000;
    padding: 10px;
}
</style>
<body>

<c:set var = "string1" value = "${qnalist.faqdate}"/>
<c:set var = "string2" value = "${fn:substring(string1, 0, 9)}" />

<table id=viewqnatable style="border-collapse:collapse;">
	<tr>
		<td>게시글 번호</td><td>${qnalist.faqnum}</td>
	</tr>
	<tr>
		<td>게시물 제목</td><td>${qnalist.faqtitle}</td>
	</tr>

	<tr>
		<td>작성자</td><td>${qnalist.writer}</td>
	</tr>
	<tr>
		<td>내용</td><td>${qnalist.faqcontent}</td>
	</tr>
	<tr>
		<td>작성일</td><td>${string2}</td>	
	</tr>
	<tr>
		<td>답변상태</td><td>${qnalist.state}</td>
	</tr>
	<tr>
		<td>답변내용</td><td>${qnalist.answer}</td>	
	</tr>
	
</table>
<br>
<div style="text-align:center;">
	<input type=button id=btnUpdate value=수정>
	<input type=button id=btnDelete value=삭제>
	<!--<input type=button id=btnNew value=새글쓰기>-->
	<input type=button id=btnQnalist value=목록보기 onclick="document.location='http://localhost:8080/app/qna'"></td></tr>
</div>
</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script>
<%
String writer=(String)session.getAttribute("userid");
%>

let dbwriter='${qnalist.writer}';
let writer= '<%=writer%>';

$(document)
.on('click','#btnUpdate',function(){
	let qnapostnum=$('#viewqnatable').find('td:eq(1)').text();
	let qnawriter=$("#viewqnatable").find('td:eq(5)').text();
	document.location="http://localhost:8080/app/qnamodify/"+qnapostnum+"/"+qnawriter;

	return false;
})

.on('click','#btnDelete',function(){
	let qnapostnum=$('#viewqnatable').find('td:eq(1)').text();
	let seldelete=confirm("정말 삭제하시겠습니까?");
	
	if(seldelete==true){
		document.location="http://localhost:8080/app/qnadelete/"+qnapostnum;	
	}
	else{
		return false;	
	}
})

if(writer==null || writer!=dbwriter){
	$('#btnUpdate').hide();
	$('#btnDelete').hide();
	$('#btnNew').hide();
}

</script>
</html>