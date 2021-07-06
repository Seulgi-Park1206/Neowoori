<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="${path}/resources/psg/css/nav.css" type="text/css">
<body>
	<header>
		<div class=class-main>
			<a href="${path}/index"><img class=logo src="${path}/resources/img/logo.png"></a>
		</div>
		<nav>
			<a class="link" id=searchLink href="">찾기</a>
			<a class="link" href="${path}/create">만들기</a>
			<a class="linklog" href="">쪽지함</a>
			<a class="linklog" id=mystudy onclick="mystudy()">내스터디</a>
			<a class="linklog" id=userid href="${path}/mypage">님</a>
			<a class="link" id=login href="${path}/login">로그인</a>
			<a class="linklog" id=logout>로그아웃</a>
		</nav>
	</header>
	<hr>
</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script>
function mystudy(){
	var uid = '${userid}';
	location.href='${path}/meetList/'+uid;
}

function islogin(){
	let uid = '${userid}';
	console.log(uid+'님');
	if(uid != ""){
		console.log('login');
		let u = uid + '님';
		$('#userid').text(u);
		$('.linklog').show();
		$('#login').hide();
	} else {
		console.log('logout');
		$('.linklog').hide();
		$('#login').show();
	}
}
$(document)
.ready(function(){
	islogin();
})
.on('click', '#logout', function(){
	// 세션 종료
	$.ajax({
		url:'${path}/logout',
		data:{state:'logout'},
		dataType:'text',
		method:'post',
		success:function(){
			islogin();
			alert('로그아웃되어 메인 페이지로 이동합니다.');
			location.href='${path}/index';
		},
		error:function(){
			alert('Logout Error');
		}
	});
	return false;
})
</script>
</html>