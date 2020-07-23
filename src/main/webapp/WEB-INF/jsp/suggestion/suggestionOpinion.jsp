<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<table class="table table-hover dataTable table-striped w-full" id="boardTable" data-plugin="dataTable">
	<thead>
	  <tr>
	    <th>번호</th>
	    <th>내용</th>
	    <th>작성자</th>
	    <th>작성자 유형</th>
	    <th>공감</th>
	    <th>등록일</th>
	    <th></th>
	  </tr>
	</thead>
    <tbody>
    	<c:forEach var="suggestionOpinion" items="${suggestionOpinionList}" varStatus="status">
    	<tr>
    		<td id="seq_${status.index}">${suggestionOpinion.opinion_idx}</td>
    		<td>${suggestionOpinion.opinion_content}</td>
    		<td>${suggestionOpinion.create_user}</td>
    		<td>작성자 유형</td>
    		<td>${suggestionOpinion.like_count}</td>
    		<td>${suggestionOpinion.create_date}</td>
    		<td>
    			<button class="btn btn-primary btn-outline float-right waves-effect waves-classic" type="button" data-toggle="modal" data-target="#qnaPositionCenter" name="opnToOpnModal">댓글 등록 </button>
    		</td>
   		</tr>
    	</c:forEach>
    </tbody>
</table>
<div class="col-lg-12 mt-20">
  	<button class="btn btn-primary btn-outline float-right waves-effect waves-classic" type="button" data-toggle="modal" data-target="#qnaPositionCenter" id="suggestionOpinionModal1">등록</button>
</div>

<!-- Q&A 답글등록 모달 -->
<div class="modal fade" id="qnaPositionCenter" aria-hidden="true" aria-labelledby="qnaPositionCenter" role="dialog" tabindex="-1">
  <div class="modal-dialog modal-simple modal-center">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">x</span>
        </button>
        <h4 class="modal-title">열린제안 댓글 등록</h4>
      </div>
      <div class="modal-body">
        <form id="suggestion-modal-opinion-form">
        	<div class="example-wrap">
        		<h4 class="example-title">작성자</h4>
        		<input type="text" class="form-control" name="create_user" value="${login.user_id}" readonly/>
      			<h4 class="example-title">작성자 유형</h4>
      			<input type="text" class="form-control" name="auth_type" value="${login.auth_type}" readonly/>
    			<h4 class="example-title">내용</h4>
      			<textarea class="form-control" name="opinion_content" rows="5"></textarea>
      			
      			<input type="hidden" name="suggestion_idx" value="${suggestionVo.suggestion_idx}"/>
      			<input type="hidden" name="opinion_idx" id="opinion_idx" value=""/>
      		</div>
        	
        	<span class="text-left" id="chk-error"></span>
        	<div style="text-align:center">
        		<button type="button" class="btn btn-primary waves-effect waves-classics" id="suggestionOpinionRegistBtn" >등록 </button>
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
<!-- Q&A 답글등록 모달 끝 -->

<script type="text/javascript">
	$("#suggestionOpinionModal1").click(function() {
		$("#opinion_idx").val("");
	});

	$("#suggestionOpinionRegistBtn").click(function() {
		var request = $.ajax({
			url: "/suggestion/suggestionOpinionRegist.do",
			method: "post",
			data: $("#suggestion-modal-opinion-form").serialize()
		});
		
		request.done(function(data) {
			location.href = "${pageContext.request.contextPath}/suggestion/suggestionListPage.do";
		});
		
		request.fail(function(error) {
			console.log("request fail", error)
		});
	});
	$("button[name='opnToOpnModal']").click(function() {
		var opinion_idx = $(this).parent().parent().find("td[id^='seq_']").text();
		$("#opinion_idx").val(opinion_idx);
	});
</script>