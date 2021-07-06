<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<!-- confirm -->
	<div class="modal fade" id="confirmModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	      	<label class="modal-title" id=confirmTitle></label>
	      </div>
	      <div class="modal-body">
	      	<div class="mb-3">
	          <label id=lblConfirm></label>
	        </div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id=btnNo>취소</button>
	        <button type="button" class="btn btn-primary" id=btnYes data-bs-dismiss="modal">확인</button>
	      </div>
	    </div>
	  </div>
	</div>
</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script>
// confirm Modal show
function confirmModal(title, comment){
	$('#confirmTitle').text(title);
	$('#lblConfirm').text(comment);
	$('#confirmModal').modal('show');
}
</script>
</html>