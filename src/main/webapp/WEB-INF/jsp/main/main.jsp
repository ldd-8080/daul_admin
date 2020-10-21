<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- Page -->
<div class="page">
	<div class="page-content container-fluid">
		<div class="row" data-plugin="matchHeight" data-by-row="true">
			<div class="col-sm-6 col-lg-4 col-xl-2">
				<!-- Card -->
				<div class="card card-shadow card-responsive card-block p-20">
					<div class="counter counter-md">
						<div class="counter-label text-uppercase">
							<i class="icon wb-home mr-5 indigo-600 font-size-18" aria-hidden="true"></i>홈페이지 방문
						</div>
						<div class="counter-number-group">
							<span class="counter-number-related font-size-14">오늘</span>
							<span class="counter-number">132</span>
						</div>
						<div class="counter-label text-uppercase ">
							<span class="counter-number-related small">누적 방문</span>
							<span class="counter-number">6,381</span>
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
							<i class="icon wb-chat-working mr-5 yellow-700 font-size-18" aria-hidden="true"></i>카카오 챗봇 응답
						</div>
						<div class="counter-number-group">
							<span class="counter-number-related font-size-14">오늘</span>
							<span class="counter-number">132</span>
						</div>
						<div class="counter-label text-uppercase ">
							<span class="counter-number-related small">누적 응답</span>
							<span class="counter-number">6,381</span>
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
							<i class="icon wb-user mr-5 green-600 font-size-18" aria-hidden="true"></i>신규 회원
						</div>
						<div class="counter-number-group">
							<span class="counter-number-related font-size-14">최근7일</span>
							<span class="counter-number">55</span>
						</div>
						<div class="counter-label text-uppercase ">
							<span class="counter-number-related small">누적 회원</span>
							<span class="counter-number">6,381 </span>
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
							<i class="icon wb-envelope mr-5 red-500 font-size-18" aria-hidden="true"></i>신규 제안
						</div>
						<div class="counter-number-group">
							<span class="counter-number-related font-size-14">최근7일</span>
							<span class="counter-number">55</span>
						</div>
						<div class="counter-label text-uppercase ">
							<span class="counter-number-related small">누적 제안</span>
							<span class="counter-number">6,381 </span>
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
							<i class="icon wb-list-bulleted mr-5 orange-500 font-size-18" aria-hidden="true"></i>설문/공모 참여
						</div>
						<div class="counter-number-group">
							<span class="counter-number-related font-size-14">최근7일</span>
							<span class="counter-number">55</span>
						</div>
						<div class="counter-label text-uppercase ">
							<span class="counter-number-related small">누적 참여</span>
							<span class="counter-number">6,381 </span>
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
							<i class="icon wb-reply mr-5 blue-grey-700 font-size-18" aria-hidden="true"></i>신규 댓글
						</div>
						<div class="counter-number-group">
							<span class="counter-number-related font-size-14">최근7일</span>
							<span class="counter-number">55</span>
						</div>
						<div class="counter-label text-uppercase ">
							<span class="counter-number-related small">누적 댓글</span>
							<span class="counter-number">6,381 </span>
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
								<a href="#" class="text-body dropdown-toggle blue-grey-700 text-uppercase" data-toggle="dropdown">홈페이지 이용 현황</a>
								<div class="dropdown-menu" role="menu">
									<a class="dropdown-item" href="#" role="menuitem">홈페이지 이용 현황</a>
									<a class="dropdown-item" href="#" role="menuitem">카카오톡 챗봇 응답 현황</a>
									<a class="dropdown-item" href="#" role="menuitem">열린제안 등록 현황</a>
									<a class="dropdown-item" href="#" role="menuitem">설문조사/공모제안 참여 현황</a>
									<a class="dropdown-item" href="#" role="menuitem">댓글 등록 현황</a>
								</div>
							</div>
							<div class="card-header-actions">
								<ul class="nav nav-tabs-sm nav-pills nav-pills-rounded product-filters">
									<li class="nav-item "><a class="active nav-link">지난 7일</a></li>
									<li class="nav-item"><a class="nav-link">지난 30일</a></li>
									<li class="nav-item"><a class="nav-link">지난 90일</a></li>
									<li class="nav-item"><a class="nav-link" id="btnPopoverDateRange" data-toggle="modal">임의 기간 설정</a>


										<div id="popoverDateRange" style="display: none;">
											<div class="row ">
												<div class="col-xl-12 form-group">
													<div class="datepicker input-daterange">
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
												<div class="col-md-12 text-right">
													<button class="btn btn-primary" data-dismiss="modal" type="button">설정</button>
													<button id="btnClosePopoverDateRange" class="btn btn-default" data-dismiss="modal" type="button">닫기</button>
												</div>
											</div>
										</div> <!-- End Pop with table --></li>
								</ul>
							</div>
						</div>
						<div class="ct-chart h-300"></div>
						<ul class="list-inline text-center mt-20 mb-0">
							<li class="list-inline-item"><i class="icon wb-large-point indigo-600 mr-10" aria-hidden="true"></i>PC BROWSER</li>
							<li class="list-inline-item ml-35"><i class="icon wb-large-point teal-600 mr-10" aria-hidden="true"></i>MOBILE PHONE</li>
							<li class="list-inline-item ml-35"><i class="icon wb-large-point red-600 mr-10" aria-hidden="true"></i>MOBILE PHONE</li>
						</ul>
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
							<ul class="nav nav-tabs-sm nav-pills nav-pills-rounded product-filters">
								<li class="nav-item"><a class="active nav-link">이번주</a></li>
								<li class="nav-item"><a class="nav-link">이번달</a></li>
							</ul>
						</div>
					</div>
					<div class="card-block py-5">
						<ul class="list-group list-group-dividered list-group-full" style="height: 380px;" data-plugin="scrollable">
							<div data-role="container">
								<div data-role="content">
									<li class="list-group-item">
										<div class="media">
											<div class="pr-10">
												<span class="badge badge-info ml-5">전문가</span>
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
									<li class="list-group-item">
										<div class="media">
											<div class="pr-10">
												<span class="badge badge-info ml-5">전문가</span>
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
									<li class="list-group-item">
										<div class="media">
											<div class="pr-10">
												<span class="badge badge-info ml-5">전문가</span>
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
								<a class="btn btn-pure p-0" href="#">목록 보기</a>
							</div>
						</h4>
					</div>
					<div class="card-block py-10">
						<div class="list-group list-group-dividered list-group-full h-350" data-plugin="scrollable">
							<div data-role="container">
								<div data-role="content">
									<a class="list-group-item justify-content-between" href="javascript:void(0)">
										<small class="badge badge-round badge-danger float-right">new</small>
										<h6 class="media-heading">대기환경 이슈를 위한 소통 플랫폼.</h6>
										<p class="mb-0 small">대기환경 이슈를 위한 소통 이슈를 위한 소통 위한 소통 소통...</p>
										<p class="mb-0 small">
											김선호 | 댓글 21 | 공감 31 |
											<time class="media-meta">2018-06-12 20:50:48</time>
										</p>
									</a>
									<a class="list-group-item justify-content-between" href="javascript:void(0)">
										<small class="badge badge-round badge-danger float-right">new</small>
										<h6 class="media-heading">대기환경 이슈를 위한 소통 플랫폼.</h6>
										<p class="mb-0 small">대기환경 이슈를 위한 소통 이슈를 위한 소통 위한 소통 소통...</p>
										<p class="mb-0 small">
											김선호 | 댓글 21 | 공감 31 |
											<time class="media-meta">2018-06-12 20:50:48</time>
										</p>
									</a>
									<a class="list-group-item justify-content-between" href="javascript:void(0)">
										<h6 class="media-heading">대기환경 이슈를 위한 소통 플랫폼.</h6>
										<p class="mb-0 small">대기환경 이슈를 위한 소통 이슈를 위한 소통 위한 소통 소통...</p>
										<p class="mb-0 small">
											김선호 | 댓글 21 | 공감 31 |
											<time class="media-meta">2018-06-12 20:50:48</time>
										</p>
									</a>
									<a class="list-group-item justify-content-between" href="javascript:void(0)">
										<h6 class="media-heading">대기환경 이슈를 위한 소통 플랫폼.</h6>
										<p class="mb-0 small">대기환경 이슈를 위한 소통 이슈를 위한 소통 위한 소통 소통...</p>
										<p class="mb-0 small">
											김선호 | 댓글 21 | 공감 31 |
											<time class="media-meta">2018-06-12 20:50:48</time>
										</p>
									</a>
									<a class="list-group-item justify-content-between" href="javascript:void(0)">
										<h6 class="media-heading">대기환경 이슈를 위한 소통 플랫폼.</h6>
										<p class="mb-0 small">대기환경 이슈를 위한 소통 이슈를 위한 소통 위한 소통 소통...</p>
										<p class="mb-0 small">
											김선호 | 댓글 21 | 공감 31 |
											<time class="media-meta">2018-06-12 20:50:48</time>
										</p>
									</a>
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
								<a class="btn btn-pure p-0" href="#">목록 보기</a>
							</div>
						</h4>
					</div>
					<div class="card-block py-10">
						<div class="list-group list-group-dividered list-group-full">
							<a class="list-group-item justify-content-between" href="javascript:void(0)">
								<small class="badge badge-round badge-success float-right">진행중</small>
								<h6 class="media-heading">대기환경 이슈를 위한 소통 플랫폼.</h6>
								<p class="mb-0 small">기간 | 2018-06-12 ~ 2018-06-12</p>
								<p class="mb-0 small">댓글 21 | 참여 31</p>
							</a>
							<a class="list-group-item justify-content-between" href="javascript:void(0)">
								<small class="badge badge-round badge-default float-right">종료</small>
								<h6 class="media-heading">대기환경 이슈를 위한 소통 플랫폼.</h6>
								<p class="mb-0 small">기간 | 2018-06-12 ~ 2018-06-12</p>
								<p class="mb-0 small">댓글 21 | 참여 31</p>
							</a>
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
								<a class="btn btn-pure p-0" href="#">목록 보기</a>
							</div>
						</h4>
					</div>
					<div class="card-block py-10">
						<div class="list-group list-group-dividered list-group-full">
							<a class="list-group-item justify-content-between">
								<small class="badge badge-round badge-success float-right">진행중</small>
								<h6 class="media-heading">대기환경 이슈를 위한 소통 플랫폼.</h6>
								<p class="mb-0 small">공모기간 | 2018-06-12 ~ 2018-06-12</p>
								<p class="mb-0 small">참여 31</p>
							</a>
							<a class="list-group-item justify-content-between" href="javascript:void(0)">
								<small class="badge badge-round badge-default float-right">종료</small>
								<h6 class="media-heading">대기환경 이슈를 위한 소통 플랫폼.</h6>
								<p class="mb-0 small">공모기간 | 2018-06-12 ~ 2018-06-12</p>
								<p class="mb-0 small">참여 31</p>
							</a>
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
							<ul class="nav nav-tabs-sm nav-pills nav-pills-rounded product-filters">
								<li class="nav-item "><a class="active nav-link">지난 7일</a></li>
								<li class="nav-item"><a class="nav-link">지난 30일</a></li>
								<li class="nav-item"><a class="nav-link">지난 90일</a></li>
								<li class="nav-item"><a class="nav-link">임의 기간 설정</a></li>
							</ul>
						</div>
					</div>
					<div class="card-block pt-30">
						<div class="row ">
							<div class="col-lg-8">
								<div class="h-400" style="background-image: url('/img/word_cloud.png'); background-position: center; background-repeat: no-repeat; background-size: contain;"></div>
							</div>
							<div class="col-lg-4">
								<h5 class="">이슈 키워드 순위</h5>
								<ul class="list-group list-group-dividered list-group-full h-350" data-plugin="scrollable">
									<div data-role="container">
										<div data-role="content">
											<li class="list-group-item">
												<div class="media">
													<div class="pr-20">1</div>
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
													<div class="pr-20">2</div>
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
													<div class="pr-20">3</div>
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
													<div class="pr-20">4</div>
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
													<div class="pr-20">5</div>
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
													<div class="pr-20">6</div>
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
													<div class="pr-20">7</div>
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
													<div class="pr-20">8</div>
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
							<ul class="nav nav-tabs-sm nav-pills nav-pills-rounded product-filters">
								<li class="nav-item "><a class="active nav-link">지난 7일</a></li>
								<li class="nav-item"><a class="nav-link">지난 30일</a></li>
								<li class="nav-item"><a class="nav-link">지난 90일</a></li>
								<li class="nav-item"><a class="nav-link">임의 기간 설정</a></li>
							</ul>
						</div>
					</div>
					<div class="card-block pt-30">
						<div class="row ">
							<div class="col-lg-6">
								<h5 class="blue-600">😊 긍정 댓글</h5>
								<ul class="list-group list-group-dividered list-group-full h-350" data-plugin="scrollable">
									<div data-role="container">
										<div data-role="content">
											<li class="list-group-item">
												<div class="media">
													<div class="media-body w-full">
														<div class="float-right blue-600">0.92</div>
														<p class="mb-0">이건 진짜 너무 잘했어요. 항상 이러면 좋을텐데요...</p>
														<small>[열린제안] 대기환경 이슈를 위한 소통 플.. | 2018-06-12 20:50:48</small>
													</div>
												</div>
											</li>
											<li class="list-group-item">
												<div class="media">
													<div class="media-body w-full">
														<div class="float-right blue-600">0.92</div>
														<p class="mb-0">이건 진짜 너무 잘했어요. 항상 이러면 좋을텐데요...</p>
														<small>[열린제안] 대기환경 이슈를 위한 소통 플.. | 2018-06-12 20:50:48</small>
													</div>
												</div>
											</li>
											<li class="list-group-item">
												<div class="media">
													<div class="media-body w-full">
														<div class="float-right blue-600">0.92</div>
														<p class="mb-0">이건 진짜 너무 잘했어요. 항상 이러면 좋을텐데요...</p>
														<small>[열린제안] 대기환경 이슈를 위한 소통 플.. | 2018-06-12 20:50:48</small>
													</div>
												</div>
											</li>
											<li class="list-group-item">
												<div class="media">
													<div class="media-body w-full">
														<div class="float-right blue-600">0.92</div>
														<p class="mb-0">이건 진짜 너무 잘했어요. 항상 이러면 좋을텐데요...</p>
														<small>[열린제안] 대기환경 이슈를 위한 소통 플.. | 2018-06-12 20:50:48</small>
													</div>
												</div>
											</li>
											<li class="list-group-item">
												<div class="media">
													<div class="media-body w-full">
														<div class="float-right blue-600">0.92</div>
														<p class="mb-0">이건 진짜 너무 잘했어요. 항상 이러면 좋을텐데요...</p>
														<small>[열린제안] 대기환경 이슈를 위한 소통 플.. | 2018-06-12 20:50:48</small>
													</div>
												</div>
											</li>
											<li class="list-group-item">
												<div class="media">
													<div class="media-body w-full">
														<div class="float-right blue-600">0.92</div>
														<p class="mb-0">이건 진짜 너무 잘했어요. 항상 이러면 좋을텐데요...</p>
														<small>[열린제안] 대기환경 이슈를 위한 소통 플.. | 2018-06-12 20:50:48</small>
													</div>
												</div>
											</li>
											<li class="list-group-item">
												<div class="media">
													<div class="media-body w-full">
														<div class="float-right blue-600">0.92</div>
														<p class="mb-0">이건 진짜 너무 잘했어요. 항상 이러면 좋을텐데요...</p>
														<small>[열린제안] 대기환경 이슈를 위한 소통 플.. | 2018-06-12 20:50:48</small>
													</div>
												</div>
											</li>
											<li class="list-group-item">
												<div class="media">
													<div class="media-body w-full">
														<div class="float-right blue-600">0.92</div>
														<p class="mb-0">이건 진짜 너무 잘했어요. 항상 이러면 좋을텐데요...</p>
														<small>[열린제안] 대기환경 이슈를 위한 소통 플.. | 2018-06-12 20:50:48</small>
													</div>
												</div>
											</li>
											<li class="list-group-item">
												<div class="media">
													<div class="media-body w-full">
														<div class="float-right blue-600">0.92</div>
														<p class="mb-0">이건 진짜 너무 잘했어요. 항상 이러면 좋을텐데요...</p>
														<small>[열린제안] 대기환경 이슈를 위한 소통 플.. | 2018-06-12 20:50:48</small>
													</div>
												</div>
											</li>
											<li class="list-group-item">
												<div class="media">
													<div class="media-body w-full">
														<div class="float-right blue-600">0.92</div>
														<p class="mb-0">이건 진짜 너무 잘했어요. 항상 이러면 좋을텐데요...</p>
														<small>[열린제안] 대기환경 이슈를 위한 소통 플.. | 2018-06-12 20:50:48</small>
													</div>
												</div>
											</li>
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
										<div data-role="content">
											<li class="list-group-item">
												<div class="media">
													<div class="media-body w-full">
														<div class="float-right red-600">0.92</div>
														<p class="mb-0">이건 진짜 너무하네요. 이러지 맙시다 좀...</p>
														<small>[열린제안] 대기환경 이슈를 위한 소통 플.. | 2018-06-12 20:50:48</small>
													</div>
												</div>
											</li>
											<li class="list-group-item">
												<div class="media">
													<div class="media-body w-full">
														<div class="float-right red-600">0.92</div>
														<p class="mb-0">이건 진짜 너무하네요. 이러지 맙시다 좀...</p>
														<small>[열린제안] 대기환경 이슈를 위한 소통 플.. | 2018-06-12 20:50:48</small>
													</div>
												</div>
											</li>
											<li class="list-group-item">
												<div class="media">
													<div class="media-body w-full">
														<div class="float-right red-600">0.92</div>
														<p class="mb-0">이건 진짜 너무하네요. 이러지 맙시다 좀...</p>
														<small>[열린제안] 대기환경 이슈를 위한 소통 플.. | 2018-06-12 20:50:48</small>
													</div>
												</div>
											</li>
											<li class="list-group-item">
												<div class="media">
													<div class="media-body w-full">
														<div class="float-right red-600">0.92</div>
														<p class="mb-0">이건 진짜 너무하네요. 이러지 맙시다 좀...</p>
														<small>[열린제안] 대기환경 이슈를 위한 소통 플.. | 2018-06-12 20:50:48</small>
													</div>
												</div>
											</li>
											<li class="list-group-item">
												<div class="media">
													<div class="media-body w-full">
														<div class="float-right red-600">0.92</div>
														<p class="mb-0">이건 진짜 너무하네요. 이러지 맙시다 좀...</p>
														<small>[열린제안] 대기환경 이슈를 위한 소통 플.. | 2018-06-12 20:50:48</small>
													</div>
												</div>
											</li>
											<li class="list-group-item">
												<div class="media">
													<div class="media-body w-full">
														<div class="float-right red-600">0.92</div>
														<p class="mb-0">이건 진짜 너무하네요. 이러지 맙시다 좀...</p>
														<small>[열린제안] 대기환경 이슈를 위한 소통 플.. | 2018-06-12 20:50:48</small>
													</div>
												</div>
											</li>
											<li class="list-group-item">
												<div class="media">
													<div class="media-body w-full">
														<div class="float-right red-600">0.92</div>
														<p class="mb-0">이건 진짜 너무하네요. 이러지 맙시다 좀...</p>
														<small>[열린제안] 대기환경 이슈를 위한 소통 플.. | 2018-06-12 20:50:48</small>
													</div>
												</div>
											</li>
											<li class="list-group-item">
												<div class="media">
													<div class="media-body w-full">
														<div class="float-right red-600">0.92</div>
														<p class="mb-0">이건 진짜 너무하네요. 이러지 맙시다 좀...</p>
														<small>[열린제안] 대기환경 이슈를 위한 소통 플.. | 2018-06-12 20:50:48</small>
													</div>
												</div>
											</li>
											<li class="list-group-item">
												<div class="media">
													<div class="media-body w-full">
														<div class="float-right red-600">0.92</div>
														<p class="mb-0">이건 진짜 너무하네요. 이러지 맙시다 좀...</p>
														<small>[열린제안] 대기환경 이슈를 위한 소통 플.. | 2018-06-12 20:50:48</small>
													</div>
												</div>
											</li>
											<li class="list-group-item">
												<div class="media">
													<div class="media-body w-full">
														<div class="float-right red-600">0.92</div>
														<p class="mb-0">이건 진짜 너무하네요. 이러지 맙시다 좀...</p>
														<small>[열린제안] 대기환경 이슈를 위한 소통 플.. | 2018-06-12 20:50:48</small>
													</div>
												</div>
											</li>
											<li class="list-group-item">
												<div class="media">
													<div class="media-body w-full">
														<div class="float-right red-600">0.92</div>
														<p class="mb-0">이건 진짜 너무하네요. 이러지 맙시다 좀...</p>
														<small>[열린제안] 대기환경 이슈를 위한 소통 플.. | 2018-06-12 20:50:48</small>
													</div>
												</div>
											</li>
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
<!-- End Page -->

<!-- DateRange Modal -->
<div class="modal " id="exampleFormModal" aria-hidden="false" aria-labelledby="exampleFormModalLabel"role="dialog" tabindex="-1">
	<div class="modal-dialog modal-simple modal-center">
		<form class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
				<h4 class="modal-title" id="exampleFormModalLabel">기간 설정</h4>
			</div>
			<div class="modal-body">
			</div>
		</form>
	</div>
</div>
<!-- End Modal -->

<script type="text/javascript">
	new Chartist.Line('#widgetOverall .ct-chart', { 
		labels : ['SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT'], 
		series : [
			[100, 50, 70, 110, 150, 200, 230], 
			[80, 40, 60, 90, 100, 190, 210], 
			[20, 10, 10, 20, 50, 10, 20]
		] 
	}, 
	{ 
		low : 0, 
		showArea : true, 
		showPoint : true, 
		showLine : true, 
		fullWidth : true,
		chartPadding : { 
			top : 0, 
			right : 20, 
			bottom : 0, 
			left : 30 
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
	$("#inputStartDate").val(lastMonth());
	$("#inputEndDate").val(today());
	
	var defaults = Plugin.getDefaults("webuiPopover"); // Example Webui Popover Pop with Table
	
	var tableSettings = {
		title: '기간 설정',
		url:'#popoverDateRange',
		width: 400,
		animation:'fade',
		dismissible:false,
		backdrop:true,
		closeable:true, //display close button or not
		onShow: function($element) {
			console.log(lastMonth());
		} // callback after show
	};
	
	$('#btnPopoverDateRange').webuiPopover($.extend({}, defaults, tableSettings));
	
	$('#btnClosePopoverDateRange').click( function() {
		$('#btnPopoverDateRange').webuiPopover('hide');
	});
</script>