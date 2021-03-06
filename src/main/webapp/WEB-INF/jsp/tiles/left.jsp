<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="site-menubar site-menubar-dark">
	<div class="site-menubar-body">
		<ul class="site-menu" data-plugin="menu">
			<li class="site-menu-category"></li>
			<li class="site-menu-item">
				<a class="animsition-link" href="/main/main.do">
					<i class="site-menu-icon wb-dashboard" aria-hidden="true"></i>
					<span class="site-menu-title">대시보드</span>
				</a>
			</li>
			<li class="site-menu-item has-sub">
				<a href="javascript:void(0)">
					<i class="site-menu-icon md-account" aria-hidden="true"></i>
					<span class="site-menu-title">사용자</span>
					<span class="site-menu-arrow"></span>
				</a>
				<ul class="site-menu-sub">
					<li class="site-menu-item">
						<a class="animsition-link" href="/user/userListPage.do?auth_type=public">
							<span class="site-menu-title">일반회원</span>
						</a>
					</li>
					<li class="site-menu-item">
						<a class="animsition-link" href="/user/userListPage.do?auth_type=admin">
							<span class="site-menu-title">관리자</span>
						</a>
					</li>
				</ul>
			</li>
			<li class="site-menu-item has-sub">
				<a href="javascript:void(0)">
					<i class="site-menu-icon wb-emoticon" aria-hidden="true"></i>
					<span class="site-menu-title">서비스</span>
					<span class="site-menu-arrow"></span>
				</a>
				<ul class="site-menu-sub">
					<li class="site-menu-item">
						<a class="animsition-link" href="/suggestion/suggestionListPage.do">
							<span class="site-menu-title">열린제안</span>
						</a>
					</li>
					<li class="site-menu-item">
						<a class="animsition-link" href="/survey/surveyList.do">
							<span class="site-menu-title">설문조사</span>
						</a>
					</li>
					<li class="site-menu-item">
						<a class="animsition-link" href="/contest/contestListPage.do">
							<span class="site-menu-title">나눔공모</span>
						</a>
					</li>
					<li class="site-menu-item">
						<a class="animsition-link" href="/mileage/mileagePage.do">
							<span class="site-menu-title">마일리지</span>
						</a>
					</li>
				</ul>
			</li>
			<li class="site-menu-item has-sub">
				<a href="javascript:void(0)">
					<i class="site-menu-icon wb-list" aria-hidden="true"></i>
					<span class="site-menu-title">게시판</span>
					<span class="site-menu-arrow"></span>
				</a>
				<ul class="site-menu-sub">
					<li class="site-menu-item">
						<a class="animsition-link" href="/board/boardListPage.do">
							<span class="site-menu-title">공지사항</span>
						</a>
					</li>
					<li class="site-menu-item">
						<a class="animsition-link" href="/faq/faqListPage.do">
							<span class="site-menu-title">자주하는질문</span>
						</a>
					</li>
					<li class="site-menu-item">
						<a class="animsition-link" href="/qna/qnaListPage.do">
							<span class="site-menu-title">묻고답하기</span>
						</a>
					</li>
				</ul>
			</li>
			<li class="site-menu-item has-sub">
				<a href="javascript:void(0)">
					<i class="site-menu-icon wb-chat-working" aria-hidden="true"></i>
					<span class="site-menu-title">챗봇</span>
					<span class="site-menu-arrow"></span>
				</a>
				<ul class="site-menu-sub">
					<li class="site-menu-item">
						<a class="animsition-link" href="/chatbot/intentListPage.do">
							<span class="site-menu-title">시나리오 관리</span>
						</a>
					</li>
					<li class="site-menu-item">
						<a class="animsition-link" href="/chatbotStats/chatbotStatsPage.do">
							<span class="site-menu-title">응답 통계/기록</span>
						</a>
					</li>
				</ul>
			</li>
			<li class="site-menu-item has-sub">
				<a href="javascript:void(0)">
					<i class="site-menu-icon wb-envelope" aria-hidden="true"></i>
					<span class="site-menu-title">메세지</span>
					<span class="site-menu-arrow"></span>
				</a>
				<ul class="site-menu-sub">
					<li class="site-menu-item">
						<a class="animsition-link" href="/notification/notificaionTalkPage.do">
							<span class="site-menu-title">알림톡 자동발송설정</span>
						</a>
					</li>
				</ul>
			</li>
		</ul>
	</div>
</div>
<script type="text/javascript">
	$("a.animsition-link").each(function(index) {
		var currPathname = window.location.pathname.split("/")[1];
		var pathname = $(this)[0].pathname.split("/")[1];

		if (currPathname === pathname) {
			if (currPathname !== "user") {
				$(this).parents("li.has-sub").addClass("active open");
				$(this).parent().addClass("active");
			} else {
				if (window.location.search.indexOf($(this)[0].search) > -1) {
					$(this).parents("li.has-sub").addClass("active open");
					$(this).parent().addClass("active");
				}
			}
		}
	});
</script>