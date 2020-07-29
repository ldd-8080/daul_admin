<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- Page -->
<div class="page">
	<div class="page-content container-fluid">
	    <!-- Page -->
	    <ol class="breadcrumb">
	      <li class="breadcrumb-item"><a href="../index.html">Home</a></li>
	      <li class="breadcrumb-item"><a href="javascript:void(0)">서비스</a></li>
	      <li class="breadcrumb-item active">열린제안</li>
	    </ol>
	
	    <div class="page-content">
	    	<div class="panel">
		        <header class="panel-heading">
		          <div class="panel-actions"></div>
		          <h3 class="panel-title">열린제안 목록</h3>
		        </header>
		        <br/>
		        <div class="panel-body">
		          <div id="sgstListTable"></div>
		          
		          <div class="col-lg-12 mt-20">
		          	<button class="btn btn-primary btn-outline float-right waves-effect waves-classic" id="suggestionRegistBtn">등록</button>
		          </div>
		        </div>
			</div>
		</div>
<!-- End Page -->
	</div>
</div>
<script type="text/javascript">
	function setSgstListTable(sgstList) {
		$('#sgstListTable').jsGrid({
		    //height: "500px",
		    width: "100%",
	
		    //autoload:true,
		    sorting: true,
		    paging: true,
		    //pageIndex: 1, default: 1
		    pageSize: 10, // default: 20
			//pageButtonCount: 5, default: 15
		    
		    data: sgstList,
	
		    fields: [
		    	{name: "suggestion_idx",title: "번호", type: "text", width: 70, align: "center"},
		    	{name: "create_user", title: "작성자", type: "text", width: 60},
		    	{name: "title", title: "제목", type: "text", width: 150}, 
		    	{name: "content", title: "내용", type: "text", width: 200}, 
		    	{name: "like_count", title: "공감", type: "text", width: 30, align: "center"}, 
		    	{name: "pro_cnt", title: "전문가 댓글", type: "text", width: 50, align: "center"}, 
		    	{name: "public_cnt", title: "일반 댓글", type: "text", width: 50, align: "center"}, 
		    	{name: "create_date", title: "등록일", type: "text", width: 100, align: "center"},
		    	{title: "상태", type: "text", width: 40}
	    	],
	    	
	    	rowClick: function(args) {
	    		var idx = args.item.suggestion_idx;
	    		
	    		location.href = "${pageContext.request.contextPath}/suggestion/suggestionDetailPage.do?suggestion_idx=" + idx;
	    	}
		});
	}

	$("#suggestionRegistBtn").click(function() {
		location.href = "${pageContext.request.contextPath}/suggestion/suggestionRegistPage.do";
	});
	
	function getSuggestionList() {
		var request = $.ajax({
			url: "/suggestion/getSuggestionList.do",
			method: "get"
		});
		
		request.done(function(data) {
			console.log(data);
			
			setSgstListTable(data);
		});
		
		request.fail(function(error) {
			console.log(error);
		});
	}
	
	$(function() {
		getSuggestionList();
	});
</script>
