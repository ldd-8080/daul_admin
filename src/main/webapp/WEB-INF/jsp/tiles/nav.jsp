<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<nav class="site-navbar navbar navbar-default navbar-fixed-top navbar-mega" role="navigation">
	<div class="navbar-header" style="background-color:#3e8ef7;">
		<button type="button" class="navbar-toggler hamburger hamburger-close navbar-toggler-left hided" data-toggle="menubar">
			<span class="sr-only">Toggle navigation</span>
			<span class="hamburger-bar"></span>
		</button>
		<div class="navbar-brand navbar-brand-center site-gridmenu-toggle">
			<a href="/main/main.do">
				<img class="navbar-brand-logo" src="${pageContext.request.contextPath}/img/logo.png">
			</a>
			<span class="navbar-brand-text hidden-xs-down"> e다울마당</span>
		</div>
	</div>



	<div class="navbar-container container-fluid">
		<div class="collapse navbar-collapse navbar-collapse-toolbar" id="site-navbar-collapse">

			<ul class="nav navbar-toolbar">
			
				<li class="nav-item hidden-float" id="toggleMenubar">
					<a class="nav-link waves-effect waves-light waves-round" data-toggle="menubar" href="#" role="button">
						<i class="icon hamburger hamburger-arrow-left">
							<span class="sr-only">Toggle menubar</span>
							<span class="hamburger-bar"></span>
						</i>
					</a>
				</li>
				<li class="nav-item hidden-sm-down" id="toggleFullscreen">
					<a class="nav-link icon icon-fullscreen waves-effect waves-light waves-round" data-toggle="fullscreen" href="#" role="button">
						<span class="sr-only">Toggle fullscreen</span>
					</a>
				</li>
			</ul>
			<ul class="nav navbar-toolbar navbar-right navbar-toolbar-right mr-5">
				<!-- <li class="nav-item dropdown">
					<a class="nav-link" data-toggle="dropdown" href="javascript:void(0)" title="Notifications" aria-expanded="false" data-animation="scale-up" role="button">
						<i class="icon wb-bell" aria-hidden="true"></i>
						<span class="badge badge-pill badge-danger up">5</span>
					</a>
					<div class="dropdown-menu dropdown-menu-right dropdown-menu-media" role="menu">
						<div class="dropdown-menu-header">
							<h5>NOTIFICATIONS</h5>
							<span class="badge badge-round badge-danger">New 5</span>
						</div>

						<div class="list-group">
							<div data-role="container">
								<div data-role="content">
									<a class="list-group-item dropdown-item" href="javascript:void(0)" role="menuitem">
										<div class="media">
											<div class="media-body">
												<h6 class="media-heading">[열린제안-제안] 대기환경 이슈를 위한 소통 플랫폼.</h6>
												<p class="mb-0">
													김선호 |
													<time class="media-meta" datetime="2018-06-12T20:50:48+08:00">2018-06-12 20:50:48</time>
												</p>
											</div>
										</div>
									</a>
									<a class="list-group-item dropdown-item" href="javascript:void(0)" role="menuitem">
										<div class="media">
											<div class="media-body">
												<h6 class="media-heading">[열린제안-댓글] 대기환경 이슈를 위한 소통 플랫폼.</h6>
												<p class="mb-0">
													김선호 |
													<time class="media-meta" datetime="2018-06-12T20:50:48+08:00">2018-06-12 20:50:48</time>
												</p>
											</div>
										</div>
									</a>
									<a class="list-group-item dropdown-item" href="javascript:void(0)" role="menuitem">
										<div class="media">
											<div class="media-body">
												<h6 class="media-heading">[묻고답하기-질문] 대기환경 이슈를 위한 소통 플랫폼.</h6>
												<p class="mb-0">
													김선호 |
													<time class="media-meta" datetime="2018-06-12T20:50:48+08:00">2018-06-12 20:50:48</time>
												</p>
											</div>
										</div>
									</a>
									<a class="list-group-item dropdown-item" href="javascript:void(0)" role="menuitem">
										<div class="media">
											<div class="media-body">
												<h6 class="media-heading">[설문조사-참여] 대기환경 이슈를 위한 소통 플랫폼.</h6>
												<p class="mb-0">
													김선호 |
													<time class="media-meta" datetime="2018-06-12T20:50:48+08:00">2018-06-12 20:50:48</time>
												</p>
											</div>
										</div>
									</a>
									<a class="list-group-item dropdown-item" href="javascript:void(0)" role="menuitem">
										<div class="media">
											<div class="media-body">
												<h6 class="media-heading">[설문조사-댓글] 대기환경 이슈를 위한 소통 플랫폼.</h6>
												<p class="mb-0">
													김선호 |
													<time class="media-meta" datetime="2018-06-12T20:50:48+08:00">2018-06-12 20:50:48</time>
												</p>
											</div>
										</div>
									</a>
									<a class="list-group-item dropdown-item" href="javascript:void(0)" role="menuitem">
										<div class="media">
											<div class="media-body">
												<h6 class="media-heading">[공모제안-참여] 대기환경 이슈를 위한 소통 플랫폼.</h6>
												<p class="mb-0">
													김선호 |
													<time class="media-meta" datetime="2018-06-12T20:50:48+08:00">2018-06-12 20:50:48</time>
												</p>
											</div>
										</div>
									</a>
								</div>
							</div>
						</div>
					</div>
				</li> -->
				<li class="nav-item dropdown">
					<a class="nav-link navbar-avatar waves-effect waves-light waves-round" data-toggle="dropdown" href="#" aria-expanded="false" data-animation="scale-up" role="button">
						<span class="avatar avatar-online">
							<img src="${pageContext.request.contextPath}/img/user.png" alt="...">
							<i></i>
						</span>
					</a>
					<div class="dropdown-menu" role="menu" style="margin-right: 5px">
						<div class="dropdown-header" role="presentation">
							<c:out value="${login.user_id}" />
						</div>
						<div class="dropdown-divider" role="presentation"></div>
						<a class="dropdown-item waves-effect waves-light waves-round" href="/login/logout.do" role="menuitem">
							<i class="icon md-power" aria-hidden="true"></i>
							Logout
						</a>
					</div>
				</li>
			</ul>
		</div>
		<div class="collapse navbar-search-overlap" id="site-navbar-search">
			<form role="search">
				<div class="form-group">
					<div class="input-search">
						<i class="input-search-icon md-search" aria-hidden="true"></i>
						<input type="text" class="form-control" name="site-search" placeholder="Search...">
						<button type="button" class="input-search-close icon md-close" data-target="#site-navbar-search" data-toggle="collapse" aria-label="Close"></button>
					</div>
				</div>
			</form>
		</div>
	</div>
</nav>