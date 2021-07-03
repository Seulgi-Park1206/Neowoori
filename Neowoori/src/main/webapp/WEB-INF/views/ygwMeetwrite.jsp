<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
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
	<input type="checkbox" id=noticeCheckbox name=noticeCheckbox> 공지사항 <input type=button id=btn_cr value=글쓰기>&nbsp;&nbsp;<input type=button id=btn_cl value=취소>
	</div>
</div>

<jsp:include page="/module/footer.jsp" flush="false" />
</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script>
var userid = '<%=session.getAttribute("userid")%>';
var s_num = '<%=session.getAttribute("s_num")%>';
var usernum = 0;
$(document)
.ready(function(){ // 아이디로 유저번호 가져오기
	$.ajax({
		url: '${path}/pjhusernum.do',
		type: 'POST',
		dataType: 'text', //서버로부터 내가 받는 데이터의 타입
		contentType : 'text/plain; charset=utf-8;',//내가 서버로 보내는 데이터의 타입
		data:userid,
		success: function(data){
			usernum = data;
		},
		error: function (){  
		}
	})
)}
$.ajax({
	    url: '${path}/pjhusernum.do',
	    type: 'POST',
	    dataType: 'text', //서버로부터 내가 받는 데이터의 타입
	    contentType : 'text/plain; charset=utf-8;',//내가 서버로 보내는 데이터의 타입
	    data:userid,
	    success: function(data){
	    	usernum = data;
	    	console.log(usernum);
	    },
	    error: function (){  
	    }
	  })
	
})
.on('click','#btn_cl',function(){ // 취소 누를시 게시판으로
	location.href = '/app/meetView'// 여기 스터디 아이디 추가해야함
})
.on('click','#btn_cr',function(){ // 글쓰기 누를시 제목&내용 확인 / 있으면 값 전송
	if($('#postTitle').val()== ""){
		alert("제목을 입력해주세요.");
	}
	else if($('#postContent').val() == ""){
		alert("내용을 입력해주세요.");
	}
	
	/*------공시사항 여부------*/
	var result = 0;
	 if($('input').is(":checked") == true){
		 result = 20; // 체크하면 공지사항
	    }else{
	     result = 10; // 체크 안하면 일반
	    }
	/*------공시사항 여부------*/

	var s_id = s_num;
	var title = $('#postTitle').val();
	var Content = $('#postContent').val();
	var form = {usernum:usernum,s_id:s_id,title:title,Content:Content,result:result};
	console.log(form);
	$.ajax({
		    url: "${path}/MeetWirte",
		    data: JSON.stringify(form),
		    contentType:'application/json; charset=UTF-8',
			dataType:'text',
			method:'post',
		    
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