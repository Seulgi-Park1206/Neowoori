<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View QNA</title>
</head>
<style>

table{
	width: 	100%;
    border: 1px solid #000000;
    border-collapse: collapse;
    text-align:center;
}
table,td{
	border: 1px solid #000000;
    padding: 10px;
}

</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<link rel="stylesheet" href="${path}/resources/ygw/qna.css">
<body>
<jsp:include page="/module/nav.jsp" flush="false" />
<div style="text-align:center; margin:0 auto;">
	<h2>Q&A 내용</h2>
</div>
<br>
<div class=qnaviewdiv style="margin:0 auto; float:none;">
<table id=viewqnatable class="table table-bordered" style="text-align:center; vertical-align:middle;">	
	<tr>
		<td class="table-light">제목</td><td colspan=3>${qnalist.faqtitle}</td>
	</tr>
	<tr>
		<td class="table-light">작성자</td><td>${qnalist.writer}</td><td class="table-light">작성일자</td><td>${qnalist.faqdate}<input type=hidden id=faqnum value="${qnalist.faqnum}"></td>
	</tr>
	<tr>
		<td class="table-light">내용</td><td colspan=3>${qnalist.faqcontent}</td>
	</tr>
	<tr>
		<td class="table-light">답변상태</td><td colspan=3>${qnalist.state}</td>
	</tr>
	<tr>
		<td class="table-light">답변내용</td><td colspan=3>${qnalist.answer}</td>	
	</tr>
	
</table>
</div>

<div style="text-align:center;">
	<input class="btn btn-outline-secondary" type=button id=btnUpdate value=수정>
	<input class="btn btn-outline-secondary" type=button id=btnDelete value=삭제>
	<!--<input type=button id=btnNew value=새글쓰기>-->
	<input class="btn btn-outline-secondary" type=button id=btnQnalist value=목록보기 onclick="document.location='http://localhost:8080/app/qna'"></td></tr>
</div>
<jsp:include page="/module/footer.jsp" flush="false" />
</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script>
<%
String writer=(String)session.getAttribute("userid");
%>

let dbwriter='${qnalist.writer}';
let writer= '<%=writer%>';

$(document)
.on('click','#btnUpdate',function(){
	let qnapostnum=$('#faqnum').val();
	let qnawriter=$("#viewqnatable").find('td:eq(3)').text();
	document.location="http://localhost:8080/app/qnamodify/"+qnapostnum+"/"+qnawriter;
	
	//alert(qnawriter);
	return false;
})

.on('click','#btnDelete',function(){
	let qnapostnum=$('#faqnum').val();
	let seldelete=confirm("정말 삭제하시겠습니까?");
	
	if(seldelete==true){
		document.location="http://localhost:8080/app/qnadelete/"+qnapostnum;	
	}
	else{
		return false;	
	}
})

if(writer==null || writer!=dbwriter){
	$('#btnUpdate').hide();
	$('#btnDelete').hide();
	$('#btnNew').hide();
}

</script>
</html>