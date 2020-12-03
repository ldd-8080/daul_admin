<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!-- Page -->
<div class="page">
	<div class="page-content container-fluid">
		<!-- Page -->
		<!-- <h1 class="page-title">사용자 목록</h1> -->
		<ol class="breadcrumb">
			<li class="breadcrumb-item">
				<a href="/main/main.do">Home</a>
			</li>
			<li class="breadcrumb-item">게시판</li>
			<li class="breadcrumb-item">공지사항</li>
			<li class="breadcrumb-item active">공지사항 작성</li>
		</ol>



		<div class="col-lg-12">
			<div class="mb-30">
				<div class="panel">
					<div class="panel-body">

						<form:form method="post" modelAttribute="boardVo" enctype="multipart/form-data">
							<div id="imgFileNameList"></div>
							<%-- <form:input type="hidden" id="notice_idx" value="${boardVo.notice_idx }" path="notice_idx" /> --%>
							<div class="form-group row">
								<div class="col-md-1"></div>
								<label class="col-md-2 col-form-label">작성자 </label>
								<div class="col-md-8">
									<form:input type="text" readonly="true" class="form-control" value="${login.user_id}" path="create_user" />
									<form:errors path="create_user" />
								</div>
							</div>
							<div class="form-group row">
								<div class="col-md-1"></div>
								<label class="col-md-2 col-form-label">구분 </label>
								<div class="col-md-8">
									<form:select data-plugin="selectpicker" class="w-p100" path="notice_type">
	    								<option value="main">일반</option>
	    								<option value="survey">설문조사</option>
	    								<option value="contest">나눔공모</option>
	    							</form:select>
	    							<form:errors style="color:red;" path="notice_type"/>
								</div>
							</div>
							<div class="form-group row">
								<div class="col-md-1"></div>
								<label class="col-md-2 col-form-label">제목 </label>
								<div class="col-md-8">
									<form:input type="text" class="form-control" path="title" id="title" />
									<form:errors style="color:red;" path="title" />
								</div>
							</div>
							<div class="form-group row">
								<div class="col-md-1"></div>
								<label class="col-md-2 col-form-label">공지내용 </label>
								<div class="col-md-8">
									<form:textarea name="content" style="display: none;" path="content" />
									<div id="summernote"></div>
									<p style="color:red;">*내용 입력중 '(작은따옴) 대신 다른 기호로 대체하여 사용해주시기 바랍니다.</p>
								</div>
								
							</div>

							<div class="form-gorup row mb-20">
								<div class="col-md-1"></div>
								<label class="col-md-2 col-form-label">첨부파일</label>
								<div class="col-md-7">
									<div class="input-group input-group-file" data-plugin="inputGroupFile">
										<input type="text" class="form-control" id="noticeFileTitle" value="파일 0개" readonly />
										<span class="input-group-append">
											<span class="btn btn-primary btn-file">
												<i class="icon md-upload" aria-hidden="true"></i>
												<input multiple="multiple" type="file" id="noticeFile" name="noticeFile" />
											</span>
										</span>
									</div>
								</div>
							</div>
							<div class="form-gorup row mb-20">
								<div class="col-md-1"></div>
								<label class="col-md-2 col-form-label"></label>
								<div class="col-md-8">
									<div id="noticeFile-list"></div>
								</div>
							</div>
							<div class="form-group form-material row">
								<div class="col-md-12 text-right">
									<button type="submit" class="btn btn-primary waves-effect waves-classic" id="boardRegistBtn" data-title="공지사항" formaction="/board/boardInsert.do">등록</button>
									<button type="button" class="btn btn-default btn-outline waves-effect waves-classic" id="boardListBtn">목록</button>
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
	$("#boardListBtn").click(function() {
		location.href = "${pageContext.request.contextPath}/board/boardList.do";
	});

	$(document).ready(function() {
		
		$('#summernote').summernote({
			minHeight: 300,   // set minimum height of editor
			lang: 'ko-KR', // default: 'en-US'				// 한글 설정
			placeholder: '최대 2000자까지 쓸 수 있습니다. ',	//placeholder 설정
			callbacks: {	//여기 부분이 이미지를 첨부하는 부분
				onImageUpload : function(files) {
					uploadSummernoteImageFile(files[0],this)
				}
			}
		});
	});

	
	var noticeFileList = new Array();

	function noticeFileChange() {
		var fileValue = $("#noticeFile")[0].files;

		if (fileValue.length > 0) {
			for (var i = 0; i < fileValue.length; i++) {
				var exist = false;

				for (var k = 0; k < noticeFileList.length; k++) {
					if (fileValue[i].name === noticeFileList[k].name) {
						exist = true;
						break;
					}
				}

				if (!exist) {
					noticeFileList.push(fileValue[i]);

					$("#noticeFileTitle").val('파일 ' + noticeFileList.length + '개');

					var str = '<li>'
							+ '<input type="hidden" name="save_file_name" value="' + fileValue[i].name + '">'
							+ '<span class="file-img"></span>'
							+ '<a href="#this" name="file"> (new) '
							+ fileValue[i].name
							+ '</a>'
							+ '<span>&nbsp;&nbsp;&nbsp;&nbsp;'
							+ (fileValue[i].size / 1024).toFixed(2)
							+ ' kb</span>'
							+ '&nbsp;&nbsp;<button type="button" class="input-search-close icon md-close" name="newFileDelBtn" onclick="newFileDel(this)"></button>'
							+ '</li>';

					$("#noticeFile-list").append(str);
				}
			}
		}
	}

	function newFileDel(_this) {
		var fileName = $(_this).siblings().first().val();

		for (var i = 0; i < noticeFileList.length; i++) {
			if (fileName === noticeFileList[i].name) {
				noticeFileList.splice(i, 1);

				$(_this).parent().remove();

				$("#noticeFileTitle").val('파일 ' + noticeFileList.length + '개');
			}
		}
	}

	$("#noticeFile").change(function() {
		noticeFileChange();
	});

	$("#boardRegistBtn").click(function() {
		
		if(document.getElementById('title').value == ""){
			alert("제목은 필수값 입니다.");
			return false;
		}
		
		
		if (!submitConfirm($(this)))
			return false;

		$('textarea[name="content"]').val($('#summernote').summernote('code'));

		appendImgFileName();

	});

	function requestDelete(_this) {
		var id = $(_this).attr("id").split("_")[1];
	}

	function appendImgFileName() {
		var summernoteElement = document.getElementById("summernote");

		var imgElementList = summernoteElement.parentElement.querySelectorAll("div.note-editor img");

		for (var i = 0; i < imgElementList.length; i++) {
			console.log(summernoteElement.parentElement.querySelectorAll("div.note-editor img")[i].src.split("=")[1]);
			var imgFileName = summernoteElement.parentElement.querySelectorAll("div.note-editor img")[i].src.split("=")[1];
			var str = '<input type="hidden" name="imgFileName" value="' + imgFileName + '">';
			console.log(str);
			$("#imgFileNameList").append(str);
		}
	}
	
	
	
</script>
