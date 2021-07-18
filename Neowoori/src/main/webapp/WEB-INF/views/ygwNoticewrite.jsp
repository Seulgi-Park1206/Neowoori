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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<body>
<jsp:include page="/module/nav.jsp" flush="false" />
<div style="text-algin:center;">
	<p style="font-size:30px; text-align:center;">공지사항 작성</p>
</div>

<div class="container" style="float:none; margin:0 auto; width:40%;">
	<form action="/noticeserver" method="post">
	<div class="form-group">
	<label for=postTitle><strong>제목</strong></label>
	<input class="form-control" type=text maxlength="25" id=postTitle name=postTitle placeholder="제목을 입력하세요."><br>
	</div>
	<div class="form-group">
	<label for=postContent><strong>내용</strong></label>
	<textarea class="form-control" id=postContent maxlength="250" name=postContent placeholder="내용을 입력하세요." style="resize:none; height:230px;"></textarea>
	</div>
	<br>
	<div style="text-align:center;">
	<input class="btn btn-outline-secondary" type=submit id=noticewrite value=글쓰기>&nbsp;&nbsp;<input class="btn btn-outline-secondary" type=button value=취소 onclick=listnotice()>
	</div>

	</form>
</div>
<jsp:include page="/module/footer.jsp" flush="false" />
</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script>

function listnotice(){
	location.href='/notice';
}

$(document)
.on('click','#noticewrite',function(){
	if($('#postTitle').val()==""){
		alert("제목을 입력해주세요!");
		
		return false;
	}
	else if($('#postContent').val()==""){
		alert("내용을 입력해주세요!");
		
		return false;
	}
	
	/*
	if($('#postTitle').val().length>$('#postTitle').attr('maxlength')){
		alert('제한길이를 초과하였습니다.');
		$('#postTitle').val()=="1";
	}
	*/
})
</script>
</html>