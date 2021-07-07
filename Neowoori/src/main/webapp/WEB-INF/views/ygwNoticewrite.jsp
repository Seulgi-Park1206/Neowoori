<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>noticewrite</title>
</head>
<style>
</style>
<script src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>
<!--<script src="//cdn.ckeditor.com/4.16.1/standard/ckeditor.js"></script>-->

<body>
<jsp:include page="/module/nav.jsp" flush="false" />
<div>
<p style="font-size:30px; text-align:center;">공지사항 쓰기</p>
</div>

<form action="/app/noticeserver" method="post">
<div style="text-align:center;">
	<input type=text style="width:600px; height:30px;" id=postTitle name=postTitle placeholder="제목을 입력하세요.""><br><br>
	<textarea id=postContent name=postContent placeholder="내용을 입력하세요." style="resize:none; width:600px; height:350px;"></textarea>
	
	<script>
 		var ckeditor_config = {
   		resize_enaleb : false,
   		enterMode : CKEDITOR.ENTER_BR,
   		shiftEnterMode : CKEDITOR.ENTER_P,
   		filebrowserUploadUrl : "/app/fileupload.do"
 		};
 
 		CKEDITOR.replace("postContent", ckeditor_config);
	</script>
	
	
<br>
	<div style="text-align:center;">
	<input type=submit value=글쓰기>&nbsp;&nbsp;<input type=button value=취소 onclick="document.location='http://localhost:8080/app/notice'">
	</div>
</div>
</form>

<jsp:include page="/module/footer.jsp" flush="false" />
</body>
</html>