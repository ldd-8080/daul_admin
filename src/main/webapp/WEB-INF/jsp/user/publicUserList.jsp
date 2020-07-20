<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
    
<!-- Page -->
<div class="page">
	<div class="page-content container-fluid">
	    <!-- Page -->
	    <!-- <h1 class="page-title">사용자 목록</h1> -->
	    <ol class="breadcrumb">
	      <li class="breadcrumb-item"><a href="/main/main.do">Home</a></li>
	      <li class="breadcrumb-item">사용자</li>
	      <li class="breadcrumb-item active">일반회원</li>
	    </ol>
	
	    <div class="page-content">
	    	<div class="panel">
		        <header class="panel-heading">
		          <div class="panel-actions"></div>
		          <h3 class="panel-title">일반회원 목록</h3>
		        </header>
		        <div class="panel-body">
		          <table class="table table-hover dataTable table-striped w-full" id="userTable" data-plugin="dataTable">
		            <thead>
		              <tr>
		                <th>No</th>
		                <th>아이디</th>
		                <th>계정</th>
		                <th>유형</th>
		                <th>이름</th>
		                <th>이메일</th>
		                <th>전화번호</th>
		                <th>최종로그인</th>
		                <th>회원가입일</th>
		              </tr>
		            </thead>
		            <tbody>
		            	<c:forEach var="user" items="${userList}" varStatus="status">
		            	<tr>
		            		<td id="seq_${status.index}">${status.count}</td>
		            		<td>${user.user_id}</td>
		            		<td>${user.channel}</td>
		            		<td>${user.auth_type}</td>
		            		<td>${user.name}</td>
		            		<td>${user.email}</td>
		            		<td>${user.phone}</td>
		            		<td>${user.last_login_date}</td>
		            		<td>${user.reg_date}</td>
	            		</tr>
		            	</c:forEach>
		            </tbody>
		          </table>
		          <div class="col-lg-12 mt-20">
		          	<button class="btn btn-primary btn-outline float-right waves-effect waves-classic" id="publicUserCreate">등록</button>
		          </div>
		        </div>
	    	</div>
		</div>
	</div>
<!-- End Page -->
</div>
<script type="text/javascript">
	$("#userTable tr td").click(function(event) {
		if ($(this).get(0).cellIndex === 0) {
		} else {
			var id = $(this).parent().children().eq(1).text();
			
			location.href = "${pageContext.request.contextPath}/user/userDetailPage.do?id=" + id;
		}
	});
	
	$("#publicUserCreate").click(function() {
		location.href = "${pageContext.request.contextPath}/user/userRegistPage.do?auth_type=public";
	});

</script>
