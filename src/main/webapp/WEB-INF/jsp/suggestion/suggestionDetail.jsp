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
	      <li class="breadcrumb-item active">제안상세</li>
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
									<form:input type="text" readonly="true" class="form-control" path="create_user"/>
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
									<form:textarea type="text" class="form-control" path="content" rows="5"/>
									<form:errors path="content"/>
								</div>
							</div>
							<div class="form-gorup row mb-20">
								<div class="col-md-1"></div>
								<label class="col-md-2 col-form-label">첨부파일</label>
								<div class="col-md-8">
									<div class="input-group input-group-file" data-plugin="inputGroupFile">
										<input type="text" class="form-control" id="publicFileName" value="${fileList[0].org_file_name}" readonly/>
										<button type="button" class="input-search-close icon md-close" id="publicFileDelBtn" style="position: absolute; display: none;"></button>
										<span class="input-group-append">
											<span class="btn btn-primary btn-file">
												<i class="icon md-upload" aria-hidden="true"></i>
												<input type="file" id="publicFile" name="publicFile"/>
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
									<button type="submit" class="btn btn-primary waves-effect waves-classic" id="suggestionModifyBtn" formaction="/suggestion/suggestionModify.do">수정 </button>
									<button type="submit" class="btn btn-primary waves-effect waves-classic" id="suggestionDeleteBtn" formaction="/suggestion/suggestionDelete.do">삭제 </button>
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
	$(window).on("load", function() {
		var _repFileTarget = $("div[class='dropify-preview']");
		_repFileTarget.find("span[class='dropify-render']").append("<img src='/suggestion/getImg.do'>");
		_repFileTarget.attr("style", "display:block");
	});
	
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
				public_file = file;
			}
		}
	}

	$("#suggestionListBtn").click(function() {
		location.href = "${pageContext.request.contextPath}/suggestion/suggestionListPage.do";
	});
	
	function publicFileChange() {
		var fileValue = $("#publicFile")[0].files[0];
		
		if (fileValue !== undefined) {
			$("#publicFileName").val($("#publicFile")[0].files[0].name);
			
			$("#publicFileDelBtn").show();
		} else {
			$("#publicFileName").val("");
			
			$("#publicFileDelBtn").hide();
		}
	}
	
	$("#publicFile").change(function() {
		publicFileChange();
	});
	
	$("#publicFileDelBtn").click(function() {
		if (!confirm("해당 파일이 삭제됩니다. 삭제하시겠습니까?")) return;
		
		// public_file 데이터를 넘겨서 삭제
		// del_chk가 N인것만 삭제를 하며 삭제 성공시 del_chk를 N -> Y로 변경
		if (public_file.del_chk === "N") {
			var request = $.ajax({
				url: "/suggestion/suggestionAttachFileDelete.do",
				method: "post",
				contentType: "application/json",
				data: JSON.stringify(public_file)
			});
			
			request.done(function(data) {
				console.log("request done", data);
				if (data === "success") public_file.del_chk = "Y";
			});
			
			request.fail(function(error) {
				console.log("request fail", error);
			});
		}
		
		$("#publicFile").val("");
		
		publicFileChange();
	});
	
	$("#suggestionModifyBtn").click(function() {
		if (!confirm("수정하시겠습니까?")) return false;
	});
</script>
	    	