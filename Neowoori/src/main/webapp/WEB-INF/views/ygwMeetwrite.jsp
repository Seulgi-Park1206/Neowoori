<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>meetwrite</title>
</head>
<style>
</style>
<body>
<jsp:include page="/module/nav.jsp" flush="false" />

<div>
<p style="font-size:30px; text-align:center;">스터디 게시글 쓰기</p>
</div>
<div style="text-align:center;">
	<input type=text style="width:600px; height:30px;" id=postTitle name=postTitle placeholder="제목을 입력하세요."><br><br>
	<textarea id=postContent name=postContent style="resize:none; width:600px; height:350px;" placeholder="내용을 입력하세요."></textarea><br>
	<div style="text-align:center;">
	<input type="checkbox" id=noticeCheckbox name=noticeCheckbox> 공지사항 <input type=button id=btn_cr value=글쓰기>&nbsp;&nbsp;<input type=button  id=btn_cl  value=취소>
	</div>
</div>

<jsp:include page="/module/footer.jsp" flush="false" />
</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script>
var userid = "human1";
var usernum = 0;

$(document)
.ready(function(){
	console.log(userid);
	$.ajax({
	    url: 'pjhusernum.do',
	    type: 'POST',
	    data: {"userid":userid}, 
	    success: function(data){
	    	console.log(data);
	    	alert("성공");
	    },
	    error: function (){
	    	alert("실패");
	    }
	  })
})
.on('click','#btn_cl',function(){ // 취소 누를시 게시판으로
	location.href = '/app/meetView'
})
.on('click','#btn_cr',function(){ // 글쓰기 누를시 제목&내용 확인 / 있으면 값 전송
	if($('#postTitle').val()== ""){
		alert("제목을 입력해주세요.");
	}
	else if($('#postContent').val() == ""){
		alert("내용을 입력해주세요.");
	}
	
	/*------날짜------*/
	var date = new Date();
	var year = date.getFullYear(); // 년도
	var month = date.getMonth() + 1;  // 월
	var date = date.getDate();  // 날짜
	var today = year + '-' + month + '-' + date;
	/*------날짜------*/
	
	/*------공시사항 여부------*/
	var result = 0;
	 if($('input').is(":checked") == true){
		 result = 20; // 체크하면 공지사항
	    }else{
	     result = 10; // 체크 안하면 일반
	    }
	/*------공시사항 여부------*/

	var uid = "${s_id}"; // 유저 아이디 세션 (스터디 아이디로 바꿔야 함)
	var s_id = 142;
	console.log(uid);
	console.log(s_id);
	console.log($('#postTitle').val());
	console.log($('#postContent').val());
	console.log(today);
	console.log(result);
	
	$.ajax({
		    url: "MeetWirte",
		    type: "POST",
		    data: {
		    	"uid" : uid,
		    	"s_id" : s_id,
		    	"title" : $('#postTitle').val(), // 제목
		    	"Content" : $('#postContent').val(), // 내용
		    	"today" : today, // 날짜
		    	"result" : result // 체크
		    },
		    success : function(data){
		      alert("글쓰기 성공")
// 		      location.href = '/app/meetView'
		    },
		    error : function(){
		      alert("글쓰기 실패")		
		    }
		  });
})

</script>
</html>