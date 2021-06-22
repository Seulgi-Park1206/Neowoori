<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>관리자 페이지</title>
</head>
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous"> -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"> -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/pjh/adminpage.css" type="text/css">
<link rel="stylesheet" href="resources/pjh/userview.css" type="text/css">

<body>
<jsp:include page="/module/nav.jsp" flush="false" />

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
      <a class="nav-link" href="#">문의사항</a>
    </li>
  </ul>
</div>
<!-- ---------------------------------Teb 띄우는곳------------------------------------------ -->



<!-- ---------------------------------목록 띄우는곳------------------------------------------ -->
<table class="list"> 

</table>
<!-- ---------------------------------목록 띄우는곳------------------------------------------ -->



<!-- ---------------------------------페이징 띄우는곳------------------------------------------ -->
<nav aria-label="Page navigation example" style="width:100px; margin: 0 auto;">
  <ul class="pagination">
    <li class="page-item"><a class="page-link" href="#">Previous</a></li>
    <li class="page-item"><a class="page-link" href="#">1</a></li>
    <li class="page-item"><a class="page-link" href="#">2</a></li>
    <li class="page-item"><a class="page-link" href="#">3</a></li>
    <li class="page-item"><a class="page-link" href="#">Next</a></li>
  </ul>
</nav>
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
.on('click','#btnradio1',function(){
	$('.test').remove(); //지우면서 다시 리로딩
 	$('.test2').remove();
	$.ajax({
        url:'adminpage.do'
        , method : 'POST'
        , data: {}
        , contentType : 'application/json; charset=UTF-8'
        , dataType : 'json'
        , success :
        	function output(resp){
        	console.log(resp);
	        	var result = '';
		        result +='<thead id=list_th>'
		        result +="<tr class=test2><td width='120px' style='background-color:white;'></td><th><span>번호</span></th><th><span>닉네임</span></th>"
				+"<th><span>작성 일자</span></th>"
		        +"</th>"
		        result +='<tbody id=list></tbody>'
		        $.each(resp,function(index,item){
		        	//data-toggle="modal" data-target="#myModal == 파업창 띄우기
		        	 result +='<tr class=test data-toggle="modal" data-target="#myModal"><td><input type="checkbox"></td>'
		        	 result +='<td>'+item["usernum"]+'</td>'
		        	 result +='<td>'+item["username"]+'</td>'
		        	 result +='<td>'+item["userdate"]+'</td>'
		        })
		        result +='</tbody>'
		        result +='</thead>'
		        $('.list').append(result)
        	}
	})
})



/*---------------------------------팝업창 띄우는곳------------------------------------------*/
.on('click','.test',function(){
	$('.close').remove();
	$('.tableLeft').remove();
	$('.btn-danger').remove();
	// 클릭 한 유저의 NO를 가져와서 label에 넣기(수정해야됨)
	$('.modal-header').append('<button type="button" class="close" data-dismiss="modal">×</button>');
	$('.modal-body').append('<table class=tableLeft><tr><td class=tdLeft>아이디:</td><td class=tdCenter><label class=intext id=uid></label></td></tr>'
							+'<tr><td class=tdLeft>유저 번호:</td><td class=tdCenter><label class=intext id=uNum></label></td></tr>'
							+'<tr><td class=tdLeft>닉네임:</td><td class=tdCenter><label class=intext id=nick></label></td></tr>'
							+'<tr><td class=tdLeft>성별:</td><td class=tdCenter><label class=intext id=gender></label></td></tr>'
							+'<tr><td class=tdLeft>생년월일:</td><td class=tdCenter><label class=intext id=birth></label></td></tr>'
							+'<tr><td class=tdLeft>연락처:</td><td class=tdCenter><label class=intext id=mobile></label></td></tr>'
							+'<tr><td class=tdLeft>이메일:</td><td class=tdCenter><label class=intext id=email></label></td></tr>'
							+'<tr><td class=tdLeft>제재 횟수:</td><td class=tdCenter><label class=intext id=cnt></label></td></tr>'
							+'<tr><td class=tdLeft>제재 내역/번호:</td><td class=tdMul><textarea id=list readonly></textarea></td></tr>'
							+'</table>');
	$('.modal-footer').append('<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>');
})
/*---------------------------------팝업창 띄우는곳------------------------------------------*/


</script>
</html>