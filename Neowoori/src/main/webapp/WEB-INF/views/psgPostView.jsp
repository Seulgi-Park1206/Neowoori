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
				<input type=button class="btn btn-outline-primary" id=btnList onclick="goList()" value=목록>
				<input type=button class="btn btn-outline-primary" id=btnUpdate value="수정">
				<input type=button class="btn btn-outline-primary" id=btnDelete value="삭제">
			</div>
			<div class=reply>
				<p class=title2>댓글목록</p>
				<br>
				<table id=tblReply>
				</table>
				<br>
				<div class=replyWrite>
					<textarea id=txtWrite placeholder="댓글을 입력하세요." cols="20" wrap="hard"></textarea>
					<input type=button class="btn1 btn btn-outline-primary" id=btnReply value="댓글 쓰기" />
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/module/footer.jsp" flush="false" />
</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script>
let link = window.location.pathname;
link = link.split('/')[3];

function goList(){
	//window.location="${path}/studypost/${s_num}";
	window.location="${path}/studypost";
}
function addComment(res){
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
	result += '</label><td class=cmtAbout><a class=updateCmt>수정</a><a class=deleteCmt>삭제</a></td>';
	result += endTag;
	console.log(result);
	
	return result;
}
function loadView(){
	$.ajax({
		url:'${path}/postView.do',
		data:link,
		contentType:'text/plain; charset=UTF-8',
		dataType:'json',
		method:'post',
		success:function(result){
			console.log(result);
			loadView();
			$('#title').text(result['title']);
			$('#writer').text(result['userid']);
			$('#date').text(result['postDate']);
			$('#contents').text(result['postContents']);
			if($('#writer').text() == uid) {
				$('#btnUpdate, #btnDelete').show();
			}
		},
		error:function(){
			alert('Post error');
		}
	});
}
$(document)
.ready(function(){
	console.log(link);
	let uid = '${userid}';
	uid = 'human1';
	// db에서 해당 게시물 불러오기
	/* $.ajax({
		url:'${path}/postView.do',
		data:link,
		contentType:'text/plain; charset=UTF-8',
		dataType:'json',
		method:'post',
		success:function(result){
			console.log(result);
			loadView();
			$('#title').text(result['title']);
			$('#writer').text(result['userid']);
			$('#date').text(result['postDate']);
			$('#contents').text(result['postContents']);
			if($('#writer').text() == uid) {
				$('#btnUpdate, #btnDelete').show();
			}
		},
		error:function(){
			alert('Post error');
		}
	}); */
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
				$('#tblReply').append(addComment(res));
			})
		},
		error:function(){
			alert('Cmt error');
		}
	});
})
// 댓글 쓰기
.on('click', '#btnReply', function(){
	if('${userid}' != ""){ // 로그인을 하지 않은 경우 실행 x
		let cmt = {pNum:link, contents:$('#txtWrite').val()}
		$.ajax({
			url:'${path}/insertCmt.do',
			data:JSON.stringify(cmt),
			contentType:'application/json; charset=UTF-8',
			dataType:'json',
			method:'post',
			success:function(res){
				$('#tblReply').prepend(addComment(res));
				$('#txtWrite').val('');
			},
			error:function(){
				alert('Cmt insert error');
			}
		});		
	} else {
		alert('로그인 해!!');
	}
	return false;
})
// 게시물 삭제
.on('click', '#btnDelete', function(){
	$.ajax({
		url:'${path}/deletePost.do',
		data:link,
		contentType:'text/plain; charset=UTF-8',
		method:'post',
		dataType:'text',
		success:function(result){
			console.log(result);
			alert('Succeed to delete (no.'+link+' post)');
			goList();
		},
		error:function(){
			alert('Post delete error');
		}
	});
	return false;
})
// 게시물 수정
.on('click', '#btnUpdate', function(){
	sessionStorage.setItem('pNum',link);
	let update = {type:"view", pNum:link, title:$('#title').val(), contents:$('#contents').val()};
	$.ajax({
		url:'${path}/UpdatePost.do',
		data:JSON.stringify(update),
		contentType:'application/json; charset=UTF-8',
		dataType:'text',
		method:'post',
		success:function(result){
			//alert("수정이 완료되었습니다.");
			//loadView();
		},
		error:function(){
			alert('Update error');
		}
	});
})
</script>
</html>