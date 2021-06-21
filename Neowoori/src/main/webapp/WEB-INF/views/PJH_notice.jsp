<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<body>
<jsp:include page="/module/nav.jsp" flush="false" />
<div>
	<h2>공지사항</h2>
</div>
<div class="accordion accordion-flush" id="accordionFlushExample" style="width:1000px; margin: 0 auto;">
  <div class="accordion-item">
    <h2 class="accordion-header" id="flush-headingOne">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
        공지사항1
      </button>
    </h2>
    <div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
      <div class="accordion-body">됐다아아아아아아아ㅏㅇ아ㅏ아아아<code>요긴 빨간색나오네</code> 으허허허허허허허</div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header" id="flush-headingTwo">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
       	공지사항2
      </button>
    </h2>
    <div id="flush-collapseTwo" class="accordion-collapse collapse" aria-labelledby="flush-headingTwo" data-bs-parent="#accordionFlushExample">
      <div class="accordion-body">됐다아아아아아아아ㅏㅇ아ㅏ아아아<code>요긴 빨간색나오네</code> 으허허허허허허허</div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header" id="flush-headingThree">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">
        공지사항3
      </button>
    </h2>
    <div id="flush-collapseThree" class="accordion-collapse collapse" aria-labelledby="flush-headingThree" data-bs-parent="#accordionFlushExample">
      <div class="accordion-body">됐다아아아아아아아ㅏㅇ아ㅏ아아아<code>요긴 빨간색나오네</code> 으허허허허허허허</div>
    </div>
  </div>
   <div class="accordion-item">
    <h2 class="accordion-header" id="flush-headingThree">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">
        공지사항4
      </button>
    </h2>
    <div id="flush-collapseThree" class="accordion-collapse collapse" aria-labelledby="flush-headingThree" data-bs-parent="#accordionFlushExample">
      <div class="accordion-body">됐다아아아아아아아ㅏㅇ아ㅏ아아아<code>요긴 빨간색나오네</code> 으허허허허허허허</div>
    </div>
  </div>
   <div class="accordion-item">
    <h2 class="accordion-header" id="flush-headingThree">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">
        공지사항5
      </button>
    </h2>
    <div id="flush-collapseThree" class="accordion-collapse collapse" aria-labelledby="flush-headingThree" data-bs-parent="#accordionFlushExample">
      <div class="accordion-body">됐다아아아아아아아ㅏㅇ아ㅏ아아아<code>요긴 빨간색나오네</code> 으허허허허허허허</div>
    </div>
  </div>
   <div class="accordion-item">
    <h2 class="accordion-header" id="flush-headingThree">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">
        공지사항6
      </button>
    </h2>
    <div id="flush-collapseThree" class="accordion-collapse collapse" aria-labelledby="flush-headingThree" data-bs-parent="#accordionFlushExample" style="margin:0px 0px 40px 0px;">
      <div class="accordion-body">됐다아아아아아아아ㅏㅇ아ㅏ아아아<code>요긴 빨간색나오네</code> 으허허허허허허허</div>
    </div>
  </div>
	<div class="btn-toolbar justify-content-between" role="toolbar" aria-label="Toolbar with button groups"  style="width:100px; margin: 0 auto;">
	  <div class="btn-group" role="group" aria-label="First group">
	    <button type="button" class="btn btn-outline-secondary">1</button>
	    <button type="button" class="btn btn-outline-secondary">2</button>
	    <button type="button" class="btn btn-outline-secondary">3</button>
	    <button type="button" class="btn btn-outline-secondary">4</button>
	  	</div>
	</div>
</div>
<jsp:include page="/module/footer.jsp" flush="false" />
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
</html>