<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.io.PrintWriter" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<link rel="stylesheet"  href="${path}/resources/jsb/search.css">
<head>
<meta charset="UTF-8">
<title>스터디 게시판</title>
</head>
<body>
<!-- 카테고리1, 카테고리2, 장소, 난이도 -->
<jsp:include page="/module/nav.jsp" flush="false" />
<input type="hidden" id="hid" value=<%=session.getAttribute("userid")%>>
<div class="container">
	검색어 설정
	<div class="btn-group">
		<div class="dropdown" >
		  <a class="btn btn-secondary dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false" style='width:130px;'>카테고리</a>
		  <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
		    <li><a class="dropdown-item" href="#" onclick=btnBigClick(1)>독서</a></li>
		    <li><a class="dropdown-item" href="#" onclick=btnBigClick(2)>문화생활</a></li>
		    <li><a class="dropdown-item" href="#" onclick=btnBigClick(3)>어학</a></li>
		    <li><a class="dropdown-item" href="#" onclick=btnBigClick(4)>취업</a></li>
		    <li><a class="dropdown-item" href="#" onclick=btnBigClick(5)>토론</a></li>
		    <li><a class="dropdown-item" href="#" onclick=btnBigClick(6)>코딩</a></li>
		    <li><a class="dropdown-item" href="#" onclick=btnBigClick(7)>기타</a></li>
		    <li><a class="dropdown-item" href="#" onclick=btnBigClick(8)>취소</a></li>
		  </ul>
		</div>
		&nbsp;
		<div class="dropdown">
		  <a class="btn btn-secondary dropdown-toggle" href="#" role="button" id="dropdownMenuLink2" data-bs-toggle="dropdown" aria-expanded="false" style='width:150px;'>상세 카테고리</a>
		  <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink2" id='btnGroupSm' >
		  	<li><a class="dropdown-item" href="#" >카테고리 먼저 선택하시오</a></li>
		  </ul>
		</div>
		&nbsp;
		<div class="input-group mb-3">
			<input id="searchWord" type="text" class="form-control" placeholder="스터디명을 입력해주세요." aria-label="Recipient's username" aria-describedby="button-addon2">
			<button class="btn btn-outline-secondary" type="button" id="button-addon2" onclick=searchBtn() >검색</button>
		</div>
	</div>
</div>
<div class="container">
	<table class="table table-hover" id='viewTable'>
	  <thead class="thead-light">
	    <tr>
	      <th class="jsb_table_width1">No</th>
	      <th class="jsb_table_width2">스터디명</th>
	      <th class="jsb_table_width3">지역</th>
	      <th class="jsb_table_width4">카테고리</th>
	      <th class="jsb_table_width5">인원수</th>
	      <th class="jsb_table_width6">스터디장</th>
	      <th class="jsb_table_width7">가입여부라벨</th>
	    </tr>
	  </thead>
	  <tbody>
	  <!-- 
	  	<c:forEach items="${SearchData}" var="rec">
		    <tr>
		      <td></td>
		      <td>${rec.mName}</td>
		      <td>${rec.adrCounty} ${rec.adrCity}</td>
		      <td>${rec.category1} - ${rec.category2} </td>
		      <td>${rec.cnt}/${rec.mPersonnel}</td>
		      <td>${rec.uNick}</td>
		      <td></td>
		      <td style="display:none;">${rec.mNum}</td>
		    </tr>
	    </c:forEach>
	  -->
	  </tbody>
	</table>
</div>
<div class="d-flex justify-content-center">
	<div id=page>
	</div>
</div>

<div class="modal fade" id="exampleModalToggle" aria-hidden="true" aria-labelledby="exampleModalToggleLabel" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h6 class="modal-title" id="exampleModalToggleLabel">Modal 1</h6>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" id="modal-body1">
        
      </div>
      <div class="modal-footer" id=modal-footerBtn1>
      	
      </div>
    </div>
  </div>
</div>
<div class="modal fade" id="exampleModalToggle2" aria-hidden="true" aria-labelledby="exampleModalToggleLabel2" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h6 class="modal-title" id="exampleModalToggleLabel2">쪽지보내기</h6>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" id="modal-body2">
		<form>
			<div class="form-floating">
			  <textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea1" disabled></textarea>
			  <label for="floatingTextarea2" id=studyAdminNick>닉네임</label>
			</div>
			<div class="form-floating">
			  <textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea2" style="height: 200px"></textarea>
			  <label for="floatingTextarea2">쪽지 내용</label>
			</div>
        </form>
      </div>
      <div class="modal-footer" id=modal-footerBtn2>
       </div>
    </div>
  </div>
</div>
<a id="bbtn" class="btn btn-primary" data-bs-toggle="modal" href="#exampleModalToggle" role="button" style="display:none;">modal</a>



<jsp:include page="/module/footer.jsp" flush="false" />
</body>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script language='javascript'>
let datas;
let selectTr;
let selectTr2;
$(document)
.ready(function(){
	$.ajax({
	    url: "jsbSearchPageFirst.do",
	    type: "POST",
	    data: {
	    	//"studyName" : $('#studyName').val() // 스터디명
	    },
	    success : function(data){
	    	//console.log(data);
	    	datas= new Array(data);
	    	//console.log(datas[0]);
	    	//console.log(datas[0][0].mName);
	    	let tblStr='';
	    	$.each(data, function(e, item){
	    		tblStr +='<tr><td>'+(e+1)+'</td><td>'+item.mName+'</td><td>'+item.adrCounty+' '+item.adrCity+'</td><td>'+item.category1+' - '+item.category2+'</td><td>'+item.cnt+'/'+item.mPersonnel+'</td><td>'+item.uNick+'</td><td></td><td style="display:none;">'+item.mNum+'</td></tr>'
	    		if(e==9) return false;
	    	})
	    	$('#viewTable tbody').html(tblStr);
	    	setPage(data.length);
	    	viewState();
	    },
	    error : function(){	
	    }
		});
})
.on("click","#viewTable tbody tr",function(){
	$('#modal-footerBtn1').empty();
	$('#modal-footerBtn2').empty();
	$('#modal-body1').empty();
	var tr = $(this);
	var td = tr.children();
	selectTr=td.eq(7).text()
	selectTr2=td;
	//console.log($(this).find('td:eq(0)').text());
	var tmpVal = $(this).find('td:eq(0)').text()-1;
	//console.log(datas[0][tmpVal]);
	var path=datas[0][tmpVal];
	//console.log(td.eq(6).text());
	var tmpTextVal = td.eq(6).text();
	//console.log(tmpTextVal);
	if (tmpTextVal=="신청가능"){
		$("#modal-footerBtn1").append("<button class='btn btn-primary' onclick=btnJoinStudy() >가입신청</button>");
		$("#modal-footerBtn1").append("<button class='btn btn-primary' data-bs-target='#exampleModalToggle2' data-bs-toggle='modal' data-bs-dismiss='modal'>쪽지보내기</button>");
	}
	if (tmpTextVal=="신청중"){
		console.log("신청중인데");
		$("#modal-footerBtn1").append("<button class='btn btn-primary' onclick=btnCancelJoin() >가입신청취소</button>");
		$("#modal-footerBtn1").append("<button class='btn btn-primary' data-bs-target='#exampleModalToggle2' data-bs-toggle='modal' data-bs-dismiss='modal'>쪽지보내기</button>");
	}
	if(tmpTextVal=="가입상태"){
		$("#modal-footerBtn1").append("<button class='btn btn-primary' onclick=btnOutStudy() >스터디탈퇴</button>");
		$("#modal-footerBtn1").append("<button class='btn btn-primary' data-bs-target='#exampleModalToggle2' data-bs-toggle='modal' data-bs-dismiss='modal'>쪽지보내기</button>");
	}
	if(tmpTextVal=="스터디장"){
		//해당 스터디장인데 버튼 추가해야될까?
	};
	$("#modal-footerBtn2").append("<button type='button' class='btn btn-primary' onclick=btnSendMsg() >메시지 보내기</button>");
	$("#modal-footerBtn2").append("<button class='btn btn-primary' data-bs-target='#exampleModalToggle' data-bs-toggle='modal' data-bs-dismiss='modal'>정보보기</button>");
	
	$('#exampleModalToggleLabel').text(path.mName);
   	$("#modal-body1").append("<input type='hidden' name='mNum' id='mNumHid'>");
   	$("#mNumHid").val(path.mNum);
   	$("#modal-body1").append("<table border='2'>");
   	$("#modal-body1").append("<tr><td><p class='text-primary'>카테고리&nbsp</p></td><td>&nbsp"+path.category1+"-"+path.category2+"</td></tr>");
   	$("#modal-body1").append("<tr><td><p class='text-primary'>스터디장&nbsp</p></td><td>&nbsp"+path.uNick+"</td></tr>");
   	$("#modal-body1").append("<tr><td><p class='text-primary'>주소&nbsp</p></td><td>&nbsp"+path.mWhere+" "+path.mWhere3+"</td></tr>");
   	$("#modal-body1").append("<tr><td><p class='text-primary'>활동요일</p></td><td>&nbsp"+path.mDay+"</td></tr>");
   	$("#modal-body1").append("<tr><td><p class='text-primary'>시작시간</p></td><td>&nbsp"+path.mTime+"</td></tr>");
   	$("#modal-body1").append("<tr><td><p class='text-primary'>진행시간</p></td><td>&nbsp"+path.mPtime+"</td></tr>");
   	$("#modal-body1").append("<tr><td><p class='text-primary'>난이도</p></td><td>&nbsp"+path.mLevel+"</td></tr>");
   	$("#modal-body1").append("<tr><td><p class='text-primary'>소개</p></td><td></td></tr><tr><td colspan='2'>"+path.mContents+"</td></tr>");
	$("#modal-body1").append("</table>");
	$("#studyAdminNick").text(path.uNick);
	$('#bbtn').get(0).click();
})

function setPage(who){
	//console.log(who);
	$('#page').empty();
	var pageHow = parseInt(who/10);  // 총 유저수 / 5 
	if(who%10 != 0){ // 나머지가 0이 아니면 + 1
		pageHow = pageHow + 1; // 나머지 때문에 +1 (if문 사용해서 수정해야됨.)
    	}
	var result = '';
	result += '<nav aria-label="Page navigation example" style="width:100px; margin: 0 auto;">'
	result += '<ul class="pagination" id="pageUl">'
	for(var i = 1; i <= pageHow; i++){
		result +='<li class="page-item" onclick=pageBtnFuc('+i+')><a class="page-link" href="#">'+i+'</a></li>'
	}
	result += '</ul>'
	result += '</nav>'
	$('#page').append(result);
}

function viewState(){
	//console.log($('#dropdownMenuLink').text());
	var i=0;
	//console.log($('#viewTable tbody tr').length);
	
	$('#viewTable tbody tr').each(function(){
		var tr = $(this);
		var td = tr.children();
		var text = td.eq(7).text();
		(function(i) {
            $.ajax({
            	url: "jsbSearchPageBtn.do",
                type:'POST',
                data : {
                	"mNum": text
                },
                async:false,
                success:function(result){
                	//console.log(i);
                	if (result==0) td.eq(6).html("<h5><span class='badge bg-secondary' id='0'>신청가능</span></h5>");
                	else if(result==10) td.eq(6).html("<h5><span class='badge bg-secondary' id='10'>신청중</span></h5>");
                	else if(result==20) td.eq(6).html("<h5><span class='badge bg-secondary' id='20'>가입상태</span></h5>");
                	else if(result==30) td.eq(6).html("<h5><span class='badge bg-secondary' id='30'>스터디장</span></h5>");
                 },
                 error: function(xhr,status,error){
                    console.log(xhr+status+error);
                 } 
            });
    	})(i);
	i++;
	});
}

function pageBtnFuc(who){
	var pageVal=who-1;
	//console.log(pageVal);
	let tblStr='';
	//console.log($('#pageUl li').length);
	if (pageVal==0){
		for (var x=0;x<=9;x++){
			tblStr +='<tr><td>'+(x+1)+'</td><td>'+datas[0][x].mName+'</td><td>'+datas[0][x].adrCounty+' '+datas[0][x].adrCity+'</td><td>'+datas[0][x].category1+' - '+datas[0][x].category2+'</td><td>'+datas[0][x].cnt+'/'+datas[0][x].mPersonnel+'</td><td>'+datas[0][x].uNick+'</td><td></td><td style="display:none;">'+datas[0][x].mNum+'</td></tr>'
		};
		$('#viewTable tbody').html(tblStr);
		viewState();
	}else if (pageVal==$('#pageUl li').length-1){
		//console.log("maxPage");
		var tmpPageVal=pageVal*10;
		var tmpPageMax=datas[0].length-1;
		//console.log(tmpPageVal+","+tmpPageMax);
		for (var x=tmpPageVal;x<=tmpPageMax;x++){
			tblStr +='<tr><td>'+(x+1)+'</td><td>'+datas[0][x].mName+'</td><td>'+datas[0][x].adrCounty+' '+datas[0][x].adrCity+'</td><td>'+datas[0][x].category1+' - '+datas[0][x].category2+'</td><td>'+datas[0][x].cnt+'/'+datas[0][x].mPersonnel+'</td><td>'+datas[0][x].uNick+'</td><td></td><td style="display:none;">'+datas[0][x].mNum+'</td></tr>'
		};
		$('#viewTable tbody').html(tblStr);
		viewState();
	}else{
		var tmpPageVal=pageVal*10;
		var tmpPageMax=tmpPageVal+9;
		for (var x=tmpPageVal;x<=tmpPageMax;x++){
			tblStr +='<tr><td>'+(x+1)+'</td><td>'+datas[0][x].mName+'</td><td>'+datas[0][x].adrCounty+' '+datas[0][x].adrCity+'</td><td>'+datas[0][x].category1+' - '+datas[0][x].category2+'</td><td>'+datas[0][x].cnt+'/'+datas[0][x].mPersonnel+'</td><td>'+datas[0][x].uNick+'</td><td></td><td style="display:none;">'+datas[0][x].mNum+'</td></tr>'
		};
		$('#viewTable tbody').html(tblStr);
		viewState();
	};
}


function btnBigClick(who){
	if (who==1) btnBigSelect1();	//독서
	if (who==2) btnBigSelect2();	//
	if (who==3) btnBigSelect3();
	if (who==4) btnBigSelect4();
	if (who==5) btnBigSelect5();
	if (who==6) btnBigSelect6();
	if (who==7) btnBigSelect7();
	if (who==8) {
		$('#dropdownMenuLink').text("카테고리");
		$('#dropdownMenuLink2').text("상세 카테고리");
	}
}
//독서,문화생활,어학,취업,토론,코딩,기타
function btnBigSelect1(){
	//$("#bigSel").val($("#labelBig1").text());
	$('#dropdownMenuLink').text("독서");
	$('#dropdownMenuLink2').text("상세 카테고리");
	//$("#btnGroupSm").show();
   	$('#btnGroupSm').empty();
   	$("#btnGroupSm").append('<li><a onclick=btnSmClick(1) id="btnSm1" class="dropdown-item" href="#">인문학</a></li>');
   	$("#btnGroupSm").append('<li><a onclick=btnSmClick(2) id="btnSm2" class="dropdown-item" href="#">심리학</a></li>');
   	$("#btnGroupSm").append('<li><a onclick=btnSmClick(3) id="btnSm3" class="dropdown-item" href="#">철학</a></li>');
   	$("#btnGroupSm").append('<li><a onclick=btnSmClick(4) id="btnSm4" class="dropdown-item" href="#">역사</a></li>');
   	$("#btnGroupSm").append('<li><a onclick=btnSmClick(5) id="btnSm5" class="dropdown-item" href="#">시사/경제</a></li>');
   	$("#btnGroupSm").append('<li><a onclick=btnSmClick(6) id="btnSm6" class="dropdown-item" href="#">소설</a></li>');
	$("#btnGroupSm").append('<li><a onclick=btnSmClick(7) id="btnSm7" class="dropdown-item" href="#">기타</a></li>');
	$("#btnGroupSm").append('<li><a onclick=btnSmClick(8) id="btnSm8" class="dropdown-item" href="#">취소</a></li>');
	//$('#btnradio11').trigger('click');
}

function btnBigSelect2(){
	//$("#bigSel").val($("#labelBig1").text());
	$('#dropdownMenuLink').text("문화생활");
	$('#dropdownMenuLink2').text("상세 카테고리");
	//$("#btnGroupSm").show();
   	$('#btnGroupSm').empty();
   	$("#btnGroupSm").append('<li><a onclick=btnSmClick(1) id="btnSm1" class="dropdown-item" href="#">뮤지컬/오페라</a></li>');
   	$("#btnGroupSm").append('<li><a onclick=btnSmClick(2) id="btnSm2" class="dropdown-item" href="#">영화</a></li>');
   	$("#btnGroupSm").append('<li><a onclick=btnSmClick(3) id="btnSm3" class="dropdown-item" href="#">전시회</a></li>');
   	$("#btnGroupSm").append('<li><a onclick=btnSmClick(4) id="btnSm4" class="dropdown-item" href="#">파티/페스티벌</a></li>');
   	$("#btnGroupSm").append('<li><a onclick=btnSmClick(5) id="btnSm5" class="dropdown-item" href="#">기타</a></li>');
   	//$("#btnGroupSm").append('<li><a onclick=btnSmClick(6) id="btnSm6" class="dropdown-item" href="#">소설</a></li>');
	//$("#btnGroupSm").append('<li><a onclick=btnSmClick(7) id="btnSm7" class="dropdown-item" href="#">기타</a></li>');
	$("#btnGroupSm").append('<li><a onclick=btnSmClick(8) id="btnSm8" class="dropdown-item" href="#">취소</a></li>');//$('#btnradio11').trigger('click');
}
//독서,문화생활,어학,취업,토론,코딩,기타
function btnBigSelect3(){
	//$("#bigSel").val($("#labelBig1").text());
	$('#dropdownMenuLink').text("어학");
	$('#dropdownMenuLink2').text("상세 카테고리");
	//$("#btnGroupSm").show();
   	$('#btnGroupSm').empty();
   	$("#btnGroupSm").append('<li><a onclick=btnSmClick(1) id="btnSm1" class="dropdown-item" href="#">영어</a></li>');
   	$("#btnGroupSm").append('<li><a onclick=btnSmClick(2) id="btnSm2" class="dropdown-item" href="#">일본어</a></li>');
   	$("#btnGroupSm").append('<li><a onclick=btnSmClick(3) id="btnSm3" class="dropdown-item" href="#">중국어</a></li>');
   	$("#btnGroupSm").append('<li><a onclick=btnSmClick(4) id="btnSm4" class="dropdown-item" href="#">프랑스어</a></li>');
   	$("#btnGroupSm").append('<li><a onclick=btnSmClick(5) id="btnSm5" class="dropdown-item" href="#">스페인어</a></li>');
   	$("#btnGroupSm").append('<li><a onclick=btnSmClick(6) id="btnSm6" class="dropdown-item" href="#">기타</a></li>');
	//$("#btnGroupSm").append('<li><a onclick=btnSmClick(7) id="btnSm7" class="dropdown-item" href="#">기타</a></li>');
	$("#btnGroupSm").append('<li><a onclick=btnSmClick(8) id="btnSm8" class="dropdown-item" href="#">취소</a></li>');
	//$('#btnradio11').trigger('click');
}
//독서,문화생활,어학,취업,토론,코딩,기타
function btnBigSelect4(){
	//$("#bigSel").val($("#labelBig1").text());
	$('#dropdownMenuLink').text("취업");
	$('#dropdownMenuLink2').text("상세 카테고리");
	//$("#btnGroupSm").show();
   	$('#btnGroupSm').empty();
   	$("#btnGroupSm").append('<li><a onclick=btnSmClick(1) id="btnSm1" class="dropdown-item" href="#">공무원</a></li>');
   	$("#btnGroupSm").append('<li><a onclick=btnSmClick(2) id="btnSm2" class="dropdown-item" href="#">토익/토플</a></li>');
   	$("#btnGroupSm").append('<li><a onclick=btnSmClick(3) id="btnSm3" class="dropdown-item" href="#">임용고시</a></li>');
   	$("#btnGroupSm").append('<li><a onclick=btnSmClick(4) id="btnSm4" class="dropdown-item" href="#">인적성검사</a></li>');
   	$("#btnGroupSm").append('<li><a onclick=btnSmClick(5) id="btnSm5" class="dropdown-item" href="#">기타</a></li>');
   	//$("#btnGroupSm").append('<li><a onclick=btnSmClick(6) id="btnSm6" class="dropdown-item" href="#">기타</a></li>');
	//$("#btnGroupSm").append('<li><a onclick=btnSmClick(7) id="btnSm7" class="dropdown-item" href="#">기타</a></li>');
	$("#btnGroupSm").append('<li><a onclick=btnSmClick(8) id="btnSm8" class="dropdown-item" href="#">취소</a></li>');
	//$('#btnradio11').trigger('click');
}
//독서,문화생활,어학,취업,토론,코딩,기타
function btnBigSelect5(){
	//$("#bigSel").val($("#labelBig1").text());
	$('#dropdownMenuLink').text("토론");
	$('#dropdownMenuLink2').text("상세 카테고리");
	//$("#btnGroupSm").show();
   	$('#btnGroupSm').empty();
   	$("#btnGroupSm").append('<li><a onclick=btnSmClick(1) id="btnSm1" class="dropdown-item" href="#">경제</a></li>');
   	$("#btnGroupSm").append('<li><a onclick=btnSmClick(2) id="btnSm2" class="dropdown-item" href="#">문화</a></li>');
   	$("#btnGroupSm").append('<li><a onclick=btnSmClick(3) id="btnSm3" class="dropdown-item" href="#">정치</a></li>');
   	$("#btnGroupSm").append('<li><a onclick=btnSmClick(4) id="btnSm4" class="dropdown-item" href="#">환경</a></li>');
   	$("#btnGroupSm").append('<li><a onclick=btnSmClick(5) id="btnSm5" class="dropdown-item" href="#">기타</a></li>');
   	//$("#btnGroupSm").append('<li><a onclick=btnSmClick(6) id="btnSm6" class="dropdown-item" href="#">기타</a></li>');
	//$("#btnGroupSm").append('<li><a onclick=btnSmClick(7) id="btnSm7" class="dropdown-item" href="#">기타</a></li>');
	$("#btnGroupSm").append('<li><a onclick=btnSmClick(8) id="btnSm8" class="dropdown-item" href="#">취소</a></li>');
	//$('#btnradio11').trigger('click');
}
function btnBigSelect6(){
	//$("#bigSel").val($("#labelBig1").text());
	$('#dropdownMenuLink').text("코딩");
	$('#dropdownMenuLink2').text("상세 카테고리");
	//$("#btnGroupSm").show();
   	$('#btnGroupSm').empty();
   	$("#btnGroupSm").append('<li><a onclick=btnSmClick(1) id="btnSm1" class="dropdown-item" href="#">JAVA</a></li>');
   	$("#btnGroupSm").append('<li><a onclick=btnSmClick(2) id="btnSm2" class="dropdown-item" href="#">C</a></li>');
   	$("#btnGroupSm").append('<li><a onclick=btnSmClick(3) id="btnSm3" class="dropdown-item" href="#">C#,C++</a></li>');
   	$("#btnGroupSm").append('<li><a onclick=btnSmClick(4) id="btnSm4" class="dropdown-item" href="#">Python</a></li>');
   	$("#btnGroupSm").append('<li><a onclick=btnSmClick(5) id="btnSm5" class="dropdown-item" href="#">Java script</a></li>');
   	//$("#btnGroupSm").append('<li><a onclick=btnSmClick(6) id="btnSm6" class="dropdown-item" href="#">기타</a></li>');
	//$("#btnGroupSm").append('<li><a onclick=btnSmClick(7) id="btnSm7" class="dropdown-item" href="#">기타</a></li>');
	$("#btnGroupSm").append('<li><a onclick=btnSmClick(8) id="btnSm8" class="dropdown-item" href="#">취소</a></li>');
	//$('#btnradio11').trigger('click');
}
function btnBigSelect7(){
	//$("#bigSel").val($("#labelBig1").text());
	$('#dropdownMenuLink').text("기타");
	$('#dropdownMenuLink2').text("상세 카테고리");
	//$("#btnGroupSm").show();
   	$('#btnGroupSm').empty();
   	$("#btnGroupSm").append('<li><a onclick=btnSmClick(1) id="btnSm1" class="dropdown-item" href="#">기타</a></li>');
   	//$("#btnGroupSm").append('<li><a onclick=btnSmClick(2) id="btnSm2" class="dropdown-item" href="#">C</a></li>');
   	//$("#btnGroupSm").append('<li><a onclick=btnSmClick(3) id="btnSm3" class="dropdown-item" href="#">C#,C++</a></li>');
   	//$("#btnGroupSm").append('<li><a onclick=btnSmClick(4) id="btnSm4" class="dropdown-item" href="#">Python</a></li>');
   	//$("#btnGroupSm").append('<li><a onclick=btnSmClick(5) id="btnSm5" class="dropdown-item" href="#">Java script</a></li>');
   	//$("#btnGroupSm").append('<li><a onclick=btnSmClick(6) id="btnSm6" class="dropdown-item" href="#">기타</a></li>');
	//$("#btnGroupSm").append('<li><a onclick=btnSmClick(7) id="btnSm7" class="dropdown-item" href="#">기타</a></li>');
	$("#btnGroupSm").append('<li><a onclick=btnSmClick(8) id="btnSm8" class="dropdown-item" href="#">취소</a></li>');
	//$('#btnradio11').trigger('click');
}
function btnSmClick(who){
	if (who==1) $("#dropdownMenuLink2").text($("#btnSm1").text());
	if (who==2) $("#dropdownMenuLink2").text($("#btnSm2").text());
	if (who==3) $("#dropdownMenuLink2").text($("#btnSm3").text());
	if (who==4) $("#dropdownMenuLink2").text($("#btnSm4").text());
	if (who==5) $("#dropdownMenuLink2").text($("#btnSm5").text());
	if (who==6) $("#dropdownMenuLink2").text($("#btnSm6").text());
	if (who==7) $("#dropdownMenuLink2").text($("#btnSm7").text());
	if (who==8) $('#dropdownMenuLink2').text("상세 카테고리");
//	console.log($("#smSel").val())
}

function searchBtn(){
	//console.log($('#dropdownMenuLink').text());
	//console.log($('#dropdownMenuLink2').text());
	//console.log($('#searchWord').text());
	let menuLink1 =	'';
	let menuLink2 = '';
	let searchWord = '';
	if ($('#dropdownMenuLink').text() != "카테고리") menuLink1 = $('#dropdownMenuLink').text();
	if ($('#dropdownMenuLink2').text() != "상세 카테고리") menuLink2 = $('#dropdownMenuLink2').text();
	if ($('#searchWord').val() != "") searchWord = $('#searchWord').val();
	$.ajax({
	    url: "jsbClickToSearchBtn.do",
	    type: "POST",
	    data: {
	    	"menuLink1" : menuLink1, // 카테고리1
	    	"menuLink2" : menuLink2, // 카테고리2
	    	"searchWord" : searchWord // 검색어
	    },
	    success : function(data){
	    	datas= new Array(data);
	    	let tblStr='';
	    	$.each(data, function(e, item){
	    		tblStr +='<tr><td></td><td>'+item.mName+'</td><td>'+item.adrCounty+' '+item.adrCity+'</td><td>'+item.category1+' - '+item.category2+'</td><td>'+item.cnt+'/'+item.mPersonnel+'</td><td>'+item.uNick+'</td><td></td><td style="display:none;">'+item.mNum+'</td></tr>'
	    		if(e==9) return false;
	    	})
	    	$('#viewTable tbody').html(tblStr);
	    	setPage(data.length);
	    	viewState();
	    },
	    error : function(){	
	    }
		});
}

function btnJoinStudy(){ //가입신청
	$.ajax({
		url: "jsbJoinStudy.do",
		type: "POST",
		data: {
			"mNumHid" : selectTr, // 
			"userId" : $("#hid").val()	    	
	    },
	    success : function(data){
	    	alert("성공(임시 alert)");
	    	$('#modal-footerBtn1').empty();
	    	$("#modal-footerBtn1").append("<button class='btn btn-primary' onclick=btnCancelJoin() >가입신청취소</button>");
	    	$("#modal-footerBtn1").append("<button class='btn btn-primary' data-bs-target='#exampleModalToggle2' data-bs-toggle='modal' data-bs-dismiss='modal'>쪽지보내기</button>");
	    	selectTr2.eq(6).html("<h5><span class='badge bg-secondary' id='10'>신청중</span></h5>");
	    },
	    error : function(){	
	    }
		});
}
function btnCancelJoin(){ // 가입신청취소
	$.ajax({
		url: "jsbCancelJoin.do",
		type: "POST",
		data: {
			"mNumHid" : selectTr, // 스터디명
			"userId" : $("#hid").val()	    	
	    },
	    success : function(data){
	    	alert("성공(임시 alert)");
	    	$('#modal-footerBtn1').empty();
	    	$("#modal-footerBtn1").append("<button class='btn btn-primary' onclick=btnJoinStudy() >가입신청</button>");
	    	$("#modal-footerBtn1").append("<button class='btn btn-primary' data-bs-target='#exampleModalToggle2' data-bs-toggle='modal' data-bs-dismiss='modal'>쪽지보내기</button>");
	    	selectTr2.eq(6).html("<h5><span class='badge bg-secondary' id='0'>신청가능</span></h5>");
	    },
	    error : function(){	
	    }
		});
}
function btnOutStudy(){ // 스터디탈되
	$.ajax({
		url: "jsbJoinOut.do",
		type: "POST",
		data: {
			"mNumHid" : selectTr, // 스터디명
			"userId" : $("#hid").val()	    	
	    },
	    success : function(data){
	    	alert("성공(임시 alert)");
	    	$('#modal-footerBtn1').empty();
	    	$("#modal-footerBtn1").append("<button class='btn btn-primary' onclick=btnJoinStudy() >가입신청</button>");
	    	$("#modal-footerBtn1").append("<button class='btn btn-primary' data-bs-target='#exampleModalToggle2' data-bs-toggle='modal' data-bs-dismiss='modal'>쪽지보내기</button>");
	    	selectTr2.eq(6).html("<h5><span class='badge bg-secondary' id='0'>신청가능</span></h5>");
	    },
	    error : function(){	
	    }
		});
}

function btnSendMsg(){ // 메시지보내기
	//floatingTextarea1 , floatingTextarea2
	console.log($("#hid").val());
	console.log($("#floatingTextarea2").val());
	console.log($("#studyAdminNick").text());
	$.ajax({
		url: "jsbSendModalMsg.do",
		type: "POST",
		data: {
			"userId" : $("#hid").val(), // 보내는 사람 id
			"cont" : $("#floatingTextarea2").val(),
			"mAdminNick" : $("#studyAdminNick").text() // 닉네임으로 받는사람 num구해야됨
	    },
	    success : function(data){
	    	alert("성공(임시 alert)");
	    },
	    error : function(){	
	    }
		});
}

</script>
</html>