<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>meetwrite</title>
</head>
<style>
</style>
<body>
<jsp:include page="/module/nav.jsp" flush="false" />

<div>
<p style="font-size:30px; text-align:center;">스터디 게시글 쓰기</p>
</div>
<div style="text-align:center;">
	<input type=text style="width:600px; height:30px;" id=postTitle name=postTitle value="제목을 입력하세요.""><br><br>
	<textarea id=postContent name=postContent style="resize:none; width:600px; height:350px;">내용을 입력하세요.</textarea><br>
	<div style="text-align:center;">
	<input type="checkbox" id=noticeCheckbox name=noticeCheckbox> 공지사항 <input type=button value=글쓰기>&nbsp;&nbsp;<input type=button value=취소>
	</div>
</div>

<jsp:include page="/module/footer.jsp" flush="false" />
</body>
</html>