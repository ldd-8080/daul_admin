<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!-- Page -->
<div class="page">
	<div class="page-content container-fluid">
		<div class="row" data-plugin="matchHeight" data-by-row="true">
			<div class="col-sm-6 col-lg-4 col-xl-2">
				<!-- Card -->
				<div class="card card-shadow card-responsive card-block p-20">
					<div class="counter counter-md">
						<div class="counter-label text-uppercase">
							<i class="icon wb-home mr-5 indigo-600 font-size-18" aria-hidden="true"></i>
							홈페이지 방문
						</div>
						<div class="counter-number-group">
							<span class="counter-number-related font-size-14">오늘</span>
							<span class="counter-number">${mainVo.daysVisitorCount}</span>
						</div>
						<div class="counter-label text-uppercase ">
							<span class="counter-number-related small">누적 방문</span>
							<span class="counter-number">${mainVo.visitorCount}</span>
						</div>
					</div>
				</div>
				<!-- End Card -->
			</div>

			<div class="col-sm-6 col-lg-4 col-xl-2">
				<!-- Card -->
				<div class="card card-shadow card-responsive card-block p-20">
					<div class="counter counter-md">
						<div class="counter-label text-uppercase">
							<i class="icon wb-chat-working mr-5 yellow-700 font-size-18" aria-hidden="true"></i>
							카카오 챗봇 응답
						</div>
						<div class="counter-number-group">
							<span class="counter-number-related font-size-14">오늘</span>
							<span class="counter-number">${mainVo.daysChatbotCount}</span>
						</div>
						<div class="counter-label text-uppercase ">
							<span class="counter-number-related small">누적 응답</span>
							<span class="counter-number">${mainVo.chatbotCount}</span>
						</div>
					</div>
				</div>
				<!-- End Card -->
			</div>

			<div class="col-sm-6 col-lg-4 col-xl-2">
				<!-- Card -->
				<div class="card card-shadow card-responsive card-block p-20" id="member-board">
					<div class="counter counter-md">
						<div class="counter-label text-uppercase">
							<i class="icon wb-user mr-5 green-600 font-size-18" aria-hidden="true"></i>
							신규 회원
						</div>
						<div class="counter-number-group">
							<span class="counter-number-related font-size-14">최근7일</span>
							<span class="counter-number">${mainVo.daysMemberCount}</span>
						</div>
						<div class="counter-label text-uppercase ">
							<span class="counter-number-related small">누적 회원</span>
							<span class="counter-number">${mainVo.memberCount} </span>
						</div>
					</div>
				</div>
				<!-- End Card -->
			</div>

			<div class="col-sm-6 col-lg-4 col-xl-2">
				<!-- Card -->
				<div class="card card-shadow card-responsive card-block p-20">
					<div class="counter counter-md">
						<div class="counter-label text-uppercase">
							<i class="icon wb-envelope mr-5 red-500 font-size-18" aria-hidden="true"></i>
							신규 제안
						</div>
						<div class="counter-number-group">
							<span class="counter-number-related font-size-14">최근7일</span>
							<span class="counter-number">${mainVo.daysSuggestionCount}</span>
						</div>
						<div class="counter-label text-uppercase ">
							<span class="counter-number-related small">누적 제안</span>
							<span class="counter-number">${mainVo.suggestionCount}</span>
						</div>
					</div>
				</div>
				<!-- End Card -->
			</div>

			<div class="col-sm-6 col-lg-4 col-xl-2">
				<!-- Card -->
				<div class="card card-shadow card-responsive card-block p-20">
					<div class="counter counter-md">
						<div class="counter-label text-uppercase">
							<i class="icon wb-list-bulleted mr-5 orange-500 font-size-18" aria-hidden="true"></i>
							설문/공모 참여
						</div>
						<div class="counter-number-group">
							<span class="counter-number-related font-size-14">최근7일</span>
							<span class="counter-number">${mainVo.daysSurveyCount + mainVo.daysContestCount}</span>
						</div>
						<div class="counter-label text-uppercase ">
							<span class="counter-number-related small">누적 참여</span>
							<span class="counter-number">${mainVo.surveyCount + mainVo.contestCount}</span>
						</div>
					</div>
				</div>
				<!-- End Card -->
			</div>

			<div class="col-sm-6 col-lg-4 col-xl-2">
				<!-- Card -->
				<div class="card card-shadow card-responsive card-block p-20">
					<div class="counter counter-md">
						<div class="counter-label text-uppercase">
							<i class="icon wb-reply mr-5 blue-grey-700 font-size-18" aria-hidden="true"></i>
							신규 댓글
						</div>
						<div class="counter-number-group">
							<span class="counter-number-related font-size-14">최근7일</span>
							<span class="counter-number">${mainVo.daysOpinionCount}</span>
						</div>
						<div class="counter-label text-uppercase ">
							<span class="counter-number-related small">누적 댓글</span>
							<span class="counter-number">${mainVo.opinionCount} </span>
						</div>
					</div>
				</div>
				<!-- End Card -->
			</div>

			<div class="col-xl-9">
				<div class="card card-shadow card-responsive p-10" id="widgetOverall">
					<div class="card-header card-header-transparent pb-0">
						<h4 class="card-title">
							<span class="text-truncate">서비스 이용 현황</span>
						</h4>
					</div>
					<div class="card-block pt-5">
						<div class="mb-40 ">
							<div class="btn-group dropdown">
								<a class="text-body dropdown-toggle blue-grey-700 text-uppercase" data-toggle="dropdown" id="dropdown_main">홈페이지 이용 현황</a>
								<div class="dropdown-menu" role="menu" id="dropdown_menu">
									<input type="hidden" id="req_url" value="selectVisitorCnt"/>
									<a class="dropdown-item" role="menuitem" id="dropdown_visit" data-url="selectVisitorCnt">홈페이지 이용 현황</a>
									<a class="dropdown-item" role="menuitem" data-url="selectVisitorCnt1">카카오톡 챗봇 응답 현황</a>
									<a class="dropdown-item" role="menuitem" data-url="selectVisitorCnt2">열린제안 등록 현황</a>
									<a class="dropdown-item" role="menuitem" data-url="selectVisitorCnt3">설문조사/공모제안 참여 현황</a>
									<a class="dropdown-item" role="menuitem" data-url="selectVisitorCnt4">댓글 등록 현황</a>
								</div>
							</div>
							<div class="card-header-actions">
								<ul class="nav nav-tabs-sm nav-pills nav-pills-rounded product-filters" id="chart_date_list" data-form="chart_search_form">
									<li class="nav-item ">
										<a class="nav-link" data-range="one_week">지난 7일</a>
									</li>
									<li class="nav-item">
										<a class="nav-link" data-range="one_month">지난 30일</a>
									</li>
									<li class="nav-item">
										<a class="nav-link" data-range="three_month">지난 90일</a>
									</li>
									<li class="nav-item">
										<a class="nav-link" id="btnPopoverDateRange" data-toggle="modal">임의 기간 설정</a>
									</li>
								</ul>
							</div>
						</div>
						<div class="ct-chart h-300"></div>
					</div>
				</div>
			</div>


			<div class="col-xl-3">
				<div class="card card-shadow card-responsive p-10" id="widgetMileage">
					<div class="card-header card-header-transparent pb-5">
						<h4 class="card-title">
							<span class="text-truncate">마일리지</span>
						</h4>
						<div class="card-header-actions">
							<ul class="nav nav-tabs-sm nav-pills nav-pills-rounded product-filters" id="mileage_date_list" data-form="mileage_search_form">
								<li class="nav-item">
									<a class="nav-link" data-range="one_week">지난 7일</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" data-range="one_month">지난 30일</a>
								</li>
							</ul>
						</div>
					</div>
					<div class="card-block py-5">
						<ul class="list-group list-group-dividered list-group-full" style="height: 380px;" data-plugin="scrollable">
							<div data-role="container">
								<div data-role="content" id="mileage_list_div">
									<li class="list-group-item">
										<div class="media">
											<div class="pr-10">
												<span class="badge badge-default ml-5">일반인</span>
											</div>
											<div class="media-body w-full">
												<div class="float-right text-right">
													<p class="mb-0 blue-600">123</p>
													<small>누적 2,123</small>
												</div>
												<p class="mb-0">홍길동(id2234)</p>
												<small>제안 30회 | 댓글 438회 | 설문 8회 ...</small>
											</div>
										</div>
									</li>
								</div>
							</div>
						</ul>
					</div>
				</div>
			</div>

			<div class="col-xxl-4 col-lg-6">
				<div class="card card-shadow card-responsive p-10" id="widgetSuggestion">
					<div class="card-header card-header-transparent pb-0">
						<h4 class="card-title">
							<span class="text-truncate">열린제안</span>
							<div class="card-header-actions">
								<a class="btn btn-pure p-0" href="/suggestion/suggestionListPage.do">목록 보기</a>
							</div>
						</h4>
					</div>
					<div class="card-block py-10">
						<div class="list-group list-group-dividered list-group-full h-350" data-plugin="scrollable">
							<div data-role="container">
								<div data-role="content">
									<c:forEach var="sgst" items="${mainSuggestionList}">
										<a class="list-group-item justify-content-between" href="/suggestion/suggestionDetailPage.do?suggestion_idx=${sgst.suggestion_idx}">
											<c:if test="${sgst.isNew eq true}"><small class="badge badge-round badge-danger float-right">new</small></c:if>
											<h6 class="media-heading">${sgst.title }</h6>
											<p class="mb-0 small">${sgst.content }</p>
											<p class="mb-0 small">
												${sgst.create_user } | 댓글 ${sgst.opinion_cnt } | 공감 ${sgst.like_count } |
												<time class="media-meta">${sgst.create_date }</time>
											</p>
										</a>
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="col-xxl-4 col-lg-6">
				<div class="card card-shadow card-responsive p-10" id="widgetSurvey">
					<div class="card-header card-header-transparent pb-0">
						<h4 class="card-title">
							<span class="text-truncate">설문조사</span>
							<div class="card-header-actions">
								<a class="btn btn-pure p-0" href="/survey/surveyList.do">목록 보기</a>
							</div>
 						</h4>
					</div>
					<div class="card-block py-10">
						<div class="list-group list-group-dividered list-group-full">
							<c:forEach var="survey" items="${mainSurveyList}">
								<a class="list-group-item justify-content-between" href="/survey/surveyDetail.do?survey_idx=${survey.survey_idx}">
									<c:if test="${survey.ing eq '투표중'}"><small class="badge badge-round badge-success float-right">${survey.ing}</small></c:if>
									<c:if test="${survey.ing eq '투표전'}"><small class="badge badge-round badge-default float-right">${survey.ing}</small></c:if>
									<c:if test="${survey.ing eq '투표완료'}"><small class="badge badge-round badge-danger float-right">${survey.ing}</small></c:if>
									<h6 class="media-heading">${survey.title }</h6>
									<p class="mb-0 small">기간 | ${survey.s_date } ~ ${survey.e_date }</p>
									<p class="mb-0 small">댓글 ${survey.opinion_count } | 참여 ${survey.participation_count }</p>
								</a>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>

			<div class="col-xxl-4 col-lg-6">
				<div class="card card-shadow card-responsive p-10" id="widgetContest">
					<div class="card-header card-header-transparent pb-0">
						<h4 class="card-title">
							<span class="text-truncate">공모제안</span>
							<div class="card-header-actions">
								<a class="btn btn-pure p-0" href="/contest/contestListPage.do">목록 보기</a>
							</div>
						</h4>
					</div>
					<div class="card-block py-10">
						<div class="list-group list-group-dividered list-group-full">
							<c:forEach var="contest" items="${mainContestList}">
								<a class="list-group-item justify-content-between" href="/contest/contestDetail.do?admin_contest_idx=${contest.admin_contest_idx}">
									<c:if test="${contest.ing eq '공모진행중'}"><small class="badge badge-round badge-success float-right">${contest.ing}</small></c:if>
									<c:if test="${contest.ing eq '공모전'}"><small class="badge badge-round badge-default float-right">${contest.ing}</small></c:if>
									<c:if test="${contest.ing eq '공모종료'}"><small class="badge badge-round badge-danger float-right">${contest.ing}</small></c:if>
									<h6 class="media-heading">${contest.title}</h6>
									<p class="mb-0 small">공모기간 | ${contest.contest_s_date } ~ ${contest.contest_e_date }</p>
									<p class="mb-0 small">참여 ${contest.user_contest_cnt }</p>
								</a>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>

			<div class="col-xxl-6 col-lg-12">
				<div class="card card-shadow card-responsive p-10" id="widgetIssueKeywords">
					<div class="card-header card-header-transparent pb-0">
						<h4 class="card-title">
							<span class="text-truncate">제안 이슈 키워드</span>
						</h4>
						<div class="card-header-actions">
							<ul class="nav nav-tabs-sm nav-pills nav-pills-rounded product-filters" id="keyword_date_list" data-form="keyword_search_form">
								<li class="nav-item ">
									<a class="nav-link" data-range="one_week">지난 7일</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" data-range="one_month">지난 30일</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" data-range="three_month">지난 90일</a>
								</li>
								<li class="nav-item">
									<!-- <a class="nav-link">임의 기간 설정</a> -->
									<a class="nav-link" id="btnPopoverDateRange2" data-toggle="modal">임의 기간 설정</a>
								</li>
							</ul>
						</div>
					</div>
					<div class="card-block pt-30">
						<div class="row ">
							<div class="col-lg-8">
								<div id="keyword_jqcloud_div" class="jqcloud"></div>
							</div>
							<div class="col-lg-4">
								<h5 class="">이슈 키워드 순위</h5>
								<ul class="list-group list-group-dividered list-group-full h-350" data-plugin="scrollable">
									<div data-role="container">
										<div data-role="content" id="keyword_list_div">
											<li class="list-group-item">
												<div class="media">
													<div class="pr-20">9</div>
													<div class="media-body w-full">
														<div class="float-right">
															<small>823</small>
														</div>
														Willard Wood
													</div>
												</div>
											</li>
											<li class="list-group-item">
												<div class="media">
													<div class="pr-20">10</div>
													<div class="media-body w-full">
														<div class="float-right">
															<small>823</small>
														</div>
														Willard Wood
													</div>
												</div>
											</li>
										</div>
									</div>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="col-xxl-6 col-lg-12">
				<div class="card card-shadow card-responsive p-10" id="widgetSentiment">
					<div class="card-header card-header-transparent pb-0">
						<h4 class="card-title">
							<span class="text-truncate">댓글 감정 분석</span>
						</h4>
						<div class="card-header-actions">
							<ul class="nav nav-tabs-sm nav-pills nav-pills-rounded product-filters" id="emotion_date_list" data-form="emotion_search_form">
								<li class="nav-item ">
									<a class="nav-link" data-range="one_week">지난 7일</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" data-range="one_month">지난 30일</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" data-range="three_month">지난 90일</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" id="btnPopoverDateRange3" data-toggle="modal">임의 기간 설정</a>
								</li>
							</ul>
						</div>
					</div>
					<div class="card-block pt-30">
						<div class="row ">
							<div class="col-lg-6">
								<h5 class="blue-600">😊 긍정 댓글</h5>
								<ul class="list-group list-group-dividered list-group-full h-350" data-plugin="scrollable">
									<div data-role="container">
										<div data-role="content" id="positive_opinion_list_div">
											<li class="list-group-item">
												<div class="media">
													<div class="media-body w-full">
														<div class="float-right blue-600">0.92</div>
														<p class="mb-0">이건 진짜 너무 잘했어요. 항상 이러면 좋을텐데요...</p>
														<small>[열린제안] 대기환경 이슈를 위한 소통 플.. | 2018-06-12 20:50:48</small>
													</div>
												</div>
											</li>
										</div>
									</div>
								</ul>
							</div>
							<div class="col-lg-6">
								<h5 class="red-600">😡 부정 댓글</h5>
								<ul class="list-group list-group-dividered list-group-full h-350" data-plugin="scrollable">
									<div data-role="container">
										<div data-role="content" id="negative_opinion_list_div">
											<li class="list-group-item">
												<div class="media">
													<div class="media-body w-full">
														<div class="float-right red-600">0.92</div>
														<p class="mb-0">이건 진짜 너무하네요. 이러지 맙시다 좀...</p>
														<small>[열린제안] 대기환경 이슈를 위한 소통 플.. | 2018-06-12 20:50:48</small>
													</div>
												</div>
											</li>
										</div>
									</div>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- </div> -->
<!-- End Page -->

<!-- DateRange Modal -->
<div class="modal " id="exampleFormModal" aria-hidden="false" aria-labelledby="exampleFormModalLabel" role="dialog" tabindex="-1">
	<div class="modal-dialog modal-simple modal-center">
		<form class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
				<h4 class="modal-title" id="exampleFormModalLabel">기간 설정</h4>
			</div>
			<div class="modal-body"></div>
		</form>
	</div>
</div>
<!-- End Modal -->
<div id="popoverDateRange" style="display: none;">
	<div class="row ">
		<div class="col-xl-12 form-group">
			<div class="datepicker input-daterange" data-plugin="datepicker">
				<div class="input-group">
					<span class="input-group-addon w-40 pt-5">
						<i class="icon md-calendar" aria-hidden="true"></i>
					</span>
					<input type="text" id="inputStartDate" class="form-control static_option" name="start" />
				</div>
				<div class="input-group">
					<span class="input-group-addon w-40 pt-5">to</span>
					<input type="text" id="inputEndDate" class="form-control static_option" name="end"/>
				</div>
			</div>
		</div>
		<div class="col-md-12 text-right">
			<button class="btn btn-primary" data-dismiss="modal" type="button" id="set_ran_date_btn" data-type="chart">설정</button>
			<button id="btnClosePopoverDateRange" class="btn btn-default" data-dismiss="modal" type="button">닫기</button>
		</div>
	</div>
</div>
<div id="popoverDateRange2" style="display: none;">
	<div class="row ">
		<div class="col-xl-12 form-group">
			<div class="datepicker input-daterange" data-plugin="datepicker">
				<div class="input-group">
					<span class="input-group-addon w-40 pt-5">
						<i class="icon md-calendar" aria-hidden="true"></i>
					</span>
					<input type="text" id="inputStartDate2" class="form-control static_option" name="start" />
				</div>
				<div class="input-group">
					<span class="input-group-addon w-40 pt-5">to</span>
					<input type="text" id="inputEndDate2" class="form-control static_option" name="end"/>
				</div>
			</div>
		</div>
		<div class="col-md-12 text-right">
			<button class="btn btn-primary" data-dismiss="modal" type="button" id="set_ran_date_btn2" data-type="keyword">설정</button>
			<button id="btnClosePopoverDateRange2" class="btn btn-default" data-dismiss="modal" type="button">닫기</button>
		</div>
	</div>
</div>
<div id="popoverDateRange3" style="display: none;">
	<div class="row ">
		<div class="col-xl-12 form-group">
			<div class="datepicker input-daterange" data-plugin="datepicker">
				<div class="input-group">
					<span class="input-group-addon w-40 pt-5">
						<i class="icon md-calendar" aria-hidden="true"></i>
					</span>
					<input type="text" id="inputStartDate3" class="form-control static_option" name="start" />
				</div>
				<div class="input-group">
					<span class="input-group-addon w-40 pt-5">to</span>
					<input type="text" id="inputEndDate3" class="form-control static_option" name="end"/>
				</div>
			</div>
		</div>
		<div class="col-md-12 text-right">
			<button class="btn btn-primary" data-dismiss="modal" type="button" id="set_ran_date_btn3" data-type="emotion">설정</button>
			<button id="btnClosePopoverDateRange3" class="btn btn-default" data-dismiss="modal" type="button">닫기</button>
		</div>
	</div>
</div>

<form id="chart_search_form">
	<input type="hidden" name="search_s_date" id="search_s_date"/>
	<input type="hidden" name="search_e_date" id="search_e_date"/>
</form>
<form id="keyword_search_form">
	<input type="hidden" name="search_s_date" id="search_s_date2"/>
	<input type="hidden" name="search_e_date" id="search_e_date2"/>
</form>
<form id="emotion_search_form">
	<input type="hidden" name="search_s_date" id="search_s_date3"/>
	<input type="hidden" name="search_e_date" id="search_e_date3"/>
</form>
<form id="mileage_search_form">
	<input type="hidden" name="search_s_date" id="search_s_date4"/>
	<input type="hidden" name="search_e_date" id="search_e_date4"/>
</form>
<script type="text/javascript">
	var defaults = Plugin.getDefaults("webuiPopover"); // Example Webui Popover Pop with Table

	// popover option
	function setPopover(target, form_id) {
		var tableSettings = { 
				title : '기간 설정', 
				url : target, 
				width : 400, 
				animation : 'fade',
				dismissible : false, 
				backdrop : true,
				closeable : true, //display close button or not
				onShow: function($element) {
					$element.find("input[name='start']").val($("#" + form_id + " input[name='search_s_date']").val());
					$element.find("input[name='end']").val($("#" + form_id + " input[name='search_e_date']").val());
				}
		};
	
		return tableSettings;
	}

	// 임의 기간 설정 버튼 클릭시 활성화 되는 popover 설정
	$('#btnPopoverDateRange').webuiPopover($.extend({}, defaults, setPopover('#popoverDateRange', 'chart_search_form')));
	$('#btnPopoverDateRange2').webuiPopover($.extend({}, defaults, setPopover('#popoverDateRange2', 'keyword_search_form')));
	$('#btnPopoverDateRange3').webuiPopover($.extend({}, defaults, setPopover('#popoverDateRange3', 'emotion_search_form')));
	// popover 닫기 버튼 이벤트
	$('#btnClosePopoverDateRange').click(function() {$("#btnPopoverDateRange").webuiPopover('hide');});
	$('#btnClosePopoverDateRange2').click(function() {$("#btnPopoverDateRange2").webuiPopover('hide');});
	$('#btnClosePopoverDateRange3').click(function() {$("#btnPopoverDateRange3").webuiPopover('hide');});
	
	// popover 설정 버튼 이벤트
	var set_btn_all = document.querySelectorAll("button[id*='set_ran_date_btn']");
	
	for (var i = 0; i < set_btn_all.length; i++) {
		let set_btn = set_btn_all[i];
		
		set_btn.addEventListener("click", function(e) {
			var type = e.target.dataset.type;
			
			var search_s_date = document.getElementById(type + "_search_form").querySelector("input[name='search_s_date']");
			var search_e_date = document.getElementById(type + "_search_form").querySelector("input[name='search_e_date']");
			search_s_date.value = e.target.parentElement.previousElementSibling.querySelector("input[name='start']").value;
			search_e_date.value = e.target.parentElement.previousElementSibling.querySelector("input[name='end']").value;
			
			e.target.nextElementSibling.click();
			
			if 		(type.indexOf("chart") > -1)	selectChartData();
			else if (type.indexOf("keyword") > -1)	selectKeywordData();
			else if (type.indexOf("emotion") > -1)	selectEmotionOpinionData();
		});
	}
	
	var chart_date_list = document.getElementById("chart_date_list");
	dateRangeAClickEvent(chart_date_list);
	var keyword_date_list = document.getElementById("keyword_date_list");
	dateRangeAClickEvent(keyword_date_list);
	var emotion_date_list = document.getElementById("emotion_date_list");
	dateRangeAClickEvent(emotion_date_list);
	var mileage_date_list = document.getElementById("mileage_date_list");
	dateRangeAClickEvent(mileage_date_list);
	
	function dateRangeAClickEvent(el) {
		var el_a_list = el.querySelectorAll("a");
		
		// 지난7일,30일,90일 버튼 클릭 이벤트
		for (var j = 0; j < el_a_list.length; j++) {
			let a = el_a_list[j];
			
			a.addEventListener("click", function(e) {
				for (var k = 0; k < el_a_list.length; k++) {
					let a = el_a_list[k];
					a.classList.remove("active");
				}
				
				if (!e.target.classList.contains("active"))	e.target.classList.add("active");
				
				var form_id = el.dataset.form;
				var search_s_date = document.getElementById(form_id).querySelector("input[name='search_s_date']");
				var search_e_date = document.getElementById(form_id).querySelector("input[name='search_e_date']");
				
				// 날짜설정
				var range = e.target.dataset.range;
	
				if (range !== undefined) {
					if 		(range === "one_week")		search_s_date.value = lastWeek();
					else if (range === "one_month")		search_s_date.value = lastMonth(1);
					else if (range === "three_month")	search_s_date.value = lastMonth(3);
					search_e_date.value = today();
					
					if 		(form_id.indexOf("chart") > -1)		selectChartData();
					else if (form_id.indexOf("keyword") > -1)	selectKeywordData();
					else if (form_id.indexOf("emotion") > -1)	selectEmotionOpinionData();
					else if (form_id.indexOf("mileage") > -1)	selectUserMileageData();
				}
			});
		}
	}
	
	var dropdown_menu = document.getElementById("dropdown_menu");
	var dropdown_menu_child = dropdown_menu.children;
	var req_url = document.getElementById("req_url");
	
	for (var i = 0; i < dropdown_menu_child.length; i++) {
		let child = dropdown_menu_child[i];
		
		child.addEventListener("click", function(e) {
			document.getElementById("dropdown_main").text = e.target.text;
			req_url.value = e.target.dataset.url;
			// 데이터 요청
			selectChartData();
		});
	}
	
	function selectChartData() {
		var URL = "/main/" + req_url.value + ".do";
		
		var request = $.ajax({
			url: URL,
			method: "post",
			data: $("#chart_search_form").serialize()
		});
		
		request.done(function(data) {
			console.log("selectChartData success", data);
			setChart(data);
		});
		
		request.fail(function(error) {
			console.log("selectChartData fail", error);
		});
	}
	
	function setChart(data) {
		var labels_arr = [];
		var series_arr = [];
		
		if(data.length < 9){
			for (var i = 0; i < data.length; i++) {
				var d = data[i];
				labels_arr.push(d.reg_date);
				series_arr.push(Number(d.visitor_cnt));
			}
		}else{
			for (var i = 0; i < data.length; i++) {
				var d = data[i];
				
				if ((i%5) != 0) {
					labels_arr.push("");
				} else {
					labels_arr.push(d.reg_date);
				}
				
				series_arr.push(Number(d.visitor_cnt));
			}
		}
		
		/* for (var i = 0; i < data.length; i++) {
			var d = data[i];
			labels_arr.push(d.reg_date);
			series_arr.push(Number(d.visitor_cnt));
		} */
		
		new Chartist.Line('#widgetOverall .ct-chart', { 
			labels : labels_arr, 
			series : [
				series_arr
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
	
	function selectKeywordData() {
		var request = $.ajax({
			url: "/main/selectKeywordList.do",
			method: "post",
			data: $("#keyword_search_form").serialize()
		});
		
		request.done(function(data) {
			console.log("selectKeywordList success", data);
			
			var el = document.getElementById("keyword_list_div");
			
			while (el.hasChildNodes()) {
			    el.childNodes[0].remove();
			}
			
			for (var i = 0; i < data.length; i++) {
				var d = data[i];
				
				var li = document.createElement("li");
				li.classList.add("list-group-item");
				
				var html = 
					'<div class="media">' +
						'<div class="pr-20">' + (i+1) + '</div>' +
						'<div class="media-body w-full">' +
							'<div class="float-right">' +
								'<small>' + d.keyword_cnt + '</small>' +
							'</div>' +
							d.keyword +
						'</div>' +
					'</div>';
				
				li.innerHTML = html;
				el.append(li);
			}
			
			var words = [];
			
			data.forEach(function(d, i) {
				words.push({text: d.keyword, weight: Number(d.keyword_cnt)});
			});

			$("#keyword_jqcloud_div").jQCloud("destroy");
			$("#keyword_jqcloud_div").jQCloud(words, {
				width: $("#keyword_jqcloud_div").parent().width(),
				height: $("#keyword_jqcloud_div").parent().height()
			});
		});
		
		request.fail(function(error) {
			console.log("selectKeywordList fail", error);
		});
	}
	
	function selectEmotionOpinionData() {
		var request = $.ajax({
			url: "/main/selectEmotionOpinionList.do",
			method: "post",
			data: $("#emotion_search_form").serialize()
		});
		
		request.done(function(data) {
			console.log("selectEmotionOpinionList success", data);
			
			var el = document.querySelectorAll("div[id*='opinion_list_div']");
			
			for (var i = 0; i < el.length; i++) {
				while (el[i].hasChildNodes()) {
				    el[i].childNodes[0].remove();
				}
			}
			
			for (var j = 0; j < data.length; j++) {
				var d = data[j];
				var emotion_type = d.emotion_type;
				
				if (d.title.length > 15) {
					d.title = d.title.substring(0, 15) + "...";
				}
				
				var div = document.querySelector("div[id='" + emotion_type + "_opinion_list_div']");
				
				var li = document.createElement("li");
				li.classList.add("list-group-item");
				
				var color = emotion_type === "positive" ? "blue" : "red";
				
				var html = 
					'<div class="media">' +
						'<div class="media-body w-full">' +
							'<div class="float-right ' + color + '-600">' + d.emotion_score + '</div>' +
							'<p class="mb-0">' + d.opinion_content + '</p>' +
							'<small>[' + d.type + '] ' + d.title + ' | ' + d.create_date + '</small>' +
						'</div>' +
					'</div>';
				
				li.innerHTML = html;
				div.append(li);
			}
		});
		
		request.fail(function(error) {
			console.log("selectEmotionOpinionList fail", error);
		});
	}
	
	function selectUserMileageData() {
		var request = $.ajax({
			url: "/main/selectUserMileageList.do",
			method: "post",
			data: $("#mileage_search_form").serialize()
		});
		
		request.done(function(data) {
			console.log("selectUserMileageList success", data);
			
			var el = document.getElementById("mileage_list_div");
			
			while (el.hasChildNodes()) {
			    el.childNodes[0].remove();
			}
			
			for (var i = 0; i < data.length; i++) {
				var d = data[i];
				
				var li = document.createElement("li");
				li.classList.add("list-group-item");
				
				if 		(d.auth_type === "admin")	var auth_type = '<span class="badge badge-danger ml-5">관리자</span>'; 
				else if (d.auth_type === "public")	var auth_type = '<span class="badge badge-default ml-5">일반인</span>';
				else if (d.auth_type === "pro")		var auth_type = '<span class="badge badge-info ml-5">전문가</span>';
				
				var html = 
					'<div class="media">' +
						'<div class="pr-10">' +
							auth_type +
						'</div>' +
						'<div class="media-body w-full">' +
							'<div class="float-right text-right">' +
								'<p class="mb-0 blue-600">' + d.total_mileage_value + '</p>' +
								/* '<small>누적 ' + d.total_mileage_value + '</small>' + */
							'</div>' +
							'<p class="mb-0">' + d.name + '(' + d.user_id + ')</p>' +
							'<small>제안 ' + d.sgst_cnt + '회 | 설문 ' + d.survey_cnt + '회 | 공모 ' + d.contest_cnt + '회 | 댓글 ' + d.op_cnt + '회</small>' +
						'</div>' +
					'</div>';
					
				li.innerHTML = html;
				el.append(li);
			}
		});
		
		request.fail(function(error) {
			console.log("selectUserMileageList fail", error);
		});
	}
		
	window.onload = function() {
		var el_a_list = document.querySelectorAll("a.nav-link[data-range='one_week']");
		for(var i = 0; i < el_a_list.length; i++) {
			el_a_list[i].click();
		}
	}
</script>