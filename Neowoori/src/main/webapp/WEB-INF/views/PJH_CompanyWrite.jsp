<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회사소개 작성</title>
</head>
<body>
<jsp:include page="/module/nav.jsp" flush="false" />
<div>
<p style="font-size:30px; text-align:center;">회사소개 작성</p>
</div>
<div style="text-align:center;">
	<textarea id=postContent name=postContent style="resize:none; width:600px; height:350px;" placeholder="내용을 입력하세요."></textarea><br>
	<div style="text-align:center;">
	<input type=button id=btn_cr value=수정>&nbsp;&nbsp;<input type=button  id=btn_cl  value=취소>
	</div>
</div>

<jsp:include page="/module/footer.jsp" flush="false" />
</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
$(document)
//회사 소개 수정버튼
.on('click','#btn_cr',function(){
	
	$.ajax({
	    url: 'Company_write.do',
	    type: 'POST',
	    dataType: 'text', //서버로부터 내가 받는 데이터의 타입
	    data: {
	    	contents : $('#postContent').val(),
	    		}, 
	    success: function(data){
	    	console.log(data);
	    	Swal.fire({
	    		  position: 'center',
	    		  icon: 'success',
	    		  title: '회사소개 수정 성공',
	    		  showConfirmButton: false,
	    		  timer: 1500
	    		})
	    },
	    error: function (){        
	    }
	  })
});
</script>
</html>