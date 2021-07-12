<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>너우리</title>
</head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@700&display=swap" rel="stylesheet">
<style>
.box::-webkit-scrollbar {
    display: none; /* Chrome, Safari, Opera*/
}   
.box{
	font-family: 'Noto Sans KR', sans-serif;
	border: none;
	background-color:transparent;
}


</style>
<body>
<jsp:include page="/module/nav.jsp" flush="false" />
<center>
	<h2 style="width:300px; margin: 0 auto;">회사소개</h2>
	<br>
	<div style="text-align:center;">
	<img src="resources/img/company.png" width="150" height="120">
	</div>
  		<div class=list>
  			
  		</div>
</center>
<jsp:include page="/module/footer.jsp" flush="false" />
</body>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script language='javascript'>
$(document)
.ready(function(){
	$.ajax({
        url:'Company_list.do'
        , method : 'POST'
        , data: {}
        , contentType : 'application/json; charset=UTF-8'
        , dataType : 'json'
        , success :
        	function output(resp){
  //      	console.log(resp);
	        	var result = '';
	        	$.each(resp,function(index,item){
	        	result +='<center>'
	        	result +='<textarea id=postContent class=box name=postContent style="resize:none; width:1000px; height:400px; text-align:center; font-size:14px" /disabled>'+item["contents"]+'</textarea>'
	        	result +='</center>'
		        $('.list').append(result)
	        	})
        }
	        	
	})
})
</script>
</html>