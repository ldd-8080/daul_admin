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
	    <h1 class="page-title">설문조사</h1>
	    <ol class="breadcrumb">
	      <li class="breadcrumb-item"><a href="../index.html">Home</a></li>
	      <li class="breadcrumb-item"><a href="javascript:void(0)">Survey</a></li>
	      <li class="breadcrumb-item active">SurveyList</li>
	    </ol>
	
	    <div class="page-content">
	    	<div class="panel">
		        <header class="panel-heading">
		          <div class="panel-actions"></div>
		          <h3 class="panel-title">Survey</h3>
		        </header>
		        <div class="panel-body">
		          <table class="table table-hover dataTable table-striped w-full" id="boardTable" data-plugin="dataTable">
		            <thead>
		              <tr>
		                <th>번호</th>
		                <th>작성자</th>
		                <th>제목</th>
		                <th>설문기간</th>
		                <th>등록일</th>
		              </tr>
		            </thead>
		            <tbody>
		            	<c:forEach var="result" items="${surveyList}" varStatus="status">
		            	<tr>
		            		<td id="seq_${status.index}">${result.survey_idx}</td>
		            		<td>${result.title}</td>
		            		<td>${result.content}</td>
		            		<td>${result.s_date}&nbsp;-&nbsp;${result.e_date}</td>
		            		<td>${result.create_date}</td>
	            		</tr>
		            	</c:forEach>
		            </tbody>
		          </table>
		           <div class="col-lg-12 mt-20">
		          	<button class="btn btn-primary btn-outline float-right waves-effect waves-classic" id="surveyRegistButton">등록</button>
		          </div>
		        </div>
			</div>
	</div>
<!-- End Page -->
</div>
<script type="text/javascript">
	$("#boardTable tr td").click(function(event) {
		if ($(this).get(0).cellIndex === 0) {
		} else {
			var board_seq = $(this).parent().children().eq(0).text();
			
			location.href = "${pageContext.request.contextPath}/board/boardDetail.do?board_seq=" + board_seq;
		}
	});


	$("#surveyRegistButton").click(function() {
		location.href = "${pageContext.request.contextPath}/survey/surveyRegistPage.do";
	});
	
</script>
