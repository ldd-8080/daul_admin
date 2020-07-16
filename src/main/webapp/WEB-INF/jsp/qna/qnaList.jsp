<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- Page -->
<div class="page">
	<div class="page-content container-fluid">
	    <!-- Page -->
	    <h1 class="page-title">Q&A</h1>
	    <ol class="breadcrumb">
	      <li class="breadcrumb-item"><a href="../index.html">Home</a></li>
	      <li class="breadcrumb-item"><a href="javascript:void(0)">Q&A</a></li>
	      <li class="breadcrumb-item active">Q&A 목록</li>
	    </ol>
	
	    <div class="page-content">
	    	<div class="panel">
		        <header class="panel-heading">
		          <div class="panel-actions"></div>
		          <h3 class="panel-title">Q&A</h3>
		        </header>
		        <div class="panel-body">
		          <table class="table table-hover dataTable table-striped w-full" id="boardTable" data-plugin="dataTable">
		            <thead>
		              <tr>
		                <th>번호</th>
		                <th style="visibility:hidden;position:absolute;"></th>
		                <th>제목</th>
		                <th style="visibility:hidden;position:absolute;">내용</th>
		                <th>작성자</th>
		                <th>작성자유형</th>
		                <th>등록일</th>
		                <th>조회수</th>
		                <th></th>
		                 <th style="visibility:hidden;position:absolute;"></th>
		              </tr>
		            </thead>
		            <tbody>
		            	<c:forEach var="result" items="${qnaList}" varStatus="status">
		            	
		            	<tr>
		            		<td id="seq_${status.index}">${status.index + 1} </td>
		            		<td style="visibility:hidden;position:absolute;">${result.qna_idx}</td>
		            		<td><c:if test="${!empty result.parent_qna_idx}"><i class="site-menu-icon md-long-arrow-right" aria-hidden="true"></i></c:if>${result.question}</td>
		            		<td style="visibility:hidden;position:absolute;">${result.content}</td>
		            		<td>${result.create_user}</td>
		            		<td>${result.auth_type}</td>
		            		<td>${result.create_date}</td>
		            		<td>${result.view_count}</td>
		            		<td>
		            		<c:choose>
		            			<c:when test="${result.create_user ne login.user_id }">
		            				<button type="button" data-toggle="modal" data-target="#qnaDetailPositionCenter" href="#">상세</button>
		            			</c:when>
		            			<c:when test="${result.create_user eq login.user_id }">
		            				<button type="button" data-toggle="modal" data-target="#qnaUpdatePositionCenter" href="#">상세</button>
		            			</c:when>
		            		</c:choose>
		            		<c:if test="${empty result.parent_qna_idx}">
		            			<button type="button" data-toggle="modal" data-target="#qnaPositionCenter" href="#">답변</button>
		            		</c:if>
		            		</td>
		            		<td style="visibility:hidden;position:absolute;">${result.parent_qna_idx}</td>
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

<!-- Q&A 답글등록 모달 -->
<div class="modal fade" id="qnaPositionCenter" aria-hidden="true" aria-labelledby="qnaPositionCenter" role="dialog" tabindex="-1">
  <div class="modal-dialog modal-simple modal-center">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">x</span>
        </button>
        <h4 class="modal-title">Q&A 답글등록</h4>
      </div>
      <div class="modal-body">
        <form id="qna-modal-reply-form">
        	<div class="example-wrap">
        		<h4 class="example-title">질문내용</h4>
      			<textarea class="form-control"id="question_content" rows="5" readonly></textarea>
      			<h4 class="example-title">답글제목</h4>
      			<input type="text" class="form-control" id="reply_title" name="question" value="답변입니다."/>
    			<h4 class="example-title">답글내용</h4>
      			<textarea class="form-control"id="reply_content" name="content" rows="5"></textarea>

				<input type="hidden" id="qna_idx_reply" name="qna_idx"/>
				<input type="hidden" id="ref_reply" name="ref"/>
      		</div>
        	
        	<span class="text-left" id="chk-error"></span>
        	<div style="text-align:center">
        		<button type="button" class="btn btn-primary waves-effect waves-classics" id="qna-modal-btn" >등 &nbsp;&nbsp; 록</button>
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
<!-- Q&A 답글등록 모달 끝 -->


<!-- Q&A 상세 모달 -->
<div class="modal fade" id="qnaDetailPositionCenter" aria-hidden="true" aria-labelledby="qnaDetailPositionCenter" role="dialog" tabindex="-1">
  <div class="modal-dialog modal-simple modal-center">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">x</span>
        </button>
        <h4 class="modal-title">Q&A 상세보기</h4>
      </div>
      <div class="modal-body">
        <form id="qna-modal-detail-form">
        	<div class="example-wrap">
        		<h4 class="example-title">작성자</h4>
      			<input type="text" class="form-control" id="detail_create_user" readonly/>	
        		<h4 class="example-title">질문제목</h4>
      			<textarea class="form-control"id="detail_qustion" rows="5" readonly></textarea>
      			<h4 class="example-title">질문내용</h4>
      			<textarea class="form-control"id="detail_content" rows="5" readonly></textarea>

				<input type="hidden" id="qna_idx_detail" name="qna_idx"/>
				<input type="hidden" id="parent_qna_idx_detail" name="parent_qna_idx"/>
      		</div>
        	
        	<span class="text-left" id="chk-error"></span>
        	<div style="text-align:center">
        	 	<button type="button" class="btn btn-default waves-effect waves-classics" id="qna-modal-delete-btn2" >삭 &nbsp;&nbsp; 제</button>
        	 	<button type="button" class="btn btn-default waves-effect waves-classics" data-dismiss="modal" aria-label="Close" id="qna-modal-btn2" >닫 &nbsp;&nbsp; 기</button>
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
<!-- Q&A 상세 모달 끝 -->


<!-- Q&A 수정 모달 -->
<div class="modal fade" id="qnaUpdatePositionCenter" aria-hidden="true" aria-labelledby="qnaUpdatePositionCenter" role="dialog" tabindex="-1">
  <div class="modal-dialog modal-simple modal-center">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">x</span>
        </button>
        <h4 class="modal-title">Q&A 상세보기</h4>
      </div>
      <div class="modal-body">
        <form id="qna-modal-update-form">
        	<div class="example-wrap">
        		<h4 class="example-title">작성자</h4>
      			<input type="text" class="form-control" id="update_create_user" readonly/>	
        		<h4 class="example-title">질문제목</h4>
      			<textarea class="form-control"id="update_qustion" name = "question" rows="5" ></textarea>
      			<h4 class="example-title">질문내용</h4>
      			<textarea class="form-control"id="update_content" name = "content" rows="5" ></textarea>

				<input type="hidden" id="qna_idx_update" name="qna_idx"/>
				
				<input type="hidden" id="parent_qna_idx_update" name="parent_qna_idx"/>
      		</div>
        	
        	<span class="text-left" id="chk-error"></span>
        	<div style="text-align:center">
        	 	<button type="button" class="btn btn-primary waves-effect waves-classics" id="qna-modal-update-btn" >수 &nbsp;&nbsp; 정</button>
        	 	<button type="button" class="btn btn-default waves-effect waves-classics" id="qna-modal-delete-btn3" >삭 &nbsp;&nbsp; 제</button>
        	 	<button type="button" class="btn btn-default waves-effect waves-classics" data-dismiss="modal" aria-label="Close" id="qna-modal-btn3" >닫 &nbsp;&nbsp; 기</button>
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
<!-- Q&A 수정 모달 끝 -->


<script type="text/javascript">


$(function() {

	
	$("#qna-modal-btn").click(function() {
		insertQnaReply();
	});	
	$("#qna-modal-update-btn").click(function() {
		updateQnaReply();
	});
	$("#qna-modal-delete-btn").click(function() {
		deleteQnaReply();
	});
	$("#qna-modal-delete-btn2").click(function() {
		deleteQnaReply();
	});
	$("#qna-modal-delete-btn3").click(function() {
		deleteQnaReply();
	});
	
});

	$("#boardTable tr td").click(function(event) {
		if ($(this).get(0).cellIndex === 8) {
			
			var qna_idx = $(this).parent().children().eq(1).text();
			var question = $(this).parent().children().eq(2).text();
			var content = $(this).parent().children().eq(3).text();			
			var create_user =  $(this).parent().children().eq(4).text();
			var parent_qna_idx = $(this).parent().children().eq(9).text();
			document.getElementById("question_content").value = content;
			document.getElementById("qna_idx_reply").value = qna_idx;
			document.getElementById("ref_reply").value = qna_idx;
			document.getElementById("detail_qustion").value = question;
			document.getElementById("detail_content").value = content;
			document.getElementById("detail_create_user").value = create_user;
			document.getElementById("update_qustion").value = question;
			document.getElementById("update_content").value = content;
			document.getElementById("update_create_user").value = create_user;
			document.getElementById("qna_idx_update").value = qna_idx;
			document.getElementById("qna_idx_detail").value = qna_idx;
			document.getElementById("parent_qna_idx_update").value = parent_qna_idx;
			document.getElementById("parent_qna_idx_detail").value = parent_qna_idx;
			
		} else {
			/* var faq_idx = $(this).parent().children().eq(1).text();
			var question = $(this).parent().children().eq(2).text();
			var answer = $(this).parent().children().eq(3).text();
			console.log(faq_idx +","+ question + ","+answer);
			
			document.getElementById("question_update").value = question;
			document.getElementById("answer_update").value = answer;
			document.getElementById("faq_idx_update").value = faq_idx;
			
			$("#faqUpdate").click(); */
		}
	});
	
	function insertQnaReply(){
		var request = $.ajax({
			url: "/qna/insertQnaReply.do",
			method: "post",
			//contentType: "application/json",
			//dataType: "json",
			data: $("#qna-modal-reply-form").serialize()
		});
		request.done(function(data) {
			console.log(data);
			console.log("request done");
			
			if (data === "success") {
				location.href = "${pageContext.request.contextPath}/qna/qnaList.do";
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
	
	function updateQnaReply(){
		var request = $.ajax({
			url: "/qna/updateQnaReply.do",
			method: "post",
			//contentType: "application/json",
			//dataType: "json",
			data: $("#qna-modal-update-form").serialize()
		});
		request.done(function(data) {
			console.log(data);
			console.log("request done");
			
			if (data === "success") {
				location.href = "${pageContext.request.contextPath}/qna/qnaList.do";
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
	
	function deleteQnaReply(){
		var request = $.ajax({
			url: "/qna/deleteQnaReply.do",
			method: "post",
			//contentType: "application/json",
			//dataType: "json",
			data: $("#qna-modal-update-form").serialize()
		});
		request.done(function(data) {
			console.log(data);
			console.log("request done");
			
			if (data === "success") {
				location.href = "${pageContext.request.contextPath}/qna/qnaList.do";
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
	
	
</script>
	

