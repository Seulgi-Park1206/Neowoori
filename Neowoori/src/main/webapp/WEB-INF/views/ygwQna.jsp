<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A</title>
</head>
<style>
/*
table{
	width: 100%;
    border: 1px solid #000000;
    border-collapse: collapse;
}
th, td {
    border: 1px solid #000000;
    padding: 10px;
}
*/
</style>

<link rel="stylesheet" href="resources/pjh/faq.css" type="text/css" >
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="${path}/resources/ygw/qna.css">
<body>
<jsp:include page="/module/nav.jsp" flush="false" />
<div style="text-align:center;">
	<h2>Q & A</h2>
</div>
<br>
<div class="input-group mb-3" style="text-align:center; float:none; margin:0 auto; width:50%;">
				
				<select class="form-select" aria-label="Default select example" id=search_faq_sel name=search_faq_sel>
					<option value="" disabled selected>선택</option>
					<option value=faqtitle>제목</option>
					<option value=faqcontent>내용</option>
				</select>
				
				<input type="text"  class="form-control" aria-label="Text input with dropdown button" id=search_input placeholder="제목이나 내용을 입력하세요." style="float:none; margin:0 auto; width:20%;">
				<button id=search_btn><img src="${path}/resources/img/faq_search_btn.png" width="20" height="20"></button>
				<br><br>
				
</div>
<div class=qnadiv id=div1 style="margin:0 auto;">
<table class="table table-hover" id=tbl1 style="text-align:center;">
	<thead class="thead-light">
	<tr>
		<th class="qna_table_width1"><strong>번호</strong></th>
		<th class="qna_table_width2"><strong>제목</strong></th>
		<th class="qna_table_width3"><strong>작성자</strong></th>
		<th class="qna_table_width4"><strong>작성일자</strong></th>
		<th class="qna_table_width5"><strong>상태</strong></th>
	</tr>
	</thead>
<c:forEach items="${faqData}" var="rec2">
<c:set var="i" value="${i+1}"/>
	<tr id=tr1 class=trclass1>
		<td>${i}<input type=hidden name=qnapostid value="${rec2.faqnum}"/></td><td>${rec2.faqtitle}</td><td>${rec2.writer}</td><td>${rec2.faqdate}</td><td>${rec2.state}</td>
	</tr>
</c:forEach>
</table>
</div>
<div style="text-align:right;">
	<input class="btn btn-outline-secondary" id=qnanewpost type=button value=새글쓰기  onclick=newpost()>
</div>
<div class="w3-center">

	<a href= # value=previous class="w3-bar-item w3-button" name=page>&laquo;</a><div id="divPage" style="display:inline;"><span id="paging">${paging}</span></div><a href= # value=next class="w3-bar-item w3-button" name=page>&raquo;</a>

</div>

<jsp:include page="/module/footer.jsp" flush="false" />
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script>
let prePageNum=1; //이전 페이지 번호
let lastPage="${lastPage}"; 
let userid='${userid}';

function newpost(){
	location.href='/qnawrite';
}

$(document)
.ready(function(){
	   $('.trclass1').hide();
	   $(".trclass1").slice(0, 10).show();
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

.on('click','#search_btn',function(){
	let category=$('#search_faq_sel option:selected').val();
	let keyword=$('#search_input').val();
	
	
	if($('#search_input').val()==""){
		alert("키워드를 입력해주세요!");
		$('#search_input').focus();
		return false;
	}
	$.ajax({
		type:"POST",
		url:"faqserver2",
		data :{
			category : category,
			keyword : keyword
		},
		success:function(result){
			//console.log("result 결과"+result);
			//console.log("크기 : "+result.length);
			let n = result.length;
			//console.log("n형형변환 : "+n);
			
			$('.trclass1').remove();
			
			let i=1;
			$.each(result,function(index,item){ //result 값 faqSelResult 배열
 				let str = "<tr class=trclass2><td>"+i+"<input type=hidden name=qnapostid2 value="+item['faqnum']+"></td><td>"+item['faqtitle']+"</td><td>"+item['writer']+"</td><td>"+item['faqdate']+"</td><td>"+item['state']+"</td></tr>";
 				i++;
 				
 				//console.log("item값"+JSON.stringify(str));
 				//let qnapostid=$('.trclass1').find("td:eq(0)").val();
 				//console.log("qnapostid 깂"+qnapostid);
 				$('#tbl1').append(str);
 				$('.trclass2').hide();
 				$('.trclass2').slice(0,10).show();
 				$('#paging').remove();
 			});
			lastPage=Math.ceil(n/10);
			//console.log("n이다 : "+lastPage);
			let paging = "";
			for(let i = 0; i < Math.ceil(n/10); i++){
				paging+="<a href=# class='w3-button'"+(i+1)+" name='page' value="+(i+1)+">"+(i+1)+"</a>";
			}
			$('#divPage').empty(paging);
			$('#divPage').append(paging);
			
			$('.trclass2').click(function(){
				let qnapostid2=$(this).find("td:eq(0)").find("input[name=qnapostid2]").val();
				//alert("qnaid값 : "+qnapostid2);
				//document.location="http://localhost:8080/app/qna/"+qnapostid2;
				location.href='/qna/'+qnapostid2;
			})
			
		},
		error:function(result){
			alert("fail 아작스 실패")
		}
				
	});
	
})


.on('click','.trclass1',function(){ //첫번째행 제외하고 클릭시
	let qnapostid=$(this).find("td:eq(0)").find("input[name=qnapostid]").val();
	
	//document.location="http://localhost:8080/app/qna/"+qnapostid;
	location.href='/qna/'+qnapostid;
	
	//return false;
})

/*
.on('click','#qna_answer',function(){
	//let a=$(this).find("td:eq(0)").find("input[name=qnapostid]").text();
	//let tr=$(this).parent().parent().td.eq(0).text();
	//let tr=$(this).parent().parent().eq(0).html();
	//console.log(tr);
	//alert(tr);
	
})
*/

/*
.on('click','#tbl1 td:last',function(){
	let last=$(this).find("td:eq(5)").val();
	alert("마지막값"+last);
	//let col=$(this).parent().children().index($(this));
	//let row=$(this).parent().parent().children().index($(this).parent());
	//alert("col 값 :"+col+"row 값 : "+row);
})
*/


if(userid==""){
	$('#qnanewpost').hide();
}



//var faqcnt='${faqcnt}';

</script>
</html>