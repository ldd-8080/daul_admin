<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="page">
	<div class="page-content container-fluid">
		<div class="row" data-plugin="matchHeight" data-by-row="true">

			<div class="col-lg-6 col-xl-4">
				<!-- Panel Projects -->
				<div class="panel panel-bordered">
					<div class="panel-heading">
						<h3 class="panel-title">열린제안 알림톡 설정</h3>
						<div class="panel-actions panel-actions-keep">
							<button class="btn btn-primary">저장</button>
							<button class="btn btn-default">취소</button>
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
											<input type="text" class="form-control" placeholder="템플릿 ID" autocomplete="off" value="${sgstNoti.template_id}"/>
										</td>
										<td class="text-center align-middle">
											<span class="inline-block">
												<input type="checkbox" data-color="#17b3a3" data-plugin="switchery" checked />
											</span>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<!-- End Panel Projects -->
			</div>

			<div class="col-lg-6 col-xl-4">
				<!-- Panel Projects -->
				<div class="panel panel-bordered">
					<div class="panel-heading">
						<h3 class="panel-title">설문조사 알림톡 설정</h3>
						<div class="panel-actions panel-actions-keep">
							<button class="btn btn-primary">저장</button>
							<button class="btn btn-default">취소</button>
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
											<input type="text" class="form-control" placeholder="템플릿 ID" autocomplete="off" value="${surveyNoti.template_id}"/>
										</td>
										<td class="text-center align-middle">
											<span class="inline-block">
												<input type="checkbox" data-color="#17b3a3" data-plugin="switchery" checked />
											</span>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<!-- End Panel Projects -->
			</div>

			<div class="col-lg-6 col-xl-4">
				<!-- Panel Projects -->
				<div class="panel panel-bordered">
					<div class="panel-heading">
						<h3 class="panel-title">공모제안 알림톡 설정</h3>
						<div class="panel-actions panel-actions-keep">
							<button class="btn btn-primary">저장</button>
							<button class="btn btn-default">취소</button>
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
											<input type="text" class="form-control" placeholder="템플릿 ID" autocomplete="off" value="${contestNoti.template_id}"/>
										</td>
										<td class="text-center align-middle">
											<span class="inline-block">
												<input type="checkbox" data-color="#17b3a3" data-plugin="switchery" checked />
											</span>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<!-- End Panel Projects -->
			</div>

		</div>
	</div>
</div>
