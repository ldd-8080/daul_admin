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
										 댓  글
									</a>
								</li>
							</ul>
							
							<div class="tab-content pt-20">
								<div class="tab-pane active" id="exampleTabsOne" role="tabpanel">
									<form:form method="post" modelAttribute="suggestionVo" enctype="multipart/form-data">
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
													<input type="text" class="form-control" id="publicFileName" readonly/>
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
				                    			<input type="file" id="repFile" name="repFile" data-plugin="dropify" <%-- data-default-file="${pageContext.request.contextPath}/img/placeholder.png" --%>/>
				                  			</div>
										</div>
										
										<input type="hidden" name="update_user" value="${login.user_id}"/>
										
							            <div class="form-group form-material row">
											<div class="col-md-9 offset-md-9">
												<button type="submit" class="btn btn-primary waves-effect waves-classic" id="suggestionModifyBtn" formaction="/suggestion/suggestionModify.do">수정 </button>
												<button type="submit" class="btn btn-primary waves-effect waves-classic" id="suggestionDeleteBtn" formaction="/suggestion/suggestionDelete.do">삭제 </button>
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
	$(window).on("load", function() {
		var _repFileTarget = $("div[class='dropify-preview']");
		_repFileTarget.find("span[class='dropify-render']").append("<img src='/suggestion/getImg.do?suggestion_idx=${suggestionVo.suggestion_idx}'>");
		_repFileTarget.attr("style", "display:block");
	});
	
	// 열린제안 파일 정보 init
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
				$("#publicFileName").val(file.org_file_name);
				public_file = file;
			}
		}
	}
	
	// 열린제안 댓글 정보 init
	var sgstOpnList = new Array();
	
	<c:forEach var="suggestionOpinion" items="${suggestionOpinionList}">
		var sgstOpn = {};
		sgstOpn.opinion_idx			= "${suggestionOpinion.opinion_idx}";
		sgstOpn.suggestion_idx		= "${suggestionOpinion.suggestion_idx}";
		sgstOpn.parent_opinion_idx 	= "${suggestionOpinion.parent_opinion_idx}"; 
		sgstOpn.opinion_content 	= "${suggestionOpinion.opinion_content}";
		sgstOpn.like_count 			= "${suggestionOpinion.like_count}";
		sgstOpn.create_user 		= "${suggestionOpinion.create_user}";
		sgstOpn.create_date			= "${suggestionOpinion.create_date}";
		sgstOpn.update_user 		= "${suggestionOpinion.update_user}";
		sgstOpn.update_date 		= "${suggestionOpinion.update_date}";
		sgstOpn.del_chk 			= "${suggestionOpinion.del_chk}";
		sgstOpn.suggestion_ref 		= "${suggestionOpinion.suggestion_ref}";
		sgstOpn.suggestion_indent	= "${suggestionOpinion.suggestion_indent}";
		sgstOpn.suggestion_step		= "${suggestionOpinion.suggestion_step}";
		sgstOpn.auth_type			= "${suggestionOpinion.auth_type}";
		sgstOpnList.push(sgstOpn);
	</c:forEach>

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
	
	$("#suggestionDeleteBtn").click(function() {
		if (!confirm("삭제하시겠습니까?")) return false;
	});
	
	$("#sgstOpnRegBtn").click(function() {
		$("#opinion_idx").val("");
	});

	$("#suggestionOpinionRegistBtn").click(function() {
		var request = $.ajax({
			url: "/suggestion/suggestionOpinionRegist.do",
			method: "post",
			data: $("#sgstOpnRegForm").serialize()
		});
		
		request.done(function(data) {
			location.href = "${pageContext.request.contextPath}/suggestion/suggestionListPage.do";
		});
		
		request.fail(function(error) {
			console.log("request fail", error)
		});
	});
	
	$("#boardTable tr td").click(function(event) {
		if ($(this).get(0).cellIndex === 0) {
		} else {
			$("#sgstOpnDetailBtn").trigger("click");
			var idx = $(this).parent().children().eq(0).text();
			
			for (var sgstOpn of sgstOpnList) {
				if (sgstOpn.opinion_idx === idx) {
					$("#detailCreateUser").val(sgstOpn.create_user);
					$("#detailAuthType").val(sgstOpn.auth_type);
					$("#detailOpinionContent").val(sgstOpn.opinion_content);
					$("#detailOpinionIdx").val(sgstOpn.opinion_idx);
				}
			}
		}
	});
	
	$('#exampleStaticData').jsGrid({
	    //height: "500px",
	    width: "100%",

	    //autoload:true,
	    sorting: true,
	    paging: true,

	    data: sgstOpnList,

	    fields: [
	    	{name: "opinion_idx",title: "번호", type: "text", width: 80, align: "center"}, 
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
	    	{title: "", width: 50, align: "center", itemTemplate:'<button class="btn btn-primary btn-outline float-right waves-effect waves-classic" type="button" data-toggle="modal" data-target="#sgstOpnRegModal" name="opnToOpnModal">댓글 등록 </button>'}
    	],
    	
    	rowClick: function(args) {
    		console.log(args);
    	}
	});
	
	$("button[name='opnToOpnModal']").click(function() {
		//var opinion_idx = $(this).parent().parent().find("td[id^='seq_']").text();
		var opinion_idx = $(this).parent().parent().children().eq(0).text();
		$("#opinion_idx").val(opinion_idx);
	});
	/* 
 	var countries = [
		{Name: "", Id: 0}, 
		{Name: "United States", Id: 1}, 
	    {Name: "Canada", Id: 2}, 
	    {Name: "United Kingdom", Id: 3}, 
	    {Name: "France", Id: 4}, 
	    {Name: "Brazil", Id: 5}, 
	    {Name: "China", Id: 6}, 
	    {Name: "Russia",Id: 7}
    ];
	
	$('#exampleStaticData').jsGrid({
	    //height: "500px",
	    width: "100%",

	    sorting: true,
	    paging: true,

	    data: [
	    	{"Name": "Otto Clay", "Age": 61, "Country": 6, "Address": "Ap #897-1459 Quam Avenue", "Married": false}, 
	    	{"Name": "Connor Johnston", "Age": 73, "Country": 7, "Address": "Ap #370-4647 Dis Av.", "Married": false}
    	],

	    fields: [
	    	{name: "Name",title:"이름", type: "text", width: 150}, 
	    	{name: "Age", type: "number", width: 50}, 
	    	{name: "Address", type: "text", width: 200}, 
	    	{name: "Country", type: "select", items: countries, valueField: "Id", textField: "Name"}, 
	    	{name: "Married", type: "checkbox", title: "Is Married"}
    	]
	});
	 */
</script>
	    	