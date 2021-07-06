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

<body>
<jsp:include page="/module/nav.jsp" flush="false" />
<div>
<p style="font-size:30px; text-align:center;">Q & A 작성</p>
</div>
<div style="width:700px; text-align:center;">
<form action="/app/Qnaserver" method="post">
<div style="text-align:center;">
	<input type=text style="width:690px; height:30px;" id=faqTitle name=faqTitle placeholder="제목을 입력하세요.""><br><br>
	<textarea id=faqContent name=faqContent style="resize:none; width:400px; height:350px;"></textarea>
			<script>
				var ckeditor_config = {
					resize_enaleb : false,
					enterMode : CKEDITOR.ENTER_BR,
					shiftEnterMode : CKEDITOR.ENTER_P,
					filebrowserUploadUrl : "/admin/goods/ckUpload"
				};

				CKEDITOR.replace("faqContent", ckeditor_config);
			</script>
			<!--  
 <script type="text/javascript">
          CKEDITOR.replace('faqContent',   //textarea 아이디
                            {height: 500});
   </script>
-->
			<br>
	<div style="text-align:center;">
	<input type=submit value=글쓰기>&nbsp;&nbsp;<input type=button value=취소 onclick="document.location='http://localhost:8080/app/qna'">
	</div>
</div>
</form>
</div>
<jsp:include page="/module/footer.jsp" flush="false" />
</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script>

</script>
</html>