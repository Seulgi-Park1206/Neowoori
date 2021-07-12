<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
</head>
<!--  
<style>
table{
	width: 100%;
    border: 1px solid #000000;
    border-collapse: collapse;
}
th, td {
    border: 1px solid #000000;
    padding: 10px;
 }
 
</style>
-->
<link rel="stylesheet" href="resources/pjh/faq.css" type="text/css" >
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"  href="${path}/resources/ygw/notice.css">
<body>

<jsp:include page="/module/nav.jsp" flush="false" />
<div style="text-align:center; margin:0 auto;">
	<h2>공지사항</h2>
</div>
<br>
<div class=noticediv id=noticediv1 style="margin:0 auto;">
<table class="table table-hover" id=tbl1 style="text-align:center;">
   <thead class="thead-light">
	<tr>
		<th class="ygw_table_width1"><strong>번호</strong></th>
		<th class="ygw_table_width2"><strong>제목</strong></th>
		<th class="ygw_table_width3"><strong>작성일자</strong></th>
		<th class="ygw_table_width4"><strong>작성자</strong></th>
	</tr>
	</thead>	
<c:forEach items="${noticeData}" var="rec">
<c:set var="i" value="${i+1}"/>
	<tr id=tr1 class=trclass1>
		<td>${i}<input type=hidden name=noticepostid value="${rec.postnum}"/></td><td>${rec.title}</td><td>${rec.admin_date}</td><td>관리자</td>
	</tr>
</c:forEach>
</table>
</div>
	<!--  <div class="btn-toolbar justify-content-between" role="toolbar" aria-label="Toolbar with button groups"  style="width:100px; margin: 0 auto;">
	  <div class="btn-group" role="group" aria-label="First group">
	    <button type="button" class="btn btn-outline-secondary">1</button>
	    <button type="button" class="btn btn-outline-secondary">2</button>
	    <button type="button" class="btn btn-outline-secondary">3</button>
	    <button type="button" class="btn btn-outline-secondary">4</button>
	    <button type="button" class="btn btn-outline-secondary">5</button>
	  	</div>-->
	  	<div style="text-align:right;">
	  	<input class="btn btn-outline-secondary" id=noticenewpost type=button value="새글쓰기" onclick="document.location='http://localhost:8080/app/noticewrite'">
	  	</div>
<div class="w3-center">
	
		<a href= # value=previous class="w3-bar-item w3-button" name=page>&laquo;</a>${paging}<a href= # value=next class="w3-bar-item w3-button" name=page>&raquo;</a>
	
</div>
<!--  	</div>-->
	

<jsp:include page="/module/footer.jsp" flush="false" />
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script>
let userid='${userid}';
let prePageNum=1; //이전 페이지 번호
let lastPage="${lastPage}";

$(document)
.ready(function(){
	   $('.trclass1').hide();
	   $(".trclass1").slice(0, 10).show();
	   //$('.trclass2').hide();
})

//페이징 버튼 클릭시
.on('click','[name=page]',function(){
   //다음 버튼 클릭시
   
   if($(this).attr('value')=="next"){ //클릭한 a태그의 value값을 비교 
	   
      $(this).attr("href", "#"+parseInt(prePageNum+1));//다음 버튼의 경로 변경
      let pageNum = parseInt(prePageNum)+1; //현재 페이지에 +1
      //alert("pre pagenum : "+pageNum);
      prePageNum++; //값을 +1 해줌 (이전, 다음에는 따로 값이 없어서 임의의 변수를 이용함)
      //alert("next pagenum : "+lastPage);
      if(pageNum>lastPage){ //lastPage(페이징의 최대 값) 보다 현재 페이지가 크면
         alert("다음 페이지가 없습니다.");
         return false;
      }
      else{ //lastPage(페이징의 최대 값) 보다 현재 페이지가 작으면
         $('.trclass1').hide(); //일단 다 숨기고
         $('.trclass1').slice((pageNum-1)*10,pageNum*10).show(); //해당 값만큼 보여줌         
      }
   }
   //이전 버튼 클릭시
   else if($(this).attr('value')=="previous"){//클릭한 a태그의 value값을 비교 
      $(this).attr("href", "#"+parseInt(prePageNum-1));//이전 버튼의 경로 변경
      let pageNum = parseInt(prePageNum)-1;//현재 페이지에 -1
      prePageNum--; //값을 -1 해줌 (이전, 다음에는 따로 값이 없어서 임의의 변수를 이용함)
      if(pageNum<=0){ //현재 페이지가 0보다 같거나 작으면
         alert("이전 페이지가 없습니다.");
         return false;
      }
      else{ //그 외.
         $('.trclass1').hide();
         $('.trclass1').slice((pageNum-1)*10,pageNum*10).show();
      }
   }
   //기존 페이징 버튼 클릭시
   else{
      let pageNum = $(this).attr('value'); //클릭한 버튼의 value값 가져옴
      $('.trclass1').hide(); //받아온 리스트 전체 숨김
      $('.trclass1').slice((pageNum-1)*10,pageNum*10).show(); //value값으로 게시물 개수 정해서 보여줌
      prePageNum=pageNum;
   }
})

.on('click','#tbl1 tr:not(:first)',function(){ //첫번째행 제외하고 클릭시
	
	let noticepostid=$(this).find("td:eq(0)").find("input[name=noticepostid]").val();
	document.location="http://localhost:8080/app/notice/"+noticepostid;
	
	return false;
})

//notice 공지사항 작성 버튼 => 로그인 id human 아니면 버튼 숨김
if(userid!='human'){ 
	$('#noticenewpost').hide();
	$('#noticeDel').hide();
}

</script>
</html>