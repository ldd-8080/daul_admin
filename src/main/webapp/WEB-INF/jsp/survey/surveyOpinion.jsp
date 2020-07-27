<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<div id="surveyOpnListTable"></div>

<div class="col-lg-12 mt-20">
  	<button class="btn btn-primary btn-outline float-right waves-effect waves-classic" type="button" data-toggle="modal" data-target="#surveyOpnRegModal" id="surveyOpnRegBtn">등록</button>
  	<button style="display: none;" type="button" data-toggle="modal" data-target="#surveyOpnDetailModal" id="surveyOpnDetailBtn">상세</button>
</div>

<!-- 설문조사 댓글등록 모달 -->
<div class="modal fade" id="surveyOpnRegModal" aria-hidden="true" aria-labelledby="surveyOpnRegModal" role="dialog" tabindex="-1">
  <div class="modal-dialog modal-simple modal-center">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">x</span>
        </button>
        <h4 class="modal-title">설문조사 댓글 등록</h4>
      </div>
      <div class="modal-body">
        <form id="surveyOpnRegForm">
        	<div class="example-wrap">
        		<h4 class="example-title">작성자</h4>
        		<input type="text" class="form-control" name="create_user" value="${login.user_id}" readonly/>
      			<h4 class="example-title">작성자 유형</h4>
      			<input type="text" class="form-control" name="auth_type" value="${login.auth_type}" readonly/>
    			<h4 class="example-title">내용</h4>
      			<textarea class="form-control" name="opinion_content" rows="5"></textarea>
      			
      			<input type="hidden" name="survey_idx" value="${surveyVo.survey_idx}"/>
      			<input type="hidden" name="opinion_idx" id="opinion_idx" value=""/>
      		</div>
        	
        	<span class="text-left" id="chk-error"></span>
        	<div style="text-align:center">
        		<button type="button" class="btn btn-primary waves-effect waves-classics" data-title="댓글" id="surveyOpinionRegistBtn" >등록 </button>
        	 	<button type="button" class="btn btn-default waves-effect waves-classics" data-dismiss="modal" aria-label="Close">취소 </button>
        	</div>
        </form>
       
      </div>
      <div class="modal-footer">
        <!-- <button type="button" class="btn btn-default btn-pure" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button> -->
      </div>
    </div>
  </div>
</div>
<!-- 설문조사 댓글등록 모달 끝 -->

<!-- 설문조사 상세 모달 -->
<div class="modal fade" id="surveyOpnDetailModal" aria-hidden="true" aria-labelledby="surveyOpnDetailModal" role="dialog" tabindex="-1">
  <div class="modal-dialog modal-simple modal-center">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">x</span>
        </button>
        <h4 class="modal-title">설문조사 댓글 상세</h4>
      </div>
      <div class="modal-body">
        <form id="surveyOpnDetailForm" method="post">
        	<div class="example-wrap">
        		<h4 class="example-title">작성자</h4>
        		<input type="text" class="form-control" name="create_user" id="detailCreateUser" value="" readonly/>
      			<h4 class="example-title">작성자 유형</h4>
      			<input type="text" class="form-control" name="auth_type" id="detailAuthType" value="" readonly/>
    			<h4 class="example-title">내용</h4>
      			<textarea class="form-control" name="opinion_content" id="detailOpinionContent" rows="5"></textarea>
      			
      			<input type="hidden" name="survey_idx" id="detailSurveyIdx" value="${surveyVo.survey_idx}"/>
      			<input type="hidden" name="opinion_idx" id="detailOpinionIdx" value=""/>
      		</div>
        	
        	<span class="text-left" id="chk-error"></span>
        	<div style="text-align:center">
        		<button type="submit" class="btn btn-primary waves-effect waves-classics" name="surveySubmitBtn" data-title="댓글" formaction="/survey/surveyOpinionModify.do">수정 </button>
        		<button type="submit" class="btn btn-primary waves-effect waves-classics" name="surveySubmitBtn" data-title="댓글" formaction="/survey/surveyOpinionDelete.do">삭제 </button>
        	 	<button type="button" class="btn btn-default waves-effect waves-classics" data-dismiss="modal" aria-label="Close">취소 </button>
        	</div>
        </form>
       
      </div>
      <div class="modal-footer">
        <!-- <button type="button" class="btn btn-default btn-pure" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button> -->
      </div>
    </div>
  </div>
</div>
<!-- 설문조사 상세 모달 끝 -->

<script type="text/javascript">
	
	
</script>