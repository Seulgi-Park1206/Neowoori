<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자주 묻는 질문</title>
</head>
<link rel="stylesheet" href="resources/pjh/faq.css" type="text/css" >
<body>
<jsp:include page="/module/nav.jsp" flush="false" />
<div class="wrapper">
	<h1>가장 많이 들어온 질문</h1>
	<table class=faqbest>
		<tr>
			<td>1. 안녕</td>
		</tr>
		<tr>
			<td>2. 됐다</td>
		</tr>
		<tr>
			<td>3. 하하</td>
		</tr>
	</table>
	<table class="keywords" cellspacing="0" cellpadding="0">
		<tr>
			<td class=btn_div >
				<input type="text" class=btn_su placeholder="검색어 입력">
				<button class="btn_search"><img src="resources/img/search.PNG"></button>
			</td>
		</tr>
	</table>
</div>
<div class="wrapper">
  <table class="keywords" cellspacing="0" cellpadding="0">
    <thead>
      <tr>
     	<td width="120px" style="background-color:white;"></td> <!--라인 관리 --> 
        <th width="120px"><span>번호</span></th>
        <th width="400px"><span>제목</span></th>
        <th><span>작성 일자</span></th>
        <td width="120px" style="background-color:white;"></td> <!--라인 관리 --> 
      </tr>
    </thead>
    <tbody>
      <tr>
      	<td><input type="checkbox"></td>
        <td class="lalign">1</td>
        <td>제목</td>
        <td>작성일자</td>
      </tr>
      <tr>
      	<td><input type="checkbox"></td>
        <td class="lalign">2</td>
        <td>제목</td>
        <td>작성일자</td>
      </tr>
      <tr>
      	<td><input type="checkbox"></td>
        <td class="lalign">3</td>
        <td>제목</td>
        <td>작성일자</td>
      </tr>
      <tr>
      	<td><input type="checkbox"></td>
        <td class="lalign">4</td>
        <td>제목</td>
        <td>작성일자</td>
      </tr>
      <tr>
     	<td><input type="checkbox"></td>
        <td class="lalign">5</td>
        <td>제목</td>
        <td>작성일자</td>
      </tr>
      <tr>
      	<td><input type="checkbox"></td>
        <td class="lalign">6</td>
        <td>제목</td>
        <td>작성일자</td>
      </tr>
    </tbody>
  </table>
 </div>
 <div class="wrapper">
	<table class="keywords">
		<tr>
			<td><button>이전</button></td>
			<td><button>1</button></td>
			<td><button>2</button></td>
			<td><button>3</button></td>
			<td><button>4</button></td>
			<td><button>5</button></td>
			<td><button>다음</button></td>
		</tr>
	</table>
</div>
<jsp:include page="/module/footer.jsp" flush="false" />
</body>
</html>