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
						<form:form method="post" modelAttribute="suggestionVo" enctype="multipart/form-data">
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
								<label class="col-md-2 col-form-label">제안내용 </label>
								<div class="col-md-8">
									<form:textarea type="text" class="form-control" path="content" rows ="5"/>
									<form:errors path="content"/>
								</div>
							</div>
							<div class="form-gorup row mb-20">
								<div class="col-md-1"></div>
								<label class="col-md-2 col-form-label">첨부파일</label>
								<div class="col-md-8">
									<div class="input-group input-group-file" data-plugin="inputGroupFile">
										<input type="text" class="form-control" id="attachTitle" readonly/>
										<button type="button" class="input-search-close icon md-close" id="attachDelBtn" style="position: absolute; display: none;"></button>
										<span class="input-group-append">
											<span class="btn btn-primary btn-file">
												<i class="icon md-upload" aria-hidden="true"></i>
												<input multiple="multiple" type="file" id="publicFile" name="publicFile"/>
											</span>
										</span>
 									</div>
								</div>
							</div>
							<div class="form-group row">
								<div class="col-md-1"></div>
									<label class="col-md-2 col-form-label">대표이미지 </label>
									<div class="col-md-8">
		                    			<input type="file" id="repFile" name="repFile" data-plugin="dropify" <%-- data-default-file="${pageContext.request.contextPath}/images/placeholder.png" --%>/>
		                  			</div>
							</div>
							
				            <div class="form-group form-material row">
								<div class="col-md-9 offset-md-9">
									<button type="submit" class="btn btn-primary waves-effect waves-classic" id="suggestionRegistBtn" formaction="/suggestion/suggestionRegist.do">등록 </button>
									<button type="button" class="btn btn-default btn-outline waves-effect waves-classic" id="suggestionListBtn">목록 </button>
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
	$("#suggestionListBtn").click(function() {
		location.href = "${pageContext.request.contextPath}/suggestion/suggestionListPage.do";
	});
	
	function publicFileChange() {
		var fileValue = $("#publicFile")[0].files[0];
		
		if (fileValue !== undefined) {
			$("#attachTitle").val($("#publicFile")[0].files[0].name);
			
			$("#attachDelBtn").show();
		} else {
			$("#attachTitle").val("");
			
			$("#attachDelBtn").hide();
		}
	}
	
	$("#publicFile").change(function() {
		publicFileChange();
	});
	
	$("#attachDelBtn").click(function() {
		$("#publicFile").val("");
		
		publicFileChange();
	});
	
	$("#suggestionRegistBtn").click(function() {
		if (!confirm("등록하시겠습니까?")) return false;
	});
</script>
	    	