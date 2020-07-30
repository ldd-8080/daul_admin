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
			<li class="breadcrumb-item active">나눔공모</li>
		</ol>


		<div class="page-content">
			<div class="panel">
				<div class="panel-body">
				<form id = "search-form">
					<div class="form-group row">
						<label class="col-md-1 col-form-label">등록일 </label>		
							<div class="col-md-6 col-xl-4">
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
											<span calss="input-group-text"> &nbsp;_&nbsp;</span>
										</div>
										<input type="text" class="form-control" name="search_e_date" />
									</div>
								</div>
							</div>
						</div>
						<div class="form-group row">
						
						<div class="col-md-4">
							<select data-plugin="selectpicker" name = "search_type">
								<option value="" selected >선택하세요</option>
								<option value="title">제목</option>
								<option value="content">내용</option>
								<option value="create_user">작성자</option>
							</select>
						</div>
							<div class="col-md-6">
							<div class="form-group">
								<div class="input-group">
									<input type="text" class="form-control" name="search" placeholder="Search..."> <span class="input-group-append">
										<button type="button" class="btn btn-primary" id="searchBtn">
											<i class="icon md-search" aria-hidden="true"></i>
										</button>
									</span>
								</div>
							</div>
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

					<div id="contestListTable"></div>

					<div class="col-lg-12 mt-20">
						<button class="btn btn-primary btn-outline float-right waves-effect waves-classic"
							id="conotestRegistBtn">등록</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	function setContestListTable(ContestList) {
		$('#contestListTable')
				.jsGrid(
						{
							//height: "500px",
							width : "100%",

							//autoload:true,
							sorting : true,
							paging : true,
							//pageIndex: 1, default: 1
							pageSize : 10, // default: 20
							//pageButtonCount: 5, default: 15

							data : ContestList,

							fields : [ {
								name : "admin_contest_idx",
								title : "번호",
								type : "text",
								width : 70,
								align : "center"
							}, {
								name : "create_user",
								title : "작성자",
								type : "text",
								width : 60
							}, {
								name : "title",
								title : "제목",
								type : "text",
								width : 150
							}, {
								name : "content",
								title : "내용",
								type : "text",
								width : 200
							}, {
								name : "create_date",
								title : "등록일",
								type : "text",
								width : 100,
								align : "center"
							}],

							rowClick : function(args) {
								var idx = args.item.admin_contest_idx;

								location.href = "${pageContext.request.contextPath}/contest/contestDetail.do?admin_contest_idx="
										+ idx;
							}
						});
	}

	$("#contestRegistBtn").click(
					function() {
						location.href = "${pageContext.request.contextPath}/contest/contestRegistPage.do";
					});

	function getcontestList() {
		
		var search_s_date = $("input[name='search_s_date']").val();
		var search_e_date = $("input[name='search_e_date']").val();
		var search_type = $("select[name='search_type']").val();
		var search = $("input[name='search']").val();
		
		console.log('search param = '+search_s_date +',' + search_e_date+','  + search_type+','  + search);
		var request = $.ajax({
			url : "/contest/getContestList.do",
			method : "get",
			data: $("#search-form").serialize()
		});

		request.done(function(data) {
			console.log(data);
			setContestListTable(data);
		});

		request.fail(function(error) {
			console.log(error);
		});
	}

	$(function() {
		getcontestList();
	});
	$("#searchBtn").click(
			function() {
				getcontestList();
			});
			
</script>
