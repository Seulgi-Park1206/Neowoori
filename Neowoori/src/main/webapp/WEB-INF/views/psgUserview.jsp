<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>유저 정보</title>
</head>
<link rel="stylesheet" href="${path}/resources/psg/css/form.css" type="text/css">
<link rel="stylesheet" href="${path}/resources/psg/css/userview.css" type="text/css">
<body>
	<jsp:include page="/module/nav.jsp" flush="false" />
	<div class=form>
		<a class=title>유저 정보</a>
		<div class=contents>
			<table>
				<tr>
					<td class=tdLeft>아이디:</td>
					<td class=tdCenter><label class=intext id=uid></label></td>
				</tr>
				<tr>
					<td class=tdLeft>유저 번호:</td>
					<td class=tdCenter><label class=intext id=uNum></label></td>
				</tr>
				<tr>
					<td class=tdLeft>닉네임:</td>
					<td class=tdCenter><label class=intext id=nick></label></td>
				</tr>
				<tr>
					<td class=tdLeft>성별:</td>
					<td class=tdCenter><label class=intext id=gender></label></td>
				</tr>
				<tr>
					<td class=tdLeft>생년월일:</td>
					<td class=tdCenter><label class=intext id=birth></label></td>
				</tr>
				<tr>
					<td class=tdLeft>연락처:</td>
					<td class=tdCenter><label class=intext id=mobile></label></td>
				</tr>
				<tr>
					<td class=tdLeft>이메일:</td>
					<td class=tdCenter><label class=intext id=email></label></td>
				</tr>
				<tr>
					<td class=tdLeft>제재 횟수:</td>
					<td class=tdCenter><label class=intext id=cnt></label></td>
				</tr>
				<tr><td class=tdLeft>제재 내역/번호:</td><td class=tdMul><textarea id=list readonly></textarea></td></tr>
			</table>
		</div>
	</div>
	<jsp:include page="/module/footer.jsp" flush="false" />
</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script>
$(document)
.ready(function(){
	// 수정 필요: 관리자 페이지에서 클릭한 유저 번호 받아오기
	let user_id = ${u_id};
	// db에서 해당 유저 정보 불러오기
	$('#uid').text('human123');
	$('#uNum').text('0001');
	$('#nick').text('봉봉');
	$('#gender').text('남');
	$('#birth').text('1995/12/07');
	$('#mobile').text('010-8225-2833');
	$('#email').text('human123@naver.com');
	$('#cnt').text('2번');
	$('#list').text('욕설/2\n욕설/4');
})
</script>
</html>