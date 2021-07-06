<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<body>
<jsp:include page="/module/nav.jsp" flush="false" />
<div style="text-align:center;">
	<h2>공지사항</h2>
</div>
<br><br>
<c:forEach items="${alData}" var="rec">			 
<div class="accordion accordion-flush" id="accordionFlushExample" style="width:1000px; margin: 0 auto;">
  <div class="accordion-item">
    <h2 class="accordion-header" id="flush-headingOne">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target=#flush-${rec.postnum} aria-expanded="false" aria-controls="flush-collapseOne">
        ${rec.title}
      </button>
    </h2>
    <div id="flush-${rec.postnum}" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
      <div class="accordion-body">${rec.admin_contents}</div>
    </div>
</div>
 </div>
 </c:forEach>
	<!--  <div class="btn-toolbar justify-content-between" role="toolbar" aria-label="Toolbar with button groups"  style="width:100px; margin: 0 auto;">
	  <div class="btn-group" role="group" aria-label="First group">
	    <button type="button" class="btn btn-outline-secondary">1</button>
	    <button type="button" class="btn btn-outline-secondary">2</button>
	    <button type="button" class="btn btn-outline-secondary">3</button>
	    <button type="button" class="btn btn-outline-secondary">4</button>
	    <button type="button" class="btn btn-outline-secondary">5</button>
	  	</div>-->
	  	<div style="text-align:right;">
	  	<input type=button value="새글쓰기" onclick="document.location='http://localhost:8080/app/noticewrite'">
	  	</div>
	 <div class=pagenumber style="text-align:center;">
	<a href= # value=previous name=page>이전</a>${paging}<a href= # value=next name=page>다음</a>
		</div>
<!--  	</div>-->
	

<jsp:include page="/module/footer.jsp" flush="false" />
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script>
$(document)

.ready(function(){
	   $('.accordion-button').hide();
	   $(".accordion-button").slice(0, 10).show();
	   //$('.trclass2').hide();
})

//페이징 버튼 클릭시
.on('click','[name=page]',function(){
   //다음 버튼 클릭시
   
   if($(this).attr('value')=="next"){ //클릭한 a태그의 value값을 비교 
	   
      $(this).attr("href", "#"+parseInt(prePageNum+1));//다음 버튼의 경로 변경
      let pageNum = parseInt(prePageNum)+1; //현재 페이지에 +1
      prePageNum++; //값을 +1 해줌 (이전, 다음에는 따로 값이 없어서 임의의 변수를 이용함)
      if(pageNum>lastPage){ //lastPage(페이징의 최대 값) 보다 현재 페이지가 크면
         alert("다음 페이지가 없습니다.");
         return false;
      }
      else{ //lastPage(페이징의 최대 값) 보다 현재 페이지가 작으면
         $('.accordion-button').hide(); //일단 다 숨기고
         $('.accordion-button').slice((pageNum-1)*10,pageNum*10).show(); //해당 값만큼 보여줌         
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
         $('.accordion-button').hide();
         $('.accordion-button').slice((pageNum-1)*10,pageNum*10).show();
      }
   }
   //기존 페이징 버튼 클릭시
   else{
      let pageNum = $(this).attr('value'); //클릭한 버튼의 value값 가져옴
      $('.accordion-button').hide(); //받아온 리스트 전체 숨김
      $('.accordion-button').slice((pageNum-1)*10,pageNum*10).show(); //value값으로 게시물 개수 정해서 보여줌
      prePageNum=pageNum;
   }
})

let prePageNum=1; //이전 페이지 번호
let lastPage="${lastPage}"; 
</script>
</html>