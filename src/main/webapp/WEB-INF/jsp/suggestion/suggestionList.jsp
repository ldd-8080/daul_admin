<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
    
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
		        <div class="panel-body">
		          <table class="table table-hover dataTable table-striped w-full" id="boardTable" data-plugin="dataTable">
		            <thead>
		              <tr>
		                <th>번호</th>
		                <th>작성자</th>
		                <th>제목</th>
		                <th>내용</th>
		                <th>공감</th>
		                <th>전문가 댓글</th>
		                <th>일반 댓글</th>
		                <th>등록일</th>
		                <th>상태</th>
		              </tr>
		            </thead>
		            <tbody>
		            	<c:forEach var="suggestion" items="${suggestionList}" varStatus="status">
		            	<tr>
		            		<td id="seq_${status.index}">${suggestion.suggestion_idx}</td>
		            		<td>${suggestion.create_user}</td>
		            		<td>${suggestion.title}</td>
		            		<td>${suggestion.content}</td>
		            		<td>${suggestion.like_count}</td>
		            		<td>전댓</td>
		            		<td>일댓</td>
		            		<td>${suggestion.create_date}</td>
		            		<td>상태</td>
	            		</tr>
		            	</c:forEach>
		            </tbody>
		          </table>
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
	$("#boardTable tr td").click(function(event) {
		if ($(this).get(0).cellIndex === 0) {
		} else {
			var idx = $(this).parent().children().eq(0).text();
			
			location.href = "${pageContext.request.contextPath}/suggestion/suggestionDetailPage.do?suggestion_idx=" + idx;
		}
	});

	$("#suggestionRegistBtn").click(function() {
		location.href = "${pageContext.request.contextPath}/suggestion/suggestionRegistPage.do";
	});
	
</script>
