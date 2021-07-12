<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	HttpSession sess = request.getSession(false);
	if(session.getAttribute("adminid")==null){
		response.sendRedirect("adminlogin");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>관리자 페이지</title>
</head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- <link rel="stylesheet" href="resources/pjh/userview.css" type="text/css"> -->
<!-- <link rel="stylesheet" href="resources/pjh/adminpage.css" type="text/css"> -->
<link rel="stylesheet"  href="resources/pjh/meetView1.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">


<body>
<jsp:include page="/module/adminnav.jsp" flush="false" />

<!-- ---------------------------------Teb 띄우는곳------------------------------------------ -->

<!-- <div class="container"> -->
<!--   <ul class="nav nav-tabs"> -->
<!--     <li class="nav-item"> -->
<!--       <a class="nav-link active" href="#" id=btnradio1>유저관리</a> -->
<!--     </li> -->
<!-- <!--     <li class="nav-item"> -->
<!-- <!--       <a class="nav-link" href="#">신고관리</a> -->
<!-- <!--     </li> -->
<!--     <li class="nav-item"> -->
<!--       <a class="nav-link active" href="#" id=btnradio3>문의사항</a> -->
<!--     </li> -->
<!--   </ul> -->
<!-- </div> -->
<div class="container">
	<ul class="nav nav-tabs" id="myTab" role="tablist">
	  <li class="nav-item" role="presentation">
	    <button class="nav-link active" id="btnradio1" data-bs-toggle="tab" data-bs-target="#home" type="button" role="tab" aria-controls="home" aria-selected="true">유저관리</button>
	  </li>
	  <li class="nav-item" role="presentation">
	    <button class="nav-link" id="btnradio3" data-bs-toggle="tab" data-bs-target="#profile" type="button" role="tab" aria-controls="profile" aria-selected="false">QnA</button>
	  </li>
	</ul>
</div>
<!-- ---------------------------------Teb 띄우는곳------------------------------------------ -->



<!-- ---------------------------------목록 띄우는곳------------------------------------------ -->
<!-- <table class="list">  -->

<!--유저-->
<div class="container" id=User_show>
	<table class="table table-hover" id='viewTable'>
	  <thead class="thead-light">
	    <tr>
	      <th></th>
	      <th class="jsb_table_width1">No</th>
	      <th class="jsb_table_width2">닉네임</th>
	      <th class="jsb_table_width3">마지막 접속</th>
	    </tr>
	  </thead>
	  <tbody class="list">
	  <input type=hidden id=hid_qna value="">
	  </tbody>
	</table>
</div>

<!--QNA -->
<div class="container" id=Qna_show style="display:none">
	<table class="table table-hover" id='viewTable'>
	  <thead class="thead-light">
	    <tr>
	      <th></th>
	      <th class="jsb_table_width4">No</th>
	      <th class="jsb_table_width5">제목</th>
	      <th class="jsb_table_width6">작성자</th>
	      <th class="jsb_table_width7">작성일자</th>
	      <th class="jsb_table_width8">상태</th>
	    </tr>
	  </thead>
	  <tbody class="list">
	  <input type=hidden id=hid_qna value="">
	  </tbody>
	</table>
</div>
<!-- ---------------------------------목록 띄우는곳------------------------------------------ -->

<!-- 삭제 버튼 -->
 <div align="right" class="container">
	<table>
		<tr>
			<button type="button" id=btn_company class="btn btn-outline-secondary" style="float: left;">회사소개 수정</button>
			<button type="button" id=btn_delete class="btn btn-outline-secondary">삭제</button>
		</tr>
	</table>
</div>



<!-- ---------------------------------페이징 띄우는곳------------------------------------------ -->
<!-- <div id=btn_paging style="width:100px; margin: 0 auto;"> -->

<!-- </div> -->
<div class="w3-center">
	<div calss="w3-bar" id=btn_paging>
		
	</div>
</div>
<!-- ---------------------------------페이징 띄우는곳------------------------------------------ -->





<!-- ---------------------------------팝업창 띄우는곳------------------------------------------ -->
<div class="container mt-3" >
  <!-- The Modal -->
  <div class="modal fade" id="myModal">
    <div class="modal-dialog">
      <div class="modal-content" >
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">유저 정보</h4>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer" id=delete_footer>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- 게시글 수정 modal -->
	<div class="modal fade" id="updateModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="updateModalLabel">질문 답변</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">

	      	<div class="mb-4">
					<label for="message-text" class="col-form-label">답변:</label>
					<textarea class="form-control myscrollbar" id=postContents placeholder="답변을 입력하세요."></textarea>
			</div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id=btnCloseModal>취소</button>
	        <button type="button" class="btn btn-primary" id=btnUpdateComplete data-bs-dismiss="modal">답변 완료</button>
	      </div>
	    </div>
	  </div>
	</div>
	
<!-- 회사 소개 수정 modal -->
	<div class="modal fade" id="Company_updateModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="updateModalLabel">회사소개 수정</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">

	      	<div class="mb-4">
					<label for="message-text" class="col-form-label">수정:</label>
					<textarea class="form-control myscrollbar" id=Company_Contents placeholder="회사 소개를 입력하세요." style="height:640px;"></textarea>
			</div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id=btnCloseModal>취소</button>
	        <button type="button" class="btn btn-primary" id=btnUpdateCompany data-bs-dismiss="modal">수정 완료</button>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- alert -->
	<jsp:include page="/module/alertModal.jsp" flush="false" />
	<!-- confirm -->
	<jsp:include page="/module/confirmModal.jsp" flush="false" />
<!-- ---------------------------------팝업창 띄우는곳------------------------------------------ -->
<jsp:include page="/module/footer.jsp" flush="false" />
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script language='javascript'>
var select = 0;
var btnnum = 1;
function userlist(){
	select = 0;
	$('.usermodal').remove(); //지우면서 다시 리로딩
	$('.w3-button').remove(); // 페이징 지우기
	$('.w3-bar-item w3-button').remove();// 페이징 지우기
	$.ajax({
        url:'userlist.do'
        , method : 'POST'
        , data: {}
        , contentType : 'application/json; charset=UTF-8'
        , dataType : 'json'
        , success :
        	function output(resp){
	        	var result = '';
// 		        result +='<thead id=list_th>'
// 		        result +="<tr class=test2><td width='120px' style='background-color:white;'></td><th><span>번호</span></th><th><span>닉네임</span></th>"
// 				+"<th><span>마지막 접속</span></th>"
// 		        +"</th>"
// 		        result +='<tbody id=list></tbody>'
		        $.each(resp,function(index,item){
		        	//data-toggle="modal" data-target="#myModal == 파업창 띄우기
		        	 result +='<tr class=usermodal data-toggle="modal" data-target="#myModal"><td onclick="event.cancelBubble=true"><input type="checkbox" class=ch_Box id='+item["uNum"]+'></td>'
		        	 result +='<td >'+item["uNum"]+'</td>'
		        	 result +='<td >'+item["uNick"]+'</td>'
		        	 result +='<td >'+item["lastJoin"]+'</td>'
		        })
// 		        result +='</tbody>'
// 		        result +='</thead>'
		        $('.list').append(result)
        	}
	})
}
function userpaging(){
	$.ajax({
        url:'count.do'
        , method : 'POST'
        , data: {}
        , contentType : 'application/json; charset=UTF-8'
        , dataType : 'json'
        , success :
        	function output(resp){
        	var test = parseInt(resp/10);  // 총 유저수 / 10
        	if(resp%10 != 0){ // 나머지가 0이 아니면 + 1
            	test = test + 1; // 나머지 때문에 +1 (if문 사용해서 수정해야됨.)
            	}
        	var result = '';
        	for(var i = 1; i <= test; i++){
        		result += '<a href="#" class="w3-button" value="'+i+'">'+i+'</a>'
        	}
        	$('#btn_paging').append(result)
        }
        })
}
$(document)
/*---------------------------------AJAX 목록 띄우는곳------------------------------------------*/
.ready(function(){ // 처음 들어가면 유저 목록 10개만 나옴.
	userlist();
	userpaging();
})

/*---------------------------------페이징 클릭시------------------------------------------*/
.on('click','.w3-button',function(){
	$('.usermodal').remove(); //지우면서 다시 리로딩
 	$('.test2').remove();
	btnnum = $(this).text(); // 선택한 버튼의 값 (ex = 1,2,3,4)
//	console.log(btnnum);
	var btnvalue = (btnnum * 10) - 10; // (선택한 버튼의 값 * 10) - 1 == sql에서 사용할 값
	if(btnnum == 1){ // 1 이면 처음 값 그대로 가져오기.
		btnnum = 0;
	}else{
		btnnum = (btnnum * 10) - 10;
	}
	if(select == 0){
	$.ajax({
        url:'btnnum.do'
        , method : 'POST'
        , data: {btnvalue : btnvalue}
        , dataType : 'json'
        , success :
        	function output(resp){
        	var result = '';
// 	        result +='<thead id=list_th>'
// 	        result +="<tr class=test2><td width='120px' style='background-color:white;'></td><th><span>번호</span></th><th><span>닉네임</span></th>"
// 			+"<th><span>마지막 접속</span></th>"
// 	        +"</th>"
// 	        result +='<tbody id=list></tbody>'
	        $.each(resp,function(index,item){
	        	 result +='<tr class=usermodal data-toggle="modal" data-target="#myModal"><td onclick="event.cancelBubble=true"><input type="checkbox" class=ch_Box id='+item["uNum"]+'></td>'
	        	 result +='<td >'+item["uNum"]+'</td>'
	        	 result +='<td >'+item["uNick"]+'</td>'
	        	 result +='<td >'+item["lastJoin"]+'</td>'
	        })
// 	        result +='</tbody>'
// 	        result +='</thead>'
	        $('.list').append(result)
    	}
	})
	}else if(select == 1){
		$.ajax({
	        url:'btnqna.do'
	        , method : 'POST'
	        , data: {btnvalue : btnvalue}
	        , dataType : 'json'
	        , success :
	        	function output(resp){
	        	var result = '';
// 		        result +='<thead id=list_th>'
// 		        result +="<tr class=test2><td width='120px' style='background-color:white;'></td><th><span>번호</span></th><th><span>제목</span></th>"
// 				+"<th><span>작성자</span></th><th><span>작성일자</span></th><th><span>상태</span></th>"
// 		        +"</th>"
// 		        result +='<tbody id=list></tbody>'
		        $.each(resp,function(index,item){
		        	 var faqdate = 0;
		        	 var faqdate = item["faqdate"].substring(0,8);
		        	 result +='<tr class=usermodal><td onclick="event.cancelBubble=true"><input type="checkbox" class=ch_Box id='+item["faqnum"]+'></td>'
		        	 result +='<td >'+item["faqnum"]+'</td>'
		        	 result +='<td >'+item["faqtitle"]+'</td>'
		        	 result +='<td >'+item["writer"]+'</td>'
		        	 result +='<td >'+faqdate+'</td>'
		        	 result +='<td >'+item["state"]+'</td>'
		        	 result +='<input type=hidden id=faqcontent value="'+item["faqcontent"]+'">'
		        })
// 		        result +='</tbody>'
// 		        result +='</thead>'
		        $('.list').append(result)
	    	}
		})
	}
	
})
/*---------------------------------페이징 클릭시------------------------------------------*/


/*---------------------------------유저 관리 팝업창 띄우는곳------------------------------------------*/
.on('click','.list tr',function(){
	$('.close').remove();
	$('.tableLeft').remove();
	$('.btn-danger').remove();
	
	var thisnum = $(this).find('td:eq(1)').text();
	if(select == 0){
	$.ajax({
        url:'usermodal.do'
        , method : 'POST'
        , data: {usernum : thisnum}
        , dataType : 'json'
        , success :
        	function output(resp){
	        	var result = '';
	        	$.each(resp,function(index,item){
	        	$('.modal-header').append('<button type="button" class="close" data-dismiss="modal">×</button>');
	        	$('.modal-body').append('<table class=tableLeft><tr><td class=tdLeft>아이디:</td><td class=tdCenter><label class=intext id=uid>'+item["userId"]+'</label></td></tr>'
	        		+'<tr><td class=tdLeft>유저 번호:</td><td class=tdCenter><label class=intext id=uNum>'+item["uNum"]+'</label></td></tr>'
					+'<tr><td class=tdLeft>닉네임:</td><td class=tdCenter><label class=intext id=nick>'+item["uNick"]+'</label></td></tr>'
					+'<tr><td class=tdLeft>성별:</td><td class=tdCenter><label class=intext id=gender>'+item["uGender"]+'</label></td></tr>'
					+'<tr><td class=tdLeft>생년월일:</td><td class=tdCenter><label class=intext id=birth>'+item["uYear"]+''+item["uBirthday"]+'</label></td></tr>'
					+'<tr><td class=tdLeft>연락처:</td><td class=tdCenter><label class=intext id=mobile>'+item["uMobile"]+'</label></td></tr>'
					+'<tr><td class=tdLeft>이메일:</td><td class=tdCenter><label class=intext id=email>'+item["uMail"]+'</label></td></tr>'
					+'</table>');
	        	$('.modal-footer').append('<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>');
	        	})
	        }
	})
	}else if(select == 1){
// 		$('.mb-3').remove();
		$('#hid_qna').val(thisnum);
		$.ajax({
	        url:'Qnamodal.do'
	        , method : 'POST'
	        , data: {qnanum : thisnum}
	        , dataType : 'json'
	        , success :
	        	function output(resp){
		        	var result = '';
		        	$.each(resp,function(index,item){
		        		
			        result +='<div class="mb-3">'
		        	result +='<label for="recipient-name" class="col-form-label">제목:</label>&nbsp;&nbsp;'
	        		result +='<label for="recipient-name" class="col-form-label" style="font-size:14px;">'+item["faqtitle"]+'</label>'
        			result +='</div>'
	       			result +='<div class="mb-3">'
	   				result +='<label for="recipient-name" class="col-form-label">작성자:</label>&nbsp;&nbsp;'
					result +='<label for="recipient-name" class="col-form-label" style="font-size:14px;">'+item["writer"]+'</label>'
					result +='</div>'
					result +='<div class="mb-3">'
					result +='<label for="recipient-name" class="col-form-label">작성날짜:</label>&nbsp;&nbsp;'
					result +='<label for="recipient-name" class="col-form-label" style="font-size:14px;">'+item["faqdate"]+'</label>'
					result +='</div>'
					result +='<div class="mb-3">'
					result +='<label for="recipient-name" class="col-form-label">내용:</label>&nbsp;&nbsp;'
					result +='<label for="recipient-name" class="col-form-label" style="font-size:14px;">'+item["faqcontent"]+'</label>'
					result +='</div>'
// 					result +='<div class="mb-3">'
// 					result +='<label for="message-text" class="col-form-label">답변:</label>'
// 					result +='<textarea class="form-control myscrollbar" id=postContents placeholder="답변을 입력하세요."></textarea>'
// 					result +='</div>'
		        	})
		        	$('.modal-body').prepend(result);
		        }
		})
		$('#updateModal').modal('show');
	}
})
//문의 답변에서 답변완료 클릭 시
.on('click', '#btnUpdateComplete', function(){
//	console.log($('#postContents').val());
	var answer = {answer:$('#postContents').val(),qnanum:$('#hid_qna').val()};
	$.ajax({
		url:'Qnaanswer.do',
		data:JSON.stringify(answer),
		contentType:'application/json; charset=UTF-8',
		method:'post',
		success:function(data){
			alertModal('게시물 수정', '수정이 완료되었습니다.');
			$('.mb-3').remove();
			$("#btnradio3").trigger('click');
			$('#postContents').val(""); // 답변내용 비우기
		},
		error:function(){
			$('.mb-3').remove();
			alert('Update error');
		}
	});
	return false;
})




//유저관리 클릭시

.on('click','#btnradio1',function(){
	$('#User_show').show();
	$('#Qna_show').hide();
	userlist();
	userpaging();
})



// QnA 클릭시
.on('click','#btnradio3',function(){
	select = 1;
	$('#User_show').hide();
	$('#Qna_show').show();
	$('.usermodal').remove(); //지우면서 다시 리로딩
 	$('.w3-button').remove(); // 페이징 지우기
	$('.w3-bar-item w3-button').remove();// 페이징 지우기
	$.ajax({
        url:'Qnalist.do'
        , method : 'POST'
        , data: {}
        , contentType : 'application/json; charset=UTF-8'
        , dataType : 'json'
        , success :
        	function output(resp){
	        	var result = '';
// 		        result +='<thead id=list_th>'
// 		        result +="<tr class=test2 onclick='event.cancelBubble=true'><td width='120px' style='background-color:white;'></td><th><span>번호</span></th><th><span>제목</span></th>"
// 				+"<th><span>작성자</span></th><th><span>작성일자</span></th><th><span>상태</span></th>"
// 		        +"</th>"
// 		        result +='<tbody id=list></tbody>'
		        $.each(resp,function(index,item){
		        	var faqdate = 0;
		        	if(index == 10) return false;
		        	 var faqdate = item["faqdate"].substring(0,8);
		        	 result +='<tr class=usermodal ><td onclick="event.cancelBubble=true"><input type="checkbox" class=ch_Box id='+item["faqnum"]+'></td>'
		        	 result +='<td >'+item["faqnum"]+'</td>'
		        	 result +='<td >'+item["faqtitle"]+'</td>'
		        	 result +='<td >'+item["writer"]+'</td>'
		        	 result +='<td >'+faqdate+'</td>'
		        	 result +='<td >'+item["state"]+'</td>'
		        	 result +='<input type=hidden id=unummodal value="'+item["uNum"]+'">'
		        })
// 		        result +='</tbody>'
// 		        result +='</thead>'
		        $('.list').append(result)
		        
		        /* 페이징 */
		        var cnt = resp.length;
		        var paging = parseInt(cnt/10);  // 총 유저수 / 10
	        	if(cnt%10 != 0){ // 나머지가 0이 아니면 + 1
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
//취소 & 최소화 클릭시
.on('click','.btn-close,#btnCloseModal',function(){
	$('.mb-3').remove();
})

//회사소개 수정 
.on('click','#btn_company',function(){
	$.ajax({
        url:'Company_list.do'
        , method : 'POST'
        , data: {}
        , contentType : 'application/json; charset=UTF-8'
        , dataType : 'json'
        , success :
        	function output(resp){
        	console.log(resp);
	        	var result = '';
	        	$.each(resp,function(index,item){
	        		result += item["contents"]
	        	})
	        	$('#Company_Contents').val(result);
        }
        
	})
	
	$('#Company_updateModal').modal('show');
})
// 회사소개 수정 클릭시
.on('click', '#btnUpdateCompany', function(){
// 	var answer = {answer:$('#Company_Contents').val()};
	$.ajax({
	    url: 'Company_write.do',
	    type: 'POST',
	    dataType: 'text', //서버로부터 내가 받는 데이터의 타입
	    data: {
	    	contents : $('#Company_Contents').val(),
	    		}, 
		success:function(data){
			alertModal('게시물 수정', '수정이 완료되었습니다.');
			$('#Company_Contents').val(""); // 답변내용 비우기
		},
		error:function(){
			alert('Update error');
		}
	});
	return false;
})
/*-------------------------삭제 클릭시 이벤트 -------------------------*/

.on('click','#btn_delete',function(){ // 삭제
	$('.close').remove();
	$('.tableLeft').remove();
	$('.btn-danger').remove();
	var cnt = $("input[class='ch_Box']:checked").length; // 체크 개수
	console.log(cnt);
    var arr = new Array(); // 저장할 array
    $("input[class='ch_Box']:checked").each(function() {
        arr.push($(this).attr('id'));
    });
    
    if(cnt==0){
    	alertModal("삭제",  "삭제할 목록을 선택하세요.");
    	return false;
    }
    console.log(arr);
    var cnt_arr = {arr:arr,cnt:cnt};
    if(select == 0){
    	 $.ajax({
                 type: "POST"
                 ,url: "pjhuserdelete.do"
                 ,data: JSON.stringify(cnt_arr)
            	 ,contentType:'application/json; charset=UTF-8'
                 ,dataType:"text"
                 ,success: function(jdata){
                    	alert(cnt+"명의 유저을 삭제했습니다.");
                    	$("#btnradio1").trigger('click');
                     }
             })
    }else if(select == 1){
    	 $.ajax({
             type: "POST"
             ,url: "pjhqnadelete.do"
             ,data: JSON.stringify(cnt_arr)
        	 ,contentType:'application/json; charset=UTF-8'
             ,dataType:"text"
             ,success: function(jdata){
                	alert(cnt+"개의 질문을 삭제했습니다.");
                	$("#btnradio3").trigger('click');
                 }
         })
    }
})

/*------------------------------------------------------------------------*/

</script>
</html>