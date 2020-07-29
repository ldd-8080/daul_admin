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
	    	<div class="panel">
		        <header class="panel-heading">
		          <div class="panel-actions"></div>
		          <h3 class="panel-title">설문조사 목록</h3>
		        </header>
		        <br/>
		        <div class="panel-body">
		          <div id="surveyListTable"></div>
		          
		           <div class="col-lg-12 mt-20">
		          	<button class="btn btn-primary btn-outline float-right waves-effect waves-classic" id="surveyRegistButton">등록</button>
		          </div>
		        </div>
			</div>
		</div>
	</div>
</div>
<!-- End Page -->

<script type="text/javascript">
	var surveyList = new Array();
	
	<c:forEach var="survey" items="${surveyList}">
		var survey = {};
		survey.survey_idx		= "${survey.survey_idx}";
		survey.create_user		= "${survey.create_user}";
 		survey.title			= "${survey.title}";
		/* survey.content			= "${survey.content}".replace(/\r\n/g, ""); */
		survey.s_date			= "${survey.s_date}";
		survey.e_date			= "${survey.e_date}";
		survey.create_date		= "${survey.create_date}";
		surveyList.push(survey);
	</c:forEach>
	
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
	    	{name: "survey_idx",title: "번호", type: "text", width: 70, align: "center"},
	    	{name: "create_user", title: "작성자", type: "text", width: 60},
	    	{name: "title", title: "제목", type: "text", width: 150}, 
	    	{title: "설문기간", type: "text", width: 100, align: "center",
	    		itemTemplate: function(_, item) {
	    			return item.s_date + " ~ " + item.e_date;
	    		}
    		},
	    	{name: "create_date", title: "등록일", type: "text", width: 100, align: "center"}
    	],
    	
    	rowClick: function(args) {
    		var idx = args.item.survey_idx;
    		
    		location.href = "${pageContext.request.contextPath}/survey/surveyDetail.do?survey_idx=" + idx;
    	}
	});

	$("#surveyRegistButton").click(function() {
		location.href = "${pageContext.request.contextPath}/survey/surveyRegistPage.do";
	});
	
</script>
