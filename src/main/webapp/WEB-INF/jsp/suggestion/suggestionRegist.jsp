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
									<form:errors style="color:red;" path="create_user"/>
								</div>
							</div>
							<div class="form-group row">
								<div class="col-md-1"></div>
								<label class="col-md-2 col-form-label">제목 </label>
								<div class="col-md-8">
									<form:input type="text" class="form-control" path="title"  maxlength="100"/>
									<form:errors style="color:red;" path="title"/>
								</div>
							</div>
							<div class="form-group row">
								<div class="col-md-1"></div>
								<label class="col-md-2 col-form-label">제안내용 </label>
								<div class="col-md-8">
									<form:textarea type="text" class="form-control" path="content" rows ="5"/>
									<form:errors style="color:red;" path="content"/>
								</div>
							</div>
							<div class="form-gorup row mb-20">
								<div class="col-md-1"></div>
								<label class="col-md-2 col-form-label">첨부파일</label>
								<div class="col-md-8">
									<div class="input-group input-group-file" data-plugin="inputGroupFile">
										<input type="text" class="form-control" id="sgstFileTitle" readonly/>
										<span class="input-group-append">
											<span class="btn btn-primary btn-file">
												<i class="icon md-upload" aria-hidden="true"></i>
												<input multiple="multiple" type="file" id="sgstFile" name="sgstFile"/>
											</span>
										</span>
 									</div>
								</div>
							</div>
							<div class="form-gorup row mb-20">
								<div class="col-md-1"></div>
								<label class="col-md-2 col-form-label"></label>
								<div class="col-md-8">
									<div id="sgstFileName-list"></div>
								</div>
							</div>
							
							<div class="form-group row">
								<div class="col-md-1"></div>
								<label class="col-md-2 col-form-label">대표이미지 </label>
								<div class="col-md-8">
	                    			<input type="file"  accept="image/*"  id="repFile" name="repFile" data-plugin="dropify" <%-- data-default-file="${pageContext.request.contextPath}/images/placeholder.png" --%>/>
	                  			</div>
							</div>
							
							<br/>
				            <div class="col-md-12 text-right">
								<div class="example example-buttons">  	
									<button type="submit" class="btn btn-primary waves-effect waves-classic" id="suggestionRegistBtn" data-title="열린제안" formaction="/suggestion/suggestionRegist.do">등록 </button>
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
	
	
	var sgstFileList = new Array();
	
	function sgstFileChange() {
		var fileValue = $("#sgstFile")[0].files;
		
		if (fileValue.length > 0) {
	  		for (var i = 0; i < fileValue.length; i++) {
				var exist = false;
				
				for (var k = 0; k < sgstFileList.length; k++) {
					if (fileValue[i].name === sgstFileList[k].name) {
						console.log("this file is already exist", fileValue[i].name);
						exist = true;
						break;
					}
				}
				
				if (!exist) {
					sgstFileList.push(fileValue[i]);

					$("#sgstFileTitle").val( '파일 '+ sgstFileList.length + '개');
					
					var str = '<li>'+
		  			'<input type="hidden" name="save_file_name" value="' + fileValue[i].name + '">' +
		  			'<span class="file-img"></span>' +
		  			'<a href="#this" name="file"> (new) ' + fileValue[i].name + '</a>' +
		  			'<span>&nbsp;&nbsp;&nbsp;&nbsp;' + (fileValue[i].size/1024).toFixed(2) + ' kb</span>' +
		  			'&nbsp;&nbsp;<button type="button" class="input-search-close icon md-close" name="newFileDelBtn" onclick="newFileDel(this)"></button>' +
		  			'</li>';
		  			
					$("#sgstFileName-list").append(str);
				}
			}
	  	}
	}
	
	function newFileDel(_this) {
		var fileName = $(_this).siblings().first().val();
		
		for (var i = 0; i < sgstFileList.length; i++) {
			if (fileName === sgstFileList[i].name) {
				sgstFileList.splice(i, 1);
				
				$(_this).parent().remove();
				
				$("#sgstFileTitle").val( '파일 '+ sgstFileList.length + '개');
			}
		}
	}
	
	$("#sgstFile").change(function() {
		sgstFileChange();
	});
	
	$("#suggestionRegistBtn").click(function() {
		if (!submitConfirm($(this))) return false;
	});
</script>
	    	