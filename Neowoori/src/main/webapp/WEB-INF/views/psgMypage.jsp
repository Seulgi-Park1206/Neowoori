<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>내 정보</title>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<link rel="stylesheet" href="${path}/resources/psg/css/form.css" type="text/css">
<link rel="stylesheet" href="${path}/resources/psg/css/mypage.css" type="text/css">
<body>
	<jsp:include page="/module/nav.jsp" flush="false" />
	<div class=form>
		<a class=title>내 정보 수정</a>
		<div class=contents>
			<table>
				<tr>
					<td class=tdLeft>아이디:</td>
					<td class=tdCenter><label class=intext id=uid></label></td>
				</tr>
				<tr>
					<td class=tdLeft>비밀번호:</td>
					<td class=tdCenter><input type=text class=intext id=pwd /></td>
				</tr>
				<tr>
					<td class=tdLeft>비밀번호 확인:</td>
					<td class=tdCenter>
						<input type=text class=intext id=pwdCheck />
					</td>
					<td class=tdCheck><label id=yesNo></label></td>
				</tr>
				<tr>
					<td class=tdLeft>이름:</td>
					<td class=tdCenter><label class=intext id=uname></label></td>
				</tr>
				<tr>
					<td class=tdLeft>닉네임:</td>
					<td class=tdCenter><input type=text class=intext id=nick /></td>
					<td class=tdCheck><input type=button class="btn btn-outline-primary" id=btnNickCheck value="중복확인" /></td>
				</tr>
				<tr><td class=tdLeft></td><td class=tdCenter id=hiddenResult><label class=intext id=nickCheckResult></label>
				<tr>
					<td class=tdLeft>생년월일:</td>
					<td class=tdCenter><label class=intext id=birth></label></td>
				</tr>
				<tr>
					<td class=tdLeft>성별:</td>
					<td class=tdCenter><label class=intext id=gender></label></td>
				</tr>
				<tr>
					<td class=tdLeft>연락처:</td>
					<td class=tdCenter><input type=text class=intext id=mobile /></td>
				</tr>
				<tr>
					<td class=tdLeft>이메일:</td>
					<td class=tdCenter>
						<!-- <input type=text class=email id=email1 />&nbsp;
						@&nbsp;
						 <select class=email id=email2>
							<option selected disabled>선택하시오</option>
							<option value="">직접 입력</option>
							<option value="gmail.com">gmail.com</option>
							<option value="naver.com">naver.com</option>
							<option value="nate.com">nate.com</option>
							<option value="hanmail.net">hanmail.net</option>
						</select>
					</td> -->
					<div class="input-group mb-3">
						<input type="text" class="form-control" placeholder="Username" aria-label="Username">
	  					<span class="input-group-text">@</span>
	  					<input type="text" class="form-control" placeholder="Server" aria-label="Server">
					</div>
					<td class=tdCheck><input type=button class="btn btn-outline-primary" id=btnEmail value="이메일 인증" /></td>
				</tr>
				<tr id=hiddenTr>
					<td class=tdLeft>이메일 인증번호:</td>
					<td class=tdCenter>
						<input type=text class=intext id=emailCheck/>
					</td>
					<td class=tdCheck><input type=button class="btn btn-outline-primary" id=btnCheck value="인증확인" /><td>
				</tr>
			</table>
			<br>
			<div class="d-grid gap-2 d-md-flex justify-content-md-end">
				<input type=button class="btn btn-outline-primary" id=btnUpdate value="정보 수정" />
				<input type=button class="btn btn-outline-primary" onclick="cancel()" value="취소" />
			</div>
		</div>
	</div>
	<jsp:include page="/module/footer.jsp" flush="false" />
</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script>
function cancel(){
	location.href='';
}
$(document)
.ready(function(){
	// 세션값을 이용해 user_id를 얻어와서 db에서 해당 유저 정보 불러오기
	$.ajax({
		url='/mypage',
		data={},
		contentType : 'application/json; charset=UTF-8',
		dataType='json',
		method='post',
		success=function(result){
			$.each(result, function(index, e)){
				$('#uid').text(e['userid']);
				$('#uname').text(e['uname']);
				$('#birth').text(e['uyear']+e['ubirthday']);
				$('#gender').text(e['ugender']);
				$('')
			}
		},
		error=function(){
			alert('error');
		}
	});
	/* $.ajax({
        url:"post.do"
        , method : 'POST'
        , data: {}
        , contentType : 'application/json; charset=UTF-8'
        , dataType : 'json'
        , success :
        	function output(resp){
	        	var result = '';
		        result +='<table border="1">'
		        result +='<tr><th>게시물번호</th><th>작성자</th><th>제목</th></tr>'
		        $.each(resp,function(index,item){
		            result +='<tr><td>'+item["bId"]+'</td>'
		            result +='<td>'+item["bName"]+'</td>'
		            result +='<td>'+item["bTitle"]+'</td></tr>'
		        })
		        result +='</table>'
		        $('#tbl').append(result)
        	}
	}) */
	$('#hiddenTr').hide();
})
.on('change keyup paste','#pwdCheck',function(){
	if($('#pwd').val() == $(this).val()){
		$('#yesNo').text('일치');
	} else if($(this).val() == ""){
		$('#yesNo').text('');
	} else {
		$('#yesNo').text('불일치');
	}
})
.on('click', '#btnNickCheck', function(){
	/* $('#hiddenResult').show(); */
	$('#nickCheckResult').css('background-color', '#ff9595');
	console.log('닉네임 중복확인');
	let nick = $('#nick').val();
	// db에서 검색한 결과: 존재 여부(count)
	let rst = 1;
	if(rst == 1){
		$('#nickCheckResult').text('이미 존재하는 닉네임입니다.');
	} else {
		$('#nickCheckResult').text('사용할 수 있는 닉네임입니다.');
	}
	
})
.on('click', '#btnEmail', function(){
	$('#hiddenTr').show();
	return false;
})
.on('click', '#btnUpdate', function(){
	let result = confirm("정보를 수정하시겠습니까?");
	if(result){
		alert("수정이 완료되었습니다.");
	}
	return false;
})
</script>
</html>