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
	    <!-- 검색조건 -->
			<div class="panel">
				<div class="panel-body">
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
							<label class="col-md-1 form-control-label"><strong>검색어 </strong></label>
							<div class="col-md-5">
								<div class="input-group">
									<div class="input-group-prepend w-p25">
										<select data-plugin="selectpicker" name="search_type">
											<option value="" selected>선택하세요</option>
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
		          
					<h3 class="panel-title"></h3>
		        </header>
		        <div class="panel-body">
		       
					
		        <div id="userListTable"></div>
		        
		        
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
	
	
	$("#publicUserCreate").click(function() {
		location.href = "${pageContext.request.contextPath}/user/userRegistPage.do?auth_type=public";
	});

	
	function setUserListTable(ContestList) {
		$('#userListTable').jsGrid({
			
			//height: "500px",
			width : "100%",

			//autoload:true,
			sorting : true,
			paging : true,
			//pageIndex: 1, default: 1
			pageSize : 10, // default: 20
			//pageButtonCount: 5, default: 15

			data : ContestList,

			fields : [ 
				{name : "user_idx", title : "번호", type : "text", width : 50, align : "center"}, 
				{name : "user_id", title : "아이디", type : "text", width : 70}, 
				{name : "channel", title : "계정", type : "text", width : 100}, 
				{name : "auth_type", title : "유형", type : "text", width : 70}, 
				{name : "name", title : "이름", type : "text", width : 100, align : "center"}, 
				{name : "email", title : "이메일", type : "text", width : 100, align : "center"}, 
				{name : "phone", title : "전화번호", type : "text", width : 100, align : "center"}, 
				{name : "last_login_date", title : "최종로그인", type : "text", width : 100, align : "center"}, 
				{name : "reg_date", title :"회원가입", type : "text", width : 100, align : "center"}
			],

			rowClick : function(args) {
				var idx = args.item.user_idx;

				location.href = "${pageContext.request.contextPath}/contest/contestDetail.do?admin_contest_idx=" + idx;
			}
		});
	}


	function getUserList() {
		var request = $.ajax({
			url : "/user/getUserList.do?auth_type='public'",
			method : "get",
			data: $("#search-form").serialize()
		});

		request.done(function(data) {
			console.log(data);
			setUserListTable(data);
		});

		request.fail(function(error) {
			console.log(error);
		});
	}

	$(function() {
		getUserList();
	});
	
	
</script>
