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
	      <li class="breadcrumb-item">서비스</li>
	      <li class="breadcrumb-item">열린제안</li>
	      <li class="breadcrumb-item active">제안등록</li>
	    </ol>	
		<div class="col-lg-12">
			<div class="mb-30">
				<div class="panel">
					<div class="panel-body">
						<form:form method="post" modelAttribute="contestVo" enctype="multipart/form-data">
							<div class="form-group row">
								<div class="col-md-1"></div>
								<label class="col-md-2 col-form-label">작성자 </label>
								<div class="col-md-8">
									<form:input type="text" readonly="true" class="form-control" value="${login.user_id}" path="create_user"/>
									<form:errors path="create_user"/>
								</div>
							</div>
							<div class="form-group row">
								<div class="col-md-1"></div>
								<label class="col-md-2 col-form-label">제목 </label>
								<div class="col-md-8">
									<form:input type="text" class="form-control" path="title"/>
									<form:errors path="title"/>
								</div>
							</div>
							<div class="form-group row">
								<div class="col-md-1"></div>
								<label class="col-md-2 col-form-label">설명 </label>
								<div class="col-md-8">
									<form:textarea type="text" class="form-control" path="content" rows ="5"/>
									<form:errors path="content"/>
								</div>
							</div>
							<div class="form-group row">
								<div class="col-md-1"></div>
									<label class="col-md-2 col-form-label">대표이미지 </label>
									<div class="col-md-8">
		                    			<input type="file" accept="image/*" id="repFile" name="repFile" data-plugin="dropify" <%-- data-default-file="${pageContext.request.contextPath}/images/placeholder.png" --%>/>
		                  			</div>
							</div>
							<div class="form-group row">
								<div class="col-md-1"></div>
								<label class="col-md-2 col-form-label">공모기간 </label>		
									<div class="col-md-6 col-xl-4">
										<div class="input-daterange" data-plugin="datepicker">
											<div class="input-group">
													<div class="input-group-prepend">
														<span class="input-group-text">
														<i class="icon md-calendar" aria-hidden="true"></i>
														</span>
													</div>
												<form:input type="text" class="form-control" path="contest_s_date" />
												<form:errors style="color:red;" path="contest_s_date"/>
											</div>
											<div class="input-group">
												<div class="input-group-prepend">
													<span calss="input-group-text"> &nbsp;_&nbsp;</span>
												</div>
												<form:input type="text" class="form-control" path="contest_e_date" />
											</div>
										</div>
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
													<form:input type="text" class="form-control" path="submit_s_date" />
													<form:errors style="color:red;" path="submit_s_date"/>
												</div>
												<div class="input-group">
													<div class="input-group-prepend">
														<span calss="input-group-text"> &nbsp;_&nbsp;</span>
													</div>
												<form:input type="text" class="form-control" path="submit_e_date" />
											</div>
										</div>
									</div>
				                </div>
				                    
							<div class="form-gorup row mb-20">
								<div class="col-md-1"></div>
								<label class="col-md-2 col-form-label">공고문</label>
								<div class="col-md-7">
									<div class="input-group input-group-file" data-plugin="inputGroupFile">
										<input type="text" class="form-control" id="noticeFileTitle" readonly/>
										<span class="input-group-append">
											<span class="btn btn-primary btn-file">
												<i class="icon md-upload" aria-hidden="true"></i>
												<input multiple="multiple" type="file" id="noticeFile" name="noticeFile"/>
											</span>
										</span>
 									</div>
								</div>
								<div class="col-md-1" style="padding-left: 0px;">
									<button type='button' class='btn btn-primary' id='noticeFileDelBtn' >삭제</button>
								</div>
							</div>	
							<div class="form-gorup row mb-20">
								<div class="col-md-1"></div>
								<label class="col-md-2 col-form-label"></label>
								<div class="col-md-8">
									<div id="noticeFileName-list">
									</div>
								</div>
							</div>
							<div class="form-gorup row mb-20">
								<div class="col-md-1"></div>
								<label class="col-md-2 col-form-label">제안서</label>
									<div class="col-md-7">
										<div class="input-group input-group-file" data-plugin="inputGroupFile">
											<input type="text" class="form-control" id="propFileTitle" readonly/>
											<span class="input-group-append">
												<span class="btn btn-primary btn-file">
													<i class="icon md-upload" aria-hidden="true"></i>
													<input type="file" id="propFile" name="propFile"/>
												</span>
											</span>
	 									</div>
									</div>
									<div class="col-md-1" style="padding-left: 0px;">
										<button type='button' class='btn btn-primary' id='propFileDelBtn' >삭제</button>
									</div>
								</div>	
								<div class="form-gorup row mb-20">
									<div class="col-md-1"></div>
									<label class="col-md-2 col-form-label"></label>
									<div class="col-md-8">
										<div id="propFileName-list">
										
										</div>
									</div>
								</div>
					            <div class="form-group form-material row">
									<div class="col-md-9 offset-md-9">
										<button type="submit" class="btn btn-primary waves-effect waves-classic" id="contestRegistBtn" formaction="/contest/contestRegist.do">등록 </button>
										<button type="button" class="btn btn-default btn-outline waves-effect waves-classic" id="contestListBtn">목록 </button>
									</div>
								</div>
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">


function noticeFileChange() {
    
	var fileValue = $("#noticeFile")[0].files[0];

	if (fileValue !== undefined) {

		$("#noticeFileTitle").val( '파일 '+$("#noticeFile")[0].files.length+'개');
			
		for( var i = 0; i <$("#noticeFile")[0].files.length; i++ ){
			console.log($("#noticeFile")[0].files[i].name);
			
			var str = '<li>'+
			'<input type="hidden" name="save_file_name" value="'+ +$("#noticeFile")[0].files[i].name+ '">'+
			'<span class="file-img"></span>'+
			'<a href="#this" name="file">'+$("#noticeFile")[0].files[i].name+'</a>' +
			'<span>&nbsp;&nbsp;&nbsp;&nbsp;'+($("#noticeFile")[0].files[i].size/1024).toFixed(2)+' kb</span>'+
			'</li>';
			$("#noticeFileName-list").append(str);
		}
		//$("#attachDelBtn").show();
	} else {
		$("#noticeFileTitle").val("");
		//$("#attachDelBtn").hide();
		$("#noticeFileName-list").children().remove();
	}
}



$("#noticeFile").change(function() {
	noticeFileChange();
});

$("#noticeFileDelBtn").click(function() {
	$("#noticeFile").val("");
	noticeFileChange();
});



function propFileChange() {
    
	var fileValue = $("#propFile")[0].files[0];

	if (fileValue !== undefined) {

		$("#propFileTitle").val( '파일 '+$("#propFile")[0].files.length+'개');
			
		for( var i = 0; i <$("#propFile")[0].files.length; i++ ){
			console.log($("#propFile")[0].files[i].name);
			
			var str =  '<li>'+
			'<input type="hidden" name="save_file_name" value="'+ +$("#propFile")[0].files[i].name+ '">'+
			'<span class="file-img"></span>'+
			'<a href="#this" name="file">'+$("#propFile")[0].files[i].name+'</a>' +
			'<span>&nbsp;&nbsp;&nbsp;&nbsp;'+($("#propFile")[0].files[i].size/1024).toFixed()+' kb</span>'+
			'</li>';
			$("#propFileName-list").append(str);
		}
		//$("#attachDelBtn").show();
	} else {
		$("#propFileTitle").val("");
		//$("#attachDelBtn").hide();
		$("#propFileName-list").children().remove();
	}
}



$("#propFile").change(function() {
	propFileChange();
});

$("#propFileDelBtn").click(function() {
	$("#propFile").val("");
	propFileChange();
});






</script>