<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>스터디 관리</title>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<link rel="stylesheet" href="${path}/resources/psg/css/form.css" type="text/css">
<link rel="stylesheet" href="${path}/resources/psg/css/meetadmin.css" type="text/css">
<body>
	<jsp:include page="/module/nav.jsp" flush="false" />
	<div class=form>
		<a class=title>스터디 관리</a>
		<div class=contents>
			<table>
				<tr><td class=tdLeft>모임명:</td><td class=tdRight><input type=text class=intext id=groupName readonly></td></tr>
				<tr><td class=tdLeft>관리자:</td><td class=tdRight><input type=text class=intext id=admin readonly></td></tr>
				<tr><td class=tdLeft>카테고리:</td><td class=tdRight><input type=text class=intext id=category readonly></td></tr>
				<tr><td class=tdLeft>모임장소:</td><td class=tdRight><input type=text class=intext id=place readonly></td></tr>
				<tr><td class=tdLeft>모임시간:</td><td class=tdRight><input type=text class=intext id=time readonly></td></tr>
				<tr><td class=tdLeft>진행시간:</td><td class=tdRight><input type=text class=intext id=progressTime readonly></td></tr>
				<tr><td class=tdLeft>난이도:</td><td class=tdRight><input type=text class=intext id=level readonly></td></tr>
				<tr><td class=tdLeft>모집인원:</td><td class=tdRight><input type=text class=intext id=peopleNumber readonly></td></tr>
				<tr class=trExp><td class=tdLeft>모임설명:</td><td class=tdMul colspan=2><textarea id=explain readonly></textarea></td></tr>
			</table>
			<br>
			<div class="d-grid gap-2 d-md-flex justify-content-md-end">
				<input type=button class="btn btn-outline-primary" id=btnUpdateInfo value="스터디 정보 수정">
				<input type=button class="btn btn-outline-primary" onclick="go_adminUser()" value=회원관리>
				<input type=button class="btn btn-outline-primary" onclick="go_adminBoard()" value="게시판 관리">
				<input type=button class="btn btn-outline-primary" id=btnDeleteStudy value="스터디 삭제">
				<input type=button class="btn btn-outline-primary" onclick="cancel()" value="취소">
			</div>
		</div>
	</div>
	<jsp:include page="/module/footer.jsp" flush="false" />
</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script>
function go_adminUser(){
	location.href = '';
}
function go_adminBoard(){
	location.href = '';
}
function cancel(){
	window.history.back();
}
$(document)
.ready(function(){
	$('#groupName').val('가나다라');
	$('#admin').val('봉봉');
	$('#category').val('프로그래밍 > 자바');
	$('#place').val('휴먼교육센터');
	$('#time').val('월, 화, 수, 목 / 18:30 부터');
	$('#progressTime').val('2시간');
	$('#level').val('초급');
	$('#peopleNumber').val('1/4');
	$('#explain').val('blabla');
})
.on('click', '#btnUpdateInfo', function(){
	if($('#groupName').prop('readonly') == true){
		$('input').prop('readonly', false);
		$('#explain').prop('readonly', false);
	} else{
		let result = confirm("정보를 수정하시겠습니까?");
		if(result){
			alert("수정이 완료되었습니다.");
		}
		// 수정된 정보 저장
		$('input').prop('readonly', true);
		$('#explain').prop('readonly', true);
	}
	
	return false;
})
/* .on('click', '#btnAdminUser', function(){
	location.href='';
	return false;
}) */
/* .on('click', '#btnAdminBoard', function(){
	location.href='';
	return false;
}) */
.on('click', '#btnDeleteStudy', function(){
	// 스터디 폐쇄
	return false;
})
/* .on('click', '#btnCancel', function(){
	window.history.back();
	return false;
}) */
</script>
</html>