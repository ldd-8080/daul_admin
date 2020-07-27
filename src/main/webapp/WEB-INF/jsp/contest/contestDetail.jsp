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
					          <form:form method="post" modelAttribute="contestVo">
						         	<form:input type="hidden" class="form-control" path="admin_contest_idx"/>
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
											
										<div class="form-group row">
											<div class="col-md-1"></div>
											<label class="col-md-2 col-form-label">첨부파일 </label>
											<div class="col-md-8">
												
									            	<c:forEach var="contestFile" items="${contestFile}" varStatus="status">
									            		
									            		<li>
									            		<input type="hidden" id="save_file_name" value="${contestFile.save_file_name}">
									            			<span class="file-img"></span>
									            			<a href="#this" name="file">${contestFile.org_file_name}</a>
									            			<span>${contestFile.file_size } kb</span>
									            		</li>
									            	</c:forEach>
									        
											</div>
										</div>  
										
										
										
										
										<div class="form-group row">
											<div class="col-md-1"></div>
											<label class="col-md-2 col-form-label">공고문 </label>
											<div class="col-md-8">
												
									        <div id = "noticeFile-list">   	
									            		
									            	
									            
									            
									        </div>
											</div>
										</div> 
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
										
							    		 <div class="form-group form-material row">
											<div class="col-md-9 offset-md-9">
												<button type="submit" class="btn btn-primary waves-effect waves-classic" id="noticeModifyBtn" formaction="/board/noticeModify.do">수정 </button>
												<button type="submit" class="btn btn-primary waves-effect waves-classic" id="notcieDeleteBtn" formaction="/board/notieDelete.do">삭제 </button>
												<button type="button" class="btn btn-default btn-outline waves-effect waves-classic" id="noticeListBtn">목록 </button>
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
   $(document).ready(function(){
	  $("a[name='file']").on("click",function(e){
		  e.preventDefault();
		  fn_downloadFile($(this));
	  });
   });
   
  function fn_downloadFile(obj){
	  var save_file_name = obj.parent().find("#save_file_name").val();
	  location.href = "${pageContext.request.contextPath}/board/downloadFile.do?save_file_name=" + save_file_name;
  }
  
  
  
//열린제안 파일 정보 init
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
			if (file.attach_type.indexOf("prop") > -1) {
				var str = 
            	'<input type="hidden" id="save_file_name" value="' + file.save_file_name + '">'+
    			'<span class="file-img"></span>'+
    			'<a href="#this" name="file">' +file.org_file_name+'</a>'+
    			'<span>${file.file_size} kb</span>';
				$("#noticeFile-list").append(str);
			} else if (file.attach_type.indexOf("notice") > -1) {
			} else if (file.attach_type.indexOf("rep") > -1){
			}
		}
	}
	
	
</script>


