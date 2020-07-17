<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!-- Page -->
<div class="page">
	<div class="page-content container-fluid">
	    <!-- Page -->
	    <!-- <h1 class="page-title">사용자 목록</h1> -->
	    <ol class="breadcrumb">
	      <li class="breadcrumb-item"><a href="/main/main.do">Home</a></li>
	      <li class="breadcrumb-item">사용자</li>
	      <li class="breadcrumb-item">일반회원</li>
	      <li class="breadcrumb-item active">회원상세</li>
	    </ol>

		<div class="col-lg-12">
			<div class="mb-30">
				<div class="panel">
					<div class="panel-body">
						<form:form method="post" modelAttribute="surveyVo">
							<div class="form-group row">
								<div class="col-md-1"></div>
									<label class="col-md-2 col-form-label">작성자 </label>
								<div class="col-md-8">
									<form:input type="text" readonly="true" class="form-control" path="create_user"/>
									<form:errors path="create_user"/>
								</div>
							</div>
							<div class="form-group row">
								<div class="col-md-1"></div>
									<label class="col-md-2 col-form-label">제목 </label>
								<div class="col-md-8">
									<form:input type="text" class="form-control" path="title"/>
									<form:errors path="title"/>
								</div>
							</div>
							<div class="form-group row">
								<div class="col-md-1"></div>
									<label class="col-md-2 col-form-label">설명 </label>
								<div class="col-md-8">
									<form:textarea type="text" class="form-control" path="content" rows ="5"/>
									<form:errors path="content"/>
								</div>
							</div>
							<div class="form-group row">
								<div class="col-md-1"></div>
									<label class="col-md-2 col-form-label">대표이미지 </label>
									<div class="col-md-8">
		                    			<input type="file" id="input-file-now-custom-1" data-plugin="dropify" <%-- data-default-file="${pageContext.request.contextPath}/images/placeholder.png" --%>/>
		                  			</div>
							</div>
		               
<div class="col-md-6 col-xl-4">
              <!-- Example Date Range -->
              <div class="example-wrap">
                <h4 class="example-title">Date Range</h4>
                <p>Set <code>name="start"</code> and <code>name="end"</code> for date
                  range.</p>
                <div class="example">
                  <div class="input-daterange" data-plugin="datepicker">
                    <div class="input-group">
                      <div class="input-group-prepend">
                        <span class="input-group-text">
                          <i class="icon md-calendar" aria-hidden="true"></i>
                        </span>
                      </div>
                      <input type="text" class="form-control" name="start" />
                    </div>
                    <div class="input-group">
                      <div class="input-group-prepend">
                        <span calss="input-group-text">to</span>
                      </div>
                      <input type="text" class="form-control" name="end" />
                    </div>
                  </div>
                </div>
              </div>
              </div>
			                
			                
				            <div class="form-group form-material row">
								<div class="col-md-9 offset-md-9">
									<button type="submit" class="btn btn-primary waves-effect waves-classic" id="userCreate" formaction="/user/create.do">등록 </button>
									<button type="button" class="btn btn-default btn-outline waves-effect waves-classic" id="userList">목록 </button>
								</div>
							</div>
							
                
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
	    	