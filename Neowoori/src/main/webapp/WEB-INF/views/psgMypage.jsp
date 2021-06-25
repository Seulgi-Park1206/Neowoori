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
				<tr class=trPw>
					<td class=tdLeft>비밀번호:</td>
					<td class=tdCenter><input type=button class="btn btn-outline-primary" id=btnShowHiddenTr value="변경" /></td>
				</tr>
				<tr class=hiddenTr>
					<td class=tdLeft>새 비밀번호:</td>
					<td class=tdCenter><input type=password class=intext id=upw1 /></td>
					<td class=tdCheck><label class=intext id=yesNo></label></td>
				</tr>
				<tr class=hiddenTr>
					<td class=tdLeft>새 비밀번호 확인:</td>
					<td class=tdCenter><input type=password class=intext id=upw /></td>
					<td class=tdCheck><input type=button class="btn btn-outline-primary" id=btnUpdatePw value="변경" /></td>
				</tr>
				<tr>
					<td class=tdLeft>이름:</td>
					<td class=tdCenter><label class=intext id=uname></label></td>
				</tr>
				<tr>
					<td class=tdLeft>닉네임:</td>
					<td class=tdCenter><input type=text class=intext id=unick /></td>
					<td class=tdCheck><input type=button class="btn btn-outline-primary" id=btnNickCheck value="중복확인" />
										<input type=button class="btn btn-outline-primary" id=btnUpdateNick value="변경" /></td>
				</tr>
				<tr class=hidden><td class=tdLeft></td><td class=tdCenter><label class=intext id=nickCheckResult></label>
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
					<td class=tdCenter><input type=text class=intext id=umobile /></td>
					<td class=tdCheck><input type=button class="btn btn-outline-primary" id=btnMobileCheck value="중복확인" />
										<input type=button class="btn btn-outline-primary" id=btnUpdateMobile value="변경" /></td>
				</tr>
				<tr class=hidden><td class=tdLeft></td><td class=tdCenter><label class=intext id=mobileCheckResult></label>
				<tr>
					<td class=tdLeft>이메일:</td>
					<td class=tdCenter><label class=intext id=email></label></td>
				</tr>
			</table>
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
	$('.hiddenTr').hide();
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
				$('#unick').val(result['unick']);
				$('#birth').text(result['uyear']+result['ubirthday']);
				$('#gender').text(result['ugender']);
				$('#umobile').val(result['umobile']);
				$('#email').text(result['umail']);
		},
		error:function(){
			alert('error');
		}
	});
})
// 비밀번호 일치/불일치 판단
.on('change keyup paste focus', '#upw, #upw1', function(){
	if($('#upw1').val() != '' && $('#upw').val() != ''){
		if($('#upw1').val() == $('#upw').val()) $('#yesNo').text('일치');
		else $('#yesNo').text('불일치');
	} else $('#yesNo').text('');
	
	return false;
})
// 변경
.on('click', 'input[type=button]', function(){
	let data = $(this).parent().parent().find('td:eq(1) input').val();
	console.log(data);
	let inputId = $(this).parent().parent().find('td:eq(1) input').attr('id');
	console.log(inputId);
	
	if(data == ''){
		if(inputId == 'upw') {alert('비밀번호를 다시 입력해주세요.');}
		else if(inputId == 'unick') {alert('닉네임을 다시 입력해주세요.');}
		else if(inputId == 'umobile') {alert('연락처를 다시 입력해주세요.');}
	} else {
		if($(this).val() == '변경'){
			if(inputId == 'btnShowHiddenTr'){
				$('.hiddenTr').show();
				$('.trPw').hide();
			} else{
				let update = {uid:$('#uid').text(), optype:inputId, val:data};
				if(confirm("수정하시겠습니까?")){
					$.ajax({
						url:'update_myInfo.do',
						data:JSON.stringify(update),
						contentType:'application/json; charset=UTF-8',
						dataType:'text',
						method:'post',
						success:function(result){
							alert("수정이 완료되었습니다.");
						},
						error:function(){
							alert('Update error');
						}
					});
				}
			}
		} else if($(this).val() == '중복확인') {
			let update = {uid:$('#uid').text(), optype:inputId, val:data};
			let check = $(this).parent().parent().next().find('td:eq(1) label');
			check.css('background-color', '#ff9595');
			// db에서 검색한 결과: 존재 여부(count)
			$.ajax({
				url:'dup_check.do',
				data:JSON.stringify(update),
				contentType:'application/json; charset=UTF-8',
				dataType:'text',
				method:'post',
				success:function(result){
					console.log(result);
					if(result == '1'){
						check.text('이미 존재합니다.');
					} else {
						check.text('사용할 수 있습니다.');
					}
				},
				error:function(){
					alert('Dup Error');
				}
			});
		}
	}
	return false;
})
// 비밀번호 변경
/* .on('click', '#btnUpdatePw', function(){
	if($('#yesno').text() == '불일치'){
		alert('비밀번호를 확인해주세요!');
	} else {
		let result = confirm("수정하시겠습니까?");
		if(result){
			$.ajax({
				url:'update_myInfo.do',
				data:JSON.stringify({
					uid:$('#uid').text(),
					optype:'upw',
					val:$('#pwd').val()
					}),
				contentType:'application/json; charset=UTF-8',
				dataType:'text',
				method:'post',
				success:function(result){
					alert("수정이 완료되었습니다.");
				},
				error:function(){
					alert('error');
				}
			});
		}
	}
	return false;
}) */
// 닉네임 중복 확인
/* .on('click', '#btnNickCheck', function(){
	$('#nickCheckResult').css('background-color', '#ff9595');
	// db에서 검색한 결과: 존재 여부(count)
	$.ajax({
		url:'nick_check.do',
		data:{nick:$('#nick').val()},
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
	return false;
}) */
// 모바일번호 중복 확인
/* .on('click', '#btnMobileCheck', function(){
	$('#nickCheckResult').css('background-color', '#ff9595');
	// db에서 검색한 결과: 존재 여부(count)
	$.ajax({
		url:'nick_check.do',
		data:{nick:$('#nick').val()},
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
	return false;
}) */
/* .on('click', '#btnUpdate', function(){
	if($('#yesno').text() == '불일치'){
		alert('비밀번호를 확인해주세요!');
	} else if($('#nickCheckResult').text() == '이미 존재하는 닉네임입니다.'){
		alert('닉네임을 확인해주세요!');
	} else {
		let result = confirm("정보를 수정하시겠습니까?");
		if(result){
			let update = {
					'pw':$('#pwd').val(),
					'nick':$('#nick').val(),
					'mobile':$('#mobile').val()
					};
			console.log(update);
			$.ajax({
				url:'update_myInfo.do',
				data:JSON.stringify(update),
				contentType:'application/json; charset=UTF-8',
				dataType:'json',
				method:'post',
				success:function(){
					alert("수정이 완료되었습니다.");
				},
				error:function(){
					alert('error');
				}
			});
		}
	}
	return false;
}) */
</script>
</html>