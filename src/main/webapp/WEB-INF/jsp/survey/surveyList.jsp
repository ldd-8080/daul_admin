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
	      <li class="breadcrumb-item active">설문조사</li>
	    </ol>
	
	    <div class="page-content">
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
								<button type="button" class="btn btn-primary btn-outline float-right waves-effect waves-classic" id="searchBtn">검색 </button>
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
	        	<br/>
	       		<div class="panel-body" style="padding-top: 20px; padding-bottom: 1px;">
	        		<div id="surveyListTable" class="text-break"></div>
	        	</div>
	        		<div class="col-md-12">
	        			<div class="example example-buttons">  
	        				<div>
	        					<button class="btn btn-primary btn-outline float-right waves-effect waves-classic" id="surveyRegistButton">등록</button>
	        				</div>
	        			</div>
	        		</div>
	        	</div>
			</div>
		</div>
	</div>

<!-- End Page -->
<script type="text/javascript">
	function setSurveyListTable(surveyList) {
		$('#surveyListTable').jsGrid({
		    //height: "500px",
		    width: "100%",
	
		    //autoload:true,
		    sorting: true,
		    paging: true,
		    //pageIndex: 1, default: 1
		    pageSize: 10, // default: 20
			//pageButtonCount: 5, default: 15
		    
		    data: surveyList,
	
		    fields: [
		    	{name: "num",title: "번호", type: "text", width: 30, align: "center"},
		    	{name: "create_user", title: "작성자", type: "text", width: 40},
		    	{name: "title", title: "제목", type: "text", width: 160,	    		
					itemTemplate: function(_, item) {
		    			var result="";
			    		console.log("length = " + item.title.length);
		    			if(item.title.length > 30){
		    				result = item.title.substring(0,30)+'...';		    				
		    			}else{
		    				result = item.title;
		    			}
		    			return result;
		    		}
		    	}, 
		    	{name: "participation_count", title: "참여", type: "text", width: 30, align: "center"},
		    	{name: "opinion_count", title: "댓글", type: "text", width: 30, align: "center"},
		    	{title: "설문기간", type: "text", width: 90, align: "center",
		    		itemTemplate: function(_, item) {
		    			return item.s_date + " ~<br/>" + item.e_date;
		    		}
	    		},
		    	{name: "create_date", title: "등록일", type: "text", width: 70, align: "center"}
	    	],
	    	
	    	rowClick: function(args) {
	    		var idx = args.item.survey_idx;
	    		
	    		location.href = "${pageContext.request.contextPath}/survey/surveyDetail.do?survey_idx=" + idx;
	    	}
		});
	}

	$("#surveyRegistButton").click(function() {
		location.href = "${pageContext.request.contextPath}/survey/surveyRegistPage.do";
	});
	
	function getSurveyList() {
		var request = $.ajax({
			url: "/survey/getSurveyList.do",
			method: "get",
			data: $("#search-form").serialize()
		});
		
		request.done(function(data) {
			console.log(data);
			setSurveyListTable(data);
		});
		
		request.fail(function(error) {
			console.log(error);
		});
	}
	
	$(function() {
		getSurveyList();
	});
	
	$("#searchBtn").click(function() {
		getSurveyList();
	});
	
	function enterKey() {
		if (window.event.keyCode === 13) {
			getSurveyList();
		}
	}
	
</script>
