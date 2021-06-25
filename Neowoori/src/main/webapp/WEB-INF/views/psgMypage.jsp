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
					<td class=tdCenter><input type=text class=intext id=pwdCheck /></td>
					<td class=tdCheck><label class=intext id=yesNo></label></td>
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
				<tr class=hidden><td class=tdLeft></td><td class=tdCenter id=hiddenResult><label class=intext id=nickCheckResult></label>
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
					<td class=tdCenter><label class=intext id=email></label></td>
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
	location.href='index';
}
$(document)
.ready(function(){
	// 세션값을 이용해 user_id를 얻어와서 db에서 해당 유저 정보 불러오기
	$.ajax({
		url:'${path}/mypage.do',
		data:{},
		contentType:'application/json; charset=UTF-8',
		dataType:'json',
		method:'post',
		success:function(result){
				$('#uid').text(result['userid']);
				$('#uname').text(result['uname']);
				$('#birth').text(result['uyear']+result['ubirthday']);
				$('#gender').text(result['ugender']);
				$('#email').text(result['umail']);
		},
		error:function(){
			alert('error');
		}
	});
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
	$('#nickCheckResult').css('background-color', '#ff9595');
	let nick = $('#nick').val();
	// db에서 검색한 결과: 존재 여부(count)
	$.ajax({
		url:'nick_check.do',
		data:nick,
		contentType:'text/plain; charset=utf-8;',
		dataType:'text',
		method:'post',
		success:function(result){
			console.log(result);
			if(result == '1'){
				$('#nickCheckResult').text('이미 존재하는 닉네임입니다.');
			} else {
				$('#nickCheckResult').text('사용할 수 있는 닉네임입니다.');
			}
		},
		error:function(){
			alert('Nick Error');
		}
	})
})
.on('click', '#btnUpdate', function(){
	if($('#yesno').text() == '불일치'){
		alert('비밀번호를 확인해주세요!');
	} else if($('#nickCheckResult').text() == '이미 존재하는 닉네임입니다.'){
		alert('닉네임을 확인해주세요!');
	} else {
		let result = confirm("정보를 수정하시겠습니까?");
		if(result){
			$.ajax({
				url:'update_myInfo.do',
				data:{
					'pw':$('#pwd').val(),
					'nick':$('#nick').val(),
					'mobile':$('#mobile').val()
					},
				contentType:'application/json; charset=UTF-8',
				dataType:'json',
				method:'post',
				success:function(result){
					console.log(result);
					alert("수정이 완료되었습니다.");
				},
				error:function(){
					alert('error');
				}
			});
		}
	}
	return false;
})
</script>
</html>