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
			<a href="${path}/index"><img class=logo
				src="${path}/resources/img/logo.png"></a>
		</div>
		<nav>
<!-- 			<a class="linklog" id=company>회사소개 수정</a> -->
			<a class="linklog" id=logout>로그아웃</a>
		</nav>
	</header>
	<hr>
</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script>
function mystudy(){
	var adminid = '<%=session.getAttribute("adminid")%>';
	location.href='${path}/meetList/'+uid;
}
function islogin(){
	let adminid = '<%=session.getAttribute("adminid")%>';
	console.log(adminid+'님');
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
			location.href='index';
		},
		error:function(){
			alert('Logout Error');
		}
	});
	return false;
})

// .on('click', '#company', function(){
// 	location.href='CompanyWrite';
// })
</script>
</html>