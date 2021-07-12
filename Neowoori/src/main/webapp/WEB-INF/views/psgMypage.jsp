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
			<table class="table">
				<tr>
					<th class="tdLeft table-light align-middle">아이디:</th>
					<td colspan=2 class="tdCenter align-middle"><label class="intext align-middle" id=uid>${member.userId}</label></td>
				</tr>
				<tr class=trPw>
					<th class="tdLeft table-light align-middle">비밀번호:</th>
					<td colspan=2 class="tdCheck align-middle"><input type=button class="btn btn-outline-secondary" id=btnShowHiddenTr value="변경" /></td>
				</tr>
				<tr class=hiddenTr>
					<th class="tdLeft table-light align-middle">새 비밀번호:</th>
					<td class="tdCenter align-middle"><input type=password class="intext align-middle inp" id=upw1 placeholder="새 비밀번호를 입력하세요." /></td>
					<td class="tdCheck align-middle"><label class="intext align-middle"  id=yesNo></label></td>
				</tr>
				<tr class=hiddenTr>
					<th class="tdLeft table-light align-middle">새 비밀번호 확인:</th>
					<td class="tdCenter align-middle"><input type=password class="intext align-middle inp" id=upw placeholder="다시 한번 입력하세요." /></td>
					<td class="tdCheck align-middle"><input type=button class="btn btn-outline-secondary" id=btnUpdatePw value="변경" /></td>
				</tr>
				<tr>
					<th class="tdLeft table-light align-middle">이름:</th>
					<td colspan=2 class="tdCenter align-middle"><label class="intext align-middle"  id=uname>${member.uName}</label></td>
				</tr>
				<tr>
					<th class="tdLeft table-light align-middle">닉네임:</th>
					<td class="tdCenter align-middle"><input type=text class="intext align-middle inp" id=unick placeholder="닉네임을 입력하세요." />
					</td>
					<td class="tdCheck align-middle">
						<input type=button class="btn btn-outline-secondary" id=btnNickCheck value="중복확인" />
						<input type=button class="btn btn-outline-secondary" id=btnUpdateNick value="변경" /></td>
				</tr>
				<tr class="hidden align-top"><th class="table-light align-middle"></th><td colspan=2 class="tdCheck align-middle"><label id=nickCheckResult></label></td></tr>
				<tr>
					<th class="tdLeft table-light align-middle">생년월일:</th>
					<td colspan=2 class="tdCenter align-middle"><label class="intext align-middle" id=birth>${member.uYear}${member.uBirthday}</label></td>
				</tr>
				<tr>
					<th class="tdLeft table-light align-middle">성별:</th>
					<td colspan=2 class="tdCenter align-middle"><label class="intext align-middle" id=gender>${member.uGender}</label></td>
				</tr>
				<tr>
					<th class="tdLeft table-light align-middle">연락처:</th>
					<td class="tdCenter align-middle"><input type=text class="intext align-middle inp" id=umobile placeholder="연락처를 입력하세요." /></td>
					<td class="tdCheck align-middle">
						<input type=button class="btn btn-outline-secondary" id=btnMobileCheck value="중복확인" />
						<input type=button class="btn btn-outline-secondary" id=btnUpdateMobile value="변경" /></td>
				</tr>
				<tr class="hidden align-top"><th class="table-light align-middle"></th><td colspan=2 class="tdCheck align-middle"><label id=mobileCheckResult></label></td></tr>
				<tr>
					<th class="tdLeft table-light align-middle">이메일:</th>
					<td colspan=2 class="tdCenter align-middle"><label class="intext align-middle"  id=email>${member.uMail}</label></td>
				</tr>
			</table>
		</div>
	</div>
	<!-- alertModal -->
	<jsp:include page="/module/alertModal.jsp" flush="false" />
	<!-- footer -->
	<jsp:include page="/module/footer.jsp" flush="false" />
</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script>
function cancel(){
	location.href='index';
}
$(document)
.ready(function(){
	$('#unick').val('${member.uNick}');
	$('#umobile').val('${member.uMobile}');
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
	var data = $(this).parent().parent().find('td:eq(0) input').val();
	console.log('data: ' + data);
	let inputId = $(this).parent().parent().find('td:eq(0) input').attr('id');
	console.log('inputId: ' + inputId);
	
	if(data == ''){
		if(inputId == 'upw') {alert('비밀번호를 다시 입력해주세요.');}
		else if(inputId == 'unick') {alert('닉네임을 다시 입력해주세요.');}
		else if(inputId == 'umobile') {alert('연락처를 다시 입력해주세요.');}
	} else {
		var check = $(this).parent().parent().next().find('td:eq(0) label');
		console.log('check: ' + check.attr('id'));
		if($(this).val() == '변경'){
			if(inputId == 'btnShowHiddenTr'){
				$('.hiddenTr').show();
				$('.trPw').hide();
			} else{
				if(check.text() == '이미 존재합니다.'){
					alert('중복된 정보입니다. 다시 입력 바랍니다.')
				} else {
					let update = {uid:$('#uid').text(), optype:inputId, val:data};
					if(confirm('수정하시겠습니까?')){
						$.ajax({
							url:'update_myInfo.do',
							data:JSON.stringify(update),
							contentType:'application/json; charset=UTF-8',
							dataType:'text',
							method:'post',
							success:function(result){
								alertModal('수정', '수정이 완료되었습니다.');
							},
							error:function(){
								alert('Update error');
							}
						});
					}					
				}
			}
		} else if($(this).val() == '중복확인') {
			$(this).parent(). parent().next().show();
			var update = {uid:$('#uid').text(), optype:inputId, val:data};
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
					alertModal('중복체크', 'Dup Error');
				}
			});
		}
	}
	return false;
})
</script>
</html>