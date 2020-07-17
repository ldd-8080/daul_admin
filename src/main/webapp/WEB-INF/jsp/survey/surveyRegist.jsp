<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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

		<div class="col-lg-12">
			<div class="mb-30">
				<div class="panel">
					<div class="panel-body">
						<form id="survey-form">
							<div class="form-group row">
								<div class="col-md-1"></div>
									<label class="col-md-2 col-form-label">작성자 </label>
								<div class="col-md-8">
									<input type="text" readonly="true" class="form-control" name="create_user"/>
									
								</div>
							</div>
							<div class="form-group row">
								<div class="col-md-1"></div>
									<label class="col-md-2 col-form-label">제목 </label>
								<div class="col-md-8">
									<input type="text" class="form-control" name="title"/>
					
								</div>
							</div>
							<div class="form-group row">
								<div class="col-md-1"></div>
									<label class="col-md-2 col-form-label">설명 </label>
								<div class="col-md-8">
									<textarea type="text" class="form-control" name="content" rows ="5">
								</textarea>
								</div>
							</div>
							<div class="form-group row">
								<div class="col-md-1"></div>
									<label class="col-md-2 col-form-label">대표이미지 </label>
									<div class="col-md-8">
		                    			<input type="file" id="input-file-now-custom-1" data-plugin="dropify" <%-- data-default-file="${pageContext.request.contextPath}/images/placeholder.png" --%>/>
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
												<input type="text" class="form-control" name="s_date" />
											</div>
											<div class="input-group">
												<div class="input-group-prepend">
													<span calss="input-group-text"> &nbsp;_&nbsp;</span>
												</div>
												<input type="text" class="form-control" name="e_date" />
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
				                    <select data-plugin="selectpicker">
				                      <option>단일선택</option>
				                      <option>복수선택</option>
				                    </select>
				                  </div>
								</div>
							</div>
			                
			                <div class="form-group row">
								<div class="col-md-1"></div>
									<label class="col-md-2 col-form-label">설문 항목	</label>								
								<div class="col-md-8">
									<button type="button" class="btn btn-primary" onclick="addQuestion()">+ 항목 생성</button>		
								</div>								
							</div>
							
							
							<div id = "question-list">
							  <div class="form-group row">
								<div class="col-md-3"></div>
								<div class="col-md-7">
									<input type="text" class="form-control" name="question_content[]" />
								</div>						
								<div class="col-md-2">
									<button type="button" class="btn btn-primary" id = "question-delete" >-</button>	
								</div>
							</div>
							</div>
							
							
				            <div class="form-group form-material row">
								<div class="col-md-9 offset-md-9">
									<button type="button" class="btn btn-primary waves-effect waves-classic" id="surveyRegist" >등록 </button>
									<button type="button" class="btn btn-default btn-outline waves-effect waves-classic" id="userList">목록 </button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">


$(function() {

	
	$("#surveyRegist").click(function() {
		registSurvey();
	});	
	
});


function registSurvey(){
	var request = $.ajax({
		url: "/survey/registSurvey.do",
		method: "post",
		//contentType: "application/json",
		//dataType: "json",
		data: $("#survey-form").serialize()
	});
	request.done(function(data) {
		console.log(data);
		console.log("request done");
		
		if (data === "success") {
			location.href = "${pageContext.request.contextPath}/qna/qnaList.do";
		} else {
			//alert(data);
			$("#chk-error").text(data);
		}
	});
	request.fail(function(error) {
		console.log(error);
		console.log("request fail");
	});
}
function addQuestion() {
    var str = " <div class='form-group row'>" +
    "<div class='col-md-3'></div>" +
    "<div class='col-md-7'>" +
    "<input type='text' class='form-control'/>"+
    "</div>"+
    "<div class='col-md-2'>" + 
    "<button type='button' class='btn btn-primary' id = 'question-delete' >-</button>"+
    "</div>"+
    "</div>"+
    "</div>";
    
    $("#question-list").append(str);
    $("button[id='question-delete']").on("click", function(e) {
        e.preventDefault();
        deleteFile($(this));
    });
    
    function deleteFile(obj) {
        obj.parent().parent().remove();
    }
}
</script>
	    	