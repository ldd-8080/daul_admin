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
						<div class="nav-tabs-horizontal" data-plugin="tabs">
							<ul class="nav nav-tabs" role="tablist">
								<li class="nav-item" role="presentation">
									<a class="nav-link active" data-toggle="tab" href="#exampleTabsOne" aria-controls="exampleTabsOne" role="tab">
										 제  안
									</a>
								</li>
								<li class="nav-item" role="presentation">
									<a class="nav-link" data-toggle="tab" href="#exampleTabsTwo" aria-controls="exampleTabsTwo" role="tab">
										 댓  글 (${suggestionOpinionSize})
									</a>
								</li>
							</ul>
							
							<div class="tab-content pt-20">
								<div class="tab-pane active" id="exampleTabsOne" role="tabpanel">
									<form:form method="post" modelAttribute="suggestionVo" enctype="multipart/form-data" id="sgstForm">
										<form:input type="hidden" class="form-control" path="suggestion_idx"/>
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
												<form:errors style="color:red;" path="title"/>
											</div>
										</div>
										<div class="form-group row">
											<div class="col-md-1"></div>
											<label class="col-md-2 col-form-label">제안내용 </label>
											<div class="col-md-8">
												<form:textarea type="text" class="form-control" path="content" rows="5"/>
												<form:errors style="color:red;" path="content"/>
											</div>
										</div>
										<div class="form-gorup row mb-20">
											<div class="col-md-1"></div>
											<label class="col-md-2 col-form-label">첨부파일</label>
											<div class="col-md-8">
												<div class="input-group input-group-file" data-plugin="inputGroupFile">
													<input type="text" class="form-control" id="sgstFileTitle" value="파일 0개" readonly/>
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
												<div id="sgstFile-list"></div>
											</div>
										</div>
										
										<div class="form-group row">
											<div class="col-md-1"></div>
											<label class="col-md-2 col-form-label">대표이미지 </label>
											<div class="col-md-8">
				                    			<input type="file" id="repFile" name="repFile" data-plugin="dropify" <%-- data-default-file="${pageContext.request.contextPath}/images/placeholder.png" --%>/>
				                  			</div>
										</div>
										
										<input type="hidden" name="update_user" value="${login.user_id}"/>
										
										<header class="panel-heading">
								        	<div class="panel-actions"></div>
								        </header>
								    
								        <br/>
										<div class="col-md-12 text-right">
											<div class="example example-buttons">  	
												<button type="button" class="btn btn-primary waves-effect waves-classic" id="sgstModifyBtn" data-title="열린제안">수정 </button>
												<button type="submit" class="btn btn-primary waves-effect waves-classic" name="sgstSubmitBtn" data-title="열린제안" formaction="/suggestion/suggestionDelete.do">삭제 </button>
												<button type="button" class="btn btn-default btn-outline waves-effect waves-classic" id="suggestionListBtn">목록 </button>
											</div>
										</div>
								
									</form:form>
								</div>
								<div class="tab-pane" id="exampleTabsTwo" role="tabpanel">
							        <%@ include file="./suggestionOpinion.jsp" %>
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
	getSuggestionOpinionList();
	
	$(window).on("load", function() {
		var _repFileTarget = $("div[class='dropify-preview']");
		_repFileTarget.find("span[class='dropify-render']").append("<img src='/suggestion/getImg.do?suggestion_idx=${suggestionVo.suggestion_idx}'>");
		_repFileTarget.attr("style", "display:block");
	});
	
	// 열린제안 파일 정보 init
	var fileList = new Array();
	var rep_file = {};
	
	<c:forEach var="file" items="${fileList}">
		var file = {};
		file.suggestion_idx = "${file.suggestion_idx}";
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
			if (file.attach_type.indexOf("rep") > -1) {
				rep_file = file;
			} else if (file.attach_type.indexOf("sgst") > -1) {
				var str = '<li>'+
	            	'<input type="hidden" name="save_file_name" value="' + file.save_file_name + '">'+
	    			'<span class="file-img"></span>'+
	    			'<a href="#this" name="file">' +file.org_file_name+'</a>'+
	    			'<span>&nbsp;&nbsp;&nbsp;&nbsp;'+file.file_size+'kb</span>'+
	    			'&nbsp;&nbsp;<button type="button" class="input-search-close icon md-close" name="FileDelBtn" ></button>'+
	    			'</li>';
    			
				$("#sgstFile-list").append(str);
			}
		}
	}
	
	$("#suggestionListBtn").click(function() {
		location.href = "${pageContext.request.contextPath}/suggestion/suggestionListPage.do";
	});
	
	var sgstFileList = new Array();
	
	function sgstFileChange() {
		var fileValue = $("#sgstFile")[0].files;

	  	// 새로 추가한 파일fileValue이 존재하면
	  	// 기존에 등록했던 파일들fileList과 비교를 하고
	  	// 새로 추가했던 파일들sgstFileList과 비교를 해서 sgstFileList에 push
	  	if (fileValue.length > 0) {
	  		for (var i = 0; i < fileValue.length; i++) {
  				var exist = false;
  				
  				for (var j = 0; j < fileList.length; j++) {
  					if (fileList[j].attach_type === "sgstFile") {
  						if (fileValue[i].name === fileList[j].org_file_name) {
  							console.log("this file is already registed", fileValue[i].name);
  							exist = true;
  							break;
  						}
  					}
  				}
  				
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
		  			
  					$("#sgstFile-list").append(str);
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
	
	$("button[name='FileDelBtn']").click(function() {
		var save_file_name = $(this).parent().find("input[name='save_file_name']").val();
		
		if (!confirm("해당 파일이 삭제됩니다. 삭제하시겠습니까?")) return;
		
			var request = $.ajax({
				url: "/suggestion/suggestionAttachFileDelete.do",
				method: "post",
				contentType: "application/json",
				data: JSON.stringify({file_name: save_file_name})
			});
			
			request.done(function(data) {
				console.log("request done", data);
				if (data === "success") {
					var $target = $("input[type='hidden'][name='save_file_name']");
					
					for (var i = 0; i < $target.length; i++) {
						if (save_file_name === $target.eq(i).val()) {
							$target.eq(i).parent().remove();
						}
					}
					
					for (var j = 0; j < fileList.length; j++) {
						if (fileList[j].attach_type === "sgstFile" && fileList[j].save_file_name === save_file_name) {
							fileList.splice(j, 1);
						}
					}
				}
			});
			
			request.fail(function(error) {
				console.log("request fail", error);
			});
	});
	
	$("#sgstOpnRegBtn").click(function() {
		$("#opinion_idx").val("");
	});

	$("#suggestionOpinionRegistBtn").click(function() {
		if (!submitConfirm($(this))) return false;
		
		var request = $.ajax({
			url: "/suggestion/suggestionOpinionRegist.do",
			method: "post",
			data: $("#sgstOpnRegForm").serialize()
		});
		
		request.done(function(data) {
			
			if (data === "success"){
				$("button[class='close']").click();
				
				getSuggestionOpinionList();
			}else{
				$("#chk-error-regist").text(data);
			}
		
		});
		
		request.fail(function(error) {
			console.log("request fail", error)
		});
	});
	
	$("button[name='sgstSubmitBtn']").click(function() {
		if (!submitConfirm($(this))) return false;
	});
	
	function getSuggestionOpinionList() {
		var idx = $("#suggestion_idx").val();
		var request = $.ajax({
			url: "/suggestion/getSuggestionOpinionList.do?suggestion_idx="+idx,
			method: "get"
		});
		
		request.done(function(data) {
			setSuggestionOpinionListTable(data);
		});
		
		request.fail(function(error) {
			console.log(error);
		});
	}
	
	function setSuggestionOpinionListTable(suggestionOpinionList) {
		$('#sgstOpnListTable').jsGrid({
		    //height: "500px",
		    width: "100%",

		    //autoload:true,
		    sorting: true,
		    paging: true,
		    //pageIndex: 1, default: 1
		    pageSize: 10, // default: 20
			//pageButtonCount: 5, default: 15
		    
		    data: suggestionOpinionList,

		    fields: [
		    	{name: "num",title: "번호", type: "text", width: 80, align: "center"}, 
		    	{name: "opinion_idx", title:"인덱스", type: "text", width: 80, css: "non-display"},
		    	{title: "내용", type: "text", width: 250, 
		    		itemTemplate: function(_, item) {
						var result = "";
		    			
		    			if (item.del_chk === 'Y') {
		    				result = "삭제된 댓글입니다.";
		    			} else {
		    				if (item.suggestion_indent !== "0") {
		    					for (var i = 0; i < item.suggestion_indent; i++) {
		    						result += '<i class="md-long-arrow-right" aria-hidden="true"></i> ';
		    					}
		    					
		    					result += item.opinion_content;
		    				} else {
			    				result = item.opinion_content;
		    				}
		    			}
		    				
		    			return result;
		    		}
	    		}, 
		    	{name: "create_user", title: "작성자", type: "text", width: 70}, 
		    	{name: "auth_type", title: "작성자 유형", type: "text", width: 70}, 
		    	{name: "like_count", title: "공감", type: "text", width: 30}, 
		    	{name: "create_date", title: "등록일", type: "text", width: 100, align: "center"}, 
		    	{title: "", width: 50, align: "center", 
		    		itemTemplate: function(_, item) {
		    			if (item.del_chk !== 'Y') {
			    			return '<button class="btn btn-primary btn-outline float-right waves-effect waves-classic" type="button" data-toggle="modal" data-target="#sgstOpnRegModal" name="opnToOpnModal" onclick="opnToOpnRegistBtn(this)">댓글 등록 </button>';
		    			}
		    		}
	    		}
	    	],
	    	
	    	rowClick: function(args) {
	    		if (args.item.del_chk !== 'Y' && args.event.target.cellIndex !== 6 && args.event.target.name !== "opnToOpnModal") {
	    			
	    			$("#chk-error-modify").text('');
	    			$("#chk-error-regist").text('');
	    			
		    		$("#sgstOpnDetailBtn").trigger("click");
					
					$("#detailCreateUser").val(args.item.create_user);
					$("#detailAuthType").val(args.item.auth_type);
					$("#detailOpinionContent").val(args.item.opinion_content);
					$("#detailOpinionIdx").val(args.item.opinion_idx);
	    		}
	    	}
		});
	}
	
	function opnToOpnRegistBtn(_this) {
		var opinion_idx = $(_this).parent().siblings(".non-display").text();
		
		$("#opinion_idx").val(opinion_idx);
		$("#opinion_content_textarea").val("");
		$("#chk-error-regist").text('');
	}
	
	function sgstOpnUpdate(type, _this) {
		if (!submitConfirm($(_this))) return false;
		
		var URL = "";
		
		if (type === 'mod') URL = "/suggestion/suggestionOpinionModify.do";
		else 				URL = "/suggestion/suggestionOpinionDelete.do";
		
		var request = $.ajax({
			url: URL,
			method: "post",
			data: $("#sgstOpnDetailForm").serialize()
		});
		
		request.done(function(data) {
			
			if (data === "success"){
				$("button[class='close']").click();
				getSuggestionOpinionList();
			}else{
				$("#chk-error-modify").text(data);
			}
		});
	}
	
	$("#sgstModifyBtn").click(function() {
		if (!submitConfirm($(this))) return false;
		
		$("#sgstFile").attr("type", "text");
		$("#sgstFile").attr("type", "file");
		
		var formData = new FormData($("#sgstForm")[0]);
		
		for (var i = 0; i < sgstFileList.length; i++) {
			formData.append("sgstFile", sgstFileList[i]);
		}
		
		var request = $.ajax({
			url: "/suggestion/suggestionModify.do",
			method: "post",
			enctype: "multipart/form-data",
			processData: false,
			contentType: false,
			data: formData
		});
		
		request.done(function(data) {
			if (typeof(data) === "object") {
				valid(data);
				
				return false;
			} else if (typeof(data) === "string") {
				location.href = "${pageContext.request.contextPath}/suggestion/suggestionListPage.do";
			}
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
	    	