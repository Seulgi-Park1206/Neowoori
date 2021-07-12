<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta charset="UTF-8">
<title>아이디찾기</title>
</head>
<body>
<div class="w3-content w3-container w3-margin-top">
		<div class="w3-container w3-card-4">
			<!--  <form action="/app/findidServer" method="post">-->
				<div class="w3-center w3-large w3-margin-top">
					<h3>아이디 찾기</h3>
				</div>
				<div>
					<p>
						<label>Email</label>
						<input class="w3-input" type="text" id="email" name="email" required>
					</p>
					<p class="w3-center">
						<button type="button" id=findBtn class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">find</button>
						<!--<button type="button" onclick="history.go(-1);" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-margin-bottom w3-round">Cancel</button>-->
					</p>
				</div>
			<!--  </form>-->
		</div>
	</div>
</body>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script>

$(document)
.on('click','#findBtn',function(){
	$.ajax({
		type:"POST",
		url:"findidServer",
		data :{
			email : $("#email").val()

		},
		success:function(result){
			if(result=='1'){
				location.href="findidfinal";
				
			}
			else{
				alert("email이 존재하지 않습니다.");
			}
		},
		error:function(result){
//			console.log("fail11 값 : "+result);
		}
				
	});
	
})

</script>
</html>