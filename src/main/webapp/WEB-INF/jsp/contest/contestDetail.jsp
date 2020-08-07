<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!-- Page -->
<div class="page">
	<div class="page-content container-fluid">
		<!-- Page -->
		<h1 class="page-title">나눔공모 상세</h1>
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="../index.html">Home</a></li>
			<li class="breadcrumb-item"><a href="javascript:void(0)">나눔공모</a></li>
			<li class="breadcrumb-item active">나눔공모 상세</li>
		</ol>

		<div class="col-lg-12">
			<div class="mb-30">
				<div class="panel">
					<div class="panel-body">
						<div class="nav-tabs-horizontal" data-plugin="tabs">
							<ul class="nav nav-tabs" role="tablist">
								<li class="nav-item" role="presentation">
									<a class="nav-link active" data-toggle="tab"
									href="#exampleTabsOne" aria-controls="exampleTabsOne"
									role="tab"> 공 모 </a>
								</li>
								<li class="nav-item" role="presentation">
									<a class="nav-link" data-toggle="tab" href="#exampleTabsTwo"
									aria-controls="exampleTabsTwo" role="tab"> 제 안 </a>
								</li>
							</ul>

							<div class="tab-content pt-20">
								<div class="tab-pane active" id="exampleTabsOne" role="tabpanel">

									<form:form method="post" modelAttribute="contestVo"
										enctype="multipart/form-data" id="contestForm">
										<form:input type="hidden" class="form-control" path="admin_contest_idx" />
										<div class="form-group row">
											<div class="col-md-1"></div>
											<label class="col-md-2 col-form-label">등록자 </label>
											<div class="col-md-8">
												<form:input type="text" readonly="true" class="form-control"
													path="create_user" />
												<form:errors path="create_user" />
											</div>
										</div>
										<div class="form-group row">
											<div class="col-md-1"></div>
											<label class="col-md-2 col-form-label">제목 </label>
											<div class="col-md-8">
												<form:input type="text" class="form-control" path="title" />
												<form:errors path="title" />
												<span class="text-left" style="color:red;" id="chk-error-title"></span>
											</div>
										</div>
										<div class="form-group row">
											<div class="col-md-1"></div>
											<label class="col-md-2 col-form-label">설명 </label>
											<div class="col-md-8">
												<form:textarea type="text" class="form-control"
													path="content" rows="5" />
												<form:errors path="content" />
												<span class="text-left" style="color:red;" id="chk-error-content"></span>
											</div>
										</div>
										<div class="form-group row">
											<div class="col-md-1"></div>
											<label class="col-md-2 col-form-label">대표이미지 </label>
											<div class="col-md-8">
												<input type="file" accept="image/*" id="repFile"
													name="repFile" data-plugin="dropify" <%-- data-default-file="${pageContext.request.contextPath}/images/placeholder.png" --%>/>
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
														<form:input type="text" class="form-control"
															path="contest_s_date" />
														<form:errors style="color:red;" path="contest_s_date" />
													</div>
													<div class="input-group">
														<div class="input-group-prepend">
															<span class="input-group-text"> &nbsp;_&nbsp;</span>
														</div>
														<form:input type="text" class="form-control"
															path="contest_e_date" />
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
														<form:input type="text" class="form-control"
															path="submit_s_date" />
														<form:errors style="color:red;" path="submit_s_date" />
													</div>
													<div class="input-group">
														<div class="input-group-prepend">
															<span class="input-group-text"> &nbsp;_&nbsp;</span>
														</div>
														<form:input type="text" class="form-control"
															path="submit_e_date" />
													</div>
												</div>
											</div>
										</div>

										<div class="form-gorup row mb-20">
											<div class="col-md-1"></div>
											<label class="col-md-2 col-form-label">공고문</label>
											<div class="col-md-7">
												<div class="input-group input-group-file" data-plugin="inputGroupFile">
													<input type="text" class="form-control" id="contestFileTitle" value="파일 0개" readonly /> 
													<span class="input-group-append"> 
														<span class="btn btn-primary btn-file"> 
															<i class="icon md-upload" aria-hidden="true"></i> 
															<input multiple="multiple" type="file" id="contestFile" name="contestFile" />
														</span>
													</span> 
												</div>
											</div>
										</div>
										<div class="form-gorup row mb-20">
											<div class="col-md-1"></div>
											<label class="col-md-2 col-form-label"></label>
											<div class="col-md-8">
												<div id="contestFile-list"></div>
											</div>
										</div>

										<div class="form-gorup row mb-20">
											<div class="col-md-1"></div>
											<label class="col-md-2 col-form-label">제안서</label>
											<div class="col-md-7">
												<div class="input-group input-group-file"
													data-plugin="inputGroupFile">
													<input type="text" class="form-control" id="propFileTitle" readonly /> 
													<span class="input-group-append"> 
														<span class="btn btn-primary btn-file"> 
															<i class="icon md-upload" aria-hidden="true"></i> 
															<input type="file" id="propFile" name="propFile" />
														</span>
													</span>
												</div>
											</div>
											<div class="col-md-1" style="padding-left: 0px;">
												<button type='button' class='btn btn-primary'
													id='propFileDelBtn'>삭제</button>
											</div>
										</div>
										<div class="form-gorup row mb-20">
											<div class="col-md-1"></div>
											<label class="col-md-2 col-form-label"></label>
											<div class="col-md-8">
												<div id="propFile-list"></div>
											</div>
										</div>

								        <br/>
								        <br/>
								        
										<div class="col-md-11 text-right">
											<div class="example example-buttons"> 
												<button type="button"
													class="btn btn-primary waves-effect waves-classic" id="contestModifyBtn">수정</button>
												<button type="submit"
													class="btn btn-primary waves-effect waves-classic" id="notcieDeleteBtn" formaction="/board/notieDelete.do">삭제</button>
												<button type="button"
													class="btn btn-default btn-outline waves-effect waves-classic"
													id="contestListBtn">목록</button>
											</div>
										</div>
									</form:form>
								</div>
								<div class="tab-pane" id="exampleTabsTwo" role="tabpanel">
									<%@ include file="./contestOpinion.jsp"%>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<script type="text/javascript">
   	$(document).ready(function(){
		$("a[name='file']").on("click",function(e){
			e.preventDefault();
			fn_downloadFile($(this));
		});
   	});
   
  	function fn_downloadFile(obj){
		var save_file_name = obj.parent().find("input[name='save_file_name']").val();
		console.log(save_file_name);
		location.href = "${pageContext.request.contextPath}/contest/downloadFile.do?type=admin&save_file_name=" + save_file_name;
  	}
  
  	$("#contestFile").change(function() {
		contestFileChange();
	});

  	$("#propFile").change(function() {
		propFileChange();
	});

  	var contestFileList = new Array();

  	function contestFileChange() {
  		var fileValue = $("#contestFile")[0].files;

	  	// 새로 추가한 파일fileValue이 존재하면
	  	// 기존에 등록했던 파일들fileList과 비교를 하고
	  	// 새로 추가했던 파일들contestFileList과 비교를 해서 contestFileList에 push
	  	if (fileValue.length > 0) {
	  		for (var i = 0; i < fileValue.length; i++) {
  				var exist = false;
  				
  				for (var j = 0; j < fileList.length; j++) {
  					if (fileList[j].attach_type === "contestFile") {
  						if (fileValue[i].name === fileList[j].org_file_name) {
  							console.log("this file is already registed", fileValue[i].name);
  							exist = true;
  							break;
  						}
  					}
  				}
  				
  				for (var k = 0; k < contestFileList.length; k++) {
  					if (fileValue[i].name === contestFileList[k].name) {
  						console.log("this file is already exist", fileValue[i].name);
  						exist = true;
  						break;
  					}
  				}
  				
  				if (!exist) {
  					contestFileList.push(fileValue[i]);
	
  					$("#contestFileTitle").val( '파일 '+ contestFileList.length + '개');
  					
  					var str = '<li>'+
			  			'<input type="hidden" name="save_file_name" value="' + fileValue[i].name + '">' +
			  			'<span class="file-img"></span>' +
			  			'<a href="#this" name="file"> (new) ' + fileValue[i].name + '</a>' +
			  			'<span>&nbsp;&nbsp;&nbsp;&nbsp;' + (fileValue[i].size/1024).toFixed(2) + ' kb</span>' +
			  			'&nbsp;&nbsp;<button type="button" class="input-search-close icon md-close" name="newFileDelBtn" onclick="newFileDel(this)"></button>' +
			  			'</li>';
		  			
  					$("#contestFile-list").append(str);
  				}
  			}
	  	}
  	}
  	
  	function newFileDel(_this) {
  		var fileName = $(_this).siblings().first().val();
  		
  		for (var i = 0; i < contestFileList.length; i++) {
  			if (fileName === contestFileList[i].name) {
  				contestFileList.splice(i, 1);
  				
  				$(_this).parent().remove();
  				
  				$("#contestFileTitle").val( '파일 '+ contestFileList.length + '개');
  			}
  		}
  	}
  
  	function propFileChange() {
      
	  	var fileValue = $("#propFile")[0].files[0];

	  	if (fileValue !== undefined) {
	  		$("#propFileTitle").val( '파일 '+$("#propFile")[0].files.length+'개');
	  			
	  		for( var i = 0; i <$("#propFile")[0].files.length; i++ ){
	  			
	  			var str = '<li>'+
	  			'<input type="hidden" name="save_file_name" value="'+ +$("#propFile")[0].files[i].name+ '">'+
	  			'<span class="file-img"></span>'+
	  			'<a href="#this" name="file"> (new) '+$("#propFile")[0].files[i].name+'</a>' +
	  			'<span>&nbsp;&nbsp;&nbsp;&nbsp;'+($("#propFile")[0].files[i].size/1024).toFixed(2)+' kb</span>'+
	  			'</li>';
	  			$("#propFile-list").append(str);
	  		}
	  		//$("#attachDelBtn").show();
	  	} else {
	  		$("#contestFileTitle").val("");
	  		//$("#attachDelBtn").hide();
	  		$("#contestFileName-list").children().remove();
	  	}
	}
	
	$("#contestFile-list").children().remove();
	$("#propFile-list").children().remove();
	var fileList = new Array();
	var prop_file = {};
	var rep_file = {};	
	var contest_file = {};
	
	<c:forEach var="file" items="${contestFile}">
		var file = {};
		file.contest_idx 	= "${file.admin_contest_idx}";
		file.org_file_name 	= "${file.org_file_name}";
		file.save_file_name = "${file.save_file_name}";
		file.file_size 		= "${file.file_size}";
		file.create_user 	= "${file.create_user}";
		file.del_chk 		= "${file.del_chk}";
		file.attach_type 	= "${file.attach_type}";
		fileList.push(file);
	</c:forEach>
	
	if (fileList.length > 0) {
		for (var file of fileList) {
			if (file.attach_type.indexOf("contest") > -1) {
				var str = '<li>'+
            	'<input type="hidden" name="save_file_name" value="' + file.save_file_name + '">'+
    			'<span class="file-img"></span>'+
    			'<a href="#this" name="file">' +file.org_file_name+'</a>'+
    			'<span>&nbsp;&nbsp;&nbsp;&nbsp;'+file.file_size+'kb</span>'+
    			'&nbsp;&nbsp;<button type="button" class="input-search-close icon md-close" name="FileDelBtn" ></button>'+
    			'</li>';
				$("#contestFile-list").append(str);
			} else if (file.attach_type.indexOf("prop") > -1) {
				var str =  '<li>'+
	            	'<input type="hidden" name="save_file_name" value="' + file.save_file_name + '">'+
	    			'<span class="file-img"></span>'+
	    			'<a href="#this" name="file">' +file.org_file_name+'</a>'+
	    			'<span>&nbsp;&nbsp;&nbsp;&nbsp;'+file.file_size+'kb</span>'+
	    			'&nbsp;&nbsp;<button type="button" class="input-search-close icon md-close" name="FileDelBtn" ></button>'+
	    			'</li>';
					$("#propFile-list").append(str);
			} else if (file.attach_type.indexOf("rep") > -1){
			}
		}
	}
	
	$("button[name='FileDelBtn']").click(function() {

		var save_file_name = $(this).parent().find("input[name='save_file_name']").val();
		
		if (!confirm("해당 파일이 삭제됩니다. 삭제하시겠습니까?")) return;
		
		var idx = $("#admin_contest_idx").val();

		var request = $.ajax({
			url: "/contest/deleteAttachFile.do",
			method: "post",
			//contentType: "application/json",
			//dataType: "json",
			data: { file_name : save_file_name}
		});
		request.done(function(data) {
			console.log("request done");
			
			if (data === "success") {
			
				var $target = $("input[type='hidden'][name='save_file_name']");
		
				for (var i = 0; i < $target.length; i++) {
					if (save_file_name === $target.eq(i).val()) {
						$target.eq(i).parent().remove();
					}
				}
				
				for (var j = 0; j < fileList.length; j++) {
					if (fileList[j].attach_type === "contestFile" && fileList[j].save_file_name === save_file_name) {
						fileList.splice(j, 1);
					}
				}
			} else {
				//alert(data);
				$("#chk-error").text(data);
			}
		});
		request.fail(function(error) {
			console.log(error);
			console.log("request fail");
		});
	});

	$("#contestModifyBtn").click(function() {
		if (!confirm("수정 하시겠습니까?")) return false;
		
	
		
		$("#contestFile").attr("type", "text");
		$("#contestFile").attr("type", "file");
		
		var formData = new FormData($("#contestForm")[0]);
		
		for (var i = 0; i < contestFileList.length; i++) {
			formData.append("contestFile", contestFileList[i]);
		}
		
		var request = $.ajax({
            method: 'POST',
            url : "/contest/contestModify.do",
            enctype: "multipart/form-data",
            processData: false,
            contentType: false,
            data: formData
        });
        request.done(function(data){
        	
        	
        	if(typeof(data) == "object"){
        		valid(data);
        		return false;
        	}
        	
        	if(typeof(data) == "string"){
        		location.href = "${pageContext.request.contextPath}/contest/contestDetail.do?admin_contest_idx=" + data;
        	}
        });
        request.fail(function(data){
        	console.log(data);
        	
        });
	});
	
	function valid(data){	
		$("#chk-error-title").text('');
		$("#chk-error-content").text('');
	
		for(var i = 0; i < data.length; i++){
			var obj = data[i];
			
			for (var key in obj) {
				if(key=="title"){
					$("#chk-error-title").text(obj[key]);
					
				}else if(key=="content"){
					$("#chk-error-content").text(obj[key]);
				}
			
			}
		}
	}
</script>


