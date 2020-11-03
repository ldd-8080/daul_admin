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
						<div class="row mb-20" style="place-content: center;">
							<div class="col-xl-40 pr-60 pl-60" style="min-width: -webkit-fill-available;text-align: center;">
								<form id="search-form">
									<div class="form-group row">
										<!-- 등록일 -->
										<label class="col-md-1 col-form-label"><strong>등록일 </strong></label>
										<div class="col-md-5">
											<div class="input-daterange" data-plugin="datepicker">
												<div class="input-group">
													<div class="input-group-prepend">
														<span class="input-group-text">
															<i class="icon md-calendar" aria-hidden="true"></i>
														</span>
													</div>
													<input type="text" class="form-control" name="search_s_date" />
												</div>
												<div class="input-group">
													<div class="input-group-prepend">
														<span class="input-group-text">-</span>
													</div>
													<input type="text" class="form-control" name="search_e_date" />
												</div>
											</div>
										</div>
										<!-- 검색어 -->
										<label class="col-md-1 col-form-label"><strong>검색어 </strong></label>
										<div class="col-md-5">
											<div class="input-group">
												<div class="input-group-prepend w-p25">
													<select data-plugin="selectpicker" name="search_type">
														<option value="" selected>선택하세요</option>
														<option value="utterance">질의</option>
														<option value="intent_title">인텐트</option>
														<option value="name">사용자</option>
													</select>
												</div>
												<!-- <input type="text" class="form-control"> -->
												<input type="text" class="form-control" name="search" placeholder="검색어를 입력하세요." onkeyup="enterKey()">
											</div>
										</div>
									</div>
									<div class="form-group row">
										<div class="col-lg-12">
											<button type="button" class="btn btn-primary btn-outline float-right waves-effect waves-classic" id="searchBtn">검색</button>
										</div>
									</div>
								</form>
							</div>
						</div>
						<div class="row mb-20">
							<div class="col-sm-12 col-md-6 col-xl-8">
							</div>
							<div class="col-sm-12 col-md-6 col-xl-4">
								<div class="row no-space">
									<div class="col-xl-4 col-md-6">
										<div class="counter ">
											<div class="counter-label ">챗봇 응답</div>
											<div class="counter-number-group text-truncate">
												<span class="counter-number" id="totalCnt"></span>
											</div>
										</div>
									</div>
									<div class="col-xl-4 col-md-6">
										<div class="counter ">
											<div class="counter-label ">응답 성공</div>
											<div class="counter-number-group text-truncate">
												<span class="counter-number" id="successCnt"></span>
											</div>
										</div>
									</div>
									<div class="col-xl-4 col-md-6">
										<div class="counter ">
											<div class="counter-label ">응답 실패</div>
											<div class="counter-number-group text-truncate">
												<span class="counter-number" id="failCnt"></span>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="card p-20" id="widgetOverall">
							<div class="card-block pt-5">
								<div class="ct-chart h-300"></div>
								<ul class="list-inline text-center mt-20 mb-0">
									<li class="list-inline-item">
										<i class="icon wb-large-point indigo-600 mr-10" aria-hidden="true"></i>
										전체 응답
									</li>
									<li class="list-inline-item ml-35">
										<i class="icon wb-large-point teal-600 mr-10" aria-hidden="true"></i>
										응답 성공
									</li>
									<li class="list-inline-item ml-35">
										<i class="icon wb-large-point red-600 mr-10" aria-hidden="true"></i>
										응답 실패
									</li>
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

						
						<!-- 목록 테이블 -->
						<div class="panel">
							<header class="panel-heading">
								<div class="panel-actions"></div>
							</header>
							<br />
							<div class="panel-body" style="padding-top: 20px; padding-bottom: 1px;">
								<div id="statsListTable" class="text-break"></div>
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



	function setChart(data) {
			console.log("data = " + data);
		var labels_arr = [];
		var total_arr = [];
		var success_arr = [];
		var fail_arr = [];
		
		var total = 0;
		var success = 0;
		var fail = 0;
		
		if(data.length < 20){
			for (var i = 0; i < data.length; i++) {
				var d = data[i];
				labels_arr.push(d.date);
				total_arr.push(Number(d.total_count));
				success_arr.push(Number(d.success_count));
				fail_arr.push(Number(d.fail_count));
				
				total += Number(d.total_count);
				success += Number(d.success_count);
				fail += Number(d.fail_count);
			}
		}else{
			for (var i = 0; i < data.length; i++) {
				var d = data[i];
				if((i%5) != 0){
					labels_arr.push("");
				}else{
					labels_arr.push(d.date);
				}
				total_arr.push(Number(d.total_count));
				success_arr.push(Number(d.success_count));
				fail_arr.push(Number(d.fail_count));
				
				total += Number(d.total_count);
				success += Number(d.success_count);
				fail += Number(d.fail_count);
				
			}
		}
	
		 document.getElementById("totalCnt").innerHTML = total;
		 document.getElementById("successCnt").innerHTML = success;
		 document.getElementById("failCnt").innerHTML = fail;
		 
		console.log("total == " + total);
		console.log("success == " + success);
		console.log("fail == " + fail);
		new Chartist.Line('#widgetOverall .ct-chart', { 
			labels : labels_arr, 
			series : [
				total_arr,
				success_arr,
				fail_arr
			]
		}, 
		{ 
			low : 0, 
			showArea : true, 
			showPoint : true, 
			showLine : true, 
			fullWidth : true,
			chartPadding : { 
				top : 20, 
				right : 20, 
				bottom : 0, 
				left : 10 
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
			} 
		});
	}
	
	function getChatbotStatsList() {
		var request = $.ajax({ url : "/chatbotStats/getChatbotStatsList.do", method : "get", data : $("#search-form").serialize() });

		request.done(function(data) {
			console.log(data);

			setChatbotStatsListTable(data.list);
			
			//selectChartData();
			setChart(data.countList);
		});

		request.fail(function(error) {
			console.log(error);
		});
	}

	$(function() {
		var today = formatDate(new Date());
		var preday = formatPreWeekDate(new Date());
		$("input[name='search_s_date']").val(preday);
		$("input[name='search_e_date']").val(today);
		getChatbotStatsList();
	});

	$("#searchBtn").click(function() {
		getChatbotStatsList();
	});

	function enterKey() {
		if (window.event.keyCode === 13) {
			getChatbotStatsList();
		}
	}

	function setChatbotStatsListTable(statsList) {
		$('#statsListTable').jsGrid(
				{
					//height: "500px",
					width : "100%",

					//autoload:true,
					sorting : true,
					paging : true,
					//pageIndex: 1, default: 1
					pageSize : 10, // default: 20
					//pageButtonCount: 5, default: 15

					data : statsList,

					fields : [
							{ title : "채널", type : "text", width : 20, align : "center",	    		
								itemTemplate: function(_, item) {
					    			return "kakao";
					    		}
							},
							{ name : "utterance", title : "질의", type : "text", width : 70, align : "center" },
							{ title : "응답", type : "text", width : 20, align : "center",	    		
								itemTemplate: function(_, item) {
									var result = "";
									
									if(item.intent_title == "no_response"){
										result = "응답 실패";
									}else{
										result = "응답 성공";
									}
									
					    			return result;
					    		}
							},
							
							{ name : "intent_title", title : "인텐트", type : "text", width : 20, align : "center" },
							{ name : "create_date", title : "시간", type : "text", width : 20, align : "center" },
							{ name : "name", title : "사용자", type : "text", width : 20, align : "center" }
					],

					rowClick : function(args) {
					} });
	}
</script>