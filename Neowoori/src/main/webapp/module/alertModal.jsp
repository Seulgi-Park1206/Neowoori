<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<!-- alert -->
	<div class="modal fade" id="alertModal" aria-hidden="true" aria-labelledby="exampleModalToggleLabel2" tabindex="-1">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	      <div class="modal-header">
	      	<label class="modal-title" id=alertTitle></label>
	      </div>
	      <div class="modal-body">
	        <label id=lblAlert></label>
	      </div>
	      <div class="modal-footer">
	        <button class="btn btn-secondary" data-bs-dismiss="modal">확인</button>
	      </div>
	    </div>
	  </div>
	</div>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script>
// alert Modal show
function alertModal(title, comment){
	$('#alertTitle').text(title);
	$('#lblAlert').text(comment);
	$('#alertModal').modal('show');
}
</script>