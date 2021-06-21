<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 스터디 게시판</title>
</head>
<link rel="stylesheet" href="resources/pjh/meetView.css" type="text/css" >
<body>
<jsp:include page="/module/nav.jsp" flush="false" />
<div class="wrapper">
	<table class="keywords" cellspacing="0" cellpadding="0">
		<tr >
			<td class=btn_div>
				<select class=btn_su style="border:1px solid;"> 
					<option>제목</option>
					<option>작성자</option>
				</select>
			</td>
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
     	<td width="120px" style="background-color:white;"></td>
        <th width="120px"><span>번호</span></th>
        <th width="400px"><span>제목</span></th>
        <th><span>작성자</span></th>
        <th><span>작성 일자</span></th>
        <th><span>조회수</span></th>
      </tr>
    </thead>
    <tbody>
      <tr>
      	<td><input type="checkbox"></td>
        <td class="lalign">1</td>
        <td>제목</td>
        <td>작성자</td>
        <td>21/06/16</td>
        <td>2</td>
      </tr>
      <tr>
      	<td><input type="checkbox"></td>
        <td class="lalign">2</td>
        <td>제목</td>
        <td>작성자</td>
        <td>21/06/16</td>
        <td>2</td>
      </tr>
      <tr>
      	<td><input type="checkbox"></td>
        <td class="lalign">3</td>
        <td>제목</td>
        <td>작성자</td>
        <td>21/06/16</td>
        <td>1</td>
      </tr>
      <tr>
      	<td><input type="checkbox"></td>
        <td class="lalign">4</td>
        <td>제목</td>
        <td>작성자</td>
        <td>21/06/16</td>
        <td>1</td>
      </tr>
      <tr>
     	<td><input type="checkbox"></td>
        <td class="lalign">5</td>
        <td>제목</td>
        <td>작성자</td>
        <td>21/06/16</td>
        <td>1</td>
      </tr>
      <tr>
      	<td><input type="checkbox"></td>
        <td class="lalign">6</td>
        <td>제목</td>
        <td>작성자</td>
        <td>21/06/16</td>
        <td>1</td>
      </tr>
    </tbody>
  </table>
 </div>
 <div class="wrapper" align="right">
	<table>
		<tr>
			<td><button class="btn_list">화상스터디</button></td>
			<td><button class="btn_list" style="margin:0 130px 30px 15px;">글쓰기</button></td>
		</tr>
	</table>
</div>
<div class="wrapper">
	<table class="keywords" cellspacing="0" cellpadding="0">
		<tr>
			<td><button class="btn_list">이전</button></td>
			<td><button class="btn_list">1</button></td>
			<td><button class="btn_list">2</button></td>
			<td><button class="btn_list">3</button></td>
			<td><button class="btn_list">4</button></td>
			<td><button class="btn_list">5</button></td>
			<td><button class="btn_list">다음</button></td>
		</tr>
	</table>
</div>
<jsp:include page="/module/footer.jsp" flush="false" />
</body>
</html>