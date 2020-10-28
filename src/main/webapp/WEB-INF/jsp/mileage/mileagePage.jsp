<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<div class="page">
	<div class="page-content container-fluid">
		<div class="row" data-plugin="matchHeight" data-by-row="true">

			<div class="col-lg-6 col-xl-4">
				<!-- Panel Projects -->
				<div class="panel panel-bordered">
					<form method="post" id="sgstForm">
						<div class="panel-heading">
							<h3 class="panel-title">열린제안 마일리지 설정</h3>
							<div class="panel-actions panel-actions-keep">
								<button type="button" class="btn btn-primary" name="save_mileage_btn" data-form="sgstForm" data-title="열린제안 마일리지">저장</button>
								<!-- <button class="btn btn-default">취소</button> -->
							</div>
						</div>
						<div class="table-responsive px-10 py-20">
							<table class="table table-striped">
								<thead>
									<tr>
										<th class="w-p35 text-center">액션</th>
										<th class="w-p35 text-center">마일리지</th>
										<th class="w-p15 text-center">on/off</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="sgstM" items="${sgstMList}" varStatus="status">
										<tr>
											<td class="text-center align-middle">${sgstM.action_name}</td>
											<td class="text-center align-middle">
												<input type="number" class="form-control" min="0" max="100" placeholder="0-100" autocomplete="off" name="data[${status.index}][mileage_value]" value="${sgstM.mileage_value}"/>
											</td>
											<td class="text-center align-middle">
												<span class="inline-block">
													<input type="checkbox" data-color="#17b3a3" data-plugin="switchery" name="data[${status.index}][on_off]" value="Y" <c:if test="${sgstM.on_off eq 'Y'}">checked</c:if>/>
												</span>
												<input type="hidden" name="data[${status.index}][idx]" value="${sgstM.idx}"/>
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
							<h3 class="panel-title">설문조사 마일리지 설정</h3>
							<div class="panel-actions panel-actions-keep">
								<button type="button" class="btn btn-primary" name="save_mileage_btn" data-form="surveyForm" data-title="설문조사 마일리지">저장</button>
								<!-- <button class="btn btn-default">취소</button> -->
							</div>
						</div>
						<div class="table-responsive px-10 py-20">
							<table class="table table-striped">
								<thead>
									<tr>
										<th class="w-p35 text-center">액션</th>
										<th class="w-p35 text-center">마일리지</th>
										<th class="w-p15 text-center">on/off</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="surveyM" items="${surveyMList}" varStatus="status">
										<tr>
											<td class="text-center align-middle">${surveyM.action_name}</td>
											<td class="text-center align-middle">
												<input type="number" class="form-control" min="0" max="100" placeholder="0-100" autocomplete="off" name="data[${status.index}][mileage_value]" value="${surveyM.mileage_value}"/>
											</td>
											<td class="text-center align-middle">
												<span class="inline-block">
													<input type="checkbox" data-color="#17b3a3" data-plugin="switchery" name="data[${status.index}][on_off]" value="Y" <c:if test="${surveyM.on_off eq 'Y'}">checked</c:if>/>
												</span>
												<input type="hidden" name="data[${status.index}][idx]" value="${surveyM.idx}"/>
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
							<h3 class="panel-title">공모제안 마일리지 설정</h3>
							<div class="panel-actions panel-actions-keep">
								<button type="button" class="btn btn-primary" name="save_mileage_btn" data-form="contestForm" data-title="공모제안 마일리지">저장</button>
								<!-- <button class="btn btn-default">취소</button> -->
							</div>
						</div>
						<div class="table-responsive px-10 py-20">
							<table class="table table-striped">
								<thead>
									<tr>
										<th class="w-p35 text-center">액션</th>
										<th class="w-p35 text-center">마일리지</th>
										<th class="w-p15 text-center">on/off</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="contestM" items="${contestMList}" varStatus="status">
										<tr>
											<td class="text-center align-middle">제안 등록</td>
											<td class="text-center align-middle">
												<input type="number" class="form-control" min="0" max="100" placeholder="0-100" autocomplete="off" name="data[${status.index}][mileage_value]" value="${contestM.mileage_value}"/>
											</td>
											<td class="text-center align-middle">
												<span class="inline-block">
													<input type="checkbox" data-color="#17b3a3" data-plugin="switchery" name="data[${status.index}][on_off]" value="Y" <c:if test="${contestM.on_off eq 'Y'}">checked</c:if>/>
												</span>
												<input type="hidden" name="data[${status.index}][idx]" value="${contestM.idx}"/>
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
	var save_btn_all = document.querySelectorAll("button[name='save_mileage_btn']");
	
	for (var i = 0; i < save_btn_all.length; i++) {
		let save_btn = save_btn_all[i];
		
		save_btn.addEventListener("click", function() {
			if (!submitConfirm($(save_btn))) return false;
			
			var form_id = save_btn.dataset.form;
			var form_data = $("#" + form_id).serializeObject();
			
			var request = $.ajax({
				url: "/mileage/modifyMileage.do",
				method: "post",
				contentType: "application/json",
				data: JSON.stringify(form_data)
			});
			
			request.done(function(data) {
				console.log("modifyMileage", data);
				if (data === "success") alert("수정이 완료 되었습니다.");
			});
			
			request.fail(function(error) {
				console.log("modifyMileage fail", error);
			});
		});
	}
</script>