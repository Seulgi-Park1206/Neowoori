<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>질문 상세보기</title>
</head>
<link rel="stylesheet" href="${path}/resources/psg/css/form.css" type="text/css">
<link rel="stylesheet" href="${path}/resources/psg/css/qna.css" type="text/css">
<body>
	<jsp:include page="/module/nav.jsp" flush="false" />
	<div class=form>
		<div class=contents>
			<table>
				<tr>
					<td class=tdLeft>No:</td>
					<td class=tdCenter><label class=intext id=qNum></label></td>
				</tr>
				<tr>
					<td class=tdLeft>닉네임:</td>
					<td class=tdCenter><label class=intext id=nick></label></td>
				</tr>
				<tr>
					<td class=tdLeft>제목:</td>
					<td class=tdCenter><label class=intext id=title></label></td>
				</tr>
				<tr>
					<td class=tdLeft>문의 일자:</td>
					<td class=tdCenter><label class=intext id=qDate></label></td>
				</tr>
				<tr>
					<td class=tdLeft>상태:</td>
					<td class=tdCenter><label class=intext id=state></label></td>
				</tr>
				<tr class=trExp><td class=tdLeft>문의 내용:</td><td class=tdMul><textarea id=question readonly></textarea></td></tr>
				<tr class=trExp><td class=tdLeft>답변:</td><td class=tdMul><textarea id=answer></textarea></td></tr>
			</table>
			<div class=btnDiv>
				<input type=button class=btn id=btnAnswer value="답변" />
				<input type=button class=btn id=btnCancel value="취소" />
			</div>
		</div>
	</div>
	<jsp:include page="/module/footer.jsp" flush="false" />
</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script>
$(document)
.ready(function(){
	let path = $(location).attr('pathname'); // /controller/admin/2
	let q_id = path.split('/')[3]; // [필요한 값 인덱스]
	// 질문 번호를 얻어와서 db에서 해당 문의 정보 불러오기
	$('#qNum').text(q_id);
	$('#nick').text('유저2');
	$('#title').text('제목1');
	$('#qDate').text('2021/06/08');
	$('#state').text('확인중');
	$('#question').text('질문1\n222');
	$('#answer').text('답변1\n222');
})
.on('click','#btnAnswer',function(){
	//답변 저장
})
.on('click', '#btnCancel', function(){
	location.href='';
	return false;
})
</script>
</html>