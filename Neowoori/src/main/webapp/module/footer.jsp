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
<link rel="stylesheet" href="${path}/resources/psg/css/footer.css" type="text/css">
<body>
<footer>
	<hr>
	<ul>
		<li><a href="${path}/company">회사소개</a></li>
		<li><a href="${path}/faq">Q&A</a></li>
		<li><a href="${path}/notice">공지사항</a></li>
	</ul>
</footer>
</body>
</html>