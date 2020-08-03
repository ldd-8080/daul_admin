<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
    
<script type="text/javascript">
/* $(document).ready(function() {
	$("#userTable").DataTable();
}); */
</script>
    
<!-- Page -->
<div class="page">
	<div class="page-content container-fluid">
	    <!-- Page -->
	    <ol class="breadcrumb">
	      <li class="breadcrumb-item"><a href="../index.html">Home</a></li>
	      <li class="breadcrumb-item"><a href="javascript:void(0)">게시판</a></li>
	      <li class="breadcrumb-item active">공지사항</li>
	    </ol>
	
	    <div class="page-content">
	    	<div class="panel">
		        <header class="panel-heading">
		          <div class="panel-actions"></div>
		          <h3 class="panel-title"></h3>
		        </header>
		        <div class="panel-body">
		          <div id="boardListTable"></div>
		          <div class="col-lg-12 mt-20">
		          	<button class="btn btn-primary btn-outline float-right waves-effect waves-classic" id="noticeRegistButton">등록</button>
		          </div>
		        </div>
		   	</div>
	    </div>
	</div>
<!-- End Page -->
</div>
<script type="text/javascript">
function setBoardListTable(BoardList) {
	$('#boardListTable').jsGrid({
	    //height: "500px",
	    width: "100%",

	    //autoload:true,
	    sorting: true,
	    paging: true,
	    //pageIndex: 1, default: 1
	    pageSize: 10, // default: 20
		//pageButtonCount: 5, default: 15
	    
	    data: BoardList,

	    fields: [
	    	{name: "notice_idx",title: "번호", type: "text", width: 70, align: "center"},
	    	{name: "create_user", title: "작성자", type: "text", width: 60},
	    	{name: "title", title: "제목", type: "text", width: 150}, 
	    	{name: "content", title: "내용", type: "text", width: 200}, 
	    	{name: "create_date", title: "등록일", type: "text", width: 100, align: "center"}
    	],
    	
    	rowClick: function(args) {
    		var idx = args.item.notice_idx;
    		
    		location.href = "${pageContext.request.contextPath}/board/boardDetail.do?notice_idx=" + idx;
    	}
	});
}
	
	$("#noticeRegistButton").click(function() {
		location.href = "${pageContext.request.contextPath}/board/boardWrite.do";
	});
	
	function getBoardList() {
		var request = $.ajax({
			url: "/board/getBoardList.do",
			method: "get"
		});
		
		request.done(function(data) {
			console.log(data);
			
			setBoardListTable(data);
		});
		
		request.fail(function(error) {
			console.log(error);
		});
	}
	
	$(function() {
		getBoardList();
	});
</script>
