<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    
<!-- Page -->
<div class="page">
	<div class="page-content container-fluid">
	    <!-- Page -->
	    <h1 class="page-title">게시판 상세</h1>
	    <ol class="breadcrumb">
	      <li class="breadcrumb-item"><a href="../index.html">Home</a></li>
	      <li class="breadcrumb-item"><a href="javascript:void(0)">Board</a></li>
	      <li class="breadcrumb-item active">BoardDetail</li>
	    </ol>
	
		<div class="col-lg-12">
			<div class="mb-30">
				<div class="panel">
					<div class="panel-body">
					          <form:form method="post" modelAttribute="boardVo">
						         	<form:input type="hidden" class="form-control" path="notice_idx"/>
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
											<label class="col-md-2 col-form-label">내용 </label>
											<div class="col-md-8">
												<form:textarea type="text" class="form-control" path="content" rows="5"/>
												<form:errors path="content"/>
											</div>
										</div>
								    	<div class="form-group row">
											<div class="col-md-1"></div>
											<label class="col-md-2 col-form-label">첨부파일 </label>
											<div class="col-md-8">
												
									            	<c:forEach var="boardFile" items="${boardFile}" varStatus="status">
									            		
									            		<li>
									            		<input type="hidden" id="save_file_name" value="${boardFile.save_file_name}">
									            			<span class="file-img"></span>
									            			<a href="#this" name="file">${boardFile.org_file_name}</a>
									            			<span>${boardFile.file_size } kb</span>
									            		</li>
									            	</c:forEach>
									        
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
</script>


