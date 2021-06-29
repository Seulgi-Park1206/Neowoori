<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>게시글 보기</title>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<link rel="stylesheet" href="${path}/resources/psg/css/form.css" type="text/css">
<link rel="stylesheet" href="${path}/resources/psg/css/postview.css" type="text/css">
<body>
	<jsp:include page="/module/nav.jsp" flush="false" />
	<div class=form>
		<a class=title>게시글 보기</a>
		<div class=contents>
			<table id=tblPost>
				<tr>
					<td class=tdLeft>제목:</td>
					<td class=tdCenter><label class=intext id=title></label></td>
				</tr>
				<tr>
					<td class=tdLeft>작성자:</td>
					<td class=tdCenter><label class=intext id=writer></label></td>
				</tr>
				<tr>
					<td class=tdLeft>작성일자:</td>
					<td class=tdCenter><label class=intext id=date></label></td>
				</tr>
				<tr>
					<td class=tdLeft>내용:</td>
					<td class=tdCenter><textarea class=intext id=contents readonly></textarea></td>
				</tr>
			</table>
			<br>
			<div class="d-grid gap-2 d-md-flex justify-content-md-end">
				<input type=button class="pull-left btn btn-outline-danger" id=btnReport value="글 신고">
				<input type=button class="btn btn-outline-primary" id=btnList value=목록>
				<input type=button class="btn btn-outline-primary" id=btnUpdate value="수정">
				<input type=button class="btn btn-outline-primary" id=btnDelete value="삭제">
			</div>
		</div>
		<div class=reply>
			<p class=title2>댓글목록</p>
			<br>
			<table id=tblReply>
			</table>
			<br>
			<div class=replyWrite>
				<textarea id=txtWrite></textarea>
				<input type=button class="btn1 btn btn-outline-primary" id=btnReply value="댓글 쓰기" />
			</div>
		</div>
	</div>
	<jsp:include page="/module/footer.jsp" flush="false" />
</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script>
let link = window.location.pathname;
link = link.split('/')[3];
$(document)
.ready(function(){
	console.log(link);
	// db에서 해당 게시물 불러오기
	$.ajax({
		url:'${path}/postView.do',
		data:link,
		contentType:'text/plain; charset=UTF-8',
		dataType:'json',
		method:'post',
		success:function(result){
			console.log(result);
			$('#title').text(result['title']);
			$('#writer').text(result['userid']);
			$('#date').text(result['postDate']);
			$('#contents').text(result['postContents']);
		},
		error:function(){
			alert('Post error');
		}
	});
	// 댓글 불러오기
	$.ajax({
		url:'${path}/postCmt.do',
		data:link,
		contentType:'text/plain; charset=UTF-8',
		dataType:'json',
		method:'post',
		success:function(rData){
			console.log(rData);
			$.each(rData, function(idx, res){
				console.log(res);
				console.log(res['userid']);
				let startTag = '<td><label class="writer">';
				let result = '<tr>' + startTag;
				let endTag = '</td></tr>';
				result += res['userid'];
				result += ' (';
				result += res['cmtDate'];
				result += ')</label><br>';
				result += '<label>';
				result += res['cmtContents'];
				result += '</label><a class=updateCmt>수정</a><a class=deleteCmt>삭제</a>';
				result += endTag;
				result += '</tr>';
				console.log(result);
				$('#tblReply').append(result);
			})
		},
		error:function(){
			alert('Cmt error');
		}
	});
})
// 댓글 쓰기
.on('click', '#btnReply', function(){
	let cmt = {pNum:link, contents:$('#txtWrite').val()}
	$.ajax({
		url:'${path}/insertCmt.do',
		data:JSON.stringify(cmt),
		contentType:'application/json; charset=UTF-8',
		dataType:'json',
		method:'post',
		success:function(res){
			console.log(res);
			console.log(res['userid']);
			let startTag = '<td><label class="writer">';
			let result = '<tr>' + startTag;
			let endTag = '</td></tr>';
			result += res['userid'];
			result += ' (';
			result += res['cmtDate'];
			result += ')</label><br>';
			result += '<label>';
			result += res['cmtContents'];
			result += '</label><a class=updateCmt>수정</a><a class=deleteCmt>삭제</a>';
			result += endTag;
			console.log(result);
			$('#tblReply').prepend(result);
		},
		error:function(){
			alert('Cmt insert error');
		}
	});
	return false;
})
/*
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
*/
</script>
</html>