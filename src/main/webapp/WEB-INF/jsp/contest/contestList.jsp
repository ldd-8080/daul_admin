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
				                <th>참여</th>
				                <th>공모기간</th>
				                <th>접수기간</th>
				                <th>등록일</th>
		                	</tr>
						</thead>	
						 <tbody>
						 	<c:forEach var="contest" items="${contestList}" varStatus="status">
		            			<tr>
		            				<td id="seq_${status.index}">${contest.contest_idx}</td>
		            				<td>${suggestion.create_user}</td>
		            				<td>${suggestion.title}</td>
		            				<td>0</td>
		            				<td>${suggestion.contest_s_date}-${suggestion.contest_e_date}</td>
		            				<td>${suggestion.submit_s_date}-${suggestion.submit_e_date}</td>
		            				<td>${suggestion.create_date}</td>
		            			</tr>
		            		</c:forEach>
						 </tbody>						 	        	
		        	</table>
		        	<div class="col-lg-12 mt-20">
		          		<button class="btn btn-primary btn-outline float-right waves-effect waves-classic" id="conotestRegistBtn">등록</button>
		          	</div>
		        </div>
	        </div>
        </div>
    </div>
</div>
<script type="text/javascript">
	$("#conotestRegistBtn").click(function() {
		location.href = "${pageContext.request.contextPath}/contest/contestRegistPage.do";
	});
</script>
