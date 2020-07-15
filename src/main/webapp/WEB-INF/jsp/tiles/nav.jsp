<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<nav class="site-navbar navbar navbar-default navbar-fixed-top navbar-mega" role="navigation">
  <div class="navbar-header">
    <button type="button" class="navbar-toggler hamburger hamburger-close navbar-toggler-left hided"
      data-toggle="menubar">
      <span class="sr-only">Toggle navigation</span>
      <span class="hamburger-bar"></span>
    </button>
    <button type="button" class="navbar-toggler collapsed" data-target="#site-navbar-collapse"
      data-toggle="collapse">
      <i class="icon md-more" aria-hidden="true"></i>
    </button>
    <div class="navbar-brand navbar-brand-center site-gridmenu-toggle" data-toggle="gridmenu">
      <img class="navbar-brand-logo" src="${pageContext.request.contextPath}/images/logo.png" title="Remark">
      <span class="navbar-brand-text hidden-xs-down"> Daul</span>
    </div>
    <button type="button" class="navbar-toggler collapsed" data-target="#site-navbar-search"
      data-toggle="collapse">
      <span class="sr-only">Toggle Search</span>
      <i class="icon md-search" aria-hidden="true"></i>
    </button>
  </div>

  <div class="navbar-container container-fluid">
    <!-- Navbar Collapse -->
    <div class="collapse navbar-collapse navbar-collapse-toolbar" id="site-navbar-collapse">
      <!-- Navbar Toolbar Right -->
      <ul class="nav navbar-toolbar navbar-right navbar-toolbar-right">
        <c:if test="${not empty login}">
        	<li class="nav-item hidden-float">
	        	<span class="nav-link"><c:out value="${login.user_id}"/></span>
        	</li>
        	<li class="nav-item hidden-float" id="testLoginBtn">
	        	<a class="nav-link" data-toggle="loginBtn" href="/login/logout.do" role="button">
	        		<i class="icon md-power"></i> Logout
	        	</a>
	        </li>
        </c:if>
        <c:if test="${empty login}">
	        <li class="nav-item hidden-float" id="testLoginBtn">
	        	<a class="nav-link" data-toggle="loginBtn" href="/login/loginPage.do" role="button">
	        		<i class="icon md-power"></i> Login
	        	</a>
	        </li>
        </c:if>
      </ul>
      <!-- End Navbar Toolbar Right -->
    </div>
    <!-- End Navbar Collapse -->

    <!-- Site Navbar Seach -->
    <div class="collapse navbar-search-overlap" id="site-navbar-search">
      <form role="search">
        <div class="form-group">
          <div class="input-search">
            <i class="input-search-icon md-search" aria-hidden="true"></i>
            <input type="text" class="form-control" name="site-search" placeholder="Search...">
            <button type="button" class="input-search-close icon md-close" data-target="#site-navbar-search"
              data-toggle="collapse" aria-label="Close"></button>
          </div>
        </div>
      </form>
    </div>
    <!-- End Site Navbar Seach -->
  </div>
</nav>