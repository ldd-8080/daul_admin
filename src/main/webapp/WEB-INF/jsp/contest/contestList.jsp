<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- Page -->
<div class="page">
	<div class="page-content container-fluid">
		<!-- Page -->
		<ol class="breadcrumb">
			<li class="breadcrumb-item">
				<a href="/main/main.do">Home</a>
			</li>
			<li class="breadcrumb-item">서비스</li>
			<li class="breadcrumb-item active">나눔공모</li>
		</ol>

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
							<button type="button" class="btn btn-primary btn-outline float-right waves-effect waves-classic" id="searchBtn">검색</button>
						</div>
					</div>
				</form>
			</div>
		</div>

		<!-- 목록 테이블 -->
		<div class="panel">
			<header class="panel-heading">
				<div class="panel-actions"></div>
			</header>
			<br />
			<div class="panel-body" style="padding-top: 20px; padding-bottom: 1px;">
				<div id="contestListTable" class="text-break"></div>
			</div>
			<div class="col-md-12">
				<div class="example example-buttons">
					<div>
						<button class="btn btn-primary btn-outline float-right waves-effect waves-classic" id="contestRegistBtn">등록</button>
					</div>
				</div>
			</div>
		</div>

	</div>
</div>
<script type="text/javascript">
	function setContestListTable(ContestList) {
		$('#contestListTable').jsGrid(
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

					fields : [
							{ name : "num", title : "번호", type : "text", width : 30, align : "center" },
							{ name : "create_user", title : "작성자", type : "text", width : 60 },
							{ title : "제목", type : "text", width : 150, itemTemplate : function(_, item) {
								var result = "";
								console.log("length = " + item.title.length);
								if (item.title.length > 30) {
									result = item.title.substring(0, 30) + '...';
								} else {
									result = item.title;
								}
								return result;
							} }, { title : "공모기간", type : "text", width : 90, align : "center", itemTemplate : function(_, item) {
								return item.contest_s_date + " ~<br/>" + item.contest_e_date;
							} }, { title : "접수기간", type : "text", width : 90, align : "center", itemTemplate : function(_, item) {
								return item.submit_s_date + " ~<br/>" + item.submit_e_date;
							} }, { name : "create_date", title : "등록일", type : "text", width : 90, align : "center" }
					],

					rowClick : function(args) {
						var idx = args.item.admin_contest_idx;

						location.href = "${pageContext.request.contextPath}/contest/contestDetail.do?admin_contest_idx=" + idx;
					} });
	}

	$("#contestRegistBtn").click(function() {
		location.href = "${pageContext.request.contextPath}/contest/contestRegistPage.do";
	});

	function getcontestList() {
		var request = $.ajax({ url : "/contest/getContestList.do", method : "get", data : $("#search-form").serialize() });

		request.done(function(data) {

			setContestListTable(data);
		});

		request.fail(function(error) {
			console.log(error);
		});
	}

	$(function() {

		$("input[name='search_s_date']").val(lastMonth(3));
		$("input[name='search_e_date']").val(today());
		getcontestList();
	});

	$("#searchBtn").click(function() {
		getcontestList();
	});

	function enterKey() {
		if (window.event.keyCode === 13) {
			getcontestList();
		}
	}
</script>
