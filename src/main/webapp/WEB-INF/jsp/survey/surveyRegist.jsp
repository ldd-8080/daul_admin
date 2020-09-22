<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!-- Page -->
<div class="page">
	<div class="page-content container-fluid">
		<!-- Page -->
		<!-- <h1 class="page-title">사용자 목록</h1> -->
		<ol class="breadcrumb">
			<li class="breadcrumb-item">
				<a href="/main/main.do">Home</a>
			</li>
			<li class="breadcrumb-item">서비스</li>
			<li class="breadcrumb-item">설문조사</li>
			<li class="breadcrumb-item active">설문조사 등록</li>
		</ol>

		<div class="col-lg-12">
			<div class="mb-30">
				<div class="panel">
					<div class="panel-body">
						<form:form method="post" modelAttribute="surveyVo" enctype="multipart/form-data">
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
									<form:input type="text" class="form-control" path="title" maxlength="100" />
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
							<div class="form-group row">
								<div class="col-md-1"></div>
								<label class="col-md-2 col-form-label">대표이미지 </label>
								<div class="col-md-8">
									<input type="file" accept="image/*" id="input-file-now-custom-1" name="repFile" id="surveyFile" data-plugin="dropify" data-default-file="${pageContext.request.contextPath}/images/placeholder.png" />
								</div>
							</div>
							<div class="form-group row">
								<div class="col-md-1"></div>
								<label class="col-md-2 col-form-label">설문기간 </label>
								<div class="col-md-6 col-xl-4">
									<div class="input-daterange" data-plugin="datepicker">
										<div class="input-group">
											<div class="input-group-prepend">
												<span class="input-group-text">
													<i class="icon md-calendar" aria-hidden="true"></i>
												</span>
											</div>
											<form:input type="text" class="form-control" path="s_date" />
											<form:errors style="color:red;" path="s_date" />
										</div>
										<div class="input-group">
											<div class="input-group-prepend">
												<span class="input-group-text"> &nbsp;_&nbsp;</span>
											</div>
											<form:input type="text" class="form-control" path="e_date" />

										</div>
									</div>
								</div>
							</div>

							<hr />
							
							<div id="survey-list">
								<input type="hidden" name="survey_id" id="list_survey_id" />
							</div>
							
							<div class="form-group form-material row">
								<div class="col-md-12 text-right">
									<button type="submit" class="btn btn-primary waves-effect waves-classic" id="registSurvey" data-title="설문조사" formaction="/survey/registSurvey.do">등록</button>
									<button type="button" class="btn btn-default btn-outline waves-effect waves-classic" id="userList">목록</button>
								</div>
							</div>
						</form:form>

						<!-- Output Box - Rule -->

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
</div>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/surveyQuestion.js"></script>
<script type="text/javascript">
	$("#registSurvey").click(function() {

		var rep_img = $("#input-file-now-custom-1").val();

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

		if (!submitConfirm($(this)))	return false;
	});

	var globalIdx = 0;

	var add_survey_list_btn = document.getElementById("add_survey_list_btn");
	
	add_survey_list_btn.addEventListener("click", function() {
		addSurveyListHtml();
	});
</script>