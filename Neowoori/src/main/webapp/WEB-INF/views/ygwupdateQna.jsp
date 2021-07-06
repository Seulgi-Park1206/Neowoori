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
<form action="/app/modifyqna" method="post">
<table id=modifyqnatable style="border-collapse:collapse;">
	<tr style="display:none;">
		<td>게시글 번호</td><td><input type=text name=qnapostnum readonly value="${modifyqna.faqnum}"></td>
	</tr>
	<tr>
		<td>게시물 제목</td><td><input type=text name=qnatitle value="${modifyqna.faqtitle}"></td>
	</tr>

	<tr>
		<td>작성자</td><td>${modifyqna.writer}</td>
	</tr>
	<tr>
		<td>내용</td><td><textarea cols=40 rows=10 name=qnacontent>${modifyqna.faqcontent}</textarea></td>
	</tr>
	<tr>
		<td>작성일</td><td>${modifyqna.faqdate}</td>	
	</tr>
	<tr><td colspan=2 align=center><input type=submit value="수정" id=modify>&nbsp;
	    <input type=button value="취소" onclick="document.location='http://localhost:8080/app/qna'"></td></tr>
</table>
</form>
</body>
</html>