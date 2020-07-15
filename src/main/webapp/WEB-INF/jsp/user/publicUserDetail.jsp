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
	      <li class="breadcrumb-item">일반회원</li>
	      <li class="breadcrumb-item active">회원상세</li>
	    </ol>
	
	    <div class="page-content">
	    	<div class="row">
	    		<div class="col-lg-4">
	    			<div class="mb-30">
    					<div class="panel">
    						<div class="panel-body text-center">
    							<img class="rounded-circle mb-10" width="150" height="150" src="${pageContext.request.contextPath}/images/placeholder.png" alt="...">
    							<p class="form-control-plaintext"><b>회원가입일 : </b>YYYY-MM-DD</p>
    							<p class="form-control-plaintext"><b>최종로그인 : </b>YYYY-MM-DD</p>
    						</div>
    					</div>
    					<div class="panel panel-bordered">
    						<div class="panel-heading">
    							<h3 class="panel-title">활동현황</h3>
    						</div>
    						<div class="panel-body">
    							<div class="input-group">
    								<div class="input-group-append">
    									<span class="input-group-text">열린제안</span>
    								</div>
    								<input type="text" class="form-control"/>
    							</div>
    						</div>
    					</div>
    					<div class="panel panel-bordered">
    						<div class="panel-heading">
    							<h3 class="panel-title">수신여부</h3>
    						</div>
    						<div class="panel-body">
    						</div>
    					</div>
	    			</div>
	    		</div>
	    		<div class="col-lg-8">
	    			<div class="mb-30">
	    				<div class="panel">
	    					<div class="panel-body">
	    					</div>
	    				</div>
	    			</div>
	    		</div>
	    	</div>
		</div>
	</div>
<!-- End Page -->
</div>
<script type="text/javascript">

</script>
