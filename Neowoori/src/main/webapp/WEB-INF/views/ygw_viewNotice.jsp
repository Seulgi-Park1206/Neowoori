<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

<table id=viewnoticetable style="border-collapse:collapse;">
	<tr>
		<td>게시글 번호</td><td>${noticelist.postnum}</td>
	</tr>
	<tr>
		<td>게시물 제목</td><td>${noticelist.title}</td>
	</tr>
	<tr>
		<td>내용</td><td>${noticelist.admin_contents}</td>
	</tr>
	<tr>
		<td>작성일</td><td>${noticelist.admin_date}</td>	
	</tr>	
</table>
<br>
<div style="text-align:center;">
	<!--<input type=button id=btnUpdate value=수정>-->
	<input type=button id=btnDelete value=삭제>
	<!--<input type=button id=btnNew value=새글쓰기>-->
	<input type=button id=btnNoticelist value=목록보기 onclick="document.location='http://localhost:8080/app/notice'"></td></tr>
</div>
</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script>
$(document)
.on('click','#btnDelete',function(){
	
	let noticepostnum=$('#viewnoticetable').find('td:eq(1)').text();
	let seldelete=confirm("정말 삭제하시겠습니까?");
	
	if(seldelete==true){
		document.location="http://localhost:8080/app/noticedelete/"+noticepostnum;	
	}
	else{
		return false;	
	}
})
</script>
</html>