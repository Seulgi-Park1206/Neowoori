<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>회원관리</title>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">

<link rel="stylesheet" href="${path}/resources/psg/css/form.css"
	type="text/css">
<link rel="stylesheet" href="${path}/resources/psg/css/meetuser.css"
	type="text/css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<body>
	<jsp:include page="/module/nav.jsp" flush="false" />
<!--
	<c:forEach items="${resp}" var="rec">
<tr>
	<td>${rec.mNum}</td><td>${rec.uNick}</td><td>${rec.uGender}</td><td>${rec.uMail}</td>
</tr>
</c:forEach>
  -->
	<div style="height:506px;">
	<div class=form>
		<a class=title>회원 관리</a>
		<div class=contents style="width:100%;">
		<div class="row justify-content-md-center" style="width:100%;">
			<table class="table table-hover" id=tblUserList >
				<thead class="thead-light">
					<tr>
						<th class="psg_table_width2">닉네임</th>
						<th class="psg_table_width3">성별</th>
						<th class="psg_table_width4">이메일</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${resp}" var="rec">
					<tr>
						<td><a class=psg_pop onclick=selUNum(${rec.uNum},'${rec.uNick}',${rec.mNum})>${rec.uNick}</a></td>
						<td>${rec.uGender}</td>
						<td>${rec.uMail}</td>
						<td style="display:none;">${rec.uNum}</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	</div>
		
		<div id="psg_dropdown">
			<a id=kick>강퇴하기</a>
			<hr>
			<a id=msg>쪽지 보내기</a>
		</div>
	</div>
	
	<!-- Button trigger modal -->
	<!-- 
<button id=bbtn type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
  Launch demo modal
</button>
-->
<a id="bbtn" class="btn btn-primary" data-bs-toggle="modal" href="#exampleModal" role="button" style="display:none;">Open first modal</a>
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h6 class="modal-title" id="exampleModalLabel"></h6>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" id=modalBody>
       <form>
			
        </form>
      </div>
      <div class="modal-footer" id=modalFoot>

      </div>
    </div>
  </div>
</div>
	<!--  팝업창 띄우고 위한 코드
	<input type="button" value="팝업창" onclick="click_add();"><br>
	-->
	<jsp:include page="/module/footer.jsp" flush="false" />
</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script type="text/javascript">
/* function click_add(){
	var url = "pop_message";
	var name = "메시지";
	var option = "width=600, height=600, left=100,top=50,location=no";
	window.open(url,name,option)
}; */
let clickUser;
let clickUserNum;
let clickMNum;
let studyID= {s_id};
var sessionVal = "<%=session.getAttribute("userid")%>";
$(document)
.ready(function(){
	//let study_id = ${s_id};
	// study_id로 해당 스터디 회원 정보 db에서 불러오기
	$('#psg_dropdown').hide();
	//console.log(studyID);
})
.ready(function(){
	
})
.on('click', '.psg_pop', function(e){
	console.log(e.pageX, e.pageY)
	if($(e.target).hasClass('psg_pop')){
		$('#psg_dropdown').show();
		let x = parseInt(e.pageX)+20;
		x = String(x);
		$('#psg_dropdown').css({
			"left": x + 'px',
			"top": e.pageY + 'px'
		})
	}
	return false;
})
.on('click', '.form', function(){
	$('#psg_dropdown').hide();
	return false;
})
.on('click', '#kick', function(){
	// confirm 대신 다른 창 만들어 사용(예를 들면 toast?)
	/*
	let result = confirm("이 유저를 강퇴하시겠습니까?");
	if(result){
		alert("해당 유저를 강퇴했습니다.");
	
		// 강퇴(테이블에서 지우기)
	
	}
	*/
	//console.log('kick');
	$('#modalBody').empty();
	$('#modalFoot').empty();
	
	$("#exampleModalLabel").text("강퇴하기");
	$("#modalBody").append('<p class="text-primary" id="pUesrNick"><p>유저를 강퇴 하시겠습니까?');
	$("#modalFoot").append('<button type="button" class="btn btn-primary" onclick=btnKickUser('+clickUserNum+') >강퇴하기</button>');
	$("#modalFoot").append('<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>');

	//$("#studyAdminNick").text(clickUser);
	$("#pUesrNick").text(clickUser);
	//$('#bbtn').trigger('click');
	$('#bbtn').get(0).click();
	return false;
})
.on('click', '#msg', function(){
	//console.log('msg 클ㄹ릭');
	$('#modalBody').empty();
	$('#modalFoot').empty();
	
	$("#exampleModalLabel").text("쪽지 보내기");
	$("#modalBody").append('<form>');
	$("#modalBody").append('<div class="form-floating">');
	$("#modalBody").append('<textarea id="adminNick" class="form-control" placeholder="" id="floatingTextarea1" disabled></textarea>');
	$("#modalBody").append('<label for="floatingTextarea1" id=studyAdminNick></label>');
	$("#modalBody").append('</div>');
	$("#modalBody").append('<div class="form-floating">');
	$("#modalBody").append(' <textarea class="form-control" placeholder="쪽지내용" id="floatingTextarea2" style="height: 200px"></textarea>');
	$("#modalBody").append('<label for="floatingTextarea2"></label>');
	$("#modalBody").append('</div>');
	$("#modalBody").append('</form>');
	$("#modalFoot").append('<button type="button" class="btn btn-primary" onclick=btnSendMsg('+clickUserNum+') >메시지 보내기</button>');
	$("#modalFoot").append('<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>');

	//$("#studyAdminNick").text(clickUser);
	$("#adminNick").text(clickUser);
	//$('#bbtn').trigger('click');
	$('#bbtn').get(0).click();

	return false;
})


function selUNum(who,who2,who3){
	clickUserNum=who;
	clickUser=who2;
	clickMNum=who3;
	//console.log(who+","+who2+","+who3);
}

function btnKickUser(who){
//	console.log(who);
}

function btnSendMsg(who){
	console.log(who);
	console.log($("#floatingTextarea2").val());
	$.ajax({
		url: "jsbSendModalMsg2.do",
		type: "POST",
		data: {
			"userId" : sessionVal, // 보내는 사람 id
			"cont" : $("#floatingTextarea2").val(),
			"recUserNum" : who // 닉네임으로 받는사람 num구해야됨
	    },
	    success : function(data){
	    	alert("성공(임시 alert)");
	    },
	    error : function(){	
	    }
		});
	
}
</script>
</html>