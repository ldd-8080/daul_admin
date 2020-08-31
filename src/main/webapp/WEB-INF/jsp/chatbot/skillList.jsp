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
	      <li class="breadcrumb-item"><a href="javascript:void(0)">챗봇</a></li>
	      <li class="breadcrumb-item active">스킬 관리</li>
	    </ol>
	
	    
	   
			
	    	<div class="panel">
		        <header class="panel-heading">
		          <div class="panel-actions"></div>
		        </header>
		        <br/>
		        <div class="panel-body">
		        	 <div id="skillListTable" class="text-break"></div>
		        </div>
	    	</div>
	    
	</div>
	<button type="button" style="display:none;" class="btn-sm btn-primary btn-outline  waves-effect waves-classic" data-toggle="modal" data-target="#qnaDetailPositionCenter" id="qnaDetailPositionBtn" href="#">상세</button>
	<button type="button" style="display:none;" class="btn-sm btn-primary btn-outline  waves-effect waves-classic" data-toggle="modal" data-target="#qnaUpdatePositionCenter" id="qnaUpdatePositionBtn" href="#">상세</button>
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
      			<span class="text-left" style="color:red;" id="chk-error-question-reg"></span>
    			<h4 class="example-title">답글내용</h4>
      			<textarea class="form-control"id="reply_content" name="content" rows="5"></textarea>
				<span class="text-left" style="color:red;" id="chk-error-content-reg"></span>
				
				<input type="hidden" id="qna_idx_reply" name="qna_idx"/>
				<input type="hidden" id="ref_reply" name="ref"/>
      		</div>
        	
        	<span class="text-left" id="chk-error"></span>
        	<div style="text-align:center">
        		<button type="button" class="btn btn-primary waves-effect waves-classics" id="qna-modal-btn" data-title="QNA">등록 </button>
        	 	<button type="button" class="btn btn-default waves-effect waves-classics" data-dismiss="modal" aria-label="Close" id="qna-modal-cancel-btn" >취소 </button>
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
        <h4 class="modal-title">스킬 상세보기</h4>
      </div>
      <div class="modal-body">
        <form id="qna-modal-detail-form">
        	<div class="example-wrap">
        		<h4 class="example-title">스킬명</h4>
      			<input type="text" class="form-control" id="detail-skill-title" readonly/>	
        		
				<h4 class="example-title">스킬아이디</h4>
      			<input type="text" class="form-control" id="detail-skill-function" readonly/>	
        		

				<input type="hidden" id="qna_idx_detail" name="qna_idx"/>
				<input type="hidden" id="parent_qna_idx_detail" name="parent_qna_idx"/>
      		</div>
        	
        	<span class="text-left" id="chk-error"></span>
        	<div style="text-align:center">
        	 	<button type="button" class="btn btn-default waves-effect waves-classics" id="qna-modal-delete-btn2" data-title="QNA">삭제 </button>
        	 	<button type="button" class="btn btn-default waves-effect waves-classics" data-dismiss="modal" aria-label="Close" id="qna-modal-cancel-btn2" >닫기 </button>
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
        <h4 class="modal-title">스킬 상세보기</h4>
      </div>
      <div class="modal-body">
        <form id="qna-modal-update-form">
        	<div class="example-wrap">
        		<h4 class="example-title">작성자</h4>
      			<input type="text" class="form-control" id="update_create_user" readonly/>	
        		<h4 class="example-title">질문제목</h4>
      			<textarea class="form-control"id="update_qustion" name = "question" rows="5" ></textarea>
      			<span class="text-left" style="color:red;" id="chk-error-question-mod"></span>
      			<h4 class="example-title">질문내용</h4>
      			<textarea class="form-control"id="update_content" name = "content" rows="5" ></textarea>
      			<span class="text-left" style="color:red;" id="chk-error-content-mod"></span>

				<input type="hidden" id="qna_idx_update" name="qna_idx"/>
				
				<input type="hidden" id="parent_qna_idx_update" name="parent_qna_idx"/>
      		</div>
        	
        	<span class="text-left" id="chk-error"></span>
        	<div style="text-align:center">
        	 	<button type="button" class="btn btn-primary waves-effect waves-classics" id="qna-modal-update-btn" data-title="QNA">수정 </button>
        	 	<button type="button" class="btn btn-default waves-effect waves-classics" id="qna-modal-delete-btn3" data-title="QNA">삭제 </button>
        	 	<button type="button" class="btn btn-default waves-effect waves-classics" data-dismiss="modal" aria-label="Close" id="qna-modal-cancel-btn3" >닫기 </button>
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


	function relpyBtnClick(){
		$("#reply_title").val("답변입니다.");
		$("#reply_content").val('');
		$("#chk-error-question-reg").text("");
		$("#chk-error-content-reg").text('');
	}
$(function() {
	
	$("#qnaPositionCenterBtn").click(function(){
		console.log("12312312321");
		$("#chk-error-question-reg").text("");
		$("#chk-error-content-reg").text('');
	});
	
	$("#qna-modal-btn").click(function() {
		if (!submitConfirm($(this))) return false;
		
		insertQnaReply();
	});	
	$("#qna-modal-update-btn").click(function() {
		if (!submitConfirm($(this))) return false;
		
		updateQnaReply();
	});

	$("#qna-modal-delete-btn2").click(function() {
		if (!submitConfirm($(this))) return false;
		
		deleteQnaReply();
		$("#qna-modal-cancel-btn2").trigger("click");
		
	});
	$("#qna-modal-delete-btn3").click(function() {
		if (!submitConfirm($(this))) return false;
		
		deleteQnaReply();
		$("#qna-modal-cancel-btn3").trigger("click");
	});
	
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
			if(typeof(data) == "object"){
	    		valid_reg(data);
	    		return false;
	    	}
			
			if (data === "success") {
				getQnaList();
				$("#qna-modal-cancel-btn").trigger("click");
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
			if(typeof(data) == "object"){
	    		valid_mod(data);
	    		return false;
	    	}
			
			if (data === "success") {
				getQnaList();
				$("#qna-modal-cancel-btn3").trigger("click");
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
			
			if (data === "success") {
				getQnaList();
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
	
	
	

	function setSkillListTable(skillList) {
		$('#skillListTable').jsGrid({
		    //height: "500px",
		    width: "100%",

		    //autoload:true,
		    sorting: true,
		    paging: true,
		    //pageIndex: 1, default: 1
		    pageSize: 10, // default: 20
			//pageButtonCount: 5, default: 15
		    
		    data: skillList,

		    
		    fields: [
		    	{name: "title",title: "스킬명", type: "text", width: 40, align: "center"},
		    	{name: "function",title: "스킬아이디", type: "text", width: 70, align: "center"},
		
		    	
	    	],
	    	rowClick: function(args) {
	    	
	    		
	    		if(args.event.target.tagName == "BUTTON"){
	    			document.getElementById("qna_idx_reply").value = args.item.qna_idx;
					document.getElementById("ref_reply").value = args.item.qna_idx;
					
	    		}else if(args.event.target.cellIndex == 6){
	    			
	    		}else{
	    			
	    			/* increaseViewCount(args.item.qna_idx);
	    			$("#chk-error-question-mod").text('');
		    		$("#chk-error-content-mod").text('');
		    		
	    			var session_id = "${login.user_id}";
		    	
		    		document.getElementById("question_content").value = args.item.content;
					document.getElementById("detail_qustion").value = args.item.question;
					document.getElementById("detail_content").value = args.item.content;
					document.getElementById("detail_create_user").value = args.item.create_user;
					document.getElementById("update_qustion").value = args.item.question;
					document.getElementById("update_content").value = args.item.content;
					document.getElementById("update_create_user").value = args.item.create_user;
					document.getElementById("qna_idx_update").value = args.item.qna_idx;
					document.getElementById("qna_idx_detail").value = args.item.qna_idx;
					document.getElementById("parent_qna_idx_update").value = args.item.parent_qna_idx;
					document.getElementById("parent_qna_idx_detail").value = args.item.parent_qna_idx;
					
					if(args.item.create_user != session_id){
		    			$("#qnaDetailPositionBtn").trigger("click");
		    		}else{
		    			$("#qnaUpdatePositionBtn").trigger("click");
		    		} */
	    		}
			}
		});
	}
	

	function getQnaList() {
		var request = $.ajax({
			url: "/chatbot/getSkillList.do",
			method: "get"
		});
		
		request.done(function(data) {
			console.log(data);
			setSkillListTable(data);
		});
		
		request.fail(function(error) {
			console.log(error);
		});
	}
		
	$(function() {
		getQnaList();
	});
		
	$("#searchBtn").click(function() {
		getQnaList();
	});

	function enterKey() {
		if (window.event.keyCode === 13) {
			getQnaList();
		}
	}
		
	
	function valid_reg(data){	
		$("#chk-error-question-reg").text('');
		$("#chk-error-content-reg").text('');
	
		for(var i = 0; i < data.length; i++){
			var obj = data[i];
			
			for (var key in obj) {
				if(key=="question"){
					$("#chk-error-question-reg").text(obj[key]);
					
				}else if(key=="content"){
					$("#chk-error-content-reg").text(obj[key]);
				}
			
			}
		}
	}
	
	function valid_mod(data){	
		
		console.log("asdfasdf11");
		$("#chk-error-question-mod").text("");
		$("#chk-error-content-mod").text('');
	
		for(var i = 0; i < data.length; i++){
			var obj = data[i];
			
			for (var key in obj) {
				if(key=="question"){
					$("#chk-error-question-mod").text(obj[key]);
					
				}else if(key=="content"){
					$("#chk-error-content-mod").text(obj[key]);
				}
			
			}
		}
	}
	
	function increaseViewCount(qna_idx){
		var request = $.ajax({
			url: "/qna/increaseViewCount.do?qna_idx="+qna_idx,
			method: "get"
		});
		
		request.done(function(data) {
			getQnaList();
			console.log("success");
		});
		
		request.fail(function(error) {
			console.log(error);
		});
		
		
	}
</script>
	

