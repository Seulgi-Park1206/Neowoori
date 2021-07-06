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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js" integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT" crossorigin="anonymous"></script>
<link rel="stylesheet" href="${path}/resources/psg/css/form.css" type="text/css">
<link rel="stylesheet" href="${path}/resources/psg/css/meetadmin.css" type="text/css">
<body>
	<!-- header -->
	<jsp:include page="/module/nav.jsp" flush="false" />
	<div class=form>
		<a class=title>스터디 관리</a>
		<div class=contents>
			<table>
				<tr><td class=tdLeft>스터디명:</td><td class=tdRight><label class=intext id=groupName>${studyInfo.mName}</label></td></tr>
				<tr><td class=tdLeft>관리자:</td><td class=tdRight><label class=intext id=admin>${studyInfo.uNick}</label></td></tr>
				<tr><td class=tdLeft>카테고리:</td><td class=tdRight><label class=intext id=category>${studyInfo.category1} > ${studyInfo.category2}</label></td></tr>
				<tr><td class=tdLeft>스터디 장소:</td><td class=tdRight><label class=intext id=place>${studyInfo.mWhere} ${studyInfo.mWhere2} ${studyInfo.mWhere3}</label></td></tr>
				<tr><td class=tdLeft>스터디 시간:</td><td class=tdRight><label class=intext2 id=day>${studyInfo.mDay}</label> / <label class=intext1 id=time>${studyInfo.mTime}</label>~</td></tr>
				<tr><td class=tdLeft>진행 시간:</td><td class=tdRight><label class=intext id=progressTime>${studyInfo.mPtime}</label></td></tr>
				<tr><td class=tdLeft>난이도:</td><td class=tdRight><label class=intext id=level>${studyInfo.mLevel}</label></td></tr>
				<tr><td class=tdLeft>모집 인원:</td><td class=tdRight><label class=intext2 id=peopleNumber>${studyInfo.cMcount}</label>/<label class=intext2 id=personnel>${studyInfo.mPersonnel}</label></td></tr>
				<tr class=trExp><td class=tdLeft>스터디 설명:</td><td class=tdMul colspan=2><textarea id=explain>${studyInfo.mContents}</textarea></td></tr>
			</table>
			<br>
			<div class="d-grid gap-2 d-md-flex justify-content-md-end">
				<input type=button class="btn btn-outline-primary" id=btnUpdateInfo value="스터디 정보 수정">
				<input type=button class="btn btn-outline-primary" onclick="go_adminUser()" value="회원 관리">
				<input type=button class="btn btn-outline-primary" onclick="go_adminBoard()" value="게시판 관리">
				<input type=button class="btn btn-outline-primary" id=btnDeleteStudy value="스터디 삭제">
				<input type=button class="btn btn-outline-primary" onclick="cancel()" value="취소">
			</div>
		</div>
	</div>
	<!-- 수정 modal -->
	<div class="modal fade" id="updateModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="updateModalLabel">스터디 정보 수정</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	      	<div class="mb-3">
	          <label for="recipient-name" class="col-form-label">스터디명:</label>
	          <input type="text" class="form-control" id="studyName" readonly>
	        </div>
	        <div class="mb-3">
	          <label for="recipient-name" class="col-form-label" id=lblWeek>스터디 요일:</label>
	          <div id="btnCheckOn" class="btn-group" role="group" aria-label="Basic checkbox toggle button group">
				  <input type="checkbox" name="chkWeek" class="btn-check" id="btncheck1" autocomplete="off" value="1" />
				  <label class="btn btn-outline-primary btn-sm" for="btncheck1">월</label>
					
				  <input type="checkbox" name="chkWeek" class="btn-check" id="btncheck2" autocomplete="off" value="2" />
				  <label class="btn btn-outline-primary btn-sm" for="btncheck2">화</label>
					
				  <input type="checkbox" name="chkWeek" class="btn-check" id="btncheck3" autocomplete="off" value="3" />
				  <label class="btn btn-outline-primary btn-sm" for="btncheck3">수</label>
					  
				  <input type="checkbox" name="chkWeek" class="btn-check" id="btncheck4" autocomplete="off" value="4" />
				  <label class="btn btn-outline-primary btn-sm" for="btncheck4">목</label>
					
				  <input type="checkbox" name="chkWeek" class="btn-check" id="btncheck5" autocomplete="off" value="5" />
				  <label class="btn btn-outline-primary btn-sm" for="btncheck5">금</label>
					
				  <input type="checkbox" name="chkWeek" class="btn-check" id="btncheck6" autocomplete="off" value="6" />
				  <label class="btn btn-outline-primary btn-sm" for="btncheck6">토</label>
					  
				  <input type="checkbox" name="chkWeek" class="btn-check" id="btncheck7" autocomplete="off" value="7" />
				  <label class="btn btn-outline-primary btn-sm" for="btncheck7">일</label>
			  </div>
	        </div>
	        <div class="mb-3">
	          <label for="recipient-name" class="col-form-label">스터디 시작 시간:</label>
	          <div class="input-group time">
		        <input id="studyHour" type="number" class="form-control" value="19" max="23" min="0">
				<span class="input-group-text">시</span>
				<input id="studyMin" type="number" class="form-control" value="30" max="59" min="0" step="10">
			  	<span class="input-group-text">분</span>
	          </div>
	        </div>
	        <div class="mb-3">
	          <label for="recipient-name" class="col-form-label">스터디 진행 시간:</label>
	          <div class="input-group ptime">
				<input id="playHour" type="number" class="form-control" value="1" max="23" min="0">
				<span class="input-group-text">시간</span>
				<input id="playMin" type="number" class="form-control" value="20" max="59" min="0" step="10">
				<span class="input-group-text">분 동안 진행</span>
			  </div>
	        </div>
	        <div class="mb-3">
	          <label for="recipient-name" class="col-form-label">모집 인원:</label>
	          <div class="input-group per">
	            <input id="studyPersonnel" type="number" class="form-control" max="10" min="2" step="1">
	            <span class="input-group-text">명</span>
	          </div>
	        </div>
	        <div class="mb-3">
	          <label for="message-text" class="col-form-label">스터디 설명:</label>
	          <textarea class="form-control myscrollbar" id="studyContents" readonly></textarea>
	        </div>
	      </div>
		  <!-- danger-alert -->
		  <div style="display:none;"id=dAlert class="alert alert-danger d-flex align-items-center" role="alert">
			<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-exclamation-triangle" viewBox="0 0 16 16">
  				<path d="M7.938 2.016A.13.13 0 0 1 8.002 2a.13.13 0 0 1 .063.016.146.146 0 0 1 .054.057l6.857 11.667c.036.06.035.124.002.183a.163.163 0 0 1-.054.06.116.116 0 0 1-.066.017H1.146a.115.115 0 0 1-.066-.017.163.163 0 0 1-.054-.06.176.176 0 0 1 .002-.183L7.884 2.073a.147.147 0 0 1 .054-.057zm1.044-.45a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566z"/>
  				<path d="M7.002 12a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM7.1 5.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995z"/>
			</svg>
		    <div>
		    	<p>An example danger alert with an icon</p>
			</div>
		  </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id=btnCloseModal>취소</button>
	        <button type="button" class="btn btn-primary" id=btnUpdateComplete data-bs-dismiss="modal">수정 완료</button>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- alert -->
	<div class="modal fade" id="alertModal" aria-hidden="true" aria-labelledby="exampleModalToggleLabel2" tabindex="-1">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	      <div class="modal-header">
	      	<label class="modal-title" id=alertTitle></label>
	      </div>
	      <div class="modal-body">
	        <label id=lblAlert></label>
	      </div>
	      <div class="modal-footer">
	        <button class="btn btn-primary" data-bs-target="#updateModal" data-bs-toggle="modal" data-bs-dismiss="modal">확인</button>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- confirm -->
	<div class="modal fade" id="confirmModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	      	<label class="modal-title" id=confirmTitle></label>
	      </div>
	      <div class="modal-body">
	      	<div class="mb-3">
	          <label id=lblConfirm></label>
	        </div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id=btnNo>취소</button>
	        <button type="button" class="btn btn-primary" id=btnYes data-bs-target="#updateModal" data-bs-toggle="modal" data-bs-dismiss="modal">확인</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<!-- footer -->
	<jsp:include page="/module/footer.jsp" flush="false" />
</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script>
// 스터디 번호
var link = window.location.pathname;
s_num = link.split('/')[3];

// 회원 관리 페이지로 이동
function go_adminUser(){
	location.href = '${path}/meetuser/'+s_num;
}

// 게시판 관리 페이지로 이동
function go_adminBoard(){
	console.log(s_num);
	location.href = '${path}/meetView/'+s_num;
}

// 취소(뒤로가기)
function cancel(){
	window.history.back();
}

// 본문 내용 크기에 맞게 높이 자동 조절
function adjustHeight(contents) {
	contents[0].style.height = 'auto';
	var contentsHeight = contents.prop('scrollHeight');
	//console.log('Contents: ' + contentsHeight);
	contents.css('height', contentsHeight);
}

//alert Modal show
function alertModal(title, comment){
	$('#alertTitle').text(title);
	$('#lblAlert').text(comment);
	$('#alertModal').modal('show');
}

//confirm Modal show
function confirmModal(title, comment){
	$('#confirmTitle').text(title);
	$('#lblConfirm').text(comment);
	$('#confirmModal').modal('show');
}

// 선택한 요일 목록
function checkboxArr(){
	var chkWeekArray="";
	var val = document.getElementsByName("chkWeek");
	for(var i=0;i<val.length;i++){
		if(val[i].checked){
			if(val[i].value==1) chkWeekArray+="월";
			if(val[i].value==2) chkWeekArray+="화";
			if(val[i].value==3) chkWeekArray+="수";
			if(val[i].value==4) chkWeekArray+="목";
			if(val[i].value==5) chkWeekArray+="금";
			if(val[i].value==6) chkWeekArray+="토";
			if(val[i].value==7) chkWeekArray+="일";
		}
	}
	if(chkWeekArray.length > 0) return chkWeekArray;
	else return "0";
}

// 요일 selected
function checkedModal(chk){
	console.log(chk);
	var chkArray = chk.split("");
	console.log(chkArray);
	var val = document.getElementsByName("chkWeek");
	for(var i=0;i<chkArray.length;i++){
		if(chkArray[i]=="월") val[0].checked = true;
		if(chkArray[i]=="화") val[1].checked = true;
		if(chkArray[i]=="수") val[2].checked = true;
		if(chkArray[i]=="목") val[3].checked = true;
		if(chkArray[i]=="금") val[4].checked = true;
		if(chkArray[i]=="토") val[5].checked = true;
		if(chkArray[i]=="일") val[6].checked = true;
	}
}

$(document)
.ready(function(){
	adjustHeight($('#explain'));
})
// 스터디 정보 수정 버튼 클릭
.on('click', '#btnUpdateInfo', function(){
	console.log('수정 버튼 클릭');
	// 모달창으로 스터디 정보 수정
	$('#studyName').val($('#groupName').text());
	checkedModal($('#day').text());
	var sh = $('#time').text().substr(0, 2);
	var sm = $('#time').text().substr(3, 2);
	console.log(sh+':'+sm);
	$('#studyHour').val(sh);
	$('#studyMin').val(sm);
	var ph = $('#progressTime').text().split("시간");
	var pm = ph[1].replace("분", "");
	ph = ph[0];
	console.log(ph+'/'+pm);
	$('#playHour').val(ph);
	$('#playMin').val(pm);
	$('#studyPersonnel').val($('#personnel').text());
	$('#studyContents').val($('#explain').text());
	$('#updateModal').modal('show');
})
// 스터디 정보 수정 기능
.on('click', '#btnUpdateComplete', function(){
	var studyName = $("#studyName").val();
	var chkweek = $('input:checkbox[name=chkWeek]').is(':checked'); // true false 확인
	var studyHour = $("#studyTime").val();
	var studyMin = $("#studyMin").val();
	var playHour = $("#playTime").val();
	var playMin = $("#playMin").val();

	if(chkweek == false) {
		alertModal('스터디 정보 수정','요일을 선택해주세요.');
	} else if(studyHour == "0" || studyMin == "0") {
		confirmModal("스터디 시간에서 0을 선택하셨습니다. 그대로 진행하시겠습니까?");
	} else if(playHour == "0" && playMin == "0") {
		//alert("진행 시간(시)을 확인해주세요.");
	}
	/*
	var chkwk = checkboxArr();
	var update = {
		sNum : s_num,
		sWeek: chkwk
	};
	$.ajax({
		url : '${path}/updateStudyInfo.do',
		data : JSON.stringify(update),
		contentType : 'application/json; charset=UTF-8',
		method : 'post',
		success : function() {
			alertModal('스터디 정보 수정', '수정이 완료되었습니다.');
			$('#date').text($('#studyDate').val());
			$('#time').text($('#studyTime').val());
			$('#progressTime').text($('#studyPTime').val());
			$('#personnel').text($('#studyPersonnel').val());
			adjustHeight($('#studyContents'));
		},
		error : function() {
			alert('Update error');
		}
	});
*/
	return false;
})

.on('click', '#btnDeleteStudy', function() {
	// 스터디 폐쇄

	return false;
})
</script>
</html>