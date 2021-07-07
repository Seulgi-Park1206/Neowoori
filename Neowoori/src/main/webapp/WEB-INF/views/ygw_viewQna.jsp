<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View QNA</title>
</head>
<style>
table{
	width: 100%;
    border: 1px solid #000000;
    border-collapse: collapse;
}
table,td{
	border: 1px solid #000000;
    padding: 10px;
}
</style>
<body>

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
		<td>작성일</td><td>${qnalist.faqdate}</td>	
	</tr>
	<tr><td colspan=3 align=center><input type=button id=btnUpdate value=수정>
	                  <input type=button id=btnDelete value=삭제>
	                  <input type=button id=btnNew value=새글쓰기>
	                  <input type=button id=btnQnalist value=목록보기 onclick="document.location='http://localhost:8080/app/qna'"></td></tr>
</table>
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

.on('click','#btnNew',function(){
	document.location="http://localhost:8080/edu/newpost";
	return false;
})





if(writer==null || writer!=dbwriter){
	$('#btnUpdate').hide();
	$('#btnDelete').hide();
	$('#btnNew').hide();
}

</script>
</html>