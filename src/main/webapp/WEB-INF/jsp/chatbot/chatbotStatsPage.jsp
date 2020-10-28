<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- Page -->
<div class="page">
	<div class="page-content container-fluid">
		<div class="row" data-plugin="matchHeight" data-by-row="true">
			<div class="col-12">
				<div class="panel panel-bordered">
					<div class="panel-heading">
						<h5 class="panel-title">챗봇 응답 현황</h5>
		                <!-- <div class="panel-actions panel-actions-keep">
		                  <button id="btnMoveAddForm" type="button" class="btn btn-primary">
		                    <i class="icon md-plus"></i>등록</button>
		                </div> -->
					</div>
					<div class="panel-body">
						<div class="row mb-20">
							<div class="col-sm-12 col-md-6 col-xl-8">
								<label class="float-left mr-10">기간</label>
								<div class="datepicker input-daterange float-left w-400">
									<div class="input-daterange" data-plugin="datepicker">
										<div class="input-group">
											<span class="input-group-addon w-40 pt-5">
												<i class="icon md-calendar" aria-hidden="true"></i>
											</span>
											<input type="text" id="inputStartDate" class="form-control static_option" name="start" />
										</div>
										<div class="input-group">
											<span class="input-group-addon w-40 pt-5">to</span>
											<input type="text" id="inputEndDate" class="form-control static_option" name="end" />
										</div>
									</div>
								</div>
							</div>
							<div class="col-sm-12 col-md-6 col-xl-4">
								<div class="row no-space">
									<div class="col-xl-4 col-md-6">
										<div class="counter ">
											<div class="counter-label ">챗봇 응답</div>
											<div class="counter-number-group text-truncate">
												<span class="counter-number">1,800</span>
											</div>
										</div>
									</div>
									<div class="col-xl-4 col-md-6">
										<div class="counter ">
											<div class="counter-label ">응답 성공</div>
											<div class="counter-number-group text-truncate">
												<span class="counter-number">1,000</span>
											</div>
										</div>
									</div>
									<div class="col-xl-4 col-md-6">
										<div class="counter ">
											<div class="counter-label ">응답 실패</div>
											<div class="counter-number-group text-truncate">
												<span class="counter-number">800</span>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="card p-20" id="widgetChatbot">
							<div class="card-block pt-5">
								<div class="ct-chart h-300"></div>
								<ul class="list-inline text-center mt-20 mb-0">
									<li class="list-inline-item"><i class="icon wb-large-point indigo-600 mr-10" aria-hidden="true"></i>전체 응답</li>
									<li class="list-inline-item ml-35"><i class="icon wb-large-point teal-600 mr-10" aria-hidden="true"></i>응답 성공</li>
									<li class="list-inline-item ml-35"><i class="icon wb-large-point red-600 mr-10" aria-hidden="true"></i>응답 실패</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-12">
				<div class="panel panel-bordered">
					<div class="panel-heading">
						<h5 class="panel-title">챗봇 응답 기록</h5>
		                <!-- <div class="panel-actions panel-actions-keep">
		                  <button id="btnMoveAddForm" type="button" class="btn btn-primary">
		                    <i class="icon md-plus"></i>등록</button>
		                </div> -->
					</div>
					<div class="panel-body">
						<div id="DataTables_Table_0_wrapper" class="dataTables_wrapper container-fluid dt-bootstrap4 ">
							<div class="row">
								<div class="col-sm-12">
									<table class="table table-hover dataTable table-striped w-full dtr-inline" data-plugin="dataTable" id="DataTables_Table_0" role="grid" aria-describedby="DataTables_Table_0_info" style="width: 1153px;">
										<thead>
											<tr role="row">
												<!-- <th class="sorting_asc" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Name: activate to sort column descending">Question</th> -->
												<!-- <th tabindex="0" rowspan="1" colspan="1" aria-label="Position: activate to sort column ascending">Answer</th> -->
												<th class="w-p5">idx</th>
												<th class="w-p10">채널</th>
												<th class="w-p30">질의</th>
												<th class="w-p15">응답</th>
												<th class="w-p15">인텐트</th>
												<th class="w-p15">시간</th>
												<th class="w-p10">사용자</th>
											</tr>
										</thead>
										<!-- <tfoot>
				                          <tr><th rowspan="1" colspan="1">Name</th><th rowspan="1" colspan="1">Position</th><th rowspan="1" colspan="1">Office</th><th rowspan="1" colspan="1">Age</th><th rowspan="1" colspan="1">Date</th><th rowspan="1" colspan="1">Salary</th></tr>
				                        </tfoot> -->
										<tbody>
											<tr class="hand" role="row">
												<td>19</td>
												<td>Kakao</td>
												<td>안녕하세요</td>
												<td>응답 성공</td>
												<td>챗봇시작하기</td>
												<td>2020-10-09 10:22:24</td>
												<td>
													<a href="">김선호</a>
												</td>
											</tr>
											<tr class="hand" role="row">
												<td>14</td>
												<td>Kakao</td>
												<td>너 바보냐?</td>
												<td>응답 실패</td>
												<td>no_understand</td>
												<td>2020-10-09 10:21:20</td>
												<td>
													<a href="">김선호</a>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<div class="row mt-10">
								<div class="col-sm-12 col-md-5">
									<select class="form-control float-left w-100 mr-10">
										<option value="10">10</option>
										<option value="25">25</option>
										<option value="50">50</option>
										<option value="100">100</option>
										<option value="all">All</option>
									</select>
									<div class="dataTables_info" id="DataTables_Table_0_info" role="status" aria-live="polite">Showing ${startIndex} to ${endIndex} of ${itemLength} entries</div>
								</div>
								<div class="col-sm-12 col-md-7">
									<div class="dataTables_paginate paging_simple_numbers float-right" id="DataTables_Table_0_paginate">
										<ul class="pagination">
											<li class="paginate_button page-item previous" id="DataTables_Table_0_previous"><a href="#" aria-controls="DataTables_Table_0" data-dt-idx="0" tabindex="0" class="page-link">Previous</a></li>
											<li class="paginate_button page-item"><a href="#" aria-controls="DataTables_Table_0" data-dt-idx="1" tabindex="0" class="page-link">${idx}</a></li>
											<li class="paginate_button page-item"><a href="#" aria-controls="DataTables_Table_0" data-dt-idx="1" tabindex="0" class="page-link">${idx}</a></li>
											<li class="paginate_button page-item"><a href="#" aria-controls="DataTables_Table_0" data-dt-idx="1" tabindex="0" class="page-link">${idx}</a></li>
											<li class="paginate_button page-item next" id="DataTables_Table_0_next"><a href="#" aria-controls="DataTables_Table_0" data-dt-idx="6" tabindex="0" class="page-link">Next</a></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- End Page -->

<script type="text/javascript">
	$("#inputStartDate").val(lastMonth(1));
	$("#inputEndDate").val(today());
	
	new Chartist.Line("#widgetChatbot .ct-chart", { 
		labels : ['SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT'], 
		series : [
			[100, 50, 70, 110, 100, 200, 230], 
			[80, 40, 60, 90, 90, 190, 140], 
			[20, 10, 10, 20, 10, 10, 90]
		]
	}, 
	{ 
		low : 0, 
		showArea : true, 
		showPoint : true, 
		showLine : true, 
		lineSmooth : false, 
		fullWidth : true,
		chartPadding : { 
			top : 0, 
			right : 10, 
			bottom : 0, 
			left : 0 
		}, 
		axisX : { 
			showGrid : false, 
			labelOffset : { 
				x : -14, 
				y : 0 
			} 
		},
		axisY : { 
			labelOffset : { 
				x : -10, 
				y : 0 
			}, 
			labelInterpolationFnc : function labelInterpolationFnc(num) {
				return num % 1 === 0 ? num : false;
			} 
		}, 
		plugins : [Chartist.plugins.tooltip()] 
	});
</script>