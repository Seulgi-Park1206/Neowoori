  
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
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js" integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT" crossorigin="anonymous"></script>
<link rel="stylesheet" href="${path}/resources/psg/css/form.css" type="text/css">
<link rel="stylesheet" href="${path}/resources/psg/css/postview.css" type="text/css">
<body>
	<!-- header -->
	<jsp:include page="/module/nav.jsp" flush="false" />
	<div class=form>
		<a class=title>게시글 보기</a>
		<div class=contents>
			<table id=tblPost class="table table-bordered">
				<tr>
					<th class="tdLeft table-light align-middle">제목:</th>
					<td colspan=3 class="tdright align-middle"><label class=intext id=title>${post.title}</label></td>
				</tr>
				<tr>
					<th class="tdLeft table-light align-middle">작성자:</th>
					<td class="tdCenter align-middle"><label class=intext id=writer>${post.userid}</label></td>
					<th class="tdLeft table-light align-middle">작성일자:</th>
					<td class="tdCenter align-middle"><label class=intext id=date>${post.post_date}</label></td>
				</tr>
				<tr class=trContxt>
					<th class="tdLeft table-light align-middle">내용:</th>
					<td colspan=3 class="tdRight align-middle"><textarea class=intext id=content readonly>${post.post_contents}</textarea></td>
				</tr>
			</table>
			<br>
			<div class="gap-2 d-md-flex justify-content-md-end">
				<input type=button class="btn btn-outline-secondary" id=btnList onclick="goList()" value=목록>
				<input type=button class="btn btn-outline-secondary" id=btnUpdate data-bs-toggle="modal" data-bs-target="#updateModal" value="수정">
				<input type=button class="btn btn-outline-secondary" id=btnDelete value="삭제">
			</div>
			<div class=reply>
				<p class=title2>댓글</p>
				<br>
				<table id=tblReply>
					<c:forEach var="c" items="${cmt}">
						<tr>
							<td class=hidCnum>${c.cmtnum}</td>
							<td class=tdView>
								<label class="writer">${c.userid} (${c.cmt_date})</label>
								<div class=cmtAbout>
									<a class=updateCmt>수정</a>
									<a class=deleteCmt>삭제</a>
									<a class=reCmt>댓글</a>
								</div>
								<textarea class="cmtTxt form-control" readonly>${c.cmt_contents}</textarea>
							</td>
						</tr>
					</c:forEach>
				</table>
				<br>
				<div class="replyWrite input-group mb-3">
					<textarea id=txtWrite class="form-control" placeholder="댓글을 입력하세요." aria-label="댓글을 입력하세요." aria-describedby="btnReply"></textarea>
					<button class="btn btn-outline-secondary" type="button" id="btnReply">댓글 쓰기</button>
				</div>
				<div id="test_cnt">(0 / 100)</div>
			</div>
		</div>
	</div>
	<!-- 게시글 수정 modal -->
	<div class="modal fade" id="updateModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="updateModalLabel">게시물 수정</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	      	<div class="mb-3">
	          <label for="recipient-name" class="col-form-label">제목:</label>
	          <input type="text" class="form-control" id="postTitle" placeholder="제목을 입력하세요.">
	        </div>
	        <div class="mb-3">
	          <label for="message-text" class="col-form-label">내용:</label>
	          <textarea class="form-control myscrollbar" id="postContents" placeholder="내용을 입력하세요."></textarea>
	        </div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id=btnCloseModal>취소</button>
	        <button type="button" class="btn btn-primary" id=btnUpdateComplete data-bs-dismiss="modal">수정 완료</button>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- 댓글/대댓글 수정 Modal -->
	<div class="modal fade" id="updateCmtModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="updateCmtModalLabel">댓글 수정</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <div class="mb-3">
	          <label for="message-text" class="col-form-label">내용:</label>
	          <textarea class="form-control myscrollbar" id="updateCmtContents" placeholder="내용을 입력하세요."></textarea>
	        </div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id=btnCloseCmtModal>취소</button>
	        <button type="button" class="btn btn-primary" id=btnupdateCmtComplete data-bs-dismiss="modal">수정 완료</button>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- alert -->
	<jsp:include page="/module/alertModal.jsp" flush="false" />
	<!-- confirm -->
	<jsp:include page="/module/confirmModal.jsp" flush="false" />
	<!-- 댓글 번호 -->
	<input type=hidden id=hiddenCnum />
	
	<!-- footer -->
	<jsp:include page="/module/footer.jsp" flush="false" />
</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script>
// 스터디 게시글 번호
var link = window.location.pathname;
link = link.split('/')[3];

// 스터디 게시판 목록으로 가기
function goList(){
	window.location="${path}/meetView/${s_num}";
}
// 댓글 추가
function addComment(res){
	console.log(res);
	console.log(res['userid']);
	
	var result = '<tr><td class="hidCnum">';
	result += res['cmtnum'];
	result += '</td><td class=tdView><label class="writer">';
	result += res['userid'];
	result += ' (';
	result += res['cmtDate'];
	result += ')</label><div class="cmtAbout">'
	result += '<a class="updateCmt">수정</a><a class="deleteCmt">삭제</a><a class="reCmt">댓글</a>';
	result += '</div><textarea class="cmtTxt form-control" readonly>';
	result += res['cmtContents'];
	result += '</textarea></td></tr>';
	console.log(result);
	
	return result;
}
// 대댓글 쓰기
function writeReComment(){
	var result = '<div class="replyWrite input-group w">';
	
	result += '<span class="input-group-text" id="spanReply">';
	result += '<img class="replyArrow" src="${path}/resources/img/reply_arrow.png"></span>';
	result += '<input type="text" class="txtWrite form-control" placeholder="댓글을 입력하세요."/>';
	result += '<button class="btnReCmt btn btn-outline-secondary" type="button">댓글 쓰기</button></div>';
	
	return result;
}
// 대댓글 추가
function addReCmt(res){
	var result = '<a class="hidReCnum">';
	
	result += res['cmtnum'];
	result += '</a><div class="replyView input-group w"><span class="input-group-text" id="spanReply">'
	result += '<img class="replyArrow" src="${path}/resources/img/reply_arrow.png"></span>';
	result += '<label class="form-control">';
	result += res['userid'];
	result += ' (';
	result += res['cmtDate'];
	result += ')<div class="dropdown">';
	result += '<a role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">';
	result += '<img class="replyDropdown" src="${path}/resources/img/three_dots.png"></a>';
	result += '<ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">';
	result += '<li><a class="updateReCmt dropdown-item">수정</a></li>';
	result += '<li><a class="deleteReCmt dropdown-item">삭제</a></li>';	
	result += '</ul></div><br><label class="reCmtTxt">';
	result += res['cmtContents'];
	result += '</label></label></div>';
	console.log(result);
	
	return result;
}
// 댓글/대댓글 수정/삭제
/* function dropdownMenu(){
	var dropdown = 
} */
// 본문 내용 크기에 맞게 높이 자동 조절
function adjustHeight() {
	var contents = $('#content');
	contents[0].style.height = 'auto';
    var contentsHeight = contents.prop('scrollHeight');
    contents.css('height', contentsHeight);
}
// modal 본문 내용 크기에 맞게 높이 자동 조절
function adjustModalHeight() {
	var contents = $('#postContents');
	contents[0].style.height = 'auto';
    var contentsHeight = contents.prop('scrollHeight');
    //console.log('postContents: ' + contentsHeight);
    contents.css('height', contentsHeight);
}
// 댓글 줄바꿈 체크
function Check(){
	var str_arr = str.split("\n");  // 줄바꿈 기준으로 나눔 
	var row = str_arr.length;  // row = 줄 수 
	if(row > 2){
	//마지막 입력문자 삭제
	alert("3줄 이상 입력할 수 없습니다.")
	var lastChar = str.slice(0,-1); //열 
	$("#txtWrite").val(lastChar)
	}
}
// 댓글 초기화
function clearCmt() {
	$('#txtWrite').val('');
	$('#test_cnt').html("(0 / 100)");
}

$(document)
.ready(function(){
	console.log(link);
	var uid = '${userid}';
	uid='human1';
	if($('#writer').text() == uid) {
		$('#btnUpdate, #btnDelete').show();
	}
	adjustHeight();
})

// 댓글 입력 시
.on('keyup', '#txtWrite', function() {
	$('#test_cnt').html("("+$(this).val().length+" / 100)");
    // 글자수 제한
	if($(this).val().length > 100) {
		$(this).val($(this).val().substring(0, 100));
		$('#test_cnt').html("(100 / 100)");
	}
})

// 댓글 쓰기
.on('click', '#btnReply', function(){
	if('${userid}' != ""){ // 로그인을 하지 않은 경우 실행 x
		var cmt = $('#txtWrite').val().trim();
		if(cmt == null || cmt == ''){
			alertModal('댓글 쓰기','댓글 내용을 입렵하세요.');
		}else {
			var cmt = {pNum:link, contents:$('#txtWrite').val().trim()};
			$.ajax({
				url:'${path}/insertCmt.do',
				data:JSON.stringify(cmt),
				contentType:'application/json; charset=UTF-8',
				dataType:'json',
				method:'post',
				success:function(res){
					alertModal('댓글 등록', '댓글이 등록되었습니다.');
					$('#tblReply').prepend(addComment(res));
					clearCmt();
				},
				error:function(){
					alert('Cmt insert error');
				}
			});		
		}
	}else {
			alertModal('댓글 등록', '로그인이 필요합니다.');
			clearCmt();
			location.href='${path}/login';
	}
	
	return false;
})

// 게시물 삭제 버튼 클릭
.on('click', '#btnDelete', function(){
	confirmModal('게시물 삭제', '정말 게시물을 삭제하시겠습니까?');
})

// 댓글 삭제 클릭
.on('click', '.deleteCmt', function(){
	var cmt = $(this).parent().siblings('.cmtTxt');
	var writer = cmt.siblings('.writer').text();
	writer = writer.split(' (')[0];
	console.log('작성자: '+writer);
	var modalTitle = '댓글 삭제';
	if('${userid}' == writer){
		$('#hiddenCnum').text($(this).parent().parent('td').siblings('.hidCnum').text());
		confirmModal(modalTitle, '정말 댓글을 삭제하시겠습니까?');
	} else {
		alertModal(modalTitle, '작성자가 아닙니다.');
	}
	
	return false;
})

// 삭제 기능
.on('click', '#btnYes', function(){
	var th = $(this).parent().siblings('.modal-header').children().text();
	console.log('th: ' + th);
	if(th == '게시물 삭제'){
		$.ajax({
			url:'${path}/deletePost.do',
			data:link,
			contentType:'text/plain; charset=UTF-8',
			method:'post',
			dataType:'text',
			success:function(result){
				alertModal(th, 'Succeed to delete (no.'+link+' post)');
				goList();
			},
			error:function(){
				alert('Post delete error');
			}
		});	
	} else {	// 댓글/대댓글 삭제
		let cNum = $('#hiddenCnum').text();
		//console.log('cNum: '+cNum);
		if(th == ('댓글 삭제'))	cmtType = '댓글';
		else	cmtType = '대댓글';
		let delCmt = {type:cmtType, postNum:link, coNum:cNum};
		//console.log(delCmt);
		
		$.ajax({
			url:'${path}/deleteCmt.do',
			data:JSON.stringify(delCmt),
			contentType:'application/json; charset=UTF-8',
			method:'post',
			dataType:'text',
			success:function(result){
				if(result == 'cmt'){ // 댓글 삭제
					// 해당 댓글 삭제
					$('#tblReply tr').each(function(index, tr){
						if($(this).find('td:eq(0)').text() == cNum){
							$(this).remove();
							
							return false;
						}
					});					
				} else { // 대댓글 삭제
					console.log(result);
					// 해당 대댓글 삭제
					$('.hidReCnum').each(function(index, upCmt){
						console.log(index+': '+$(this).text()+'/'+$('#hiddenCnum').text());
						if($(this).text() == $('#hiddenCnum').text()){ // 수정 중인 댓글
							console.log('--- 삭제!');
							var idx = $(this).index();
							$(this).siblings(':eq('+idx+')').remove();
							$(this).remove();
							
							return false;
						}
					});
				}			
				
				// alert
				alertModal(th, '댓글이 삭제되었습니다.');
			},
			error:function(){
				alert('Cmt delete error');
			}
		});
	}
	
	return false;
})

// 게시물 수정 버튼 클릭
.on('click', '#btnUpdate', function(){
	console.log('수정 버튼 클릭');
	// 모달창으로 게시글 수정
	$('#postTitle').val($('#title').text());
	$('#postContents').val($('#content').text());
	$('#updateModal').modal('show');
})

// 게시물 수정 기능
.on('click', '#btnUpdateComplete', function(){
	var update = {pNum:link, title:$('#postTitle').val(), contents:$('#postContents').val()};
	$.ajax({
		url:'${path}/updatePost.do',
		data:JSON.stringify(update),
		contentType:'application/json; charset=UTF-8',
		method:'post',
		success:function(){
			alertModal('게시물 수정', '수정이 완료되었습니다.');
			$('#title').text($('#postTitle').val());
			$('#content').text($('#postContents').val());
			adjustModalHeight();
		},
		error:function(){
			alert('Update error');
		}
	});
	
	return false;
})

// 댓글 수정 클릭
.on('click', '.updateCmt', function(){
	// 해당 댓글 번호
	$('#hiddenCnum').text($(this).parent().parent('td').siblings('.hidCnum').text());
	var cmt = $(this).parent().siblings('.cmtTxt');
	console.log('댓글 수정 클릭: '+cmt.attr('class'));
	var writer = cmt.siblings('.writer').text();
	writer = writer.split(' (')[0];
	console.log('작성자: '+writer);
	if('${userid}' == writer){
		// 댓글 수정 Modal 보기
		$('#updateCmtContents').val(cmt.text());
		$('#updateCmtModal').modal('show');
	} else {
		alertModal('댓글 수정', '작성자가 아닙니다.');
	}
		
	return false;
})

// 댓글/대댓글 수정 완료 클릭
.on('click', '#btnupdateCmtComplete', function(){
	console.log('수정 완료 클릭');
	var cmtType = '';
	var updateTxt = '';
	
	if($('#updateCmtContents').val() == '') alertModal('댓글 수정','내용을 입력하세요.');
	else {
		if($('#updateModalLabel').text() == '댓글 수정'){
			cmtType = '댓글';
			// 수정한 댓글이 있는 textarea
			var txt = $(this).parent().siblings('.modal-body').children('div').children('textarea');
			console.log('수정한 댓글 입력: '+txt.val());
			// 수정된 댓글 내용으로 바꾸기
			$('.hidCnum').each(function(index, upCmt){
				console.log(index+': '+$(this).text()+'/'+$('#hiddenCnum').text());
				if($(this).text() == $('#hiddenCnum').text()){ // 수정 중인 댓글
					updateTxt = txt.val().trim();
					$(this).siblings('.tdView').children('.cmtTxt').val(updateTxt);
				}
			});
			
		}else {
			cmtType = '대댓글';
			console.log('대댓글 수정이야');
			// 수정한 대댓글이 있는 textarea
			var txt = $(this).parent().siblings('.modal-body').children('div').children('textarea');
			console.log('수정한 댓글 입력: '+txt.val());
			// 수정된 대댓글 내용으로 바꾸기
			$('.hidReCnum').each(function(index, upCmt){
				console.log(index+': '+$(this).text()+'/'+$('#hiddenCnum').text());
				if($(this).text() == $('#hiddenCnum').text()){ // 수정 중인 댓글
					console.log('--- 수정!');
					var idx = $(this).index();
					console.log('idx: '+idx);
					var upReCmt = $(this).siblings(':eq('+idx+')').children('label').children('label');	//.reCmtTxt
					console.log('upReCmt: '+upReCmt.text());
					updateTxt = txt.val().trim();
					upReCmt.text(updateTxt);
					
					return false;
				}
			});
			console.log('updateTxt: '+updateTxt);
		}
		
		// 수정한 댓글 db에 저장
		var cmt = {type:cmtType, pNum:link, cNum:$('#hiddenCnum').text(), contents:updateTxt};
		console.log('cmt: '+cmt);
		$.ajax({
			url:'${path}/updateCmt.do',
			data:JSON.stringify(cmt),
			contentType:'application/json; charset=UTF-8',
			method:'post',
			success:function(){
				alertModal('댓글 수정', '수정이 완료되었습니다.');
			},
			error:function(){
				alert('Update error');
			}
		});
	}
	
	return false;
})

// 댓글 클릭(대댓글 쓰기) 클릭
.on('click', '.reCmt', function(){
	console.log('-----------------------------------------------------');
	var divCount = $(this).parent().parent().children('div');
	var divCount_class = divCount.attr('class'); // .cmtAbout
	console.log('tdView 내의 div 개수: '+divCount.length);
	console.log('class: ' + divCount_class);
	
	// 해당 댓글 번호
	var replyNum = $(this).parent().parent().siblings('.hidCnum').text();
	console.log('replyNum: '+replyNum);
	// 추가할 위치
	var td = $(this).parents('td');	// .tdView
	console.log('>>> 추가할 위치: '+td.attr('class'));
	
	if(divCount.length == 1){	// 대댓글 안보임
		td.append('<div class=divReCmt></div>');
		// 해당 댓글의 대댓글 검색 후 출력
		$.ajax({
			url: '${path}/selectReCmt.do',
			data: replyNum,
			contentType: 'text/plain; charset=UTF-8',
			dataType: 'json',
			method: 'post',
			success: function(res){
				console.log('>>> res.length: ' + res.length);
				if(res.length > 0){	// 대댓글 존재
					$.each(res, function(index, item){
						console.log('index: '+index);
						td.children('.divReCmt').append(addReCmt(item));
					});
				}
				td.children('.divReCmt').append(writeReComment());
				td.children('.divReCmt').show();
			},
			error: function(){
				alert('ReCmt Load Error');
			}
		});
	} else {	// 대댓글 보임
		console.log('-- 대댓글 제거');
		td.children(':last').remove();	// 대댓글 제거
	}
	
	return false;
})

//대댓글 - '댓글 쓰기' 클릭
.on('click', '.btnReCmt', function(){
	// 대댓글 입력한 input
	var reCmt = $(this).siblings('.txtWrite');
	console.log('대댓글: ' + reCmt.val());
	
	// 대댓글 등록
	if('${userid}' != ""){ // 로그인을 하지 않은 경우 실행 x
		var replyNumTd = $(this).parent().parent().parent().siblings('.hidCnum');
		var cnum = replyNumTd.text();
		console.log('cnum: '+cnum);
		var cts = reCmt.val().trim();
		if(cts != null && cts != ''){
			var cmt = {pNum:link, parentNum:cnum, contents:cts};
			
			$.ajax({
				url:'${path}/insertReCmt.do',
				data:JSON.stringify(cmt),
				contentType:'application/json; charset=UTF-8',
				dataType:'json',
				method:'post',
				success:function(res){
					reCmt.parent().before(addReCmt(res));
					alertModal('댓글 등록', '댓글이 등록되었습니다.');
					reCmt.val('');
				},
				error:function(){
					alert('ReCmt insert error');
				}
			});	
		} else {
			alertModal('댓글 등록','댓글 내용을 입력하세요.');
		}
	} else {
		alertModal('댓글 등록', '로그인이 필요합니다.');
		clearCmt();
		location.href='${path}/login';
	}
	
	return false;
})

// 대댓글 수정 클릭
.on('click', '.updateReCmt', function(){
	$('#updateModalLabel').text('대댓글 수정');
	var idx = $(this).parent().parent().parent().parent().parent();
	console.log('idx: '+idx.index());
	var preIdx = idx.index()-1;
	console.log('idx-1: '+idx.siblings(':eq('+preIdx+')').text());
	// 해당 댓글 번호
	$('#hiddenCnum').text(idx.siblings(':eq('+preIdx+')').text());
	
	var cmt = $(this).parent().parent().parent().parent();	// label(.form-control)
	console.log('대댓글 수정 클릭: '+cmt.attr('class'));
	var writer = cmt.text();
	writer = writer.split(' (')[0];
	console.log('작성자: '+writer);
	var reCmtTxt = cmt.children('.reCmtTxt').text();
	console.log('대댓글: '+reCmtTxt);
	if('${userid}' == writer){
		// 댓글 수정 Modal 보기
		$('#updateCmtContents').val(reCmtTxt);
		$('#updateCmtModal').modal('show');
	} else {
		alertModal('댓글 수정', '작성자가 아닙니다.');
	}
		
	return false;
})

// 대댓글 삭제
.on('click', '.deleteReCmt', function(){
	var idx = $(this).parent().parent().parent().parent().parent();
	console.log('idx: '+idx.index());
	var preIdx = idx.index()-1;
	console.log('idx-1: '+idx.siblings(':eq('+preIdx+')').text());
	
	var modalTitle = '대댓글 삭제';
	var cmt = $(this).parent().parent().parent().parent();	// label(.form-control)
	console.log('대댓글 수정 클릭: '+cmt.attr('class'));
	var writer = cmt.text();
	writer = writer.split(' (')[0];
	console.log('작성자: '+writer);
	if('${userid}' == writer){
		// 해당 댓글 번호
		$('#hiddenCnum').text(idx.siblings(':eq('+preIdx+')').text());
		confirmModal(modalTitle, '정말 댓글을 삭제하시겠습니까?');
	} else {
		alertModal(modalTitle, '작성자가 아닙니다.');
	}
	
	return false;
})
</script>
</html>