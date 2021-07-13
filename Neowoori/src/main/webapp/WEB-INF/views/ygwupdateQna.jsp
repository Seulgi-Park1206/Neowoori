<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<link rel="stylesheet" href="${path}/resources/ygw/qna.css">
<body>
<jsp:include page="/module/nav.jsp" flush="false" />
<div style="text-align:center; margin:0 auto;">
	<h2>Q&A 수정</h2>
</div>
<br>
<div class="qnamodify" style="margin:0 auto; float:none; width:40%;">
<form action="/modifyqna" method="post">
<table class="table table-bordered" id=modifyqnatable style="text-align:center; vertical-align:middle;">
	<tr style="display:none;">
		<td class="table-light">게시글 번호</td><td><input type=text name=qnapostnum readonly value="${modifyqna.faqnum}"></td>
	</tr>
	<tr>
		<td class="table-light">제목</td><td><input type=text id=modifyqnatitle maxlength="25" class="form-control" name=qnatitle value="${modifyqna.faqtitle}"></td>
	</tr>

	<tr>
		<td class="table-light">작성자</td><td>${modifyqna.writer}</td>
	</tr>
	<tr>
		<td class="table-light">내용</td><td><textarea cols=40 rows=10 id=modifyqnacontent class="form-control" name=qnacontent style="resize:none;">${modifyqna.faqcontent}</textarea></td>
	</tr>
</table>

	<div style="text-algin:center; margin:0 auto; float:none; width:40%;">
	<input type=submit class="btn btn-outline-secondary" value="수정" id=modify>&nbsp;
	<input type=button class="btn btn-outline-secondary" value="취소" onclick=returnQna()>
	</div>
</form>
</div>
<jsp:include page="/module/footer.jsp" flush="false" />
</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script>

function returnQna(){
	location.href='/qna';
}
$(document)
.on('click','#modify',function(){
	if($('#modifyqnatitle').val()==""){
		alert("제목을 입력해주세요!");
		
		return false;
	}
	else if($('#modifyqnacontent').val()==""){
		alert("내용을 입력해주세요!");
		
		return false;
	}
	
})
</script>
</html>