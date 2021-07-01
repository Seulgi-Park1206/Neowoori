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
<link rel="stylesheet" href="${path}/resources/psg/css/form.css" type="text/css">
<link rel="stylesheet" href="${path}/resources/psg/css/meetList.css" type="text/css">
<body>
	<jsp:include page="/module/nav.jsp" flush="false" />
	<div class=form>
		<!-- 내가 만든 스터디 -->
		<div class=subForm>
			<a class=title>내가 만든 스터디</a><br>
			<div class=contents>
				<div id=noStudyDiv1>
					<a class=comment>가입된 스터디가 없습니다.</a><br>
					<img src="${path}/resources/img/searchBig.png" class=searchPic><br>
					<a href="" id=goSearch>스터디 찾으러 가기</a>
				</div>
				<div id=myStudyDiv1>
<!-- 					<table> -->
<!-- 						<tr><td class=studyBlock> -->
<!-- 								<table class=tblBlock> -->
<!-- 									<tr><td>행렬의 아름다움</td></tr> -->
<!-- 									<tr><td>카테고리 대</td></tr> -->
<!-- 									<tr><td>카테고리 소</td></tr> -->
<!-- 									<tr><td>천안시</td></tr> -->
<!-- 								</table> -->
<!-- 							</td><td class=blank></td> -->
<!-- 							<td class=studyBlock> -->
<!-- 								<table class=tblBlock> -->
<!-- 									<tr><td>행렬의 아름다움</td></tr> -->
<!-- 									<tr><td>카테고리 대</td></tr> -->
<!-- 									<tr><td>카테고리 소</td></tr> -->
<!-- 									<tr><td>천안시</td></tr> -->
<!-- 								</table> -->
<!-- 							</td></tr> -->
<!-- 						<tr><td colspan=3 class=blank2></td></tr> -->
<!-- 						<tr><td class=studyBlock> -->
<!-- 								<table class=tblBlock> -->
<!-- 									<tr><td>행렬의 아름다움</td></tr> -->
<!-- 									<tr><td>카테고리 대</td></tr> -->
<!-- 									<tr><td>카테고리 소</td></tr> -->
<!-- 									<tr><td>천안시</td></tr> -->
<!-- 								</table> -->
<!-- 							</td><td class=blank></td> -->
<!-- 							<td class=studyBlock> -->
<!-- 								<table class=tblBlock> -->
<!-- 									<tr><td>행렬의 아름다움</td></tr> -->
<!-- 									<tr><td>카테고리 대</td></tr> -->
<!-- 									<tr><td>카테고리 소</td></tr> -->
<!-- 									<tr><td>천안시</td></tr> -->
<!-- 								</table> -->
<!-- 							</td></tr> -->
<!-- 						<tr><td colspan=3 class=blank2></td></tr> -->
<!-- 						<tr><td class=studyBlock> -->
<!-- 								<table class=tblBlock> -->
<!-- 									<tr><td>행렬의 아름다움</td></tr> -->
<!-- 									<tr><td>카테고리 대</td></tr> -->
<!-- 									<tr><td>카테고리 소</td></tr> -->
<!-- 									<tr><td>천안시</td></tr> -->
<!-- 								</table> -->
<!-- 							</td><td class=blank></td> -->
<!-- 							<td class=studyBlock> -->
<!-- 								<table class=tblBlock> -->
<!-- 									<tr><td>행렬의 아름다움</td></tr> -->
<!-- 									<tr><td>카테고리 대</td></tr> -->
<!-- 									<tr><td>카테고리 소</td></tr> -->
<!-- 									<tr><td>천안시</td></tr> -->
<!-- 								</table> -->
<!-- 							</td></tr> -->
<!-- 					</table> -->
				</div>
			</div>
		</div>
		<hr>
		<!-- 내가 가입한 스터디 -->
		<div class=subForm>
			<a class=title>내가 가입한 스터디</a><br>
			<div class=contents>
				<div id=noStudyDiv2>
					<a class=comment>가입된 스터디가 없습니다.</a><br>
					<img src="${path}/resources/img/searchBig.png" class=searchPic><br>
					<a href="" id=goSearch>스터디 찾으러 가기</a>
				</div>
				<div id=myStudyDiv2>
<!-- 					<table> -->
<!-- 						<tr><td class=studyBlock> -->
<!-- 								<table class=tblBlock> -->
<!-- 									<tr><td>행렬의 아름다움</td></tr> -->
<!-- 									<tr><td>(가입 중)</td></tr> -->
<!-- 									<tr><td>카테고리 대</td></tr> -->
<!-- 									<tr><td>카테고리 소</td></tr> -->
<!-- 									<tr><td>천안시</td></tr> -->
<!-- 								</table> -->
<!-- 							</td><td class=blank></td> -->
<!-- 							<td class=studyBlock> -->
<!-- 								<table class=tblBlock> -->
<!-- 									<tr><td>행렬의 아름다움</td></tr> -->
<!-- 									<tr><td>(가입 중)</td></tr> -->
<!-- 									<tr><td>카테고리 대</td></tr> -->
<!-- 									<tr><td>카테고리 소</td></tr> -->
<!-- 									<tr><td>천안시</td></tr> -->
<!-- 								</table> -->
<!-- 							</td></tr> -->
<!-- 						<tr><td colspan=3 class=blank2></td></tr> -->
<!-- 						<tr><td class=studyBlock> -->
<!-- 								<table class=tblBlock> -->
<!-- 									<tr><td>행렬의 아름다움</td></tr> -->
<!-- 									<tr><td>(가입 중)</td></tr> -->
<!-- 									<tr><td>카테고리 대</td></tr> -->
<!-- 									<tr><td>카테고리 소</td></tr> -->
<!-- 									<tr><td>천안시</td></tr> -->
<!-- 								</table> -->
<!-- 							</td><td class=blank></td> -->
<!-- 							<td class=studyBlock> -->
<!-- 								<table class=tblBlock> -->
<!-- 									<tr><td>행렬의 아름다움</td></tr> -->
<!-- 									<tr><td>(가입 중)</td></tr> -->
<!-- 									<tr><td>카테고리 대</td></tr> -->
<!-- 									<tr><td>카테고리 소</td></tr> -->
<!-- 									<tr><td>천안시</td></tr> -->
<!-- 								</table> -->
<!-- 							</td></tr> -->
<!-- 						<tr><td colspan=3 class=blank2></td></tr> -->
<!-- 						<tr><td class=studyBlock> -->
<!-- 								<table class=tblBlock> -->
<!-- 									<tr><td>행렬의 아름다움</td></tr> -->
<!-- 									<tr><td>(가입 중)</td></tr> -->
<!-- 									<tr><td>카테고리 대</td></tr> -->
<!-- 									<tr><td>카테고리 소</td></tr> -->
<!-- 									<tr><td>천안시</td></tr> -->
<!-- 								</table> -->
<!-- 							</td><td class=blank></td> -->
<!-- 							<td class=studyBlock> -->
<!-- 								<table class=tblBlock> -->
<!-- 									<tr><td>행렬의 아름다움</td></tr> -->
<!-- 									<tr><td>(가입 중)</td></tr> -->
<!-- 									<tr><td>카테고리 대</td></tr> -->
<!-- 									<tr><td>카테고리 소</td></tr> -->
<!-- 									<tr><td>천안시</td></tr> -->
<!-- 								</table> -->
<!-- 							</td></tr> -->
<!-- 					</table> -->
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/module/footer.jsp" flush="false" />
</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script>
$(document)
.ready(function(){
	var userid = '<%=session.getAttribute("userid")%>';
	// uid를 이용해 db에서 스터디 목록 불러오기
	$.ajax({
		url: '${path}/meetList.do', // 내 스터디 목록 보여주는 AJAX
		method: "POST",
		dataType : 'json',
		data: {"uid":userid},
		success: function output(resp){
			console.log(resp);
			var result = '';
			result += '<table>'
			$.each(resp,function(index,item){
				if(item["state"] == 30){
				result += '<tr><td class=studyBlock>'
				result += '<table class=tblBlock>'
				result += '<input type=hidden value="'+item["mNum"]+'">'
				result += '<tr><td>'+item["mname"]+'</td></tr>'
				result += '<tr><td>'+item["category1"]+'</td></tr>'
				result += '<tr><td>'+item["category2"]+'</td></tr>'
				result += '<tr><td>'+item["mwhere"]+'</td></tr>'
				result += '</table>'
// 				result += '</td><td class=blank></td>'
				
			}
		})
				result +='</table>'
				result += '</td></tr>'
			$('#myStudyDiv1').append(result);
		
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
			result += '<table>'
			$.each(resp,function(index,item){
				if(item["state"] == 20){
				result += '<tr><td class=studyBlock>'
				result += '<table class=tblBlock>'
				result += '<input type=hidden value="'+item["mNum"]+'">'
				result += '<tr><td>'+item["mname"]+'</td></tr>'
				result += '<tr><td>(가입 중)</td></tr>'
				result += '<tr><td>'+item["category1"]+'</td></tr>'
				result += '<tr><td>'+item["category2"]+'</td></tr>'
				result += '<tr><td>'+item["mwhere"]+'</td></tr>'
				result += '</table>'
// 				result += '</td><td class=blank></td>'
				
			}
		})
				result +='</table>'
				result += '</td></tr>'
			$('#myStudyDiv2').append(result);
		
		},
		error: function(){
			alert('error');
		}
	});
	
	var mystudy = 1;
	var join = 1;
	// 수정 사항
	// mystudy: 내가 스터디장인 스터디의 개수 count / 있는지 확인
	// join: 내가 가입된 스터디
	if(mystudy != null){
		$('#noStudyDiv1').hide();
	}else{
		$('#myStudyDiv1').hide();
	}
	if(join != null){
		$('#noStudyDiv2').hide();
	}else{
		$('#myStudyDiv2').hide();
	}
})
.on('click','.tblBlock',function(){
	var s_num = $(this).find('input').val();
	location.href = '${path}/meetView/'+s_num
})
</script>
</html>