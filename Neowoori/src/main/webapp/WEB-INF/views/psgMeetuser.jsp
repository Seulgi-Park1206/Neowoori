<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
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
		 <div class="col-md-auto">
			<table class="table table-hover" id=tblUserList style="width:100%;">
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
						<td><a class=pop onclick=selUNick(${rec.uNum})>${rec.uNick}</a></td>
						<td>${rec.uGender}</td>
						<td>${rec.uMail}</td>
						<td style="display:none;">${rec.uNum}</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
<<<<<<< HEAD
			</div>
			</div>
			<!--  
			<div class="btn-group" role="group" aria-label="Basic outlined example">
  				<button type="button" class="btn btn-outline-primary">이전</button>
				<button type="button" class="btn btn-outline-primary">1</button>
				<button type="button" class="btn btn-outline-primary">2</button>
				<button type="button" class="btn btn-outline-primary">3</button>
				<button type="button" class="btn btn-outline-primary">4</button>
				<button type="button" class="btn btn-outline-primary">다음</button>
			</div>
			-->
		</div>
=======
>>>>>>> branch 'main' of https://github.com/Seulgi-Park1206/Neowoori.git
		</div>
		<div class="dropdown">
			<a id=kick>강퇴하기</a>
			<hr>
			<a id=msg>쪽지 보내기</a>
		</div>
	</div>
	
	<!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
  Launch demo modal
</button>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">메시지보내기</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" id=modalBody>
       <form>
			<div class="form-floating">
			  <textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea1" disabled></textarea>
			  <label for="floatingTextarea2" id=studyAdminNick>닉네임</label>
			</div>
			<div class="form-floating">
			  <textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea2" style="height: 200px"></textarea>
			  <label for="floatingTextarea2">쪽지 내용</label>
			</div>
        </form>
      </div>
      <div class="modal-footer" id=modalFoot>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type='button' class='btn btn-primary' onclick=btnSendMsg() >메시지 보내기</button>
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
$(document)
.ready(function(){
	//let study_id = ${s_id};
	// study_id로 해당 스터디 회원 정보 db에서 불러오기
	$('.dropdown').hide();
})
.ready(function(){
	
})
.on('click', '.pop', function(e){
	console.log(e.pageX, e.pageY)
	if($(e.target).hasClass('pop')){
		$('.dropdown').show();
		let x = parseInt(e.pageX)+20;
		x = String(x);
		$('.dropdown').css({
			"left": x + 'px',
			"top": e.pageY + 'px'
		})
	}
	return false;
})
.on('click', '.form', function(){
	$('.dropdown').hide();
	return false;
})
.on('click', '#kick', function(){
	// confirm 대신 다른 창 만들어 사용(예를 들면 toast?)
	/*
	let result = confirm("이 유저를 강퇴하시겠습니까?");
	if(result){
		alert("해당 유저를 강퇴했습니다.");
	*/
		// 강퇴(테이블에서 지우기)
	
	}
	return false;
})
.on('click', '#msg', function(){
	$("#studyAdminNick").text(path.uNick);
	// 쪽지보내기
	return false;
})


function selUNick(who){
	clickUser=who;
}
</script>
</html>