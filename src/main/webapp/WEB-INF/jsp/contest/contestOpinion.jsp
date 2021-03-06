<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<div id="contestListTable" class="text-break"></div>

<div class="col-lg-12 mt-20">

	<button style="display: none;" type="button" data-toggle="modal" data-target="#contestOpnDetailModal" id="contestOpnDetailBtn">상세</button>
</div>


<!-- 열린제안 상세 모달 -->
<div class="modal fade" id="contestOpnDetailModal" aria-hidden="true" aria-labelledby="contestOpnDetailModal" role="dialog" tabindex="-1">
	<div class="modal-dialog modal-simple modal-center">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">x</span>
				</button>
				<h4 class="modal-title">열린제안 댓글 상세</h4>
			</div>
			<div class="modal-body">
				<form id="sgstOpnDetailForm" method="post">
					<div class="example-wrap">
						<h4 class="example-title">작성자</h4>
						<input type="text" class="form-control" name="create_user" id="detailCreateUser" value="" readonly />
						<h4 class="example-title">제안명</h4>
						<input type="text" class="form-control" name="title" id="detailTitle" value="" readonly />
						<h4 class="example-title">내용</h4>
						<textarea class="form-control" name="opinion_content" id="detailOpinionContent" rows="5" readonly></textarea>

						<input type="hidden" name="user_contest_idx" id="detailOpinionIdx" value="" />
					</div>
					<div class="form-gorup row mb-20">
						<div class="col-md-1"></div>
						<label class="col-md-2 col-form-label"></label>
						<div class="col-md-10">
							<div id="opinionFile-list"></div>
						</div>
					</div>
					<span class="text-left" id="chk-error"></span>
					<div style="text-align: center">
						<button type="button" class="btn btn-primary waves-effect waves-classics" name="sgstSubmitBtn" data-title="열린제안" id="contestOpinionDeleteBtn">삭제</button>
						<button type="button" class="btn btn-default waves-effect waves-classics" data-dismiss="modal" aria-label="Close" id="cancel-btn">취소</button>
					</div>
				</form>

			</div>
			<div class="modal-footer">
				<!-- <button type="button" class="btn btn-default btn-pure" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button> -->
			</div>
		</div>
	</div>
</div>
<!-- 열린제안 상세 모달 끝 -->

<script type="text/javascript">
	$(function() {
		getcontestOpinionList();
	});

	function setContestOpinionListTable(ContestList) {
		$('#contestListTable').jsGrid(
				{
					//height: "500px",
					width : "100%",

					//autoload:true,
					sorting : true,
					paging : true,
					//pageIndex: 1, default: 1
					pageSize : 10, // default: 20
					//pageButtonCount: 5, default: 15

					data : ContestList,

					fields : [
							{ name : "num", title : "번호", type : "text", width : 30, align : "center" },
							{ name : "create_user", title : "작성자", type : "text", width : 70 },
							{ title : "제목", type : "text", width : 150, itemTemplate : function(_, item) {
								var result = "";
								console.log("length = " + item.title.length);
								if (item.title.length > 30) {
									result = item.title.substring(0, 30) + '...';
								} else {
									result = item.title;
								}
								return result;
							} }, { title : "내용", type : "text", width : 200, itemTemplate : function(_, item) {
								var result = "";
								console.log("length = " + item.content.length);
								if (item.content.length > 30) {
									result = item.content.substring(0, 30) + '...';
								} else {
									result = item.content;
								}
								return result;
							} }, { name : "create_date", title : "등록일", type : "text", width : 100, align : "center" },
							{ title : "제안서", width : 100, align : "center", itemTemplate : function(_, item) {
								var result = "";

								if (parseInt(item.attach_cnt) > 0) {
									result += '<div class="icondemo vertical-align-middle">'
									result += '<i class="icon wb-download" aria-hidden="true"></i>';
									result += '</div>'
								}

								return result;
							} }
					],

					rowClick : function(args) {
						if (args.event.target.tagName == "I") {
							allDownload(args);
						} else if (args.event.target.cellIndex == 5) {

						} else {
							var idx = args.item.user_contest_idx;
							$("#contestOpnDetailBtn").trigger("click");

							$("#detailCreateUser").val(args.item.create_user);
							$("#detailTitle").val(args.item.title);
							$("#detailOpinionContent").val(args.item.content);
							$("#detailOpinionIdx").val(args.item.user_contest_idx);

							getContestOpinionFileList(idx);
						}
					} });

	}

	function getcontestOpinionList() {
		var idx = $("#admin_contest_idx").val();
		var request = $.ajax({ url : "/contest/getContestOpinionList.do?admin_contest_idx=" + idx, method : "get" });

		request.done(function(data) {
			setContestOpinionListTable(data);
		});

		request.fail(function(error) {
			console.log(error);
		});
	}

	$("#contestOpinionDeleteBtn").click(function() {
		if (!submitConfirm($(this)))
			return false;

		var idx = $("#detailOpinionIdx").val();
		var request = $.ajax({ url : "/contest/contestOpinionDelete.do?user_contest_idx=" + idx, method : "get" });

		request.done(function(data) {
			getcontestOpinionList();
			$("#cancel-btn").trigger("click");
		});

		request.fail(function(error) {
			console.log(error);
		});
	});

	function getContestOpinionFileList(idx) {
		var request = $.ajax({ url : "/contest/getContestOpinionFileList.do?user_contest_idx=" + idx, method : "get" });

		request.done(function(data) {
			setContestOpinionFileListTable(data);

		});

		request.fail(function(error) {
			console.log(error);
		});
	}

	function setContestOpinionFileListTable(fileList) {
		$("#opinionFile-list").children().remove();

		for (var i = 0; i < fileList.length; i++) {
			var str = '<li>' + '<input type="hidden" name="save_file_name" value="' + fileList[i].save_file_name + '">'
					+ '<span class="file-img"></span>' + '<a href="#this" name="opinionFile" onclick="opinionFileDownload(this)">'
					+ fileList[i].org_file_name + '</a>' + '<span>&nbsp;&nbsp;&nbsp;&nbsp;' + fileList[i].file_size + 'kb</span>' + '</li>';

			$("#opinionFile-list").append(str);
		}
	}

	function opinionFileDownload(_this) {
		var save_file_name = $(_this).siblings().first().val();

		fn_downloadOpinionFile(save_file_name);
	}

	function allDownload(args) {
		var request = $.ajax({ url : "/contest/getSaveFileName.do?user_contest_idx=" + args.item.user_contest_idx, method : "get" });

		request.done(function(data) {
			(function() {
				var i = 0;

				(function run() {
					fn_downloadOpinionFile(data[i].save_file_name);

					if (i < (data.length - 1)) {
						setTimeout(run, 500); // <--- 딜레이 타임
						i++;
					} else {
						return false;
					}
				}());
			}());
		});

		request.fail(function(error) {
			console.log(error);
		});
	}

	function fn_downloadOpinionFile(save_file_name) {
		location.href = "${pageContext.request.contextPath}/contest/downloadFile.do?type=user&save_file_name=" + save_file_name;
	}
</script>