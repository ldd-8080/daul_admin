<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="page">
	<div class="page-content container-fluid">
		<div class="row" data-plugin="matchHeight" data-by-row="true">

			<div class="col-lg-6 col-xl-4">
				<!-- Panel Projects -->
				<div class="panel panel-bordered">
					<form method="post" id="sgstForm">
						<div class="panel-heading">
							<h3 class="panel-title">열린제안 알림톡 설정</h3>
							<div class="panel-actions panel-actions-keep">
								<button type="button" class="btn btn-primary" name="save_notification_btn" data-form="sgstForm" data-title="열린제안 알림톡">저장</button>
								<!-- <button class="btn btn-default">취소</button> -->
							</div>
						</div>
						<div class="table-responsive px-10 py-20">
							<table class="table table-striped">
								<thead>
									<tr>
										<th class="w-p35 text-center">액션</th>
										<th class="w-p35 text-center">템플릿 ID</th>
										<th class="w-p15 text-center">on/off</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="sgstNoti" items="${sgstNotiList}" varStatus="status">
										<tr>
											<td class="text-center align-middle">${sgstNoti.action_name}</td>
											<td class="text-center align-middle">
												<input type="text" class="form-control" placeholder="템플릿 ID" autocomplete="off" name="data[${status.index}][template_id]" value="${sgstNoti.template_id}"/>
											</td>
											<td class="text-center align-middle">
												<span class="inline-block">
													<input type="checkbox" data-color="#17b3a3" data-plugin="switchery" name="data[${status.index}][on_off]" value="Y" <c:if test="${sgstNoti.on_off eq 'Y'}">checked</c:if>/>
												</span>
												<input type="hidden" name="data[${status.index}][idx]" value="${sgstNoti.idx}"/>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</form>
				</div>
				<!-- End Panel Projects -->
			</div>

			<div class="col-lg-6 col-xl-4">
				<!-- Panel Projects -->
				<div class="panel panel-bordered">
					<form method="post" id="surveyForm">
						<div class="panel-heading">
							<h3 class="panel-title">설문조사 알림톡 설정</h3>
							<div class="panel-actions panel-actions-keep">
								<button type="button" class="btn btn-primary" name="save_notification_btn" data-form="surveyForm" data-title="설문조사 알림톡">저장</button>
								<!-- <button class="btn btn-default">취소</button> -->
							</div>
						</div>
						<div class="table-responsive px-10 py-20">
							<table class="table table-striped">
								<thead>
									<tr>
										<th class="w-p35 text-center">액션</th>
										<th class="w-p35 text-center">템플릿 ID</th>
										<th class="w-p15 text-center">on/off</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="surveyNoti" items="${surveyNotiList}" varStatus="status">
										<tr>
											<td class="text-center align-middle">${surveyNoti.action_name}</td>
											<td class="text-center align-middle">
												<input type="text" class="form-control" placeholder="템플릿 ID" autocomplete="off" name="data[${status.index}][template_id]" value="${surveyNoti.template_id}"/>
											</td>
											<td class="text-center align-middle">
												<span class="inline-block">
													<input type="checkbox" data-color="#17b3a3" data-plugin="switchery" name="data[${status.index}][on_off]" value="Y" <c:if test="${surveyNoti.on_off eq 'Y'}">checked</c:if>/>
												</span>
												<input type="hidden" name="data[${status.index}][idx]" value="${surveyNoti.idx}"/>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</form>
				</div>
				<!-- End Panel Projects -->
			</div>

			<div class="col-lg-6 col-xl-4">
				<!-- Panel Projects -->
				<div class="panel panel-bordered">
					<form method="post" id="contestForm">
						<div class="panel-heading">
							<h3 class="panel-title">공모제안 알림톡 설정</h3>
							<div class="panel-actions panel-actions-keep">
								<button type="button" class="btn btn-primary" name="save_notification_btn" data-form="contestForm" data-title="공모제안 알림톡">저장</button>
								<!-- <button class="btn btn-default">취소</button> -->
							</div>
						</div>
						<div class="table-responsive px-10 py-20">
							<table class="table table-striped">
								<thead>
									<tr>
										<th class="w-p35 text-center">액션</th>
										<th class="w-p35 text-center">템플릿 ID</th>
										<th class="w-p15 text-center">on/off</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="contestNoti" items="${contestNotiList}" varStatus="status">
										<tr>
											<td class="text-center align-middle">${contestNoti.action_name}</td>
											<td class="text-center align-middle">
												<input type="text" class="form-control" placeholder="템플릿 ID" autocomplete="off" name="data[${status.index}][template_id]" value="${contestNoti.template_id}"/>
											</td>
											<td class="text-center align-middle">
												<span class="inline-block">
													<input type="checkbox" data-color="#17b3a3" data-plugin="switchery" name="data[${status.index}][on_off]" value="Y" <c:if test="${contestNoti.on_off eq 'Y'}">checked</c:if>/>
												</span>
												<input type="hidden" name="data[${status.index}][idx]" value="${contestNoti.idx}"/>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</form>
				</div>
				<!-- End Panel Projects -->
			</div>

		</div>
	</div>
</div>

<script type="text/javascript">
	var save_btn_all = document.querySelectorAll("button[name='save_notification_btn']");
	
	for (var i = 0; i < save_btn_all.length; i++) {
		let save_btn = save_btn_all[i];
		
		save_btn.addEventListener("click", function() {
			if (!submitConfirm($(save_btn))) return false;
			
			var form_id = save_btn.dataset.form;
			var form_data = $("#" + form_id).serializeObject();
			
			var request = $.ajax({
				url: "/notification/modifyNotification.do",
				method: "post",
				contentType: "application/json",
				data: JSON.stringify(form_data)
			});
			
			request.done(function(data) {
				console.log("modifyNotification", data);
				if (data === "success") alert("수정이 완료 되었습니다.");
			});
			
			request.fail(function(error) {
				console.log("modifyNotification fail", error);
			});
		});
	}
</script>