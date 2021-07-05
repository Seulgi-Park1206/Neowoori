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
			<input type="text" class="form-control" placeholder="스터디명을 입력해주세요." aria-label="Recipient's username" aria-describedby="button-addon2">
			<button class="btn btn-outline-secondary" type="button" id="button-addon2">검색</button>
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
	  </tbody>
	</table>
</div>

<jsp:include page="/module/footer.jsp" flush="false" />
</body>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script language='javascript'>
$(document)
.ready(function(){
	console.log($('#dropdownMenuLink').text());
	var i=0;
	console.log($('#viewTable tbody tr').length);
	
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
                	if (result==0) td.eq(6).text("신청가능");
                	else if(result==10) td.eq(6).text("신청중");
                	else if(result==20) td.eq(6).text("가입상태");
                	else if(result==30) td.eq(6).text("관리자");
                 },
                 error: function(xhr,status,error){
                    console.log(xhr+status+error);
                 } 
            });
    	})(i);
	i++;
	});
	
})

function btnBigClick(who){
	if (who==1) btnBigSelect1();	//독서
	if (who==2) btnBigSelect2();	//
	if (who==3) btnBigSelect3();
	if (who==4) btnBigSelect4();
	if (who==5) btnBigSelect5();
	if (who==6) btnBigSelect6();
	if (who==7) btnBigSelect7();
	if (who==8) $('#dropdownMenuLink').text("카테고리 ");
}
//독서,문화생활,어학,취업,토론,코딩,기타
function btnBigSelect1(){
	//$("#bigSel").val($("#labelBig1").text());
	$('#dropdownMenuLink').text("독서");
	$('#dropdownMenuLink2').text("상세 카테고리 ");
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
	$('#dropdownMenuLink2').text("상세 카테고리 ");
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
	$('#dropdownMenuLink2').text("상세 카테고리 ");
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
	$('#dropdownMenuLink2').text("상세 카테고리 ");
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
	$('#dropdownMenuLink2').text("상세 카테고리 ");
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
	$('#dropdownMenuLink2').text("상세 카테고리 ");
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
	$('#dropdownMenuLink2').text("상세 카테고리 ");
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
	if (who==8) $('#dropdownMenuLink2').text("상세 카테고리 ");
//	console.log($("#smSel").val())
}


</script>
</html>