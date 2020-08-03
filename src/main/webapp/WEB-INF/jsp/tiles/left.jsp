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
               <a href="javascript:void(0)">
                   <i class="site-menu-icon md-view-compact" aria-hidden="true"></i>
                   <span class="site-menu-title">사용자</span>
                   <span class="site-menu-arrow"></span>
               </a>
               <ul class="site-menu-sub">
                 <li class="site-menu-item">
                   <!-- <a class="animsition-link"  href="/user/publicUserListPage.do"> -->                   
                   <a class="animsition-link"  href="/user/userListPage.do?auth_type=public">                   
                     <span class="site-menu-title">일반회원</span>
                   </a>
                 </li>
                 <li class="site-menu-item">
                   <!-- <a class="animsition-link" href="/user/adminUserListPage.do"> -->                    
                   <a class="animsition-link" href="/user/userListPage.do?auth_type=admin">                    
                     <span class="site-menu-title">관리자</span>
                   </a>
                 </li>
               </ul>
           </li>
     
           <li class="site-menu-item has-sub">
	           <a href="javascript:void(0)">
	               <i class="site-menu-icon md-view-compact" aria-hidden="true"></i>
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
	           </ul>
           </li>
   
	       <li class="site-menu-item has-sub">
	           <a href="javascript:void(0)">
	               <i class="site-menu-icon md-view-compact" aria-hidden="true"></i>
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
	                 <span class="site-menu-title">FAQ</span>
	               </a>
	             </li>
	             <li class="site-menu-item">
	               <a class="animsition-link" href="/qna/qnaListPage.do">                    
	                 <span class="site-menu-title">Q&A</span>
	               </a>
	             </li>
	           </ul>
	       </li>
        </ul>
      </div>
    </div>
  </div>

   
</div>