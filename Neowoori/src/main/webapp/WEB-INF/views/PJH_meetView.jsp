<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 스터디 게시판</title>
</head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/pjh/meetView.css" type="text/css" >
<body>
<jsp:include page="/module/nav.jsp" flush="false" />
<div class="wrapper">
	<table class="keywords">
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
  <table class="keywords" id=study>
    <thead>
      <tr>
     	<td width="120px" style="background-color:white;"></td>
        <th width="120px"><span>번호</span></th>
        <th width="400px"><span>제목</span></th>
        <th><span>작성자</span></th>
        <th><span>작성 일자</span></th>
        <th><span></span></th>
      </tr>
    </thead>
    
    
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
<!-- ---------------------------------페이징 띄우는곳------------------------------------------ -->
<div id=paging>
<!-- <nav aria-label="Page navigation example" style="width:100px; margin: 0 auto;"> -->
<!--   <ul class="pagination"> -->
<!--     <li class="page-item"><a class="page-link" href="#">Previous</a></li> -->
<!--     <li class="page-item"><a class="page-link" href="#">1</a></li> -->
<!--     <li class="page-item"><a class="page-link" href="#">2</a></li> -->
<!--     <li class="page-item"><a class="page-link" href="#">3</a></li> -->
<!--     <li class="page-item"><a class="page-link" href="#">Next</a></li> -->
<!--   </ul> -->
<!-- </nav> -->
</div>
<!-- ---------------------------------페이징 띄우는곳------------------------------------------ -->

<jsp:include page="/module/footer.jsp" flush="false" />
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script>
var se = '<%=session.getAttribute("userid")%>';
console.log(se);
var hid = 0;
$(document)
/*---------------------------------AJAX내 스터디 게시판 띄우는곳------------------------------------------*/

.ready(function(){ // 처음 들어가면 내 스터디 다 보임
	$('.stpost').remove(); //지우면서 다시 리로딩
	$.ajax({
        url:'studypost'
        , method : 'POST'
        , data: {}
        , contentType : 'application/json; charset=UTF-8'
        , dataType : 'json'
        , success :
        	function output(resp){
        	console.log(resp);
        	var result = '';
        	var sum = 0;
        	var notice = 0;
        		result += '<tbody class=test)>'
     			$.each(resp,function(index,item){
     				if(item["postType"] == "20"){
     				result += ' <tr class="stpost">'
   					result += ' <td><input type="checkbox"></td>'
					result += ' <td class="lalign">공지</td>'
					result += ' <td>'+item["title"]+'</td>'
					result += ' <td>'+item["post_Contents"]+'</td>'
					result += ' <td>'+item["post_Date"]+'</td>'
		 			result += ' </tr>'
		 			sum++;
		 			notice++;
     				}
     				else{
     					result += ' <tr class="stpost">'
   	   					result += ' <td><input type="checkbox"></td>'
   						result += ' <td class="lalign">'+(index-(sum-1))+'</td>'
   						result += ' <td>'+item["title"]+'</td>'
   						result += ' <td>'+item["post_Contents"]+'</td>'
   						result += ' <td>'+item["post_Date"]+'</td>'
   			 			result += ' </tr>'
     				}
     			})
     				result += ' <input type=hidden id=hid value="'+notice+'">' // 공지 개수 저장
		 			result += '</tbody>'
           	 $('#study').append(result);
        }
	})
	/*---------------------------------페이징 띄우는곳------------------------------------------*/
		$.ajax({
        url:'postcount.do'
        , method : 'POST'
        , data: {}
        , contentType : 'application/json; charset=UTF-8'
        , dataType : 'json'
        , success :
        	function output(resp){
        	var test = parseInt(resp/10);  // 총 유저수 / 5 
        	test = test + 1; // 나머지 때문에 +1 (if문 사용해서 수정해야됨.)
        	var result = '';
        	result += '<nav aria-label="Page navigation example" style="width:100px; margin: 0 auto;">'
        	result += '<ul class="pagination">'
        	for(var i = 1; i <= test; i++){
        		result +='<li class="page-item" value='+i+'><a class="page-link" href="#">'+i+'</a></li>'
        	}
        	result += '</ul>'
        	result += '</nav>'
        	$('#paging').append(result)
        }
        })
})  
/*---------------------------------페이징 클릭시------------------------------------------*/

.on('click','.page-item',function(){
	$('.stpost').remove(); //지우면서 다시 리로딩
	$('.test').remove();
	var btnnum = $(this).val(); // 선택한 버튼의 값 (ex = 1,2,3,4)
	var btnvalue = (btnnum * 10) - 10; // (선택한 버튼의 값 * 5) - 1 == sql에서 사용할 값
	if(btnnum == 1){ // 1 이면 처음 값 그대로 가져오기.
		btnnum = 0;
	}
	else{
		btnnum = (btnnum * 10) - 10;
	}
	$.ajax({
        url:'studypostpaging.do'
        , method : 'POST'
        , data: {btnvalue : btnvalue}
        , dataType : 'json'
        , success :
        	function output(resp){
        	var result = '';
        	var miu = $('#hid').val(); //공지 개수
        	var posthid = 0; // 포스트 넘버
        	if(btnnum == 0){
        		posthid = 1*btnnum;
        	}
        	else{
        		posthid = 1*btnnum-miu; // ex) 1 * 10 - 공지 개수
        	}
	        result +='<tbody class=test>'
	        $.each(resp,function(index,item){
	        	if(item["postType"] == "20"){
		        	result += ' <tr class="stpost">'
					result += ' <td><input type="checkbox"></td>'
					result += ' <td class="lalign">공지</td>'
					result += ' <td>'+item["title"]+'</td>'
					result += ' <td>'+item["post_Contents"]+'</td>'
					result += ' <td>'+item["post_Date"]+'</td>'
		 			result += ' </tr>'
		        	miu++;
 				}else{
 					result += ' <tr class="stpost">'
   					result += ' <td><input type="checkbox"></td>'
					result += ' <td class="lalign">'+(parseInt(posthid)+1)+'</td>'
					result += ' <td>'+item["title"]+'</td>'
					result += ' <td>'+item["post_Contents"]+'</td>'
					result += ' <td>'+item["post_Date"]+'</td>'
		 			result += ' </tr>'
		 			posthid++;
 				}
	        })
	        result += ' <input type=hidden id=hid value="'+hid+'">'
	        result +='</tbody>'
	        $('#study').append(result)
    	}
	})
	
})
</script>
</html>