<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  

<script type="text/javascript" src="${pageContext.request.contextPath}/js/intentInput.js"></script>

  
<div class="page">
	<!-- Sidebar -->
	<div class="page-aside">
		<div class="page-aside-switch">
			<i class="icon md-chevron-left" aria-hidden="true"></i> 
			<i class="icon md-chevron-right" aria-hidden="true"></i>
		</div>
		<div class="page-aside-inner">
			<!-- 			
			<div class="scenario-add-btn">
				<input type="button" class="form-control" id="tree-open-btn" style="cursor:pointer; color:blue" value="모두열기"/>
				<input type="button" class="form-control" id="tree-close-btn" style="cursor:pointer; color:blue" value="모두닫기"/>
			</div> 
			 -->
		
			<div class="input-search">
				<form class="form-group m-0" role="search">
					<div class="input-search">
						<input type="search" class="form-control" id="jstreeSearch" placeholder="Search ...">
						<button class="input-search-btn">
							<i class="icon md-search" aria-hidden="true"></i>
						</button>
					</div>
				</form>
			</div>

			<div class="dialog-list page-aside-scroll">
				<div data-role="container">
					<div data-role="content">
						<div id="jstree" class="dialog-list-jstree"></div>
					</div>
				</div>
			</div>

		</div>
	</div>
	
	<div class="page-main" style="overflow-y: scroll;">
        <div class="page-content" >


          <!-- Content -->
          <div class="panel panel-bordered intent" id="intent">
            <!-- Header -->
            <div class="panel-heading">
              <h3 id="intentTitle" class="intent-title panel-title" onclick="showDivIntentTitleInput('')">
                #<span class="title" id="title"></span>
              </h3>
              <div id="intentTitleInput"
                   class="intent-title-input panel-title form-group form-material w-500 pb-10 pt-5"
                   data-plugin="formMaterial" style="display: none;">
                <input type="text" name="title" placeholder="Please input intent title!"
                       class="form-control form-control-lg enter-focusout"
                       value="New Intent"
                       onchange="renameIntent('')"
                       onblur="hideDivIntentTitleInput('')"/>
              </div>
              <div class="panel-actions panel-actions-keep">
                <button type="button" class="btn btn-primary" id="chatbot-regist-btn" data-title="발화및응답">
                  <i class="icon fa-save" aria-hidden="true"></i> 저장</button>
                <button type="button" class="btn btn-default" onclick="">
                  <i class="icon fa-trash-o" aria-hidden="true"></i> 삭제</button>
              </div>
            </div>

            <!-- Body -->
            <div class="panel-body">

              <!-- Input Groups -->
              <!-- -------------------------------------------------------------------------------------- -->

              <!-- Input - Title -->
              <div class="">
                <div class="media">
                  <div class="pr-10">
                    <a class="avatar" href="javascript:void(0)">
                      <img src="${pageContext.request.contextPath}/images/user.png" alt="...">
                    </a>
                  </div>
                  <div class="media-body">
                    <h4 class="mt-5 mb-5">사용자 발화</h4>
                  </div>
                </div>
              </div>
              <!-- End Input - Title -->
			  <form id="input-text-form">
			  	<input type="hidden" id="intent-id" name="intent_id"/>
			    
	              <!-- Input Box - Input Sentences -->
	              <div class="box input">
	                <div class="panel box-main">
	                  <div class="panel-heading">
	                    <h3 class="panel-title">사용자 발화 - 문장형</h3>
	                  </div>
	                  <div class="panel-body input-box p-15">
	                    <div class="form-group w-p100">
	                      <div class="input-group" id="tokenfield-div">
	                      
	                      </div>
	                    </div>
	                  </div>
	                </div>
	              </div>
	              <!-- End Input Box - Input Sentences -->
			  </form>
              <!-- End Input Groups -->


              <!-- Output Groups -->
              <!-- -------------------------------------------------------------------------------------- -->

              <!-- Output - Title -->
              <div class="mt-50">
                <div class="media">
                  <div class="pr-10">
                    <a class="avatar " href="javascript:void(0)">
                      <img src="${pageContext.request.contextPath}/images/chatbot.png" alt="...">
                    </a>
                  </div>
                  <div class="media-body">
                    <h4 class="mt-5 mb-5">챗봇 응답</h4>
                  </div>
                </div>
              </div>
              <!-- End Output - Title -->

              <!-- Output Box - Rule -->
              <div class="box response" id="response_4">
                <div class="box-aside">
                  <button type="button" class="btn btn-icon btn-sm btn-round cbtn-action btn-box-move-up">
                    <i class="icon md-chevron-up" aria-hidden="true"></i>
                  </button>
                  <button type="button" class="btn btn-icon btn-sm btn-round cbtn-action btn-box-move-down">
                    <i class="icon md-chevron-down" aria-hidden="true"></i>
                  </button>
                  <button type="button" class="btn btn-icon btn-sm btn-round cbtn-action btn-box-delete">
                    <i class="icon md-delete" aria-hidden="true"></i>
                  </button>
                </div>
                <div class="panel box-main">
                  <div class="panel-heading">
                    <h3 class="panel-title">챗봇 응답 조건</h3>
                  </div>
                  <div class="panel-body response-rule-box">
                    <div class="response-card w-p100 mt-0" id="responseCard_4_0">
                      <div class="card skill-card response-card-body mb-5 w-p100">
                        <div class="card-block m-0">
                          <p class="card-title font-weight-400">
                            <i class="icon fa-code-fork font-size-18  mx-5 mb-5" aria-hidden="true"></i> 조건 체크 함수
                          </p>
                          <select class="form-control select-response-rule"></select>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <!-- End Output Box - Rule -->

              <!-- Output Box - Text -->
              <div class="box response" id="response_0">
                <div class="box-aside">
                  <button type="button" class="btn btn-icon btn-sm btn-round cbtn-action btn-box-move-up">
                    <i class="icon md-chevron-up" aria-hidden="true"></i>
                  </button>
                  <button type="button" class="btn btn-icon btn-sm btn-round cbtn-action btn-box-move-down">
                    <i class="icon md-chevron-down" aria-hidden="true"></i>
                  </button>
                  <button type="button" class="btn btn-icon btn-sm btn-round cbtn-action btn-box-delete">
                    <i class="icon md-delete" aria-hidden="true"></i>
                  </button>
                </div>
                <div class="panel box-main">
                  <div class="panel-heading">
                    <h3 class="panel-title">챗봇 응답 - 텍스트형</h3>
                    <span class="action-title">전송타입 </span>
                    <div class="action-btns">
                      <div class="sending-type-btns btn-group btn-group-sm panel-action" aria-label="Small button group" role="group">
                        <button type="button" class="btn cbtn-action w-60 active">케로셀</button>
                        <button type="button" class="btn cbtn-action w-60">랜덤형</button>
                      </div>
                    </div>
                  </div>
                  <div class="panel-body response-card-box">
                    <div class="response-card" id="responseCard_0_0">
                      <div class="response-card-actions" >
                        <button type="button" class="btn btn-icon btn-pure m-0 p-5 float-left handle-card">
                          <i class="icon md-code-setting font-size-16 mr-0" aria-hidden="true"></i></button>
                        <button type="button" class="btn btn-icon btn-pure m-0 p-5 float-right">
                          <i class="icon md-delete font-size-16 mr-0" aria-hidden="true"></i></button>
                      </div>
                      <div class="card response-card-body mt-30">
                        <div class="card-block card-block-evt card-block-text">
                          <p class="card-text">Some quick example text to build on the card title and make up
                            the bulk of the card's content.</p>
                        </div>
                        <div class="card-block card-block-btns">
                          <button type="button" class="btn btn-block card-btn response-card-btn">
                            <i class="icon fa-sort handle-card-btn position-absolute" style="left:10px" aria-hidden="true"></i>
                            Default1</button>
                          <button type="button" class="btn btn-block card-btn response-card-btn">
                            <i class="icon fa-sort handle-card-btn position-absolute" style="left:10px" aria-hidden="true"></i>
                            Default2</button>
                          <button type="button" class="btn btn-block card-btn-action ignore-elements">+ 버튼 추가</button>
                        </div>
                      </div>
                    </div>
                    <div class="response-card" id="responseCard_0_1">
                      <div class="response-card-actions" >
                        <button type="button" class="btn btn-icon btn-pure m-0 p-5 float-left handle-card">
                          <i class="icon md-code-setting font-size-16 mr-0" aria-hidden="true"></i></button>
                        <button type="button" class="btn btn-icon btn-pure m-0 p-5 float-right">
                          <i class="icon md-delete font-size-16 mr-0" aria-hidden="true"></i></button>
                      </div>
                      <div class="card response-card-body mt-30">
                        <div class="card-block card-block-evt card-block-text">
                          <p class="card-text">내용을 입력하세요.</p>
                        </div>
                        <div class="card-block">
                          <button type="button" class="btn btn-block card-btn-action">+ 버튼 추가</button>
                        </div>
                      </div>
                    </div>
                    <div class="response-card-empty card ignore-elements bg-transparent" >
                      <span class="align-center" aria-hidden="true">
                        <button type="button" class="btn btn-round cbtn-action btn-addcard"
                                data-placement="right" data-toggle="tooltip" data-original-title="카드 추가">
                          <i class="icon md-plus font-size-26" aria-hidden="true"></i>
                        </button>
                      </span>
                    </div>
                  </div>
                </div>
              </div>
              <!-- End Output Box - Text -->

              <!-- Output Box - Image -->
              <div class="box response" id="response_1">
                <div class="box-aside">
                  <button type="button" class="btn btn-icon btn-sm btn-round cbtn-action btn-box-move-up">
                    <i class="icon md-chevron-up" aria-hidden="true"></i>
                  </button>
                  <button type="button" class="btn btn-icon btn-sm btn-round cbtn-action btn-box-move-down">
                    <i class="icon md-chevron-down" aria-hidden="true"></i>
                  </button>
                  <button type="button" class="btn btn-icon btn-sm btn-round cbtn-action btn-box-delete">
                    <i class="icon md-delete" aria-hidden="true"></i>
                  </button>
                </div>
                <div class="panel box-main">
                  <div class="panel-heading">
                    <h3 class="panel-title">챗봇 응답 - 이미지형</h3>
                    <span class="action-title">전송타입 </span>
                    <div class="action-btns">
                      <div class="sending-type-btns btn-group btn-group-sm panel-action" aria-label="Small button group" role="group">
                        <button type="button" class="btn cbtn-action w-60 active">케로셀</button>
                        <button type="button" class="btn cbtn-action w-60">랜덤형</button>
                      </div>
                    </div>
                  </div>
                  <div class="panel-body response-card-box">
                    <div class="response-card" id="responseCard_1_0">
                      <div class="response-card-actions" >
                        <button type="button" class="btn btn-icon btn-pure m-0 p-5 float-left handle-card">
                          <i class="icon md-code-setting font-size-16 mr-0" aria-hidden="true"></i></button>
                        <button type="button" class="btn btn-icon btn-pure m-0 p-5 float-right">
                          <i class="icon md-delete font-size-16 mr-0" aria-hidden="true"></i></button>
                      </div>
                      <div class="card response-card-body mt-30">
                        <img class="card-img-top img-fluid card-block-evt card-block-img"
                             src="${pageContext.request.contextPath}/images/placeholder.png" alt="Card image cap" />
                      </div>
                    </div>
                    <div class="response-card-empty card ignore-elements bg-transparent" >
                      <span class="align-center" aria-hidden="true">
                        <button type="button" class="btn btn-round cbtn-action btn-addcard"
                                data-placement="right" data-toggle="tooltip" data-original-title="카드 추가">
                          <i class="icon md-plus font-size-26" aria-hidden="true"></i>
                        </button>
                      </span>
                    </div>
                  </div>
                </div>
              </div>
              <!-- End Output Box - Image -->

              <!-- Output Box - Card -->
              <div class="box response" id="response_2">
                <div class="box-aside">
                  <button type="button" class="btn btn-icon btn-sm btn-round cbtn-action btn-box-move-up">
                    <i class="icon md-chevron-up" aria-hidden="true"></i>
                  </button>
                  <button type="button" class="btn btn-icon btn-sm btn-round cbtn-action btn-box-move-down">
                    <i class="icon md-chevron-down" aria-hidden="true"></i>
                  </button>
                  <button type="button" class="btn btn-icon btn-sm btn-round cbtn-action btn-box-delete">
                    <i class="icon md-delete" aria-hidden="true"></i>
                  </button>
                </div>
                <div class="panel box-main">
                  <div class="panel-heading">
                    <h3 class="panel-title">챗봇 응답 - 카드형</h3>
                    <span class="action-title">전송타입 </span>
                    <div class="action-btns">
                      <div class="sending-type-btns btn-group btn-group-sm panel-action" aria-label="Small button group" role="group">
                        <button type="button" class="btn cbtn-action w-60 active">케로셀</button>
                        <button type="button" class="btn cbtn-action w-60">랜덤형</button>
                      </div>
                    </div>
                  </div>
                  <div class="panel-body response-card-box">
                    <div class="response-card" id="responseCard_2_0">
                      <div class="response-card-actions" >
                        <button type="button" class="btn btn-icon btn-pure m-0 p-5 float-left handle-card">
                          <i class="icon md-code-setting font-size-16 mr-0" aria-hidden="true"></i></button>
                        <button type="button" class="btn btn-icon btn-pure m-0 p-5 float-right">
                          <i class="icon md-delete font-size-16 mr-0" aria-hidden="true"></i></button>
                      </div>
                      <div class="card response-card-body mt-30">
                        <img class="card-img-top img-fluid card-block-evt card-block-img"
                             src="${pageContext.request.contextPath}/images/placeholder.png" alt="Card image cap" />
                        <div class="card-block card-block-evt card-block-title-text">
                          <h5 class="card-title">Card title</h5>
                          <p class="card-text">Some quick example text to build on the card title and make up
                            the bulk of the card's content.</p>
                        </div>
                        <div class="card-block card-block-btns">
                          <button type="button" class="btn btn-block card-btn response-card-btn">
                            <i class="icon fa-sort handle-card-btn position-absolute" style="left:10px" aria-hidden="true"></i>
                            Default1</button>
                          <button type="button" class="btn btn-block card-btn response-card-btn">
                            <i class="icon fa-sort handle-card-btn position-absolute" style="left:10px" aria-hidden="true"></i>
                            Default2</button>
                          <button type="button" class="btn btn-block card-btn-action ignore-elements">+ 버튼 추가</button>
                        </div>
                      </div>
                    </div>
                    <div class="response-card" id="responseCard_2_1">
                      <div class="response-card-actions" >
                        <button type="button" class="btn btn-icon btn-pure m-0 p-5 float-left handle-card">
                          <i class="icon md-code-setting font-size-16 mr-0" aria-hidden="true"></i></button>
                        <button type="button" class="btn btn-icon btn-pure m-0 p-5 float-right">
                          <i class="icon md-delete font-size-16 mr-0" aria-hidden="true"></i></button>
                      </div>
                      <div class="card response-card-body mt-30">
                        <img class="card-img-top img-fluid card-block-evt card-block-img"
                             src="${pageContext.request.contextPath}/images/placeholder.png" alt="Card image cap" />
                        <div class="card-block card-block-evt card-block-title-text">
                          <h5 class="card-title">타이틀을 입력하세요.</h5>
                          <p class="card-text">내용을 입력하세요.</p>
                        </div>
                        <div class="card-block card-block-btns">
                          <button type="button" class="btn btn-block card-btn-action ignore-elements">+ 버튼 추가</button>
                        </div>
                      </div>
                    </div>
                    <div class="response-card-empty card ignore-elements bg-transparent" >
                      <span class="align-center" aria-hidden="true">
                        <button type="button" class="btn btn-round cbtn-action btn-addcard"
                                data-placement="right" data-toggle="tooltip" data-original-title="카드 추가">
                          <i class="icon md-plus font-size-26" aria-hidden="true"></i>
                        </button>
                      </span>
                    </div>
                  </div>
                </div>
              </div>
              <!-- End Output Box - Card -->

              <!-- Output Box - List -->
              <div class="box response" id="response_3">
                <div class="box-aside">
                  <button type="button" class="btn btn-icon btn-sm btn-round cbtn-action btn-box-move-up">
                    <i class="icon md-chevron-up" aria-hidden="true"></i>
                  </button>
                  <button type="button" class="btn btn-icon btn-sm btn-round cbtn-action btn-box-move-down">
                    <i class="icon md-chevron-down" aria-hidden="true"></i>
                  </button>
                  <button type="button" class="btn btn-icon btn-sm btn-round cbtn-action btn-box-delete">
                    <i class="icon md-delete" aria-hidden="true"></i>
                  </button>
                </div>
                <div class="panel box-main">
                  <div class="panel-heading">
                    <h3 class="panel-title">챗봇 응답 - 리스트형</h3>
                    <span class="action-title">전송타입 </span>
                    <div class="action-btns">
                      <div class="sending-type-btns btn-group btn-group-sm panel-action" aria-label="Small button group" role="group">
                        <button type="button" class="btn cbtn-action w-60 active">케로셀</button>
                        <button type="button" class="btn cbtn-action w-60">랜덤형</button>
                      </div>
                    </div>
                  </div>
                  <div class="panel-body response-card-box">
                    <div class="response-card" id="responseCard_3_0">
                      <div class="response-card-actions" >
                        <button type="button" class="btn btn-icon btn-pure m-0 p-5 float-left handle-card">
                          <i class="icon md-code-setting font-size-16 mr-0" aria-hidden="true"></i></button>
                        <button type="button" class="btn btn-icon btn-pure m-0 p-5 float-right">
                          <i class="icon md-delete font-size-16 mr-0" aria-hidden="true"></i></button>
                      </div>
                      <div class="card response-card-body mt-30">
                        <div class="card-header card-header-transparent card-header-bordered card-block-list-title card-block-evt">
                          <h5 class="card-title text-center">Card title</h5>
                        </div>
                        <div class="card-block card-block-list">
                          <ul class="list-group list-group-full list-group-dividered">
                            <li class="list-group-item card-block-list-item card-block-evt">
                              <div class="media">
                                <div class="media-body">
                                  <p class="title">Media Heading</p>
                                  <p class="content text-truncate">Diogenem. Utuntur iudicabit meo idem te...</p>
                                </div>
                                <div class="pl-20">
                                  <a href="javascript:void(0)">
                                    <img class="w-50 h-50" src="${pageContext.request.contextPath}/images/placeholder.png" alt="...">
                                  </a>
                                </div>
                              </div>
                            </li>
                            <li class="list-group-item card-block-list-item card-block-evt">
                              <div class="media">
                                <div class="media-body">
                                  <p class="title">Media Heading</p>
                                  <p class="content text-truncate">Diogenem. Utuntur iudicabit meo idem te...</p>
                                </div>
                                <div class="pl-20">
                                  <a href="javascript:void(0)">
                                    <img class="w-50 h-50" src="${pageContext.request.contextPath}/images/placeholder.png" alt="...">
                                  </a>
                                </div>
                              </div>
                            </li>
                            <li class="list-group-item card-block-list-item card-block-evt">
                              <div class="media">
                                <div class="media-body">
                                  <p class="title">Media Heading</p>
                                  <p class="content text-truncate">Diogenem. Utuntur iudicabit meo idem te...</p>
                                </div>
                                <div class="pl-20">
                                  <a href="javascript:void(0)">
                                    <img class="w-50 h-50" src="${pageContext.request.contextPath}/images/placeholder.png" alt="...">
                                  </a>
                                </div>
                              </div>
                            </li>
                            <li class="list-group-item">
                              <button type="button" class="btn btn-block btn-pure w-p100 h-p100">+ 목록 추가</button>
                            </li>
                          </ul>
                        </div>
                        <div class="card-block card-block-btns">
                          <button type="button" class="btn btn-block card-btn response-card-btn">
                            <i class="icon fa-sort handle-card-btn position-absolute" style="left:10px" aria-hidden="true"></i>
                            Default1</button>
                          <button type="button" class="btn btn-block card-btn response-card-btn">
                            <i class="icon fa-sort handle-card-btn position-absolute" style="left:10px" aria-hidden="true"></i>
                            Default2</button>
                          <button type="button" class="btn btn-block card-btn-action ignore-elements">+ 버튼 추가</button>
                        </div>
                      </div>
                    </div>
                    <div class="response-card" id="responseCard_3_1">
                      <div class="response-card-actions" >
                        <button type="button" class="btn btn-icon btn-pure m-0 p-5 float-left handle-card">
                          <i class="icon md-code-setting font-size-16 mr-0" aria-hidden="true"></i></button>
                        <button type="button" class="btn btn-icon btn-pure m-0 p-5 float-right">
                          <i class="icon md-delete font-size-16 mr-0" aria-hidden="true"></i></button>
                      </div>
                      <div class="card response-card-body mt-30">
                        <div class="card-header card-header-transparent card-header-bordered card-block-list-title card-block-evt">
                          <h5 class="card-title text-center">타이틀을 입력하세요.</h5>
                        </div>
                        <div class="card-block card-block-list">
                          <ul class="list-group list-group-full list-group-dividered">
                            <li class="list-group-item">
                              <button type="button" class="btn btn-block btn-pure w-p100 h-p100">+ 목록 추가</button>
                            </li>
                          </ul>
                        </div>
                        <div class="card-block card-block-btns">
                          <button type="button" class="btn btn-block card-btn-action ignore-elements">+ 버튼 추가</button>
                        </div>
                      </div>
                    </div>
                    <div class="response-card-empty card ignore-elements bg-transparent" >
                      <span class="align-center" aria-hidden="true">
                        <button type="button" class="btn btn-round cbtn-action btn-addcard"
                                data-placement="right" data-toggle="tooltip" data-original-title="카드 추가">
                          <i class="icon md-plus font-size-26" aria-hidden="true"></i>
                        </button>
                      </span>
                    </div>
                  </div>
                </div>
              </div>
              <!-- End Output Box - List -->

              <!-- Output Box - Skill -->
              <div class="box response" id="response_5">
                <div class="box-aside">
                  <button type="button" class="btn btn-icon btn-sm btn-round cbtn-action btn-box-move-up">
                    <i class="icon md-chevron-up" aria-hidden="true"></i>
                  </button>
                  <button type="button" class="btn btn-icon btn-sm btn-round cbtn-action btn-box-move-down">
                    <i class="icon md-chevron-down" aria-hidden="true"></i>
                  </button>
                  <button type="button" class="btn btn-icon btn-sm btn-round cbtn-action btn-box-delete">
                    <i class="icon md-delete" aria-hidden="true"></i>
                  </button>
                </div>
                <div class="panel box-main">
                  <div class="panel-heading">
                    <h3 class="panel-title">챗봇 응답 - 스킬형</h3>
                  </div>
                  <div class="panel-body response-card-box">
                    <div class="response-card w-p100 mt-0" id="responseCard_5_0">
                      <div class="card skill-card response-card-body mb-5 w-p100">
                        <div class="card-block m-0">
                          <p class="card-title font-weight-400">
                            <i class="icon fa-code font-size-18  mx-5 mb-5" aria-hidden="true"></i> 스킬 함수
                          </p>
                          <select class="form-control select-response-skill"></select>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <!-- End Output Box - Skill -->

              <!-- Output Box - Btns -->
              <div class="box response response-qbtn" id="response_6">
                <div class="box-aside">
                  <button type="button" class="btn btn-icon btn-sm btn-round cbtn-action btn-box-move-up">
                    <i class="icon md-chevron-up" aria-hidden="true"></i>
                  </button>
                  <button type="button" class="btn btn-icon btn-sm btn-round cbtn-action btn-box-move-down">
                    <i class="icon md-chevron-down" aria-hidden="true"></i>
                  </button>
                  <button type="button" class="btn btn-icon btn-sm btn-round cbtn-action btn-box-delete">
                    <i class="icon md-delete" aria-hidden="true"></i>
                  </button>
                </div>
                <div class="panel box-main">
                  <div class="panel-heading">
                    <h3 class="panel-title">챗봇 응답 - 바로연결 버튼 </h3>
                  </div>
                  <div class="panel-body response-qbtn-box px-15 pt-15 pb-10">
                    <button type="button" class="btn btn-round quick-btn mr-2 mb-2 px-20">
                      <span class="btn btn-round btn-sm btn-icon quick-btn-action handle-qbtn bg-grey-50 position-absolute" style="left:2px; top:2px">
                        <i class="icon md-code-setting" aria-hidden="true"></i>
                      </span>
                      Default
                    </button>
                    <button type="button" class="btn btn-round quick-btn mr-2 mb-2 px-20">
                      <span class="btn btn-round btn-sm btn-icon quick-btn-action handle-qbtn bg-grey-50 position-absolute" style="left:2px; top:2px">
                        <i class="icon md-code-setting" aria-hidden="true"></i>
                      </span>
                      Default
                    </button>
                    <button type="button" class="btn btn-round quick-btn mr-2 mb-2 px-20">
                      <span class="btn btn-round btn-sm btn-icon quick-btn-action handle-qbtn bg-grey-50 position-absolute" style="left:2px; top:2px">
                        <i class="icon md-code-setting" aria-hidden="true"></i>
                      </span>
                      Default
                    </button>
                    <button type="button" class="btn btn-icon btn-round cbtn-action ignore-elements mb-2">
                      <i class="icon md-plus" aria-hidden="true"></i>
                    </button>
                  </div>
                </div>
              </div>
              <!-- End Output Box - Btns -->

              <!-- Output - Button Group -->
              <div class="mt-30 mb-30 ml-50">
                <p class="mb-5 font-size-16 font-weight-400 " style="color: #616161;">+ 응답추가</p>
                <div class="btn-group mt-5">
                  <div class="btn-group" role="group">
                    <button type="button" class="btn w-80 px-0">
                      <i class="icon md-comment-more font-size-20" aria-hidden="true"></i>
                      <br>
                      <span class="text-uppercase hidden-sm-down">텍스트</span>
                    </button>
                  </div>

                  <div class="btn-group" role="group">
                    <button type="button" class="btn w-80 px-0">
                      <i class="icon md-comment-image font-size-20" aria-hidden="true"></i>
                      <br>
                      <span class="text-uppercase hidden-sm-down">이미지</span>
                    </button>
                  </div>

                  <div class="btn-group" role="group">
                    <button type="button" class="btn w-80 px-0">
                      <i class="icon md-comment-edit font-size-20" aria-hidden="true"></i>
                      <br>
                      <span class="text-uppercase hidden-sm-down">카드</span>
                    </button>
                  </div>

                  <div class="btn-group" role="group">
                    <button type="button" class="btn w-80 px-0">
                      <i class="icon md-comment-list font-size-20" aria-hidden="true"></i>
                      <br>
                      <span class="text-uppercase hidden-sm-down">리스트</span>
                    </button>
                  </div>

                  <div class="btn-group " role="group">
                    <button type="button" class="btn w-80 px-0">
                      <i class="icon fa-code font-size-18" aria-hidden="true"></i>
                      <br>
                      <span class="text-uppercase hidden-sm-down">스킬</span>
                    </button>
                  </div>

                  <div class="btn-group " role="group">
                    <button type="button" class="btn w-80 px-0">
                      <i class="icon fa-location-arrow font-size-18" aria-hidden="true"></i>
                      <br>
                      <span class="text-uppercase hidden-sm-down">퀵버튼</span>
                    </button>
                  </div>

                  <div class="btn-group " role="group">
                    <button type="button" class="btn w-80 px-0">
                      <i class="icon fa-code-fork font-size-18" aria-hidden="true"></i>
                      <br>
                      <span class="text-uppercase hidden-sm-down">조건</span>
                    </button>
                  </div>

                </div>
              </div>
              <!-- End Output - Button Group -->

              <!-- End Example Output Groups -->

            </div>
          </div>
        </div>
      </div>
</div>


<script type="text/javascript">
$("body").addClass("app-notebook page-aside-left dialog");

initialize_jstree();
initialize_components();

function initialize_components(){
    var to = false;
    
    $('#jstreeSearch').keydown(function (event) {
      if (event.keyCode === 13) {
        $(this).blur();
      }
      if (to) {
        clearTimeout(to);
      }
      to = setTimeout(function () {
        var v = $('#jstreeSearch').val();
        $('#jstree').jstree(true).search(v);
      }, 250);
    });

/* 
	let tokenfield = $(".input-box .tokenfield");
    tokenfield[0].value = "a|b";
    tokenfield.tokenfield({ delimiter: '|' }); 
*/

    // SortableJS options go here
    // See: (https://github.com/SortableJS/jquery-sortablejs)
    // See: (https://github.com/SortableJS/Sortable#options)
    $('.response-card-box').sortable({
      handle: '.handle-card', // handle's class
        filter: ".ignore-elements",
        draggable: ".response-card",
      animation: 150
    });

    $('.response-qbtn-box').sortable({
      handle: '.handle-qbtn', // handle's class
        filter: ".ignore-elements",
        draggable: ".quick-btn",
      animation: 150
    });

    $('.card-block-btns').sortable({
      handle: '.handle-card-btn', // handle's class
        filter: ".ignore-elements",
        draggable: ".response-card-btn",
      animation: 150
    });

    var defaults = Plugin.getDefaults("webuiPopover");

    var popEditTextHeader = $('#popoverEditTextHeader').html();
    var popEditTextContent = $('#popoverEditText').html();
    var popEditTextSettings = {
      title:popEditTextHeader,
      content: popEditTextContent,
      placement:'auto',
      width: 400,
      animation:'fade',
      backdrop:true,
      closeable: true
    };

    var popEditTitleTextHeader = $('#popoverEditTitleTextHeader').html();
    var popEditTitleTextContent = $('#popoverEditTitleText').html();
    var popEditTitleTextSettings = {
      title:popEditTitleTextHeader,
      content: popEditTitleTextContent,
      placement:'auto',
      width: 400,
      animation:'fade',
      backdrop:true,
      closeable: true
    };

    var popEditBtnHeader = $('#popoverEditBtnHeader').html();
    var popEditBtnContent = $('#popoverEditBtn').html();
    var popEditBtnSettings = {
      title:popEditBtnHeader,
      content:popEditBtnContent,
      placement:'auto',
      width: 400,
      animation:'fade',
      backdrop:true,
      closeable: true
    };

    var popEditImgHeader = $('#popoverEditImgHeader').html();
    var popEditImgContent = $('#popoverEditImg').html();
    var popEditImgSettings = {
      title:popEditImgHeader,
      content:popEditImgContent,
      placement:'auto',
      width: 400,
      animation:'fade',
      backdrop:true,
      closeable: true
    };

    var popEditListTitleHeader = $('#popoverListTitleHeader').html();
    var popEditListTitleContent = $('#popoverListTitle').html();
    var popEditListTitleSettings = {
      title:popEditListTitleHeader,
      content: popEditListTitleContent,
      placement:'auto',
      width: 400,
      animation:'fade',
      backdrop:true,
      closeable: true
    };

    var popoverListItemHeader = $('#popoverListItemHeader').html();
    var popoverListItemContent = $('#popoverListItem').html();
    var popoverListItemSettings = {
      title:popoverListItemHeader,
      content: popoverListItemContent,
      placement:'auto',
      width: 400,
      animation:'fade',
      backdrop:true,
      closeable: true
    };


    var arr_response = $(".response");
    for (var i = 0; i < arr_response.length; i++) {
      //console.log(arr_response[i].id)
      var response_id = '#'+arr_response[i].id;

      $(response_id+" .sending-type-btns > .btn").click({response_id: response_id}, function(param){
        $(param.data.response_id+" .sending-type-btns > .btn").removeClass("active");
        $(this).addClass("active");
      });

      $(response_id+" .box-aside").hide();
      $(response_id).mouseover({response_id: response_id}, function(param){
        $(param.data.response_id+" .box-aside").show();
      });
      $(response_id).mouseout({response_id: response_id}, function(param){
        $(param.data.response_id+" .box-aside").hide();
      });

      var select_response_rule = $(response_id+" .select-response-rule")
      select_response_rule.select2({
        dropdownCssClass: "increasedzindexclass",
        data: [
            {id: 'sys.is_login', text: '로그인 상태 체크 (sys.is_login)'},
            {id: 'sys.is_logout', text: '로그아웃 상태 체크 (sys.is_logout)'}
        ]
      });

      var select_response_skill = $(response_id+" .select-response-skill")
      select_response_skill.select2({
        dropdownCssClass: "increasedzindexclass",
        data: [
            {id: 'sys.get_news', text: '뉴스 가져오기 (sys.get_news)'},
            {id: 'sys.get_poppular_news', text: '인기 뉴스 가져오기 (sys.get_poppular_news)'}
        ]
      });

      $(response_id+" .response-qbtn-box .quick-btn").webuiPopover($.extend({
          onShow: function($element) {
            var popover_id = $element[0].id;
            var select_btn_type = $("#"+popover_id+" .select-btn-type");
            var select_intent = $("#"+popover_id+" .select-intent");
            var div_select_intent = $("#"+popover_id+" .div-select-intent");
            var div_input_url = $("#"+popover_id+" .div-input-url");

            div_select_intent.show();
            div_input_url.hide();

            if (!select_btn_type.data('select2')) {
              select_btn_type.select2({
                dropdownCssClass: "increasedzindexclass",
                data: [
                    {id: 'intent', text: 'intent 링크'},
                    {id: 'url', text: 'URL 링크'}
                ]
              });
              select_btn_type.on('select2:select', function (e) {
                e.preventDefault();
                var data = e.params.data;
                if (data.id == 'intent'){
                  div_select_intent.show();
                  div_input_url.hide();
                }
                else if (data.id == 'url'){
                console.log(data.id);
                  div_select_intent.hide();
                  div_input_url.show();
                }
                console.log(data);
              });
            }

            if (!select_intent.data('select2')) {
              select_intent.select2({
                dropdownCssClass: "increasedzindexclass",
                data: [
                  {id: 0, text: '의도 0'},
                  {id: 1, text: '의도 1'}
                ]
              });
            }
          }, // callback after show
          onHide: function($element) {}, // callback after hide
      }, defaults, popEditBtnSettings));

      // quick buttons actions show/hide
      var qbtn_id = response_id +' .quick-btn'
      $(qbtn_id+" .quick-btn-action").hide();
      $(qbtn_id).mouseover({qbtn_id: qbtn_id}, function(param){
        $(param.data.qbtn_id+" .quick-btn-action").show();
      });
      $(qbtn_id).mouseout({qbtn_id: qbtn_id}, function(param){
        $(param.data.qbtn_id+" .quick-btn-action").hide();
      });

      var arr_response_card = $(response_id+" .response-card")
      for (var c_i = 0; c_i < arr_response_card.length; c_i++) {
        console.log(arr_response_card[c_i].id)
        var card_id = response_id + ' #'+arr_response_card[c_i].id

        // card actions show/hide
        $(card_id+" .response-card-actions").hide();
        $(card_id).mouseover({card_id: card_id}, function(param){
          $(param.data.card_id+" .response-card-actions").show();
        });
        $(card_id).mouseout({card_id: card_id}, function(param){
          $(param.data.card_id+" .response-card-actions").hide();
        });

        // card buttons actions show/hide
        var btn_id = card_id +' .response-card-btn'
        $(btn_id+" .icon").hide();
        $(btn_id).mouseover({btn_id: btn_id}, function(param){
          $(param.data.btn_id+" .icon").show();
        });
        $(btn_id).mouseout({btn_id: btn_id}, function(param){
          $(param.data.btn_id+" .icon").hide();
        });

        // card webuiPopover
        $(card_id+" .card-block-text").webuiPopover($.extend({}, defaults, popEditTextSettings));
        $(card_id+" .card-block-title-text").webuiPopover($.extend({}, defaults, popEditTitleTextSettings));
        $(card_id+" .card-block-img").webuiPopover($.extend({}, defaults, popEditImgSettings));
        $(card_id+" .response-card-btn").webuiPopover($.extend({
          onShow: function($element) {
            var popover_id = $element[0].id
            var select_btn_type = $("#"+popover_id+" .select-btn-type")
            var select_intent = $("#"+popover_id+" .select-intent")
            var div_select_intent = $("#"+popover_id+" .div-select-intent")
            var div_input_url = $("#"+popover_id+" .div-input-url")

            div_select_intent.show()
            div_input_url.hide()

            if (!select_btn_type.data('select2')) {
              select_btn_type.select2({
                dropdownCssClass: "increasedzindexclass",
                data: [
                    {
                        id: 'intent',
                        text: 'intent 링크'
                    },
                    {
                        id: 'url',
                        text: 'URL 링크'
                    }
                ]
              });
              select_btn_type.on('select2:select', function (e) {
                e.preventDefault();
                var data = e.params.data;
                if (data.id == 'intent'){
                  div_select_intent.show()
                  div_input_url.hide()
                }
                else if (data.id == 'url'){
                console.log(data.id);
                  div_select_intent.hide()
                  div_input_url.show()
                }
                console.log(data);
              });
            }

            if (!select_intent.data('select2')) {
              select_intent.select2({
                dropdownCssClass: "increasedzindexclass",
                data: [
                  {
                    id: 0,
                    text: '의도 0'
                  },
                  {
                    id: 1,
                    text: '의도 1'
                  }
                ]
              });
            }
          }, // callback after show
          onHide: function($element) {}, // callback after hide
        }, defaults, popEditBtnSettings));
        $(card_id+" .card-block-list-title").webuiPopover($.extend({}, defaults, popEditListTitleSettings));
        $(card_id+" .card-block-list-item").webuiPopover($.extend({}, defaults, popoverListItemSettings));
      }
    }
}

function initialize_jstree(){
	refresh=true;
	
    //===== jstree category/intent node tree ==================
    $('#jstree').jstree({
      'core': {
        "check_callback": true,
        'data' : {
        	url:"/chatbot/getIntentList.do",
        	dataType:"json"
        }
      },
      "types" : {
        "#" : {
          "max_children" : 100,
          // "max_depth" : 3,
          "valid_children" : ["R"]
        },
        "R" : {
          "icon" : "fa-hashtag",
          "valid_children" : ["C", "I"]
        },
        "C" : {
          "icon" : "fa-folder-o",
          "valid_children" : ["C", "I"]
        },
        "I" : {
          "icon" : "fa-comments-o",
          "valid_children" : []
        }
      },
      "contextmenu":{
        "items": function($node) {
            return {
              "Create_Category": {
                "separator_before": false,
                "separator_after": false,
                "label": "시나리오생성",
                "icon": "fa-folder-o",
             
                "action": function (obj) {
                	let ref = $('#jstree').jstree(true)
                    let sel = ref.get_selected();
                    if(!sel.length) {
                      return false;
                    }
                    sel = sel[0];
                    let parent = ref.get_node(sel);

                	console.log(parent.children.length);
                	
                	if(parent.type !== "R"){
                		alert("루트노드에서만 생성이 가능합니다.");
                		return false;
                	}
             
                	createScenario();
                }
              },
              "Create_Intent": {
                  "separator_before": false,
                  "separator_after": false,
                  "label": "블록생성",
                  "icon": "fa-comments-o",
                  "action": function (obj) {
                    let ref = $('#jstree').jstree(true)
                    let sel = ref.get_selected();
                    if(!sel.length) {
                      return false;
                    }
                    sel = sel[0];
                    let parent = ref.get_node(sel);
                    if (parent.type === 'I'){
                      alert("블록노드는 블록을 생성할 수 없습니다.")
                      return false;
                    }
                    if (parent.type === 'R'){
                        alert("루트노드는 블록을 생성할 수 없습니다.")
                        return false;
                     }
                 
                    
                    console.log(parent.id);
                    createBlock(parent.id);
                    
                  }
                },
                "Rename": {
                    "separator_before": false,
                    "separator_after": false,
                    "label":"이름변경",
                    "icon": "fa-edit",
                    "action": function (obj) {
                      let ref = $('#jstree').jstree(true), sel = ref.get_selected();
                     
                      if(!sel.length) { return false; }
                      sel = sel[0];
                      let node = ref.get_node(sel);
                      if (node.type === 'R'){
                        alert("루트노드는 수정할 수 없습니다.");
                      }
                    
                      ref.edit(sel);
                      console.log(ref);
                      
                    }
                  },
                    "Remove": {
                      "separator_before": false,
                      "separator_after": false,
                      "label": "삭제",
                      "icon": "fa-trash",
                      "action": function (obj) {
                    	  let ref = $('#jstree').jstree(true)
                          let sel = ref.get_selected();
                          if(!sel.length) {
                            return false;
                          }
                          sel = sel[0];
                          let parent = ref.get_node(sel);

                      	console.log(parent.children.length);
                      	
                      	if(parent.type === "R"){
                      		alert("루트노드는 삭제할 수 없습니다.");
                      		return false;
                      	}
                      	
                      	if(parent.children.length > 0){
                      		alert("하위 블록이 있을 경우 삭제할 수 없습니다.");
                      		return false;
                      	}
                  		deleteCategory(parent.id);
                    }
                },
                "Open": {
                    "separator_before": false,
                    "separator_after": false,
                    "label": "전체열기",
                    "icon": "fa-folder-open",
                    "action": function (obj) {
                  	 	treeOpen();
                  }
              },
                "Close": {
                    "separator_before": false,
                    "separator_after": false,
                    "label": "전체닫기",
                    "icon": "fa-folder",
                    "action": function (obj) {
                  	 	treeClose();
                  }
              }
            }
        }
      },
      'plugins': [ 'search', "types", 'state', "wholerow", 'contextmenu']
    }).on("ready.jstree",function (){
    	$("#jstree").jstree("close_all");
    })
    .on("select_node.jstree", function (event, data) {
    	// 노드가 선택된 뒤 처리할 이벤트
		var type = data.instance.get_node(data.selected).type;
    	if( type === 'I'){
    		loadRightPage(data);
		}
   	})
   	.on('rename_node.jstree', function (e, data) {
           var ref = $('#jstree').jstree(true);
           console.log(data.node.id);
           if (data.text === data.old){
             return;
           }
           if (!confirm("이름을 수정하시겠습니까?")) return false;
           
           rename(data.text,data.node.id);
         })
         ;
    	
    /* .on('changed.jstree', function (e, data) {
      if (data.action == 'select_node'){
        let node = data.node;
       // reloadDetailView(node.id);
      }else {
       // reloadDetailView(0);
      }
    }); */
}
/* 
function reloadDetailView(node_id){
    let div_detail = $('#dlgIntents');
    if (node_id === '' || node_id === 0 || node_id === null){
      div_detail.html("");
      console.log("renderIntents", node_id, "fail");
      return;
    }
    console.log("renderIntents", node_id, "start");
    // div_detail.addClass('loader');
    $.post("{% url 'development:get_intent_html' %}",
      {
        csrfmiddlewaretoken: '{{ csrf_token }}',
        page: '{{page}}',
        node_id: node_id,
      },
      (function(data, status){
        div_detail.html(data);
        // div_detail.removeClass('loader');
        console.log("renderIntents", node_id, "end");
      }).bind(this)
    )
}

function showDivIntentTitleInput(){
    console.log("showDivIntentTitleInput")
    $("#intentTitle").hide();
    $("#intentTitleInput").show();
    let input = $("#intentTitleInput input");
    input.focus();
    input.focusTextToEnd();
}

  function hideDivIntentTitleInput(){
    console.log("hideDivIntentTitleInput")
    $("#intentTitle").show();
    $("#intentTitleInput").hide();
}

  function renameIntent(intent_id){
    console.log("renameIntent")
    let text = $("#intentTitleInput input").val();
    $("#intentTitle .title").html(text);
    $("#intentTitleInput input").val(text);
    $('#jstree').jstree('rename_node', intent_id , text);
    hideDivIntentTitleInput();
} */
  

  
	
	
	function createScenario(){
		console.log("click");	
		var request = $.ajax({
			url : "/chatbot/addScenario.do",
			method : "get"
		});

		request.done(function(data) {
			$("#jstree").jstree("refresh");
		});

		request.fail(function(error) {
			console.log(error);
		});
		
	}
	
	function createBlock(id){
		console.log("block생성" + id);	
		 
		var request = $.ajax({
			url : "/chatbot/addBlock.do?intent_id="+id,
			method : "get"
		});

		request.done(function(data) {
			$("#jstree").jstree("refresh");
		});

		request.fail(function(error) {
			console.log(error);
		});
		 
	}
	
	
	function deleteCategory(id){
		console.log("delete " + id);
		
		var request = $.ajax({
			url : "/chatbot/deleteCategory.do?intent_id="+id,
			method : "get"
		});

		request.done(function(data) {
			$("#jstree").jstree("refresh");
		});

		request.fail(function(error) {
			console.log(error);
		});
		
	}
	
	function rename(text,id){
		
		var request = $.ajax({
			url : "/chatbot/renameCategory.do?intent_id="+id+"&title="+text,
			method : "get"
		});

		request.done(function(data) {
			$("#jstree").jstree("refresh");
		});

		request.fail(function(error) {
			console.log(error);
		});
	}
	
	function treeOpen(){
		$("#jstree").jstree("open_all");
	}
	
	function treeClose(){
		$("#jstree").jstree("close_all");
	}
	
	function loadRightPage(data){
    	var id = data.instance.get_node(data.selected).id;
    	var text = data.instance.get_node(data.selected).text;
    	console.log(id);
    	console.log(text);
    	
    	$("#intent-id").val(id);
    	$("#title").text('');
    	$("#title").append(text);
    	
    	var request = $.ajax({
			url : "/chatbot/getInputText.do?intent_id="+id,
			method : "get"
		});

		request.done(function(data) {
			console.log(data);
			setInputText(data);
		});

		request.fail(function(error) {
			console.log(error);
		});
    	
	}
</script>
