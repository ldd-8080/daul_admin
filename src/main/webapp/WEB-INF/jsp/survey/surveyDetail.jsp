<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    
<!-- Page -->
<div class="page">
	<div class="page-content container-fluid">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="/main/main.do">Home</a></li>
			<li class="breadcrumb-item">서비스</li>
			<li class="breadcrumb-item">설문조사</li>
			<li class="breadcrumb-item active">설문조사 상세</li>
		</ol>
		<div class="panel">
			<div class="panel-body container-fluid">
				<div class="example-wrap">
					<div class="nav-tabs-horizontal" data-plugin="tabs">
						<ul class="nav nav-tabs" role="tablist">
							<li class="nav-item" role="presentation"><a class="nav-link active" data-toggle="tab" href="#exampleTabsOne" aria-controls="exampleTabsOne" role="tab">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;설&nbsp;&nbsp;문&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
							<li class="nav-item" role="presentation"><a class="nav-link" data-toggle="tab" href="#exampleTabsTwo" aria-controls="exampleTabsTwo" role="tab">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;결&nbsp;&nbsp;과&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
							<li class="nav-item" role="presentation"><a class="nav-link" data-toggle="tab" href="#exampleTabsThree" aria-controls="exampleTabsThree" role="tab">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;댓글&nbsp;(${surveyOpinionListSize})&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
						</ul>
						<div class="tab-content pt-20">
							<div class="tab-pane active" id="exampleTabsOne" role="tabpanel">
								<div class="col-lg-12">
									<div class="mb-30">
										<div class="panel">
											<div class="panel-body">
												<form:form method="post" modelAttribute="surveyVo" enctype="multipart/form-data">
													<form:input type="hidden" path="survey_idx" />
													<div class="form-group row">
														<div class="col-md-1"></div>
														<label class="col-md-2 col-form-label">작성자 </label>
														<div class="col-md-8">
															<form:input type="text" readonly="true" class="form-control" path="create_user" value="${login.user_id}" />
															<form:errors path="create_user" />
														</div>
													</div>
													<div class="form-group row">
														<div class="col-md-1"></div>
														<label class="col-md-2 col-form-label">제목 </label>
														<div class="col-md-8">
															<form:input type="text" class="form-control" path="title" />
															<form:errors style="color:red;" path="title" />
														</div>
													</div>
													<div class="form-group row">
														<div class="col-md-1"></div>
														<label class="col-md-2 col-form-label">설명 </label>
														<div class="col-md-8">
															<form:textarea type="text" class="form-control" path="content" rows="5" />
															<form:errors style="color:red;" path="content" />
														</div>
													</div>
													<%-- <div class="form-group row">
														<div class="col-md-1"></div>
														<label class="col-md-2 col-form-label">대표이미지 </label>
														<div class="col-md-8">
							                    			<input type="file" id="repFile" name="repFile" data-plugin="dropify" data-default-file="${pageContext.request.contextPath}/img/placeholder.png"/>
							                  			</div>
													</div> --%>
													<div class="form-group row">
														<div class="col-md-1"></div>
														<label class="col-md-2 col-form-label">설문기간 </label>
														<div class="col-md-6 col-xl-5">
															<div class="input-daterange" data-plugin="datepicker">
																<div class="input-group">
																	<div class="input-group-prepend">
																		<span class="input-group-text">
																			<i class="icon md-calendar" aria-hidden="true"></i>
																		</span>
																	</div>
																	<form:input type="text" class="form-control" name="s_date" id="s_date" path="s_date" />
																	<form:errors style="color:red;" path="s_date" />
																</div>
																<div class="input-group">
																	<div class="input-group-prepend">
																		<span class="input-group-text"> &nbsp;-&nbsp;</span>
																	</div>
																	<form:input type="text" class="form-control" name="e_date" path="e_date" />
																</div>
															</div>
														</div>
													</div>

													<hr />

													<div id="survey-list">
													</div>

													<br />
													<br />

													<div class="col-md-12 text-right">
														<button type="submit" class="btn btn-primary waves-effect waves-classic" id="updateSurvey" data-title="설문조사" formaction="/survey/updateSurvey.do">수정</button>
														<button type="button" class="btn btn-default btn-outline waves-effect waves-classic" id="userList">목록</button>
													</div>
												</form:form>
												
												<!-- Output - Button Group -->
												<div class="mt-30 mb-30 ml-50">
													<p class="mb-5 font-size-16 font-weight-400 " style="color: #616161;">+ 설문추가</p>
													<div class="btn-group mt-5">
														<div class="btn-group" role="group">
															<button type="button" class="btn w-80 px-0" id="add_survey_list_btn">
																<i class="icon md-comment-more font-size-20" aria-hidden="true"></i>
																<br>
																<span class="text-uppercase hidden-sm-down">설문추가</span>
															</button>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>

							<!--두번째탭 -->
							<div class="tab-pane" id="exampleTabsTwo" role="tabpanel">
								<div class="row row-lg">
									<div class="col-md-12">
										<h4>◦ 투표결과</h4>
										<div class="example-wrap w-p100 pl-20" id="surveyResultDiv"></div>
									</div>

									<div class="col-md-12">
										<h4>
											◦ 참여자
											<span class="small" id="total_user_count">  총 0명</span>
										</h4>
										<div id="surveyParticipationListTable" class="text-break"></div>
									</div>
								</div>
							</div>
							<!--세번째탭 -->
							<div class="tab-pane" id="exampleTabsThree" role="tabpanel">
								<%@ include file="./surveyOpinion.jsp"%>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/surveyQuestion.js"></script>
<script type="text/javascript">
	getSurveyOpinionList();
	
	$(window).on("load", function() {
		var _repFileTarget = $("div[class='dropify-preview']");
		_repFileTarget.find("span[class='dropify-render']").append("<img src='/survey/getImg.do?survey_idx=${surveyVo.survey_idx}'>");
		_repFileTarget.attr("style", "display:block");
	});
	
	//파일정보 가져오기
	var ResultList = new Array();
	
	<c:forEach var="result" items="${surveyResult}">
		var result = {};
		result.question_idx			= 	"${result.question_idx}";
		result.survey_idx			= 	"${result.survey_idx}";
		result.ref 					=	"${result.ref}";
		result.question_content 	= 	"${result.question_content}";
		result.total_question_count	= 	"${result.total_question_count}";
		result.question_count 		= 	"${result.question_count}";
		result.question_per 		= 	"${result.question_per}";
		result.type 				=	"${result.type}";
		ResultList.push(result);
	</c:forEach>

	var survey_result_div = document.getElementById("surveyResultDiv");
	
	for (var i = 0; i < ResultList.length; i++) {
		var data = ResultList[i];
		
		var html;
		
		if (data.ref === data.question_idx) {
			var div = document.createElement("div");
			div.classList.add("p-10");
			div.id = data.ref;
			
			html =
				'<h6 class="font-size-16">' + data.question_content + ' (총 ' + data.total_question_count + '표)</h6>' +
				'<div class="mb-20"></div>' +
				'<div class="ml-30 w-p50" name="child_question_list"></div>';
			
			div.innerHTML = html;
			
			survey_result_div.append(div);
		} else {
			html = 
				'<h6 class="font-size-16">' + data.question_content + ' (' + data.question_count + '표)</h6>' +
				'<div class="progress" data-labeltype="percentage" data-goal="-40" data-plugin="progress">' +
					'<div class="progress-bar" aria-valuemin="0" aria-valuemax="-100" aria-valuenow="-' + data.question_per + '" role="progressbar">' +
						'<span class="progress-label"></span>' +
					'</div>' +
				'</div>';
			
			var parent_div = document.getElementById(data.ref).querySelector("div[name='child_question_list']");
			parent_div.innerHTML += html;
		}
	}
	
	$("#surveyOpnRegBtn").click(function() {
		$("#opinion_idx").val("");
		$("#opinion_content_textarea").val("");
	});
	
	$("#surveyOpinionRegistBtn").click(function() {
		if (!submitConfirm($(this))) return false;
		
		var request = $.ajax({
			url: "/survey/surveyOpinionRegist.do",
			method: "post",
			data: $("#surveyOpnRegForm").serialize()
		});
		
		request.done(function(data) {
			if (data === "success"){
				$("button[class='close']").click();
				
				getSurveyOpinionList();
			}else{
				$("#chk-error-regist").text(data);
			}
		});
		
		request.fail(function(error) {
			console.log("request fail", error)
		});
	});
	
	$("button[name='opnToOpnModal']").click(function() {
		//var opinion_idx = $(this).parent().parent().find("td[id^='seq_']").text();
		var opinion_idx = $(this).parent().parent().children().eq(0).text();
		console.log("opnToOpnModal click", opinion_idx);
		$("#opinion_idx").val(opinion_idx);
	});
	
	$("button[name='surveySubmitBtn']").click(function() {
		if (!submitConfirm($(this))) return false;
	});
	
	//설문조사 참여자 리스트
	function setSurveyParticipationListTable(ParticipationList) {
		document.getElementById("total_user_count").innerHTML = "  총 " + ParticipationList.length + "명";
		
		$('#surveyParticipationListTable').jsGrid({
			
			//height: "500px",
			width : "100%",

			//autoload:true,
			sorting : true,
			paging : true,
			//pageIndex: 1, default: 1
			pageSize : 10, // default: 20
			//pageButtonCount: 5, default: 15

			data : ParticipationList,

			fields : [ 
				{name : "participation_user", title : "아이디", type : "text", width : 70, align : "center"}, 
				{name : "name", title : "이름", type : "text", width : 70}, 
				{name : "email", title : "이메일", type : "text", width : 120}, 
				{name : "phone", title : "전화번호", type : "text", width : 120, align : "center"}, 
				{name : "create_date", title : "참여일", type : "text", width : 100, align : "center"}, 
				{name : "choose", title :"선택", type : "text", width : 40, align : "center"}
			],

			rowClick : function(args) {
			}
		});
	}


	function getUserList() {
		var survey_idx = $("#survey_idx").val();
		var request = $.ajax({
			url : "/survey/getParticipationList.do?survey_idx="+survey_idx,
			method : "get"
		});

		request.done(function(data) {
			console.log(data);
			setSurveyParticipationListTable(data);
		});

		request.fail(function(error) {
			console.log(error);
		});
	}

	$(function() {
		getUserList();
	});
	
	function getSurveyOpinionList() {
		var idx = $("#survey_idx").val();
		var request = $.ajax({
			url: "/survey/getSurveyOpinionList.do?survey_idx="+idx,
			method: "get"
		});
		
		request.done(function(data) {
			setSurveyOpinionListTable(data);
		});
		
		request.fail(function(error) {
			console.log(error);
		});
	}
	
	function setSurveyOpinionListTable(surveyOpnList) {
		$('#surveyOpnListTable').jsGrid({
		    //height: "500px",
		    width: "100%",

		    //autoload:true,
		    sorting: true,
		    paging: true,
		    //pageIndex: 1, default: 1
		    pageSize: 9, // default: 20
			//pageButtonCount: 5, default: 15
		    
		    data: surveyOpnList,

		    fields: [
		    	{name: "num", title: "번호", type: "text", width: 30, align: "center"}, 
		    	{name: "opinion_idx", title: "번호", type: "text", width: 80, align: "center", css: "non-display"}, 
		    	{title: "내용", type: "text", width: 250, 
		    		itemTemplate: function(_, item) {
						var result = "";
		    			
		    			if (item.del_chk === 'Y') {
		    				result = "삭제된 댓글입니다.";
		    			} else {
		    				if (item.survey_indent !== "0") {
		    					for (var i = 0; i < item.survey_indent; i++) {
		    						result += '<i class="md-long-arrow-right" aria-hidden="true"></i> ';
		    					}
		    					
		    					if(item.opinion_content.length > 30){
				    				result += item.opinion_content.substring(0,30)+'...';		    				
				    			}else{
				    				result += item.opinion_content;
				    			}
		    				} else {
		    					if(item.opinion_content.length > 30){
				    				result += item.opinion_content.substring(0,30)+'...';		    				
				    			}else{
				    				result += item.opinion_content;
				    			}
		    				}
		    			}
		    				
		    			return result;
		    		}
	    		}, 
		    	{name: "create_user", title: "작성자", type: "text", width: 70}, 
		    	{name: "auth_type", title: "작성자 유형", type: "text", width: 70}, 
		    	/* {name: "like_count", title: "공감", type: "text", width: 30}, */ 
		    	{name: "create_date", title: "등록일", type: "text", width: 100, align: "center"}, 
		    	{title: "", width: 80, align: "center", 
		    		itemTemplate: function(_, item) {
		    			if (item.del_chk !== 'Y' && item.survey_indent == 0) {
			    			return '<button class="btn-xs btn-primary btn-outline waves-effect waves-classic" type="button" data-toggle="modal" data-target="#surveyOpnRegModal" name="opnToOpnModal" onclick="opnToOpnRegistBtn(this)">댓글 등록 </button>';
		    			}
		    		}
	    		}
	    	],
	    	
	    	rowClick: function(args) {
	    		if (args.item.del_chk !== 'Y' && args.event.target.cellIndex !== 6 && args.event.target.name !== 'opnToOpnModal') {
	    			
	    			$("#chk-error-modify").text('');
	    			
	    			
		    		$("#surveyOpnDetailBtn").trigger("click");
					
					$("#detailCreateUser").val(args.item.create_user);
					$("#detailAuthType").val(args.item.auth_type);
					$("#detailOpinionContent").val(args.item.opinion_content);
					$("#detailOpinionIdx").val(args.item.opinion_idx);
	    		}
	    	}
		});
	}
	
	function opnToOpnRegistBtn(_this) {
		var opinion_idx = $(_this).parent().siblings(".non-display").text();
		
		$("#opinion_idx").val(opinion_idx);
		$("#opinion_content_textarea").val("");
		$("#chk-error-regist").text('');
	}
	
	function surveyOpnUpdate(type, _this) {
		if (!submitConfirm($(_this))) return false;
		
		var URL = "";
		
		if (type === 'mod') URL = "/survey/surveyOpinionModify.do";
		else 				URL = "/survey/surveyOpinionDelete.do";
		
		var request = $.ajax({
			url: URL,
			method: "post",
			data: $("#surveyOpnDetailForm").serialize()
		});
		
		request.done(function(data) {
			if (data === "success"){
				$("button[class='close']").click();
				
				getSurveyOpinionList();
			}else{
				$("#chk-error-modify").text(data);
			}
		});
	}
	
	$("#updateSurvey").click(function() {
		if ($("#survey-list").children("div").length < 1) {
			alert("설문 목록을 1개 이상 추가해 주세요.");
			return false;
		} else {
			var survey_list_arr = $("#survey-list").children("div");
			
			for (var i = 0; i <survey_list_arr.length; i++) {
				var survey_list = survey_list_arr[i];
				var q_list = $("#" + survey_list.id + "_q_list");
				
				if (q_list.children().length < 2) {
					alert("설문 항목을 2개 이상 추가해 주세요.");
					return false;
				}
			}
		}
		
		if (!submitConfirm($(this))) return false;
	});
	
	var globalIdx = 0;
	
	var add_survey_list_btn = document.getElementById("add_survey_list_btn");
	
	add_survey_list_btn.addEventListener("click", function() {
		addSurveyListHtml();
	});
	
	getSurveyQuestionList();
	
	function getSurveyQuestionList() {
		var request = $.ajax({
			url: "/survey/getSurveyQuestionList.do?survey_idx=${surveyVo.survey_idx}",
			method: "get"
		});
		
		request.done(function(data) {
			for (var i = 0; i < data.length; i++) {
				add_survey_list_btn.click();
				
				var question = data[i];
				
				var survey_div = document.getElementById("survey_" + i);
				
				survey_div.querySelector("select").value = question.select_type;
				survey_div.querySelector("input[name*='title']").value = question.title;
				
				var content = question.question_content;
				
				var add_q_content_btn = document.getElementById("survey_" + i + "_add_q_content_btn");
				
				for (var j = 0; j < content.length; j++) {
					add_q_content_btn.click();
					
					survey_div.querySelector("input[name*='question_content[" + j + "]']").value = content[j].question_content;
				}
			}
		});
		
		request.fail(function(error) {
			console.log("getSurveyQuestionList fail", error);
		});
	}
</script>