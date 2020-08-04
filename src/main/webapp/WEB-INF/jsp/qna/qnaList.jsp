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
	      <li class="breadcrumb-item"><a href="javascript:void(0)">게시판</a></li>
	      <li class="breadcrumb-item active">Q&A</li>
	    </ol>
	
	    <div class="page-content">
	    
	    <!-- 검색조건 -->
			<div class="panel">
				<div class="panel-body" style="padding-top: 20px; padding-bottom: 1px;">
					<form id="search-form">
						<div class="form-group row">
							<!-- 등록일 -->
							<label class="col-md-1 col-form-label"><strong>등록일 </strong></label>
							<div class="col-md-5">
								<div class="input-daterange" data-plugin="datepicker">
									<div class="input-group">
										<div class="input-group-prepend">
											<span class="input-group-text"> 
												<i class="icon md-calendar" aria-hidden="true"></i>
											</span>
										</div>
										<input type="text" class="form-control" name="search_s_date" />
									</div>
									<div class="input-group">
										<div class="input-group-prepend">
											<span class="input-group-text">-</span>
										</div>
										<input type="text" class="form-control" name="search_e_date" />
									</div>
								</div>
							</div>
							<!-- 검색어 -->
							<label class="col-md-1 col-form-label"><strong>검색어 </strong></label>
							<div class="col-md-5">
								<div class="input-group">
									<div class="input-group-prepend w-p25">
										<select data-plugin="selectpicker" name="search_type">
											<option value="" selected>선택</option>
											<option value="title">제목</option>
											<option value="content">내용</option>
											<option value="create_user">작성자</option>
										</select>
									</div>
									<!-- <input type="text" class="form-control"> -->
									<input type="text" class="form-control" name="search" placeholder="검색어를 입력하세요." onkeyup="enterKey()"> 
								</div>
							</div>
						</div>
						<div class="form-group row">
							<div class="col-lg-12">
								<button type="button" class="btn btn-primary btn-outline float-right waves-effect waves-classic" id="searchBtn">검색 </button>
							</div>
						</div>
					</form>
				</div>
			</div>
			
	    	<div class="panel">
		        <header class="panel-heading">
		          <div class="panel-actions"></div>
		        </header>
		        <br/>
		        <div class="panel-body">
		        	 <div id="qnaListTable"></div>
		        </div>
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
				location.href = "${pageContext.request.contextPath}/qna/qnaListPage.do";
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
				location.href = "${pageContext.request.contextPath}/qna/qnaListPage.do";
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
				location.href = "${pageContext.request.contextPath}/qna/qnaListPage.do";
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
	
	
	

	function setQnaListTable(qnaList) {
		$('#qnaListTable').jsGrid({
		    //height: "500px",
		    width: "100%",

		    //autoload:true,
		    sorting: true,
		    paging: true,
		    //pageIndex: 1, default: 1
		    pageSize: 10, // default: 20
			//pageButtonCount: 5, default: 15
		    
		    data: qnaList,

		    
		    fields: [
		    	{name: "qna_idx",title: "번호", type: "text", width: 70, align: "center"},
		    	{title: "제목", type: "text", width: 200,
		    		itemTemplate: function(_, item) {
		    			
		    			var result = "";
		    			if(item.parent_qna_idx != null){
		    				result +=  '<i class="md-long-arrow-right" aria-hidden="true"></i> ';
		    			}
		    			result += item.question;
			    		return result; 
			    		}	
		    	},
		    	{name: "create_user", title: "작성자", type: "text", width: 60},
		    	{name: "auth_type", title: "작성자유형", type: "text", width: 70, align: "center"}, 
		    	{name: "create_date", title: "등록일", type: "text", width: 70, align: "center"}, 
		    	{name: "view_count", title: "조회수", type: "text", width: 70, align: "center"},
		    	{title: "", width: 100, align: "center",
		    		itemTemplate: function(_, item) {
		    			var result="";
		    		
		    			if(item.parent_qna_idx == null){
		    				result += '&nbsp;<button type="button" class="btn-sm btn-primary btn-outline  waves-effect waves-classic" data-toggle="modal" data-target="#qnaPositionCenter" href="#">답변</button>';		    				
		    			}
		    			return result;
		    		}	
		    	}
	    	],
	    	rowClick: function(args) {
	    		console.log(args.event.target.tagName == "BUTTON");
	    		
	    		
	    		if(args.event.target.tagName == "BUTTON"){
						    			
	    		}else if(args.event.target.cellIndex == 6){
	    			
	    		}else{

	    			var session_id = "${login.user_id}";
		    	
		    		document.getElementById("question_content").value = args.item.content;
					document.getElementById("qna_idx_reply").value = args.item.qna_idx;
					document.getElementById("ref_reply").value = args.item.qna_idx;
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
		    		}
	    		}
			}
		});
	}
	

	function getQnaList() {
		var request = $.ajax({
			url: "/qna/getQnaList.do",
			method: "get"
		});
		
		request.done(function(data) {
			console.log(data);
			
			setQnaListTable(data);
		});
		
		request.fail(function(error) {
			console.log(error);
		});
	}
		
		$(function() {
			getQnaList();
		});
		
		
		
</script>
	

