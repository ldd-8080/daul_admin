<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div class="site-menubar">
  <div class="site-menubar-body">
    <div>
      <div>
        <ul class="site-menu" data-plugin="menu">
          <!-- <li class="site-menu-category">General</li> -->
          <li class="site-menu-item has-sub">
            <a class="animsition-link" href="/main/main.do">
                <i class="site-menu-icon md-view-dashboard" aria-hidden="true"></i>
                <span class="site-menu-title">Dashboard</span>
            </a>
          </li>
           <li class="site-menu-item has-sub">
            <a class="animsition-link" href="/">              
                <span class="site-menu-title">사용자관리</span>
            </a>
          </li>
           <li class="site-menu-item has-sub">
            <a class="animsition-link" href="/">              
                <span class="site-menu-title">콘텐츠관리</span>
            </a>
          </li>
             <li class="site-menu-item has-sub">
                <a href="javascript:void(0)">
                        <i class="site-menu-icon md-view-compact" aria-hidden="true"></i>
                        <span class="site-menu-title">게시글 관리</span>
                                <span class="site-menu-arrow"></span>
                    </a>
                <ul class="site-menu-sub">
                  <li class="site-menu-item">
                    <a class="animsition-link" href="/board/boardList.do">
                      <span class="site-menu-title">공지사항</span>
                    </a>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="/">
                      <span class="site-menu-title">Q&A</span>
                    </a>
                  </li>
                </ul>
              </li>
           <li class="site-menu-item has-sub">
            <a class="animsition-link" href="/">              
                <span class="site-menu-title">열린제안관리</span>
            </a>
          </li>
           <li class="site-menu-item has-sub">
            <a class="animsition-link" href="/">              
                <span class="site-menu-title">설문조사관리</span>
            </a>
          </li>
           <li class="site-menu-item has-sub">
            <a class="animsition-link" href="/">              
                <span class="site-menu-title">나눔공모관리</span>
            </a>
          </li>
            <li class="site-menu-item has-sub">
            <a class="animsition-link" href="/">              
                <span class="site-menu-title">기록/통계</span>
            </a>
          </li>
          
          
        </ul>
      </div>
    </div>
  </div>

  <div class="site-menubar-footer">
    <a href="javascript: void(0);" class="fold-show" data-placement="top" data-toggle="tooltip"
      data-original-title="Settings">
      <span class="icon md-settings" aria-hidden="true"></span>
    </a>
    <a href="javascript: void(0);" data-placement="top" data-toggle="tooltip" data-original-title="Lock">
      <span class="icon md-eye-off" aria-hidden="true"></span>
    </a>
    <a href="javascript: void(0);" data-placement="top" data-toggle="tooltip" data-original-title="Logout">
      <span class="icon md-power" aria-hidden="true"></span>
    </a>
  </div>
   

</div>