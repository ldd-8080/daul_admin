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
									<a class="nav-link active" data-toggle="tab" href="#exampleTabsOne" aria-controls="exampleTabsOne" role="tab">
										 공  모
									</a>
								</li>
								<li class="nav-item" role="presentation">
									<a class="nav-link" data-toggle="tab" href="#exampleTabsTwo" aria-controls="exampleTabsTwo" role="tab">
										 제  안
									</a>
								</li>
							</ul>
							
							<div class="tab-content pt-20">
								<div class="tab-pane active" id="exampleTabsOne" role="tabpanel">
				
						          <form:form method="post" modelAttribute="contestVo" enctype="multipart/form-data">
							         	<form:input type="hidden" class="form-control" id = "admin_contest_idx" path="admin_contest_idx"/>
							         		<div class="form-group row">
												<div class="col-md-1"></div>
												<label class="col-md-2 col-form-label">등록자 </label>
												<div class="col-md-8">
													<form:input type="text" readonly="true" class="form-control" path="create_user"/>
													<form:errors path="create_user"/>
												</div>
											</div>
											<div class="form-group row">
												<div class="col-md-1"></div>
												<label class="col-md-2 col-form-label">제목 </label>
												<div class="col-md-8">
													<form:input type="text"  class="form-control" path="title"/>
													<form:errors path="title"/>
												</div>
											</div>
											<div class="form-group row">
												<div class="col-md-1"></div>
												<label class="col-md-2 col-form-label">설명 </label>
												<div class="col-md-8">
													<form:textarea type="text" class="form-control" path="content" rows="5"/>
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
													<div id="noticeFile-list">
													
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
													<div id="propFile-list">
													
													</div>
												</div>
											</div>
										
											
											 <div class="form-group form-material row">
												<div class="col-md-9">
													<button type="submit" class="btn btn-primary waves-effect waves-classic" id="contestModifyBtn" formaction="/contest/contestModify.do">수정 </button>
													<button type="submit" class="btn btn-primary waves-effect waves-classic" id="notcieDeleteBtn" formaction="/board/notieDelete.do">삭제 </button>
													<button type="button" class="btn btn-default btn-outline waves-effect waves-classic" id="noticeListBtn">목록 </button>
												</div>
											</div>
							    	</form:form>
							    	</div>
				    		<div class="tab-pane" id="exampleTabsTwo" role="tabpanel">
							    
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
	  
	  //setFileList();
   });
   
  function fn_downloadFile(obj){
	  //var save_file_name = obj.parent().find("#save_file_name").val();
	  location.href = "${pageContext.request.contextPath}/board/downloadFile.do?save_file_name=" + save_file_name;
  }
  
  $("#noticeFile").change(function() {
		noticeFileChange();
	});

  $("#propFile").change(function() {
		propFileChange();
	});


  function noticeFileChange() {
      
  	var fileValue = $("#noticeFile")[0].files[0];

  	if (fileValue !== undefined) {
		console.log(fileValue);
  		$("#noticeFileTitle").val( '파일 '+$("#noticeFile")[0].files.length+'개');
  			
  		for( var i = 0; i <$("#noticeFile")[0].files.length; i++ ){
  			console.log($("#noticeFile")[0].files[i].name);
  			
  			var str = '<li>'+
  			'<input type="hidden" name="save_file_name" value="'+ +$("#noticeFile")[0].files[i].name+ '">'+
  			'<span class="file-img"></span>'+
  			'<a href="#this" name="file"> (new) '+$("#noticeFile")[0].files[i].name+'</a>' +
  			'<span>&nbsp;&nbsp;&nbsp;&nbsp;'+($("#noticeFile")[0].files[i].size/1024).toFixed(2)+' kb</span>'+
  			'</li>';
  			$("#noticeFile-list").append(str);
  		}
  		//$("#attachDelBtn").show();
  	} else {
  		$("#noticeFileTitle").val("");
  		//$("#attachDelBtn").hide();
  		$("#noticeFileName-list").children().remove();
  	}
  }
  
  function propFileChange() {
      
	  	var fileValue = $("#propFile")[0].files[0];

	  	if (fileValue !== undefined) {
			console.log(fileValue);
	  		$("#propFileTitle").val( '파일 '+$("#propFile")[0].files.length+'개');
	  			
	  		for( var i = 0; i <$("#propFile")[0].files.length; i++ ){
	  			console.log($("#propFile")[0].files[i].name);
	  			
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
	  		$("#noticeFileTitle").val("");
	  		//$("#attachDelBtn").hide();
	  		$("#noticeFileName-list").children().remove();
	  	}
	  }
//function setFileList(){
	
	$("#noticeFile-list").children().remove();
	$("#propFile-list").children().remove();
	var fileList = new Array();
	var prop_file = {};
	var rep_file = {};	
	var notice_file = {};
	
	<c:forEach var="file" items="${contestFile}">
		var file = {};
		file.suggestion_idx = "${file.admin_contest_idx}";
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
			if (file.attach_type.indexOf("notice") > -1) {
				var str = '<li>'+
            	'<input type="hidden" name="save_file_name" value="' + file.save_file_name + '">'+
    			'<span class="file-img"></span>'+
    			'<a href="#this" name="file">' +file.org_file_name+'</a>'+
    			'<span>&nbsp;&nbsp;&nbsp;&nbsp;'+file.file_size+'kb</span>'+
    			'&nbsp;&nbsp;<button type="button" class="input-search-close icon md-close" name="FileDelBtn" ></button>'+
    			'</li>';
				$("#noticeFile-list").append(str);
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
//}
	
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
			console.log(data);
			console.log("request done");
			
			if (data === "success") {
			
				var $target = $("input[type='hidden']");
		
				for (var i = 0; i < $target.length; i++) {
					if (save_file_name === $target.eq(i).val()) {
						$target.eq(i).parent().remove();
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
	
</script>

