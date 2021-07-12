<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>내 스터디</title>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js" integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT" crossorigin="anonymous"></script>
<link rel="stylesheet" href="${path}/resources/psg/css/form.css" type="text/css">
<link rel="stylesheet" href="${path}/resources/psg/css/meetList.css" type="text/css">
<body>
	<jsp:include page="/module/nav.jsp" flush="false" />
<div class="container px-4">
<a class=title>내가 만든 스터디</a><br><br>
<div class=form >
    <div class=subForm>
    	<div class=contents>
    		<div id=noStudyDiv1>
				<a class=comment>가입된 스터디가 없습니다.</a><br>
				<img src="${path}/resources/img/searchBig.png" class=searchPic><br>
				<a href="http://localhost:8080/app/search#" id=goSearch>스터디 찾으러 가기</a>
			</div>
		</div>
	</div>
</div>
  <div class="row gx-5">
    <div class="col">
     <div class="p-3" id=myStudyDiv1>
     
     </div>
    </div>
    <div class="col">
      <div class="p-3" id=myStudyDiv2>
      
      </div>
    </div>
  </div>
</div>
		<hr>
		<!-- 내가 가입한 스터디 -->
<div class="container px-4">
<a class=title>내가 가입한 스터디</a><br><br>
<div class=form >
    <div class=subForm>
    	<div class=contents>
    		<div id=noStudyDiv2>
				<a class=comment>가입된 스터디가 없습니다.</a><br>
				<img src="${path}/resources/img/searchBig.png" class=searchPic><br>
				<a href="http://localhost:8080/app/search#" id=goSearch>스터디 찾으러 가기</a>
			</div>
		</div>
	</div>
</div>
  <div class="row gx-5">
    <div class="col">
     <div class="p-3" id=myStudyDiv3>
     
     </div>
    </div>
    <div class="col">
      <div class="p-3" id=myStudyDiv4>
      
      </div>
    </div>
  </div>
</div>
<!-- 		<div class=subForm> -->
<!-- 			<a class=title>내가 가입한 스터디</a><br> -->
<!-- 			<div class=contents> -->
<!-- 				<div id=noStudyDiv2> -->
<!-- 					<a class=comment>가입된 스터디가 없습니다.</a><br> -->
<%-- 					<img src="${path}/resources/img/searchBig.png" class=searchPic><br> --%>
<!-- 					<a href="http://localhost:8080/app/search#" id=goSearch>스터디 찾으러 가기</a> -->
<!-- 				</div> -->
<!-- 				<div id=class style="text-align:center;"> -->
<%-- 				<img src="${path}/resources/img/meetlist.PNG" width="150" height="120"> --%>
<!-- 				</div> -->
<!-- 				<div id=myStudyDiv2> 내가 가입한 스터디 목록 -->
				
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->
	<jsp:include page="/module/footer.jsp" flush="false" />
</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script>
$(document)
.ready(function(){
	var userid = '<%=session.getAttribute("userid")%>';
	var mystudy = 0;
	var join = 0;
	
	// 아이디로 유저num 가져와서 세션저장
	$.ajax({
	    url: '${path}/pjhusernum.do',
	    type: 'POST',
	    dataType: 'text', //서버로부터 내가 받는 데이터의 타입
	    contentType : 'text/plain; charset=utf-8;',//내가 서버로 보내는 데이터의 타입
	    data:userid,
	    success: function(data){
	    },
	    error: function (){  
	    }
	  })
	
	// uid를 이용해 db에서 스터디 목록 불러오기
	$.ajax({
		url: '${path}/meetList.do', // 내 스터디 목록 보여주는 AJAX
		method: "POST",
		dataType : 'json',
		data: {"uid":userid},
		success: function output(resp){
			console.log(resp);
			var result = '';
			var result1 = '';
			var count = 0;
// 			result += '<table>'
			$.each(resp,function(index,item){
				if(item["state"] == 30){
					if(count%2 == 0){
						result += '<table>'
						result += '<tr><td><img src="${path}/resources/img/meetlist.PNG" width="150" height="100"></td></tr>'
						result += '<tr><td class=studyBlock>'
						result += '<table class=tblBlock>'
						result += '<input type=hidden value="'+item["mNum"]+'">'
						result += '<tr><td>'+item["mname"]+'</td></tr>'
						result += '<tr><td>'+item["category1"]+'</td></tr>'
						result += '<tr><td>'+item["category2"]+'</td></tr>'
						result += '<tr><td>'+item["mwhere"]+'</td></tr>'
						result += '</table>'
						result +='</table>'
				mystudy++;
				}else{
					result1 += '<table>'
					result1 += '<tr><td><img src="${path}/resources/img/meetlist.PNG" width="150" height="100"></td></tr>'
					result1 += '<tr><td class=studyBlock>'
					result1 += '<table class=tblBlock>'
					result1 += '<input type=hidden value="'+item["mNum"]+'">'
					result1 += '<tr><td>'+item["mname"]+'</td></tr>'
					result1 += '<tr><td>'+item["category1"]+'</td></tr>'
					result1 += '<tr><td>'+item["category2"]+'</td></tr>'
					result1 += '<tr><td>'+item["mwhere"]+'</td></tr>'
					result1 += '</table>'
					result1 +='</table>'
				}
				count++;
					
			}
		})
				result +='</table>'
// 				result += '</td></tr>'
			$('#myStudyDiv1').append(result);
			$('#myStudyDiv2').append(result1);
			if(mystudy != 0){
				$('#noStudyDiv1').hide();
			}else{
				$('.img1').hide();
			}
		},
		error: function(){
			alert('error');
		}
	});
	
	$.ajax({
		url: '${path}/meetList.do', // 내 스터디 목록 보여주는 AJAX
		method: "POST",
		dataType : 'json',
		data: {"uid":userid},
		success: function output(resp){
			console.log(resp);
			var result = '';
			var result1 = '';
			var count2 = 0;
			result += '<table>'
			$.each(resp,function(index,item){
				if(item["state"] == 20){
					if(count2%2 == 0){
						result += '<table>'
						result += '<tr><td><img src="${path}/resources/img/meetlist.PNG" width="150" height="100"></td></tr>'
						result += '<tr><td class=studyBlock>'
						result += '<table class=tblBlock>'
						result += '<input type=hidden value="'+item["mNum"]+'">'
						result += '<tr><td>'+item["mname"]+'</td></tr>'
						result += '<tr><td>'+item["category1"]+'</td></tr>'
						result += '<tr><td>'+item["category2"]+'</td></tr>'
						result += '<tr><td>'+item["mwhere"]+'</td></tr>'
						result += '</table>'
						result +='</table>'
						join++;
						}else{
							result1 += '<table>'
							result1 += '<tr><td><img src="${path}/resources/img/meetlist.PNG" width="150" height="100"></td></tr>'
							result1 += '<tr><td class=studyBlock>'
							result1 += '<table class=tblBlock>'
							result1 += '<input type=hidden value="'+item["mNum"]+'">'
							result1 += '<tr><td>'+item["mname"]+'</td></tr>'
							result1 += '<tr><td>'+item["category1"]+'</td></tr>'
							result1 += '<tr><td>'+item["category2"]+'</td></tr>'
							result1 += '<tr><td>'+item["mwhere"]+'</td></tr>'
							result1 += '</table>'
							result1 +='</table>'
						}
				count2++;
			}
		})
				result +='</table>'
				result += '</td></tr>'
			$('#myStudyDiv3').append(result);
			$('#myStudyDiv4').append(result1);
			if(join != 0){
				$('#noStudyDiv2').hide();
			}else{
				$('.img1').hide();
			}
		},
		error: function(){
			alert('error');
		}
	});
	// 수정 사항
	// mystudy: 내가 스터디장인 스터디의 개수 count / 있는지 확인
	// join: 내가 가입된 스터디
})
.on('click','.tblBlock',function(){
	var s_num = $(this).find('input').val();
	location.href = '${path}/meetadmin/'+s_num
})
</script>
</html>