<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q & A 작성</title>
</head>
<style>
</style>
<!--  <script src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>-->
<script src="https://cdn.ckeditor.com/4.8.0/full-all/ckeditor.js"></script> <!-- 에디터 사용을 위한 스크립트 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<body>
<jsp:include page="/module/nav.jsp" flush="false" />
<div>
<p style="font-size:30px; text-align:center;">Q & A 작성</p>
</div>
<div class="container" style="float:none; margin:0 auto; width:40%;">
<form action="/app/Qnaserver" method="post">
	<div class="form-group">
	<label for=postTitle><strong>제목</strong></label>
	<input type=text class="form-control" maxlength="25" id=faqTitle name=faqTitle placeholder="제목을 입력하세요."><br>
	</div>
	<div class="form-group">
	<label for=postContent><strong>내용</strong></label>
	<textarea class="form-control" id=faqContent name=faqContent placeholder="내용을 입력하세요." style="resize:none; height:230px;"></textarea>
	</div>
	<br>
	<div style="text-align:center;">
	<input type=submit id=qnawrite class="btn btn-outline-secondary" value=글쓰기>&nbsp;&nbsp;<input type=button class="btn btn-outline-secondary" value=취소 onclick="document.location='http://localhost:8080/app/qna'">
	</div>
</form>
</div>
<jsp:include page="/module/footer.jsp" flush="false" />
</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script>
$(document)
.on('click','#qnawrite',function(){
	if($('#faqTitle').val()==""){
		alert("제목을 입력해주세요!");
		
		return false;
	}
	else if($('#faqContent').val()==""){
		alert("내용을 입력해주세요!");
		
		return false;
	}
	
})
</script>
</html>