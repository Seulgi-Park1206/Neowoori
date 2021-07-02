<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
					<td class=tdCenter><label class=intext id=title>${post.title}</label></td>
				</tr>
				<tr>
					<td class=tdLeft>작성자:</td>
					<td class=tdCenter><label class=intext id=writer>${post.userid}</label></td>
				</tr>
				<tr>
					<td class=tdLeft>작성일자:</td>
					<td class=tdCenter><label class=intext id=date>${post.post_date}</label></td>
				</tr>
				<tr class=trContxt>
					<td class=tdLeft>내용:</td>
					<td class=tdCenter><textarea class=intext id=contents readonly>${post.post_contents}</textarea></td>
				</tr>
			</table>
			<br>
			<div class="d-grid gap-2 d-md-flex justify-content-md-end">
				<input type=button class="pull-left btn btn-outline-danger" id=btnReport value="글 신고">
				<input type=button class="btn btn-outline-primary" id=btnList onclick="goList()" value=목록>
				<input type=button class="btn btn-outline-primary" id=btnUpdate value="수정">
				<input type=button class="btn btn-outline-primary" id=btnComplete value="수정 완료">
				<input type=button class="btn btn-outline-primary" id=btnDelete value="삭제">
			</div>
			<div class=reply>
				<p class=title2>댓글목록</p>
				<br>
				<table id=tblReply>
					<c:forEach var="c" items="${cmt}">
						<tr><td class=hidCnum>${c.cmtnum}</td>
						<td class=tdView><label class="writer">${c.userid}</label>
							<label> (${c.cmt_date})</label>
							<div class=cmtAbout>
								<a class=updateCmt>수정</a>
								<a class=deleteCmt>삭제</a>
								<a class=reCmt>댓글</a>
							</div>
							<%-- <c:set var="con" value="${c.cmt_contents}" />
							<c:set var="br" value="<br>" />
							<c:set var="crcn" value="\r\n" />
							<c:set var="contents" value="${fn:replace(con, br, crcn)}" /> --%>
							<textarea class=cmtTxt readonly>${c.cmt_contents}</textarea></td>
						<!-- <td class=cmtAbout><a class=updateCmt>수정</a>
							<a class=deleteCmt>삭제</a>
							<a class=reCmt>댓글</a></td> -->
						</tr>
					</c:forEach>
				</table>
				<br>
				<div class=replyWrite>
					<textarea id=txtWrite placeholder="댓글을 입력하세요."></textarea>
					<input type=button class="btn1 btn btn-outline-primary" id=btnReply value="댓글 쓰기" />
				</div>
				<div id="test_cnt">(0 / 100)</div>
			</div>
		</div>
	</div>
	<jsp:include page="/module/footer.jsp" flush="false" />
</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script>
// 스터디 게시글 번호
var link = window.location.pathname;
link = link.split('/')[3];
// 스터디 게시판 목록으로 가기
function goList(){
	window.location="${path}/studypost/${s_num}";
	//window.location="${path}/studypost";
}

// 댓글 추가
function addComment(res){
	console.log(res);
	console.log(res['userid']);
	var result = '<tr><td class=hidCnum>';
	result += res['cmtnum'];
	result += '</td><td class=tdView><label class="writer">';
	result += res['userid'];
	result += ' (';
	result += res['cmtDate'];
	result += ')</label><div class=cmtAbout><a class=updateCmt>수정</a><a class=deleteCmt>삭제</a><a class=reCmt>댓글</a></div>';
	result += '<textarea class=cmtTxt readonly>';
	result += res['cmtContents'];
	result += '</textarea></td></tr>';
	console.log(result);
	
	return result;
}

// 본문 내용 크기에 맞게 높이 자동 조절
function adjustHeight() {
	var contents = $('#contents');
	contents[0].style.height = 'auto';
    var contentsHeight = contents.prop('scrollHeight');
    contents.css('height', contentsHeight);
}

// 댓글 내용 크기에 맞게 높이 자동 조절
function adjustCmtHeight() {
    var cmt = $('.cmtTxt');
    cmt[0].style.height = 'auto';
    var cmtHeight = cmt.prop('scrollHeight');
    cmt.css('height', cmtHeight);
}
// 댓글 줄바꿈 체크
function Check(){
	// 첫 글자 체크
	var str = $("#txtWrite").val();
	if(str[0] != "")
	// 줄바꿈 체크
	var str_arr = str.split("\n");  // 줄바꿈 기준으로 나눔 
	var row = str_arr.length;  // row = 줄 수 

	if(row >10){
	//마지막 입력문자 삭제
	alert("10줄 이상 입력할 수 없습니다.")
	var lastChar = str.slice(0,-1); //열 
	$("#aaaa").val(lastChar)
	}
}

$(document)
.ready(function(){
	console.log(link);
	var uid = '${userid}';
	uid = 'human1';
	if($('#writer').text() == uid) {
		$('#btnUpdate, #btnDelete').show();
	}
	adjustHeight();
	adjustCmtHeight();
})
// 댓글 입력 시
.on('keyup', '#txtWrite', function() {
	$('#test_cnt').html("("+$(this).val().length+" / 100)");
	/* // 줄바꿈에 따라 높이 자동 조절
	$(this).css("height", "auto");
	$(this).parent().css("height", "auto");
    $(this).height(this.scrollHeight); */
    // 글자수 제한
	if($(this).val().length > 100) {
		$(this).val($(this).val().substring(0, 100));
		$('#test_cnt').html("(100 / 100)");
	}
})
// 댓글 쓰기
.on('click', '#btnReply', function(){
	if('${userid}' != ""){ // 로그인을 하지 않은 경우 실행 x
		var cmt = {pNum:link, contents:$('#txtWrite').val()};
		if(cmt['contents'] != "")
		$.ajax({
			url:'${path}/insertCmt.do',
			data:JSON.stringify(cmt),
			contentType:'application/json; charset=UTF-8',
			dataType:'json',
			method:'post',
			success:function(res){
				$('#tblReply').prepend(addComment(res));
				adjustCmtHeight();
				$('#txtWrite').val('');
				$('#test_cnt').html("(0 / 100)");
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
// 댓글 삭제
.on('click', '.deleteCmt', function(){
	if('${userid}' == $('#writer').text()){
		console.log('writer');
	}
	let cNum = $(this).parent().parent().find('td:eq(0)').text();
	console.log(cNum);
	let delCmt = {postNum:link, coNum:cNum};
	
	$.ajax({
		url:'${path}/deleteCmt.do',
		data:JSON.stringify(delCmt),
		contentType:'application/json; charset=UTF-8',
		method:'post',
		dataType:'text',
		success:function(result){
			console.log(result);
			$(this).parent().parent().remove();
			alert('댓글이 삭제되었습니다.');
		},
		error:function(){
			alert('Cmt delete error');
		}
	});
	return false;
})
// 게시물 수정
.on('click', '#btnUpdate', function(){
	//sessionStorage.setItem('pNum',link);
	console.log('수정 버튼 클릭');
	
	let update = {type:"view", pNum:link, title:$('#title').text(), contents:$('#contents').val()};
	$.ajax({
		url:'${path}/updatePost.do',
		data:JSON.stringify(update),
		contentType:'application/json; charset=UTF-8',
		method:'post',
		success:function(){
		},
		error:function(){
			alert('Update error');
		}
	});
})
</script>
</html>