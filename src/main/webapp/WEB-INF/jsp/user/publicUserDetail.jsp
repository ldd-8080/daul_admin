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
	
	    <div class="page-content">
	    	<div class="row">
	    		<div class="col-lg-4">
	    			<div class="mb-30">
    					<div class="panel">
    						<div class="panel-body text-center">
    							<img class="rounded-circle mb-10" width="150" height="150" src="${pageContext.request.contextPath}/images/placeholder.png" alt="...">
    							<p class="form-control-plaintext"><b>회원가입일 : </b>${userVo.reg_date}</p>
    							<p class="form-control-plaintext"><b>최종로그인 : </b>${userVo.last_login_date}</p>
    						</div>
    					</div>
    					<div class="panel panel-bordered">
    						<div class="panel-heading">
    							<h3 class="panel-title">활동현황</h3>
    						</div>
    						<div class="panel-body">
    							<div class="input-group">
    								<div class="input-group-append">
    									<span class="input-group-text">열린제안</span>
    								</div>
    								<input type="text" class="form-control"/>
    							</div>
    							<div class="input-group">
    								<div class="input-group-append">
    									<span class="input-group-text">설문참여</span>
    								</div>
    								<input type="text" class="form-control"/>
    							</div>
    							<div class="input-group">
    								<div class="input-group-append">
    									<span class="input-group-text">공모참여</span>
    								</div>
    								<input type="text" class="form-control"/>
    							</div>
    							<div class="input-group">
    								<div class="input-group-append">
    									<span class="input-group-text">답변활동</span>
    								</div>
    								<input type="text" class="form-control"/>
    							</div>
    						</div>
    					</div>
    					<div class="panel panel-bordered">
    						<div class="panel-heading">
    							<h3 class="panel-title">수신여부</h3>
    						</div>
    						<div class="panel-body">
    							<div class="input-group">
    								<div class="input-group-append">
    									<span class="input-group-text">이메일</span>
    								</div>
    								<div class="form-control">
	    								<div class="float-left mr-20" id="email_chk-div">
	    									<input type="checkbox" data-plugin="switchery"/>
	    								</div>
    									<label class="pt-3" for="emailSwitch">On</label>
    								</div>
    							</div>
    							<div class="input-group">
    								<div class="input-group-append">
    									<span class="input-group-text">알림톡</span>
    								</div>
    								<div class="form-control">
    									<div class="float-left mr-20" id="talk_chk-div">
	    									<input type="checkbox" data-plugin="switchery"/>
	    								</div>
    									<label class="pt-3" for="talkSwitch">On</label>
    								</div>
    							</div>
    							<div class="input-group">
    								<div class="input-group-append">
    									<span class="input-group-text">SMS</span>
    								</div>
    								<div class="form-control">
    									<div class="float-left mr-20" id="sms_chk-div">
	    									<input type="checkbox" data-plugin="switchery"/>
	    								</div>
    									<label class="pt-3" for="smsSwitch">On</label>
    								</div>
    							</div>
    						</div>
    					</div>
	    			</div>
	    		</div>
	    		<div class="col-lg-8">
	    			<div class="mb-30">
	    				<div class="panel">
	    					<div class="panel-body">
	    						<form:form method="post" modelAttribute="userVo">
	    							<div class="form-group form-material row">
	    								<div class="col-md-2"></div>
		    							<label class="col-md-2 col-form-label">아이디 </label>
		    							<div class="col-md-6">
		    								<form:input type="text" class="form-control" path="user_id"/>
		    								<form:errors path="user_id"/>
		    							</div>
	    							</div>
	    							<div class="form-group form-material row">
	    								<div class="col-md-2"></div>
		    							<label class="col-md-2 col-form-label">계정 </label>
		    							<div class="col-md-6">
		    								<form:input type="text" class="form-control" path="channel"/>
		    							</div>
	    							</div>
	    							<div class="form-group form-material row">
	    								<div class="col-md-2"></div>
		    							<label class="col-md-2 col-form-label">유형 </label>
		    							<div class="col-md-6">
		    								<form:input type="text" class="form-control" path="auth_type"/>
		    							</div>
	    							</div>
	    							<div class="form-group form-material row">
	    								<div class="col-md-2"></div>
		    							<label class="col-md-2 col-form-label">이름 </label>
		    							<div class="col-md-6">
		    								<form:input type="text" class="form-control" path="name"/>
		    							</div>
	    							</div>
	    							<%-- <div class="form-group form-material row">
	    								<div class="col-md-2"></div>
		    							<label class="col-md-2 col-form-label">비밀번호 </label>
		    							<div class="col-md-6">
		    								<form:input type="password" class="form-control" placeholder="영문자, 숫자 혼합 8~15자리" path="new_pw"/>
		    								<form:errors path="new_pw"/>
		    							</div>
	    							</div>
	    							<div class="form-group form-material row">
	    								<div class="col-md-2"></div>
		    							<label class="col-md-2 col-form-label">비밀번호 확인 </label>
		    							<div class="col-md-6">
		    								<input type="password" class="form-control" id="pw-chk" placeholder="영문자, 숫자 혼합 8~15자리"/>
		    								<span class="text-left" id="pwChk-error"></span>
		    							</div>
	    							</div> --%>
	    							<div class="form-group form-material row">
	    								<div class="col-md-2"></div>
		    							<label class="col-md-2 col-form-label">전화번호 </label>
		    							<div class="col-md-6">
		    								<form:input type="text" class="form-control" path="phone"/>
		    							</div>
	    							</div>
	    							<div class="form-group form-material row">
	    								<div class="col-md-2"></div>
		    							<label class="col-md-2 col-form-label">이메일 </label>
		    							<div class="col-md-6">
		    								<form:input type="text" class="form-control" path="email"/>
		    							</div>
	    							</div>
	    							<form:input type="text" path="email_chk"/>
	    							<form:input type="text" path="talk_chk"/>
	    							<form:input type="text" path="sms_chk"/>
	    							<form:input type="text" path="reg_date"/>
	    							<form:input type="text" path="last_login_date"/>
	    							<div class="form-group form-material row">
	    								<div class="col-md-9 offset-md-9">
		    								<button type="submit" class="btn btn-primary waves-effect waves-classic" id="userSave" formaction="/user/update.do">저장 </button>
		    								<button type="submit" class="btn btn-danger waves-effect waves-classic" id="userDelete" formaction="/user/delete.do">삭제 </button>
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
	</div>
<!-- End Page -->
</div>
<script type="text/javascript">
	var pwFlag = false;
	var pwRule = /^(?=.*[a-zA-Z])(?=.*[0-9]).{10,12}$/;
	
	/* if ($("#pw").val() != null) {
		$("#pw").val("");
	} */
	
	function passwordCheck() {
		var pw = $("#new_pw").val();
		var pwChk = $("#pw-chk").val();

		if (pw !== pwChk) {
			$("#pwChk-error").text("비밀번호가 일치하지 않습니다.");
			pwFlag = true;
			return;
		} else {
			$("#pwChk-error").text("");
			pwFlag = false;
		}
		
		// 비밀번호가 빈값이 아닐때만 비밀번호 규칙 확인
		if (pw !== "") {
			if (!pwRule.test(pw)) {
				$("#pwChk-error").text("영문자, 숫자가 포함된 8~15자리로 입력해 주세요.");
				pwFlag = true;
			} else {
				$("#pwChk-error").text("영문자, 숫자가 포함된 8~15자리로 입력해 주세요.");
				pwFlag = false;
			}
		}
	}
	
	$("#pw-chk").blur(function() {
		passwordCheck();
	});
	
	// 수신여부 init
	var chkArr = ["${userVo.email_chk}", "${userVo.talk_chk}", "${userVo.sms_chk}"];
	
	$("input[type='checkbox']").each(function(idx) {
		if (chkArr[idx] === "N") {
			if ($(this).is(":checked")) {
				$(this).click();
			}
		} else {
			if (!$(this).is(":checked")) {
				$(this).click();
			}
		}
	});
	
	// 수신여부 click
	$(".float-left.mr-20").click(function(event) {
		// 수신여부 click하고난 후 :checked 상태에 따라 hidden으로 숨겨놓은 input태그의 value 설정
		// :checked = false -> value = 'N' , :checked = true -> value = 'Y'
		var currentId = event.currentTarget.id;
		var valueId = currentId.split("-")[0];
		
		if ($(event.currentTarget).children().eq(0).is(":checked")) {
			$("#" + valueId).val("Y");
		} else {
			$("#" + valueId).val("N");
		}
	});
	
	$("#userSave").click(function() {
		/* passwordCheck();
		
		if (pwFlag) {
			alert("비밀번호를 확인해주세요.");
			return;
		} */
		if (!confirm("수정하시겠습니까?")) return false;
	});
	
	$("#userDelete").click(function() {
		if (!confirm("삭제하시겠습니까?")) return false;
	});
	
	$("#userList").click(function() {
		location.href = "${pageContext.request.contextPath}/user/publicUserListPage.do";
	});
</script>
