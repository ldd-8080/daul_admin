<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script type="text/javascript">
/* $(document).ready(function() {
	$("#userTable").DataTable();
}); */
</script>
    
<!-- Page -->
<div class="page">
	<div class="page-content container-fluid">
	    <!-- Page -->
	    <h1 class="page-title">FAQ</h1>
	    <ol class="breadcrumb">
	      <li class="breadcrumb-item"><a href="../index.html">Home</a></li>
	      <li class="breadcrumb-item"><a href="javascript:void(0)">FAQ</a></li>
	      <li class="breadcrumb-item active">FAQ 목록</li>
	    </ol>
	
	    <div class="page-content">
	    	<div class="panel">
		        <header class="panel-heading">
		          <div class="panel-actions"></div>
		          <h3 class="panel-title">FAQ</h3>
		        </header>
		        <div class="panel-body">
		          <table class="table table-hover dataTable table-striped w-full" id="boardTable" data-plugin="dataTable">
		            <thead>
		              <tr>
		                <th>번호</th>
		                <th style="visibility:hidden;position:absolute;"></th>
		                <th>질문</th>
		                <th>답변</th>
		                <th>등록자</th>
		              </tr>
		            </thead>
		            <tbody>
		            	<c:forEach var="result" items="${faqList}" varStatus="status">
		            	<tr>
		            		<td id="seq_${status.index}">${status.index + 1}</td>
		            		<td style="visibility:hidden;position:absolute;">${result.faq_idx}</td>
		            		<td>${result.question}</td>
		            		<td>${result.answer}</td>
		            		<td>${result.create_user}</td>
	            		</tr>
		            	</c:forEach>
		            </tbody>
		          </table>
		        </div>
		        <div class="col-md-6">
                	<div class="example example-buttons">                     
                     	<div>
               	      		<button type="button" class="btn btn-squared btn-info" data-toggle="modal" data-target="#faqPositionCenter" href="#" >글쓰기</button>
               	      		<button type="button"  style="display:none;" class="btn btn-squared btn-info" id = "faqUpdate" data-toggle="modal" data-target="#faqUpdatePositionCenter" href="#" >수정</button>
                    	</div>                     
                	</div>
            	</div>
	    	</div>
	    </div>
	</div>
<!-- End Page -->
</div>
<!-- FAQ 등록 모달 -->
<div class="modal fade" id="faqPositionCenter" aria-hidden="true" aria-labelledby="faqPositionCenter" role="dialog" tabindex="-1">
  <div class="modal-dialog modal-simple modal-center">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">x</span>
        </button>
        <h4 class="modal-title">FAQ</h4>
      </div>
      <div class="modal-body">
        <form id="faq-modal-form">
        	<div class="example-wrap">
        		<h4 class="example-title">작성자</h4>
      			<input type="text" class="form-control" id="inputPlaceholder"  value="${login.email}"/>
    			<h4 class="example-title">질의</h4>
      			<textarea class="form-control"id="question" name="question" rows="5"></textarea>
      			<h4 class="example-title">응답</h4>
      			<textarea class="form-control"id="answer"name="answer" rows="5"></textarea>
      		</div>
        	
        	<span class="text-left" id="chk-error"></span>
        	<div style="text-align:center">
        		<button type="button" class="btn btn-primary waves-effect waves-classics" id="faq-modal-btn" >등 &nbsp;&nbsp; 록</button>
        	 	<button type="button" class="btn btn-default waves-effect waves-classics" data-dismiss="modal" aria-label="Close" id="faq-modal-btn" >취 &nbsp;&nbsp; 소</button>
        	</div>
        </form>
       
      </div>
      <div class="modal-footer">
        <!-- <button type="button" class="btn btn-default btn-pure" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button> -->
      </div>
    </div>
  </div>
</div>
<!--FAQ등록 모달 끝 -->

<!-- FAQ수정 모달 -->
<div class="modal fade" id="faqUpdatePositionCenter" aria-hidden="true" aria-labelledby="faqUpdatePositionCenter" role="dialog" tabindex="-1">
  <div class="modal-dialog modal-simple modal-center">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">x</span>
        </button>
        <h4 class="modal-title">FAQ 상세보기</h4>
      </div>
      <div class="modal-body">
        <form id="faq-modal-update-form">
        	<div class="example-wrap">
        		<h4 class="example-title">작성자</h4>
      			<input type="text" class="form-control" id="inputPlaceholder" name="create_user" value="${login.user_id}"/>
    			<h4 class="example-title">질의</h4>
      			<textarea class="form-control"id="question_update" name="question" rows="5"></textarea>
      			<h4 class="example-title">응답</h4>
      			<textarea class="form-control"id="answer_update"name="answer" rows="5"></textarea>
      			
      			<input type="hidden" id="faq_idx_update" name="faq_idx"/>
      			
      			
      		</div>
        	
        	<span class="text-left" id="chk-error"></span>
        	<div style="text-align:center">
        		<button type="button" class="btn btn-primary waves-effect waves-classics" id="faq-modal-update-btn" >수 &nbsp;&nbsp; 정</button>
        	 	<button type="button" class="btn btn-default waves-effect waves-classics" id="faq-modal-delete-btn" >삭 &nbsp;&nbsp; 제</button>
        	</div>
        </form>
       
      </div>
      <div class="modal-footer">
        <!-- <button type="button" class="btn btn-default btn-pure" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button> -->
      </div>
    </div>
  </div>
</div>
<!--FAQ수정 모달 끝 -->



<script type="text/javascript">

$(function() {

	
	$("#faq-modal-btn").click(function() {
		insertFaq();
	});
	
	$("#faq-modal-update-btn").click(function() {
		updateFaq();
	});
	
	$("#faq-modal-delete-btn").click(function() {
		deleteFaq();
	});
	
});


function insertFaq() {
	var request = $.ajax({
		url: "/faq/insertFaq.do",
		method: "post",
		//contentType: "application/json",
		//dataType: "json",
		data: $("#faq-modal-form").serialize()
	});
	request.done(function(data) {
		console.log(data);
		console.log("request done");
		
		if (data === "success") {
			location.href = "${pageContext.request.contextPath}/faq/faqList.do";
		} else {
			//alert(data);
			$("#chk-error").text(data);
		}
	});
	request.fail(function(error) {
		console.log(error);
		console.log("request fail");
	});
}


function updateFaq() {
	var request = $.ajax({
		url: "/faq/updateFaq.do",
		method: "post",
		//contentType: "application/json",
		//dataType: "json",
		data: $("#faq-modal-update-form").serialize()
	});
	request.done(function(data) {
		console.log(data);
		console.log("request done");
		
		if (data === "success") {
			location.href = "${pageContext.request.contextPath}/faq/faqList.do";
		} else {
			//alert(data);
			$("#chk-error").text(data);
		}
	});
	request.fail(function(error) {
		console.log(error);
		console.log("request fail");
	});
}


function deleteFaq() {
	var request = $.ajax({
		url: "/faq/deleteFaq.do",
		method: "post",
		//contentType: "application/json",
		//dataType: "json",
		data: $("#faq-modal-update-form").serialize()
	});
	request.done(function(data) {
		console.log(data);
		console.log("request done");
		
		if (data === "success") {
			location.href = "${pageContext.request.contextPath}/faq/faqList.do";
		} else {
			//alert(data);
			$("#chk-error").text(data);
		}
	});
	request.fail(function(error) {
		console.log(error);
		console.log("request fail");
	});
}



	$("#boardTable tr td").click(function(event) {
		if ($(this).get(0).cellIndex === 0) {
		} else {
			var faq_idx = $(this).parent().children().eq(1).text();
			var question = $(this).parent().children().eq(2).text();
			var answer = $(this).parent().children().eq(3).text();
			console.log(faq_idx +","+ question + ","+answer);
			
			document.getElementById("question_update").value = question;
			document.getElementById("answer_update").value = answer;
			document.getElementById("faq_idx_update").value = faq_idx;
			
			$("#faqUpdate").click();
		}
	});

</script>
