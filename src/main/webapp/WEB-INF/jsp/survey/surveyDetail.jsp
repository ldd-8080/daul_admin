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
                          aria-controls="exampleTabsThree" role="tab">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;댓글&nbsp;(갯수)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
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
											
								            <div class="form-group form-material row">
												<div class="col-md-9 offset-md-9">
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
	                   <table class="table table-hover dataTable table-striped w-full" id="boardTable" data-plugin="dataTable">
			            <thead>
			              <tr>
			                <th>아이디</th>
			                <th>이름</th>
			                <th>이메일</th>
			                <th>전화번호</th>
			                <th>참여일</th>
			                <th>선택</th>
			              </tr>
			            </thead>
			            <tbody>
			            	<c:forEach var="result" items="${surveyParticipation}" varStatus="status">
			            	<tr>
			            		<td id="seq_${status.index}">${result.participation_user}</td>
			            		<td>${result.name}</td>
			            		<td>${result.email}</td>
			            		<td>${result.phone}</td>
			            		<td>${result.create_date}</td>
			            		<td>${result.choose}</td>
		            		</tr>
			            	</c:forEach>
			            </tbody>
			          </table>
               		</div>
                    <!--번째탭 -->
                    <div class="tab-pane" id="exampleTabsThree" role="tabpanel">
                      Benivole horrent tantalo fuisset adamare fugiendam tractatos indicaverunt animis
                      chaere, brevi minuendas, ubi angoribus iisque deorsum audita
                      haec dedocendi utilitas. Panaetium erimus platonem varias
                      imperitos animum, iudiciorumque operis multa disputando.
             	    </div>
                	      
                	      
             	     </div>
         			</div> 
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
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
	
	//파일정보 가져오기
	var fileList = new Array();
	var public_file = {};
	var rep_file = {};
	
	<c:forEach var="file" items="${fileList}">
		var file = {};
		file.suggestion_idx = "${file.suggestion_idx}";
		file.org_file_name = "${file.org_file_name}";
		file.save_file_name = "${file.save_file_name}";
		file.file_size = "${file.file_size}";
		file.create_user = "${file.create_user}";
		file.del_chk = "${file.del_chk}";
		file.attach_type = "${file.attach_type}";
		fileList.push(file);
	</c:forEach>
	
	if (fileList.length > 0) {
		for (var file of fileList) {
			if (file.attach_type.indexOf("rep") > -1) {
				rep_file = file;
			} else if (file.attach_type.indexOf("public") > -1) {
				$("#publicFileDelBtn").show();
				$("#publicFileName").val(file.org_file_name);
				public_file = file;
			}
		}
	}
	
</script>