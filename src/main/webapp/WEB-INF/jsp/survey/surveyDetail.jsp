<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    
<!-- Page -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/surveyRegist.js"></script>

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
                      <li class="nav-item" role="presentation"><a class="nav-link active" data-toggle="tab" href="#exampleTabsOne"
                          aria-controls="exampleTabsOne" role="tab">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;설&nbsp;&nbsp;문&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
                      <li class="nav-item" role="presentation"><a class="nav-link" data-toggle="tab" href="#exampleTabsTwo"
                          aria-controls="exampleTabsTwo" role="tab">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;결&nbsp;&nbsp;과&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
                      <li class="nav-item" role="presentation"><a class="nav-link" data-toggle="tab" href="#exampleTabsThree"
                          aria-controls="exampleTabsThree" role="tab">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;댓글&nbsp;(${surveyOpinionListSize})&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
                    </ul>
                    <div class="tab-content pt-20">
                      <div class="tab-pane active" id="exampleTabsOne" role="tabpanel">
                      	<div class="col-lg-12">
							<div class="mb-30">
								<div class="panel">
									<div class="panel-body">
										<form:form method="post" modelAttribute="surveyVo" enctype="multipart/form-data">
										<form:input type="hidden" path="survey_idx"/>
											<div class="form-group row">
												<div class="col-md-1"></div>
													<label class="col-md-2 col-form-label">작성자 </label>
												<div class="col-md-8">
													<form:input type="text" readonly="true" class="form-control" path="create_user"  value="${login.user_id}"/>
													<form:errors path="create_user"/>
												</div>
											</div>
											<div class="form-group row">
												<div class="col-md-1"></div>
													<label class="col-md-2 col-form-label">제목 </label>
												<div class="col-md-8">
													<form:input type="text" class="form-control" path="title"/>
													<form:errors style="color:red;" path="title"/>
												</div>
											</div>
											<div class="form-group row">
												<div class="col-md-1"></div>
													<label class="col-md-2 col-form-label">설명 </label>
												<div class="col-md-8">
													<form:textarea type="text" class="form-control" path="content" rows ="5"/>
													<form:errors style="color:red;" path="content"/>
												</div>   
											</div>
											<div class="form-group row">
												<div class="col-md-1"></div>
												<label class="col-md-2 col-form-label">대표이미지 </label>
												<div class="col-md-8">
					                    			<input type="file" id="repFile" name="repFile" data-plugin="dropify" <%-- data-default-file="${pageContext.request.contextPath}/images/placeholder.png" --%>/>
					                  			</div>
											</div>
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
																<form:errors style="color:red;" path="s_date"/>
															</div>
															<div class="input-group">
																<div class="input-group-prepend">
																	<span calss="input-group-text"> &nbsp;_&nbsp;</span>
																</div>
																<form:input type="text" class="form-control" name="e_date" path="e_date" />
																
															</div>
														</div>
													</div>
							                </div>
							                
							                <hr/>
							                
							                <div class="form-group row">
												<div class="col-md-1"></div>
													<label class="col-md-2 col-form-label" style="padding-top:25px;">답변유형 </label>
												<div class="col-md-8">
												<div class="example">
								                    <select data-plugin="selectpicker" name = "survey_type">
								                      <option value="S" <c:if test="${surveyVo.survey_type eq 'S'}">selected</c:if>>단일선택</option>
								                      <option value="P" <c:if test="${surveyVo.survey_type eq 'P'}">selected</c:if>>복수선택</option>
								                    </select>
								                  </div>
												</div>
											</div>
							                
							              
							                <div class="form-group row">
												<div class="col-md-1"></div>
													<label class="col-md-2 col-form-label">설문 항목	</label>								
												<div class="col-md-8">
													<button type="button" class="btn btn-primary" id="addQuestion" onclick="addQuestion()">+ 항목 생성</button>		
												</div>								
											</div>
											
										  <div id = "question-list">
							                <c:forEach var="result" items="${surveyQuestionList}" varStatus="status">
								                	
								              		<div class='form-group row'>
													    <div class='col-md-3'></div>
														    <div class='col-md-7'>
														    	<input type='text' class='form-control' name='question_content' value=" ${ result.question_content}"/>
														    </div>
														    <div class='col-md-2'>
														    	<button type='button' class='btn btn-primary' name = 'question_delete'  >-</button>
														    </div>
												    </div>
											 
										    	</c:forEach>
											</div>
											
								        <br/>
								        <br/>
								        
											<div class="col-md-11 text-right">
												<div class="example example-buttons">  
													<button type="submit" class="btn btn-primary waves-effect waves-classic" id="updateSurvey" formaction="/survey/updateSurvey.do">수정 </button>
													<button type="button" class="btn btn-default btn-outline waves-effect waves-classic" id="userList">목록 </button>
												</div>
											</div>
										</form:form>
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
						  <br/>
								<div class="row row-lg">
								<div class="col-md-1"></div>
									<div class="col-md-6">
										<div class="example-wrap" id = "surveyResultDiv">
										</div>
									</div>
								</div>
		                   </div>
		                </div>
                
                    <hr/>
                    	<br/>
                    	<div class='form-group row'>
                      	<h4>◦ 참여자</h4><span>&nbsp;&nbsp;총${ surveyParticipation.size() }명</span>
                      	</div>  
						<br/>
						
						   <div id="surveyParticipationListTable" class="text-break"></div>
					
               		</div>
                    <!--번째탭 -->
                    <div class="tab-pane" id="exampleTabsThree" role="tabpanel">
                      <%@ include file="./surveyOpinion.jsp" %>
             	    </div>
                	      
                	      
             	     </div>
         			</div> 
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	getSurveyOpinionList();
	
	$(window).on("load", function() {
		console.log($("#s_date").val());
		var _repFileTarget = $("div[class='dropify-preview']");
		_repFileTarget.find("span[class='dropify-render']").append("<img src='/survey/getImg.do?survey_idx=${surveyVo.survey_idx}'>");
		_repFileTarget.attr("style", "display:block");
	});
	
	var s_date = document.getElementById("s_date").value;
	
	var today = formatDate(new Date())
	
	if(s_date <= today){
		document.getElementById('addQuestion').setAttribute('disabled', 'disabled');
		$("button[name='question_delete']").attr("disabled", "disabled");
		$("input[name='question_content']").attr("readonly", "true");
		$("input[name='s_date']").attr("readonly", "true");
		$("input[name='e_date']").attr("readonly", "true");
		$("div[class='input-daterange']").attr("data-plugin", "");
		$("select[name='survey_type']").attr("disabled", "disabled");
	}else{
		
	}
	
	//파일정보 가져오기
	var ResultList = new Array();
	var sumCount= 0;
	var ResultPerList = new Array();
	
	<c:forEach var="result" items="${surveyResult}">
		var result = {};
		result.question_content = "${result.question_content}";
		result.question_count = "${result.question_count}";
		ResultList.push(result);
	</c:forEach>
	
	if (ResultList.length > 0) {
		for (var result of ResultList) {
			sumCount += parseInt(result.question_count);
		}
		
		for (var result2 of ResultList){
			
			result2.result_per = 100-((result2.question_count / sumCount) * 100);
			if(isNaN(result2.result_per))result2.result_per=100;
			ResultPerList.push(result2);
		}
	}
	
	if(ResultPerList.length > 0){
		var index = 1;
		for(var resultPer of ResultPerList){
			console.log(resultPer.question_content);
			var str = '<h6 class="font-size-16">' +index + '.&nbsp;' +resultPer.question_content+' ('+resultPer.question_count+'표)</h6>'+
			'<div class="progress" data-labeltype="percentage" data-goal="-40" data-plugin="progress">'+
			'<div class="progress-bar" aria-valuemin="-100" aria-valuemax="0" aria-valuenow="-' + resultPer.result_per+'" role="progressbar">'+
			'<span class="progress-label"></span>' +
			'</div>'+
			'</div>';
			
			$("#surveyResultDiv").append(str);
			index++;
		}
	}
	
	$("#surveyOpnRegBtn").click(function() {
		$("#opinion_idx").val("");
	});
	
	function submitConfirm($type) {
		var type = $type.text();
		var title = $type.data("title");
		var msg = "";
		
		if (title !== undefined) msg += title + "을(를) ";
		msg += type + "하시겠습니까?";
		
		if (!confirm(msg)) return false;
		else return true;
	}
	
	$("#surveyOpinionRegistBtn").click(function() {
		if (!submitConfirm($(this))) return false;
		
		var request = $.ajax({
			url: "/survey/surveyOpinionRegist.do",
			method: "post",
			data: $("#surveyOpnRegForm").serialize()
		});
		
		request.done(function(data) {
			$("button[class='close']").click();
			
			getSurveyOpinionList();
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
				{name : "participation_user", title : "아이디", type : "text", width : 50, align : "center"}, 
				{name : "name", title : "이름", type : "text", width : 70}, 
				{name : "email", title : "이메일", type : "text", width : 100}, 
				{name : "phone", title : "전화번호", type : "text", width : 100, align : "center"}, 
				{name : "create_date", title : "참여일", type : "text", width : 100, align : "center"}, 
				{name : "choose", title :"선택", type : "text", width : 100, align : "center"}
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
		    	{name: "opinion_idx",title: "번호", type: "text", width: 80, align: "center"}, 
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
		    					
		    					result += item.opinion_content;
		    				} else {
			    				result = item.opinion_content;
		    				}
		    			}
		    				
		    			return result;
		    		}
	    		}, 
		    	{name: "create_user", title: "작성자", type: "text", width: 70}, 
		    	{name: "auth_type", title: "작성자 유형", type: "text", width: 70}, 
		    	/* {name: "like_count", title: "공감", type: "text", width: 30}, */ 
		    	{name: "create_date", title: "등록일", type: "text", width: 100, align: "center"}, 
		    	{title: "", width: 50, align: "center", 
		    		itemTemplate: function(_, item) {
		    			if (item.del_chk !== 'Y') {
			    			return '<button class="btn btn-primary btn-outline float-right waves-effect waves-classic" type="button" data-toggle="modal" data-target="#surveyOpnRegModal" name="opnToOpnModal" onclick="opnToOpnRegistBtn(this)">댓글 등록 </button>';
		    			}
		    		}
	    		}
	    	],
	    	
	    	rowClick: function(args) {
	    		if (args.item.del_chk !== 'Y' && args.event.target.name !== 'opnToOpnModal') {
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
		var opinion_idx = $(_this).parent().siblings().first().text();
		
		$("#opinion_idx").val(opinion_idx);
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
			$("button[class='close']").click();
			
			getSurveyOpinionList();
		});
	}
</script>