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
			<a href="${path }/index"><img class=logo
				src="${path}/resources/img/logo.png"></a>
		</div>
		<nav>
			<a class="link" id=searchLink href="">찾기</a>
			<a class="link" href="">만들기</a>
			<a class="link" href="">쪽지함</a>
			<a class="link" onclick="mystudy()">내스터디</a>
			<a class="link" href="${path }/login">로그인</a>
		</nav>
	</header>
	<hr>
</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script>
function mystudy(){
	/* 세션 사용 시 수정 */
	<%-- var uid = <%=session.getAttribute("usid") %>; --%>
	var uid = 2;
	location.href='meetList/'+uid;
}
</script>
</html>