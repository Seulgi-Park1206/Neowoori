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
<link rel="stylesheet" href="resources/pjh/userview.css" type="text/css">
<link rel="stylesheet" href="resources/pjh/adminpage.css" type="text/css">


<body>
<jsp:include page="/module/adminnav.jsp" flush="false" />

<!-- ---------------------------------Teb 띄우는곳------------------------------------------ -->

<div class="container">
  <ul class="nav nav-tabs">
    <li class="nav-item">
      <a class="nav-link active" href="#" id=btnradio1>유저관리</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="#">신고관리</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="#" id=btnradio3>문의사항</a>
    </li>
  </ul>
</div>
<!-- ---------------------------------Teb 띄우는곳------------------------------------------ -->



<!-- ---------------------------------목록 띄우는곳------------------------------------------ -->
<table class="list"> 

</table>
<!-- ---------------------------------목록 띄우는곳------------------------------------------ -->

<!-- 삭제 버튼 -->
 <div class="wrapper" align="right">
	<table>
		<tr>
			<td><button class="btn_list" id=btn_delete>삭제</button></td>
		</tr>
	</table>
</div>



<!-- ---------------------------------페이징 띄우는곳------------------------------------------ -->
<div id=test123 style="width:100px; margin: 0 auto;">

</div>
<!-- ---------------------------------페이징 띄우는곳------------------------------------------ -->





<!-- ---------------------------------팝업창 띄우는곳------------------------------------------ -->
<div class="container mt-3">
  <!-- The Modal -->
  <div class="modal fade" id="myModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">유저 정보</h4>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
        </div>
      </div>
    </div>
  </div>
</div>
<!-- ---------------------------------팝업창 띄우는곳------------------------------------------ -->
<jsp:include page="/module/footer.jsp" flush="false" />
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script language='javascript'>
$(document)
/*---------------------------------AJAX 목록 띄우는곳------------------------------------------*/
.ready(function(){ // 처음 들어가면 유저 목록 5개만 나옴.
	$('.usermodal').remove(); //지우면서 다시 리로딩
 	$('.test2').remove();
	$.ajax({
        url:'userlist.do'
        , method : 'POST'
        , data: {}
        , contentType : 'application/json; charset=UTF-8'
        , dataType : 'json'
        , success :
        	function output(resp){
	        	var result = '';
		        result +='<thead id=list_th>'
		        result +="<tr class=test2><td width='120px' style='background-color:white;'></td><th><span>번호</span></th><th><span>닉네임</span></th>"
				+"<th><span>마지막 접속</span></th>"
		        +"</th>"
		        result +='<tbody id=list></tbody>'
		        $.each(resp,function(index,item){
		        	//data-toggle="modal" data-target="#myModal == 파업창 띄우기
		        	 result +='<tr class=usermodal data-toggle="modal" data-target="#myModal"><td onclick="event.cancelBubble=true"><input type="checkbox" class=ch_Box id='+item["uNum"]+'></td>'
		        	 result +='<td >'+item["uNum"]+'</td>'
		        	 result +='<td >'+item["uNick"]+'</td>'
		        	 result +='<td >'+item["lastJoin"]+'</td>'
		        	 result +='<input type=hidden id=unummodal value="'+item["uNum"]+'">'
		        })
		        result +='</tbody>'
		        result +='</thead>'
		        $('.list').append(result)
        	}
	})
	
	/*---------------------------------페이징 띄우는곳------------------------------------------*/
	
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
        	result += '<nav aria-label="Page navigation example" style="width:100px; margin: 0 auto;">'
        	result += '<ul class="pagination">'
        	for(var i = 1; i <= test; i++){
        		result +='<li class="page-item" value='+i+'><a class="page-link" href="#">'+i+'</a></li>'
        	}
        	result += '</ul>'
        	result += '</nav>'
        	$('#test123').append(result)
        }
        })
})



/*---------------------------------페이징 클릭시------------------------------------------*/
.on('click','.page-item',function(){
	$('.usermodal').remove(); //지우면서 다시 리로딩
 	$('.test2').remove();
	var btnnum = $(this).val(); // 선택한 버튼의 값 (ex = 1,2,3,4)
	var btnvalue = (btnnum * 10) - 10; // (선택한 버튼의 값 * 10) - 1 == sql에서 사용할 값
	if(btnnum == 1){ // 1 이면 처음 값 그대로 가져오기.
		btnnum = 0;
	}
	else{
		btnnum = (btnnum * 10) - 10;
	}
	$.ajax({
        url:'btnnum.do'
        , method : 'POST'
        , data: {btnvalue : btnvalue}
        , dataType : 'json'
        , success :
        	function output(resp){
        	var result = '';
	        result +='<thead id=list_th>'
	        result +="<tr class=test2><td width='120px' style='background-color:white;'></td><th><span>번호</span></th><th><span>닉네임</span></th>"
			+"<th><span>마지막 접속</span></th>"
	        +"</th>"
	        result +='<tbody id=list></tbody>'
	        $.each(resp,function(index,item){
	        	 result +='<tr class=usermodal data-toggle="modal" data-target="#myModal"><td onclick="event.cancelBubble=true"><input type="checkbox" class=ch_Box id='+item["uNum"]+'></td>'
	        	 result +='<td >'+item["uNum"]+'</td>'
	        	 result +='<td >'+item["uNick"]+'</td>'
	        	 result +='<td >'+item["lastJoin"]+'</td>'
	        	 result +='<input type=hidden id=unummodal value="'+item["uNum"]+'">'
	        })
	        result +='</tbody>'
	        result +='</thead>'
	        $('.list').append(result)
    	}
	})
	// 클릭 한 유저의 NO를 가져와서 label에 넣기(수정해야됨)
	
})
/*---------------------------------페이징 클릭시------------------------------------------*/


/*---------------------------------유저 관리 팝업창 띄우는곳------------------------------------------*/
.on('click','.list tr',function(){
	$('.close').remove();
	$('.tableLeft').remove();
	$('.btn-danger').remove();
	
	var usernum = $(this).find('td:eq(1)').text();
	$.ajax({
        url:'usermodal.do'
        , method : 'POST'
        , data: {usernum : usernum}
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
	// 클릭 한 유저의 NO를 가져와서 label에 넣기(수정해야됨)
	
})
/*---------------------------------팝업창 띄우는곳------------------------------------------*/


/*---------------------------------QnA 띄우는곳------------------------------------------*/


.on('click','#btnradio3',function(){
	$('.usermodal').remove(); //지우면서 다시 리로딩
 	$('.test2').remove();
	$.ajax({
        url:'Qnalist.do'
        , method : 'POST'
        , data: {}
        , contentType : 'application/json; charset=UTF-8'
        , dataType : 'json'
        , success :
        	function output(resp){
	        	var result = '';
		        result +='<thead id=list_th>'
		        result +="<tr class=test2><td width='120px' style='background-color:white;'></td><th><span>번호</span></th><th><span>닉네임</span></th>"
				+"<th><span>마지막 접속</span></th>"
		        +"</th>"
		        result +='<tbody id=list></tbody>'
		        $.each(resp,function(index,item){
		        	//data-toggle="modal" data-target="#myModal == 파업창 띄우기
		        	 result +='<tr class=usermodal data-toggle="modal" data-target="#myModal"><td onclick="event.cancelBubble=true"><input type="checkbox" class=ch_Box id='+item["uNum"]+'></td>'
		        	 result +='<td >'+item["uNum"]+'</td>'
		        	 result +='<td >'+item["uNick"]+'</td>'
		        	 result +='<td >'+item["lastJoin"]+'</td>'
		        	 result +='<input type=hidden id=unummodal value="'+item["uNum"]+'">'
		        })
		        result +='</tbody>'
		        result +='</thead>'
		        $('.list').append(result)
        	}
	})
	
})













/*-------------------------삭제 클릭시 이벤트 -------------------------*/

.on('click','#btn_delete',function(){ // 삭제
	var cnt = $("input[class='ch_Box']:checked").length; // 체크 개수
	console.log(cnt);
    var arr = new Array(); // 저장할 array
    $("input[class='ch_Box']:checked").each(function() {
        arr.push($(this).attr('id'));
    });
    console.log(arr);
    var cnt_arr = {arr:arr,cnt:cnt};
    	 $.ajax({
                 type: "POST"
                 ,url: "pjhuserdelete.do"
                 ,data: JSON.stringify(cnt_arr)
            	 ,contentType:'application/json; charset=UTF-8'
                 ,dataType:"text"
                 ,success: function(jdata){
                    	alert(cnt+"개의 게시물을 삭제했습니다.");
                    	location.reload();
                     }
             })
    
})

/*------------------------------------------------------------------------*/

</script>
</html>