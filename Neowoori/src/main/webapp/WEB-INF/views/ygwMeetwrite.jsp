<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	HttpSession sess = request.getSession(false);
	if(session.getAttribute("userid")==null){
		response.sendRedirect("/login");
	}
%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 스터디 게시판</title>
</head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="${path}/resources/pjh/meetView.css" type="text/css" >
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<body>
<jsp:include page="/module/nav.jsp" flush="false" />
<div class="wrapper">
	<table class="keywords">
		<tr >
			<td class=btn_div>
				<select class=btn_su id=sel_su style="border:1px solid;"> 
					<option>제목</option>
					<option>작성자</option>
				</select>
			</td>
			<td class=btn_div >
				<input type="text" class=btn_su id=inp_su placeholder="검색어 입력">
				<button class="btn_search"><img src="${path}/resources/img/search.PNG" id=btn_search></button>
			</td>
		</tr>
	</table>
<!-- </div> -->
<!--  <div class="wrapper"> -->
<!--   <table class="keywords" id=study> -->
<!--     <thead> -->
<!--       <tr> -->
<!--      	<td width="120px" style="background-color:white;"></td> -->
<!--         <th width="120px"><span>번호</span></th> -->
<!--         <th><span>제목</span></th> -->
<!--         <th><span>작성자</span></th> -->
<!--         <th><span>작성 일자</span></th> -->
<!--         <th><span></span></th> -->
<!--       </tr> -->
<!--     </thead> -->
    
    
<!--   </table> -->
<!--  </div> -->
<div class="container" id=User_show>
	<table class="table table-hover" id='study'>
	  <thead class="thead-light">
	    <tr>
	      <th></th>
	      <th class="jsb_table_width1">No</th>
	      <th class="jsb_table_width2">제목</th>
	      <th class="jsb_table_width3">작성자</th>
	      <th class="jsb_table_width4">작성 날짜</th>
	    </tr>
	  </thead>
	  <tbody class="list">
	  <input type=hidden id=hid_qna value="">
	  </tbody>
	</table>
</div>
<!--  <div class="wrapper" align="right"> -->
<!-- 	<table> -->
<!-- 		<tr> -->
<!-- 			<td><button class="btn_list">화상스터디</button></td> -->
<!-- 			<td><button class="btn_list" id=btn_create style="margin:0 150px 30px 15px;">글쓰기</button></td> -->
<!-- 			<td><button class="btn_list" id=btn_back style="margin:0 5px 30px 15px;">게시물 관리</button></td> -->
<!-- 			<td><button class="btn_list" id=btn_delete>삭제</button></td> -->
<!-- 		</tr> -->
<!-- 	</table> -->
<!-- </div> -->
 <div align="right" class="container">
	<table>
		<tr>
			<button type="button" id=btn_create class="btn btn-outline-secondary">글쓰기</button>
			&nbsp;&nbsp;&nbsp;
			<button type="button" id=btn_back class="btn btn-outline-secondary">게시물 관리</button>
			&nbsp;&nbsp;&nbsp;
			<button type="button" id=btn_delete class="btn btn-outline-secondary">삭제</button>
		</tr>
	</table>
</div>
<!-- ---------------------------------페이징 띄우는곳------------------------------------------ -->
<!-- <div id=paging style="width:100px; margin: 0 auto;"> -->
<!-- <nav aria-label="Page navigation example" style="width:100px; margin: 0 auto;"> -->
<!--   <ul class="pagination"> -->
<!--     <li class="page-item"><a class="page-link" href="#">Previous</a></li> -->
<!--     <li class="page-item"><a class="page-link" href="#">1</a></li> -->
<!--     <li class="page-item"><a class="page-link" href="#">2</a></li> -->
<!--     <li class="page-item"><a class="page-link" href="#">3</a></li> -->
<!--     <li class="page-item"><a class="page-link" href="#">Next</a></li> -->
<!--   </ul> -->
<!-- </nav> -->
<!-- </div> -->
<div class="w3-center">
	<div calss="w3-bar" id=btn_paging>
		
	</div>
</div>


<!-- 글쓰기 modal -->
	<div class="modal fade" id="write_updateModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="updateModalLabel">스터디 게시글 작성</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">

	      	<div class="mb-4">
					<label for="message-text" class="col-form-label">제목:</label>
					<textarea class="form-control myscrollbar" id=postTitle placeholder="제목을 입력하세요."></textarea>
			</div>
			<div class="mb-4">
					<label for="message-text" class="col-form-label">내용:</label>
					<textarea class="form-control myscrollbar" id=postContent placeholder="내용을 입력하세요." style="height:500px;"></textarea>
			</div>
			<div class="mb-4">
					<input type="checkbox" id=noticeCheckbox name=noticeCheckbox>공지사항 
			</div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id=btnCloseModal>취소</button>
	        <button type="button" class="btn btn-primary" id=btnwrite data-bs-dismiss="modal">수정 완료</button>
	      </div>
	    </div>
	  </div>
	</div>

<!-- alert -->
	<jsp:include page="/module/alertModal.jsp" flush="false" />
<!-- ---------------------------------페이징 띄우는곳------------------------------------------ -->

<jsp:include page="/module/footer.jsp" flush="false" />
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script>
//아이디 세션
var se = '<%=session.getAttribute("userid")%>';
//유저num 세션
var usernum = '<%=session.getAttribute("u_num")%>';

var hid = 0; //공지 개수 히든값 (공지 - 게시물 해야지 순차적인 번호 가능)

var s_num = ${s_num}; // 스터디번호 파라미터

var s_num1; // 페이지 들어왔을때 ready이벤트로 스터디번호 세션저장

var form = {s_num:s_num}; //스터디번호 저장


$(document)

	/*---------------------------------처음 화면------------------------------------------*/

.ready(function(){ // 처음 들어가면 내 스터디 다 보임
	  
	/*-------------------------스터디 장 & 일반 유저 & 가입 승인중 마다 다른 이벤트 -------------------------*/
	
	var s_state = {u_num:usernum,s_num:s_num}; // 회원 상태 찾기위한 json
	$.ajax({
        url:'${path}/studystate'
	    , data: JSON.stringify(s_state) 
		, contentType:'application/json; charset=UTF-8'
	    , dataType:'text'
		, method:'post'
        , success :
        	function output(resp){
        	console.log(resp);
        	if(resp == 30){
        		return;
        	}else{
        		$('#btn_delete').hide();
        	}
        }
	})
	
		
	/*--------------------------------------------------------------------------------------------*/
	
	
	
	$('.stpost').remove(); //지우면서 다시 리로딩
	$.ajax({
        url:'${path}/studypost'
	    , data: JSON.stringify(form) 
		, contentType:'application/json; charset=UTF-8'
	    , dataType:'text'
		, method:'post'
        , success :
        	function output(resp){
        	s_num1 = '<%=session.getAttribute("s_num")%>';
        	var result = '';
        	var sum = 0; // 공지사항 개수 확인 (왜 두개를 나눴는지 까먹음...무서워서 못건들이는중..)
        	var notice = 0; // 공지사항 개수 저장 변수
        		result += '<tbody class=test)>'
     			$.each(JSON.parse(resp),function(index,item){
     				if(item["postType"] == "20"){
     				result += ' <tr class="stpost">'
   					result += ' <td onclick="event.cancelBubble=true"><input type="checkbox" id='+item["postNum"]+' class=ch_Box style="display:none"></td>'
					result += ' <td class="lalign">공지</td>'
					result += ' <td>'+item["title"]+'</td>'
					result += ' <td>'+item["unick"]+'</td>'
					result += ' <td>'+item["post_Date"]+'</td>'
					result += ' <td><input type=hidden value="'+item["postNum"]+'"></td>'
		 			result += ' </tr>'
		 			sum++;
		 			notice++;
     				}
     				else{
     					result += ' <tr class="stpost">'
   	   					result += ' <td onclick="event.cancelBubble=true"><input type="checkbox" id='+item["postNum"]+' class=ch_Box style="display:none"></td>'
   						result += ' <td class="lalign">'+(index-(sum-1))+'</td>'
   						result += ' <td>'+item["title"]+'</td>'
   						result += ' <td>'+item["unick"]+'</td>'
   						result += ' <td>'+item["post_Date"]+'</td>'
   						result += ' <td><input type=hidden value="'+item["postNum"]+'"></td>'
   			 			result += ' </tr>'
     				}
     			})
     				result += ' <input type=hidden id=hid value="'+notice+'">' // 공지 개수 저장
		 			result += '</tbody>'
           	 $('#study').append(result);
        }
	})
	
	
	/*---------------------------------처음 페이징 화면------------------------------------------*/
	$.ajax({
        url:'${path}/postcount.do'
       	, data: JSON.stringify(form)
   		, contentType:'application/json; charset=UTF-8'
   	    , dataType:'text'
   		, method:'post'
        , success :
        	function output(resp){
        	var paging = parseInt(resp/10);  // 총 유저수 / 5 
        	if(resp%10 != 0){ // 나머지가 0이 아니면 + 1
        		paging = paging + 1; // 나머지 때문에 +1 (if문 사용해서 수정해야됨.)
            	}
        	var result = '';
        	for(var i = 1; i <= paging; i++){
        		result += '<a href="#" class="w3-button" value="'+i+'">'+i+'</a>'
        	}
    	$('#btn_paging').append(result)
        }
        })
})  
	/*----------------------------------------------------------------------------*/




/*---------------------------------페이징 클릭시------------------------------------------*/

.on('click','.w3-button',function(){
	$('.stpost').remove(); //지우면서 다시 리로딩
	$('.test').remove();
	var btnnum = $(this).text(); // 선택한 버튼의 값 (ex = 1,2,3,4)
	var btnvalue = (btnnum * 10) - 10; // (선택한 버튼의 값 * 5) - 1 == sql에서 사용할 값
	if(btnnum == 1){ // 1 이면 처음 값 그대로 가져오기.
		btnnum = 0;
	}
	else{
		btnnum = (btnnum * 10) - 10;
	}
	var sum = {btnvalue:btnvalue,s_num:s_num}
	var select = 0;
	if($('#sel_su').val() == "제목" && $('#sel_su').val() != ""){ // select 제목(1),작성자(2) 일반(3)구별
		select = 1;
	}else if($('#sel_su').val() == "작성자" && $('#sel_su').val() != ""){
		select = 2;
	}else{
		select = 0;
	}

	/*---------------------------------아무것도 검색 안했을때 페이징 클릭시------------------------------------------*/
	if(select == 0){
	$.ajax({
        url:'${path}/studypostpaging.do'
        , data: JSON.stringify(sum)
       	, contentType:'application/json; charset=UTF-8'
       	, dataType:'text'
        , method:'post'
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
	        $.each(JSON.parse(resp),function(index,item){
	        	if(item["postType"] == "20"){
		        	result += ' <tr class="stpost">'
					result += ' <td onclick="event.cancelBubble=true"><input type="checkbox" id='+item["postNum"]+' class=ch_Box style="display:none"></td>'
					result += ' <td class="lalign">공지</td>'
					result += ' <td>'+item["title"]+'</td>'
					result += ' <td>'+item["unick"]+'</td>'
					result += ' <td>'+item["post_Date"]+'</td>'
					result += ' <td><input type=hidden value="'+item["postNum"]+'"></td>'
		 			result += ' </tr>'
		        	miu++;
 				}else{
 					result += ' <tr class="stpost">'
   					result += ' <td onclick="event.cancelBubble=true"><input type="checkbox" id='+item["postNum"]+' class=ch_Box style="display:none"></td>'
					result += ' <td class="lalign">'+(parseInt(posthid)+1)+'</td>'
					result += ' <td>'+item["title"]+'</td>'
					result += ' <td>'+item["unick"]+'</td>'
					result += ' <td>'+item["post_Date"]+'</td>'
					result += ' <td><input type=hidden value="'+item["postNum"]+'"></td>'
		 			result += ' </tr>'
		 			posthid++;
 				}
	        })
	        result += ' <input type=hidden id=hid value="'+hid+'">'
	        result +='</tbody>'
	        $('#study').append(result)
    	}
	})
	/*------------------------------------------------------------------*/
	
	

	
	/*---------------------------------제목 검색했을때 페이징 클릭시------------------------------------------*/
   }else if(select == 1){ //제목 입력했을 시
	   var title_writer = {title_writer:$('#inp_su').val(),btnvalue:btnvalue,s_num:s_num}
		var title_writer_count = {title_writer:$('#inp_su').val(),s_num:s_num}
		$.ajax({
	        url:'${path}/pjhtitle.do'
	       	, data: JSON.stringify(title_writer)
	   		, contentType:'application/json; charset=UTF-8'
	   	    , dataType:'text'
	   		, method:'post'
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
		        $.each(JSON.parse(resp),function(index,item){
		        	if(item["postType"] == "20"){
			        	result += ' <tr class="stpost">'
						result += ' <td onclick="event.cancelBubble=true"><input type="checkbox" id='+item["postNum"]+' class=ch_Box style="display:none"></td>'
						result += ' <td class="lalign">공지</td>'
						result += ' <td>'+item["title"]+'</td>'
						result += ' <td>'+item["unick"]+'</td>'
						result += ' <td>'+item["post_Date"]+'</td>'
						result += ' <td><input type=hidden value="'+item["postNum"]+'"></td>'
			 			result += ' </tr>'
			        	miu++;
	 				}else{
	 					result += ' <tr class="stpost">'
	   					result += ' <td onclick="event.cancelBubble=true"><input type="checkbox" id='+item["postNum"]+' class=ch_Box style="display:none"></td>'
						result += ' <td class="lalign">'+(parseInt(posthid)+1)+'</td>'
						result += ' <td>'+item["title"]+'</td>'
						result += ' <td>'+item["unick"]+'</td>'
						result += ' <td>'+item["post_Date"]+'</td>'
						result += ' <td><input type=hidden value="'+item["postNum"]+'"></td>'
			 			result += ' </tr>'
			 			posthid++;
	 				}
		        })
		        result += ' <input type=hidden id=hid value="'+hid+'">'
		        result +='</tbody>'
		        $('#study').append(result)
	    	}
	        })
	        $('.w3-button').remove();
	        $.ajax({
	        url:'${path}/pjhtitlecount.do'
	       	, data: JSON.stringify(title_writer_count)
	   		, contentType:'application/json; charset=UTF-8'
	   	    , dataType:'text'
	   		, method:'post'
	        , success :
	        	function output(resp){
	        	var paging = parseInt(resp/10);  // 총 유저수 / 5 
	        	if(resp%10 != 0){ // 나머지가 0이 아니면 + 1
	        		paging = paging + 1; // 나머지 때문에 +1 (if문 사용해서 수정해야됨.)
	            	}
	        	var result = '';
	        	for(var i = 1; i <= paging; i++){
	        		result += '<a href="#" class="w3-button" value="'+i+'">'+i+'</a>'
	        	}
	    	$('#btn_paging').append(result)
	        }
	        })
	 /*------------------------------------------------------------------*/       
	        
	        
	        
	/*---------------------------------작성자 검색했을때 페이징 클릭시------------------------------------------*/       
   }else if(select == 2){
	   var title_writer = {title_writer:$('#inp_su').val(),btnvalue:btnvalue,s_num:s_num}
	   var title_writer_count = {title_writer:$('#inp_su').val(),s_num:s_num}
	   $.ajax({
	        url:'${path}/pjhwriter.do'
	       	, data: JSON.stringify(title_writer)
	   		, contentType:'application/json; charset=UTF-8'
	   	    , dataType:'text'
	   		, method:'post'
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
		        $.each(JSON.parse(resp),function(index,item){
		        	if(item["postType"] == "20"){
			        	result += ' <tr class="stpost">'
						result += ' <td onclick="event.cancelBubble=true"><input type="checkbox" id='+item["postNum"]+' class=ch_Box style="display:none"></td>'
						result += ' <td class="lalign">공지</td>'
						result += ' <td>'+item["title"]+'</td>'
						result += ' <td>'+item["unick"]+'</td>'
						result += ' <td>'+item["post_Date"]+'</td>'
						result += ' <td><input type=hidden value="'+item["postNum"]+'"></td>'
			 			result += ' </tr>'
			        	miu++;
	 				}else{
	 					result += ' <tr class="stpost">'
	   					result += ' <td onclick="event.cancelBubble=true"><input type="checkbox" id='+item["postNum"]+' class=ch_Box style="display:none"></td>'
						result += ' <td class="lalign">'+(parseInt(posthid)+1)+'</td>'
						result += ' <td>'+item["title"]+'</td>'
						result += ' <td>'+item["unick"]+'</td>'
						result += ' <td>'+item["post_Date"]+'</td>'
						result += ' <td><input type=hidden value="'+item["postNum"]+'"></td>'
			 			result += ' </tr>'
			 			posthid++;
	 				}
		        })
		        result += ' <input type=hidden id=hid value="'+hid+'">'
		        result +='</tbody>'
		        $('#study').append(result)
	    	}
	        })
	        
	    $('.w3-button').remove();
		
		
       $.ajax({
       url:'${path}/pjhwritercount.do'
      	, data: JSON.stringify(title_writer_count)
  		, contentType:'application/json; charset=UTF-8'
  	    , dataType:'text'
  		, method:'post'
       , success :
       	function output(resp){
    	   var paging = parseInt(resp/10);  // 총 유저수 / 5 
	       	if(resp%10 != 0){ // 나머지가 0이 아니면 + 1
	       		paging = paging + 1; // 나머지 때문에 +1 (if문 사용해서 수정해야됨.)
	           	}
	       	var result = '';
	       	for(var i = 1; i <= paging; i++){
	       		result += '<a href="#" class="w3-button" value="'+i+'">'+i+'</a>'
       			}
   	$('#btn_paging').append(result)
       }
       })
   }
})

/*------------------------------------------------------------------*/




.on('click','#btn_search',function(){ // 검색
	var select = 0;
	
	/*----------------------------검색어에 아무것도 입력안했을때 처음화면 보여주기--------------------------------------*/
	if($('#inp_su').val()==""){
		alertModal("알림","검색어를 입력해주세요.");
		$('.stpost').remove(); //지우면서 다시 리로딩
		$.ajax({
	        url:'${path}/studypost'
		    , data: JSON.stringify(form)
			, contentType:'application/json; charset=UTF-8'
		    , dataType:'text'
			, method:'post'
	        , success :
	        	function output(resp){
	        	s_num1 = '<%=session.getAttribute("s_num")%>';
	        	var result = '';
	        	var sum = 0;
	        	var notice = 0;
	        		result += '<tbody class=test)>'
	     			$.each(JSON.parse(resp),function(index,item){
	     				if(item["postType"] == "20"){
	     				result += ' <tr class="stpost">'
	   					result += ' <td onclick="event.cancelBubble=true"><input type="checkbox" id='+item["postNum"]+' class=ch_Box style="display:none"></td>'
						result += ' <td class="lalign">공지</td>'
						result += ' <td>'+item["title"]+'</td>'
						result += ' <td>'+item["unick"]+'</td>'
						result += ' <td>'+item["post_Date"]+'</td>'
						result += ' <td><input type=hidden value="'+item["postNum"]+'"></td>'
			 			result += ' </tr>'
			 			sum++;
			 			notice++;
	     				}
	     				else{
	     					result += ' <tr class="stpost">'
	   	   					result += ' <td onclick="event.cancelBubble=true"><input type="checkbox" id='+item["postNum"]+' class=ch_Box style="display:none"></td>'
	   						result += ' <td class="lalign">'+(index-(sum-1))+'</td>'
	   						result += ' <td>'+item["title"]+'</td>'
	   						result += ' <td>'+item["unick"]+'</td>'
	   						result += ' <td>'+item["post_Date"]+'</td>'
	   						result += ' <td><input type=hidden value="'+item["postNum"]+'"></td>'
	   			 			result += ' </tr>'
	     				}
	     			})
	     				result += ' <input type=hidden id=hid value="'+notice+'">' // 공지 개수 저장
			 			result += '</tbody>'
	           	 $('#study').append(result);
	        }
		})
		/*---------------------------------페이징 띄우는곳------------------------------------------*/
		$('.w3-button').remove();
		$.ajax({
	        url:'${path}/postcount.do'
	       	, data: JSON.stringify(form)
	   		, contentType:'application/json; charset=UTF-8'
	   	    , dataType:'text'
	   		, method:'post'
	        , success :
	        	function output(resp){
	        	var paging = parseInt(resp/10);  // 총 유저수 / 5 
		       	if(resp%10 != 0){ // 나머지가 0이 아니면 + 1
		       		paging = paging + 1; // 나머지 때문에 +1 (if문 사용해서 수정해야됨.)
		           	}
		       	var result = '';
		       	for(var i = 1; i <= paging; i++){
		       		result += '<a href="#" class="w3-button" value="'+i+'">'+i+'</a>'
	       			}
	   	$('#btn_paging').append(result)
	        }
	        })
		return false;
	}
	/*------------------------------------------------------------------*/
	
	
	
	/*------------------------------제목으로 처음 검색했을때 게시판 및 페이징------------------------------------*/
	
	if($('#sel_su').val() == "제목"){ // select 제목(1),작성자(2) 구별
		select = 1;
	}else{
		select = 2;
	}
	$('.stpost').remove(); //지우면서 다시 리로딩
	$('.test').remove();
	var btnnum = $(this).text(); // 선택한 버튼의 값 (ex = 1,2,3,4)
	var btnvalue = (btnnum * 10) - 10; // (선택한 버튼의 값 * 5) - 1 == sql에서 사용할 값
	if(btnnum == 1){ // 1 이면 처음 값 그대로 가져오기.
		btnnum = 0;
	}
	else if(btnnum == 0){
		btnnum = 0;
	}
	else{
		btnnum = (btnnum * 10) - 10;
	}
	var title_writer = {title_writer:$('#inp_su').val(),btnvalue:btnvalue,s_num:s_num}
	var title_writer_count = {title_writer:$('#inp_su').val(),s_num:s_num}
	if(select == 1){ // 제목 선택시
	$.ajax({
        url:'${path}/pjhtitle.do'
       	, data: JSON.stringify(title_writer)
   		, contentType:'application/json; charset=UTF-8'
   	    , dataType:'text'
   		, method:'post'
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
	        $.each(JSON.parse(resp),function(index,item){
	        	if(item["postType"] == "20"){
		        	result += ' <tr class="stpost">'
					result += ' <td onclick="event.cancelBubble=true"><input type="checkbox" id='+item["postNum"]+' class=ch_Box style="display:none"></td>'
					result += ' <td class="lalign">공지</td>'
					result += ' <td>'+item["title"]+'</td>'
					result += ' <td>'+item["unick"]+'</td>'
					result += ' <td>'+item["post_Date"]+'</td>'
					result += ' <td><input type=hidden value="'+item["postNum"]+'"></td>'
		 			result += ' </tr>'
		        	miu++;
 				}else{
 					result += ' <tr class="stpost">'
   					result += ' <td onclick="event.cancelBubble=true"><input type="checkbox" id='+item["postNum"]+' class=ch_Box style="display:none"></td>'
					result += ' <td class="lalign">'+(parseInt(posthid)+1)+'</td>'
					result += ' <td>'+item["title"]+'</td>'
					result += ' <td>'+item["unick"]+'</td>'
					result += ' <td>'+item["post_Date"]+'</td>'
					result += ' <td><input type=hidden value="'+item["postNum"]+'"></td>'
		 			result += ' </tr>'
		 			posthid++;
 				}
	        })
	        result += ' <input type=hidden id=hid value="'+hid+'">'
	        result +='</tbody>'
	        $('#study').append(result)
    	}
        })
        $('.w3-button').remove();
		
		
        $.ajax({
        url:'${path}/pjhtitlecount.do'
       	, data: JSON.stringify(title_writer_count)
   		, contentType:'application/json; charset=UTF-8'
   	    , dataType:'text'
   		, method:'post'
        , success :
        	function output(resp){
        	var paging = parseInt(resp/10);  // 총 유저수 / 5 
	       	if(resp%10 != 0){ // 나머지가 0이 아니면 + 1
	       		paging = paging + 1; // 나머지 때문에 +1 (if문 사용해서 수정해야됨.)
	           	}
	       	var result = '';
	       	for(var i = 1; i <= paging; i++){
	       		result += '<a href="#" class="w3-button" value="'+i+'">'+i+'</a>'
       			}
   	$('#btn_paging').append(result)
        }
        })
        
        /*------------------------------------------------------------------*/
        
        
        
        /*------------------------------작성자로 처음 검색했을때 게시판 및 페이징------------------------------------*/
        
	}else if(select == 2){ //작성자 선택시
		$.ajax({
	        url:'${path}/pjhwriter.do'
	       	, data: JSON.stringify(title_writer)
	   		, contentType:'application/json; charset=UTF-8'
	   	    , dataType:'text'
	   		, method:'post'
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
		        $.each(JSON.parse(resp),function(index,item){
		        	if(item["postType"] == "20"){
			        	result += ' <tr class="stpost">'
						result += ' <td onclick="event.cancelBubble=true"><input type="checkbox" id='+item["postNum"]+' class=ch_Box style="display:none"></td>'
						result += ' <td class="lalign">공지</td>'
						result += ' <td>'+item["title"]+'</td>'
						result += ' <td>'+item["unick"]+'</td>'
						result += ' <td>'+item["post_Date"]+'</td>'
						result += ' <td><input type=hidden value="'+item["postNum"]+'"></td>'
			 			result += ' </tr>'
			        	miu++;
	 				}else{
	 					result += ' <tr class="stpost">'
	   					result += ' <td onclick="event.cancelBubble=true"><input type="checkbox" id='+item["postNum"]+' class=ch_Box style="display:none"></td>'
						result += ' <td class="lalign">'+(parseInt(posthid)+1)+'</td>'
						result += ' <td>'+item["title"]+'</td>'
						result += ' <td>'+item["unick"]+'</td>'
						result += ' <td>'+item["post_Date"]+'</td>'
						result += ' <td><input type=hidden value="'+item["postNum"]+'"></td>'
			 			result += ' </tr>'
			 			posthid++;
	 				}
		        })
		        result += ' <input type=hidden id=hid value="'+hid+'">'
		        result +='</tbody>'
		        $('#study').append(result)
	    	}
	        })
	        
	    $('.w3-button').remove();
        $.ajax({
        url:'${path}/pjhwritercount.do'
       	, data: JSON.stringify(title_writer_count)
   		, contentType:'application/json; charset=UTF-8'
   	    , dataType:'text'
   		, method:'post'
        , success :
        	function output(resp){
        	var paging = parseInt(resp/10);  // 총 유저수 / 5 
	       	if(resp%10 != 0){ // 나머지가 0이 아니면 + 1
	       		paging = paging + 1; // 나머지 때문에 +1 (if문 사용해서 수정해야됨.)
	           	}
	       	var result = '';
	       	for(var i = 1; i <= paging; i++){
	       		result += '<a href="#" class="w3-button" value="'+i+'">'+i+'</a>'
       			}
   	$('#btn_paging').append(result)
        }
        })
	}
})
/*------------------------------------------------------------------*/




/*-------------------------글쓰기 클릭시 이벤트 -------------------------*/

// .on('click','#btn_create',function(){ // 글쓰기
// 	location.href = '${path}/meetwrite'
// })

/*------------------------------------------------------------------*/




/*-------------------------스터디 장 삭제 클릭시 이벤트 -------------------------*/

.on('click','#btn_delete',function(){ // 삭제
	$('.ch_Box').css("display","");
	var cnt = $("input[class='ch_Box']:checked").length; // 체크 개수
	console.log(cnt);
    var arr = new Array(); // 저장할 array
    $("input[class='ch_Box']:checked").each(function() {
        arr.push($(this).attr('id'));
    });
    console.log(arr);
    var cnt_arr = {arr:arr,cnt:cnt};
    if(cnt == 0){
    	alertModal("알림","선택 후 다시 삭제를 눌러주세요.");
    }
    else{
    	 $.ajax({
                 type: "POST"
                 ,url: "${path}/pjhpostdelete.do"
                 ,data: JSON.stringify(cnt_arr)
            	 ,contentType:'application/json; charset=UTF-8'
                 ,dataType:"text"
                 ,success: function(jdata){
                	 alert(cnt+"개의 게시물을 삭제했습니다.");
                	 location.reload();
                     }
             })
    }
})
.on('click','#btn_create',function(){
	$('#write_updateModal').modal('show');
})
//글쓰기 모달
.on('click','#btn_create',function(){ // 글쓰기 누를시 제목&내용 확인 / 있으면 값 전송
	if($('#postTitle').val()== ""){
		alert("제목을 입력해주세요.");
	}
	else if($('#postContent').val() == ""){
		alert("내용을 입력해주세요.");
	}
	
	/*------공시사항 여부------*/
	var result = 0;
	 if($('input').is(":checked") == true){
		 result = 20; // 체크하면 공지사항
	    }else{
	     result = 10; // 체크 안하면 일반
	    }
	/*------공시사항 여부------*/

	var s_id = s_num;
	var title = $('#postTitle').val();
	var Content = $('#postContent').val();
	var form = {usernum:usernum,s_id:s_id,title:title,Content:Content.trim(),result:result};
	console.log(form);
	$.ajax({
		    url: "${path}/MeetWirte",
		    data: JSON.stringify(form),
		    contentType:'application/json; charset=UTF-8',
			dataType:'text',
			method:'post',
		    
		    success : function(data){
		      alert("글쓰기 성공")
// 		      location.href = '/app/meetView'
		    },
		    error : function(){
		      alert("글쓰기 실패")		
		    }
		  });
})

/*------------------------------------------------------------------------*/

// 해당 게시물 클릭할때 이벤트
.on('click','.stpost',function(){
	var post_num = $(this).find($("input[type='hidden']")).val();
	console.log(post_num);
	location.href = '${path}/postView/'+post_num
})

//이전페이지
.on('click','#btn_back',function(){
	location.href = document.referrer;
})

</script>
</html>