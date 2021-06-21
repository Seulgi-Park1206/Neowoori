<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet"  href="${path}/resources/jsb/main.css">
<title>send message</title>
</head>
<body>
<form class="w3-container w3-card-4 w3-light-grey">
  <p>
  <label>받는 사람</label>
  <input class="w3-input w3-border w3-round" name="from" type="text" id="from"></p>
  <p>
  <label>보낼 내용</label>
  <input class="w3-input w3-border w3-round" name="contents" type="text" id="contents" style="height:100px;"></p>
  <input type=submit value="보내기"><input type=button value="취소" onclick="click_cancel();">
</form>


<!--  팝업창 띄우고 위한 코드
<input type="button" value="팝업창" onclick="click_add();"><br>
function click_add(){
	var url = "pop_message";
	var name = "메시지";
	var option = "width=600, height=600, left=100,top=50,location=no";
	window.open(url,name,option)
};
-->

</body>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript" language="javascript">
function click_cancel(){
	window.close()
}
</script>
</html>
