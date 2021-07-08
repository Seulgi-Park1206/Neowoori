<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쪽지함</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet"  href="${path}/resources/jsb/main.css">
</head>
<body>
<div class="w3-bar w3-light-grey">
  <a href="#" class="w3-bar-item w3-button" onclick="post_get();">받은 쪽지</a>
  <a href="#" class="w3-bar-item w3-button" onclick="post_set();">보낸 쪽지</a>
  <a href="#" class="w3-bar-item w3-button" onclick="post_box();">보관함</a>
  <input type="text" class="w3-bar-item w3-input" placeholder="Search..">
  <a href="#" class="w3-bar-item w3-button w3-green" onclick=post_find()>검색</a>
</div>
<div class="w3-bar w3-border">
  <button class="w3-bar-item w3-button w3-tiny">보관</button>
  <button class="w3-bar-item w3-button w3-tiny">수신거부</button>
  <button class="w3-bar-item w3-button w3-tiny">신고하기</button>
  <button class="w3-bar-item w3-button w3-tiny">삭제하기</button>
</div>

<div style="height:506px;">
<table class="table table-hover" id=viewTable>
  <thead class="thead-light">
    <tr>
      <th class="jsb_table_width1"><input type="checkBox"></th>
      <th class="jsb_table_width2">No</th>
      <th class="jsb_table_width3">받은사람</th>
      <th class="jsb_table_width4">쪽지내용</th>
      <th class="jsb_table_width5">수신날짜</th>
    </tr>
  </thead>
  <tbody>

  </tbody>
</table>
</div>

<div class="w3-center">
<div class="w3-bar" id=page>
</div>
</div>


</body>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
let datas;
$(document)
.ready(function(){
	$.ajax({
	    url: "sendMsgList.do",
	    type: "POST",
	    data: {
	    	//"studyName" : $('#studyName').val() // 스터디명
	    },
	    success : function(data){
	    	console.log(data);
	    	datas= new Array(data);
	    	let tblStr='';
	    	$.each(data, function(e, item){
	    		var tmpVal = data.length-e;
	    		tblStr +='<tr><td><input type="checkBox"></td><td>'+tmpVal+'</td><td>'+item.recUNick+'</td><td>'+item.msg+'</td><td>'+item.send_Date+'</td><td style="display:none;">'+item.msgNum+'</td><td style="display:none;">'+item.m_State+'</td></tr>'
	    		if(e==9) return false;
	    	})
	    	$('#viewTable tbody').html(tblStr);
	    	setPage(data.length);
	    	//viewState();
	    },
	    error : function(){	
	    }
		});
})

function post_get(){
	location.href='msgGetBox';
}
function post_set(){
	location.href='msgSetBox';
}
function post_box(){
	location.href='msgBox';
}
function post_find(){
	
}

function setPage(who){
	console.log(who);
	$('#page').empty();
	var pageHow = parseInt(who/10);  // 총 유저수 / 5 
	if(who%10 != 0){ // 나머지가 0이 아니면 + 1
		pageHow = pageHow + 1; // 나머지 때문에 +1 (if문 사용해서 수정해야됨.)
    	}
	var result = '';
	//result += '<nav aria-label="Page navigation example" style="width:100px; margin: 0 auto;">'
	//result += '<ul class="pagination" id="pageUl">'
	for(var i = 1; i <= pageHow; i++){
		//result +='<li class="page-item" onclick=pageBtnFuc('+i+')><a class="page-link" href="#">'+i+'</a></li>'
		result +='<a href="#" class="w3-button" onclick=pageBtnFuc('+i+')>'+i+'</a>'
	}
	//result += '</ul>'
	//result += '</nav>'
	$('#page').append(result);
}

function pageBtnFuc(who){
	var pageVal=who-1;
	//console.log(pageVal);
	let tblStr='';
	//console.log($('#pageUl li').length);
	if (pageVal==0){
		for (var x=0;x<=9;x++){
			var tmpVal = datas[0].length-x;
			//tblStr +='<tr><td>'+(x+1)+'</td><td>'+datas[0][x].mName+'</td><td>'+datas[0][x].adrCounty+' '+datas[0][x].adrCity+'</td><td>'+datas[0][x].category1+' - '+datas[0][x].category2+'</td><td>'+datas[0][x].cnt+'/'+datas[0][x].mPersonnel+'</td><td>'+datas[0][x].uNick+'</td><td></td><td style="display:none;">'+datas[0][x].mNum+'</td></tr>'
			tblStr +='<tr><td><input type="checkBox"></td><td>'+tmpVal+'</td><td>'+datas[0][x].recUNick+'</td><td>'+datas[0][x].msg+'</td><td>'+datas[0][x].send_Date+'</td><td style="display:none;">'+datas[0][x].msgNum+'</td><td style="display:none;">'+datas[0][x].m_State+'</td></tr>'
		};
		$('#viewTable tbody').html(tblStr);
		//viewState();
	}else if (pageVal==$('#page a').length-1){
		//console.log("maxPage");
		var tmpPageVal=pageVal*10;
		var tmpPageMax=datas[0].length-1;
		//console.log(tmpPageVal+","+tmpPageMax);
		for (var x=tmpPageVal;x<=tmpPageMax;x++){
			var tmpVal = datas[0].length-x;
			//tblStr +='<tr><td>'+(x+1)+'</td><td>'+datas[0][x].mName+'</td><td>'+datas[0][x].adrCounty+' '+datas[0][x].adrCity+'</td><td>'+datas[0][x].category1+' - '+datas[0][x].category2+'</td><td>'+datas[0][x].cnt+'/'+datas[0][x].mPersonnel+'</td><td>'+datas[0][x].uNick+'</td><td></td><td style="display:none;">'+datas[0][x].mNum+'</td></tr>'
			tblStr +='<tr><td><input type="checkBox"></td><td>'+tmpVal+'</td><td>'+datas[0][x].recUNick+'</td><td>'+datas[0][x].msg+'</td><td>'+datas[0][x].send_Date+'</td><td style="display:none;">'+datas[0][x].msgNum+'</td><td style="display:none;">'+datas[0][x].m_State+'</td></tr>'
		};
		$('#viewTable tbody').html(tblStr);
		//viewState();
	}else{
		var tmpPageVal=pageVal*10;
		var tmpPageMax=tmpPageVal+9;
		for (var x=tmpPageVal;x<=tmpPageMax;x++){
			var tmpVal = datas[0].length-x;
			//tblStr +='<tr><td>'+(x+1)+'</td><td>'+datas[0][x].mName+'</td><td>'+datas[0][x].adrCounty+' '+datas[0][x].adrCity+'</td><td>'+datas[0][x].category1+' - '+datas[0][x].category2+'</td><td>'+datas[0][x].cnt+'/'+datas[0][x].mPersonnel+'</td><td>'+datas[0][x].uNick+'</td><td></td><td style="display:none;">'+datas[0][x].mNum+'</td></tr>'
			tblStr +='<tr><td><input type="checkBox"></td><td>'+tmpVal+'</td><td>'+datas[0][x].recUNick+'</td><td>'+datas[0][x].msg+'</td><td>'+datas[0][x].send_Date+'</td><td style="display:none;">'+datas[0][x].msgNum+'</td><td style="display:none;">'+datas[0][x].m_State+'</td></tr>'
		};
		$('#viewTable tbody').html(tblStr);
		//viewState();
	};
}
</script>
</html>