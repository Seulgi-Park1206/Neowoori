<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>너우리</title>
</head>
<style>
.box::-webkit-scrollbar {
    display: none; /* Chrome, Safari, Opera*/
}
</style>
<body>
<jsp:include page="/module/nav.jsp" flush="false" />
<center>
	<h2 style="width:200px; margin: 0 auto;">회사소개</h2>
	<br>
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
        	console.log(resp);
	        	var result = '';
	        	$.each(resp,function(index,item){
	        	result +='<center>'
	        	result +='<textarea id=postContent class=box name=postContent style="resize:none; width:800px; height:400px; text-align:center; font-size:14px" /disabled>'+item["contents"]+'</textarea>'
	        	result +='</center>'
		        $('.list').append(result)
	        	})
        }
	        	
	})
})
</script>
</html>