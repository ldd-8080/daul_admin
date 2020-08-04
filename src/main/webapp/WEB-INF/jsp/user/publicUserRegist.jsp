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
	      <li class="breadcrumb-item active">회원등록</li>
	    </ol>
	
	    <div class="page-content">
	    	<div class="row">
	    		<div class="col-lg-4">
	    			<div class="mb-30">
    					<div class="panel">
    						<div class="panel-body text-center">
    							<img class="rounded-circle mb-10" width="150" height="150" src="${pageContext.request.contextPath}/images/placeholder.png" alt="...">
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
    									<span class="input-group-text">&nbsp;SMS&nbsp;</span>
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
	    							<div class="form-group row">
	    								<div class="col-md-2"></div>
		    							<label class="col-md-2 col-form-label">아이디 </label>
		    							<div class="col-md-6">
		    								<form:input type="text" class="form-control" path="user_id"/>
		    								<form:errors path="user_id"/>
		    							</div>
	    							</div>
	    							<div class="form-group row">
	    								<div class="col-md-2"></div>
		    							<label class="col-md-2 col-form-label">계정 </label>
		    							<div class="col-md-6">
		    								<form:select data-plugin="selectpicker" class="w-p100" path="channel">
			    								<option value="일반">일반</option>
			    								<option value="카카오">카카오</option>
			    							</form:select>
		    							</div>
	    							</div>
	    							<div class="form-group row">
	    								<div class="col-md-2"></div>
		    							<label class="col-md-2 col-form-label">유형 </label>
		    							<div class="col-md-6">
		    								<form:select data-plugin="selectpicker" class="w-p100" path="auth_type">
			    								<option value="public">일반</option>
			    								<option value="pro">전문가</option>
			    								<option value="admin">관리자</option>
			    							</form:select>
		    							</div>
	    							</div>
	    							<div class="form-group row">
	    								<div class="col-md-2"></div>
		    							<label class="col-md-2 col-form-label">이름 </label>
		    							<div class="col-md-6">
		    								<form:input type="text" class="form-control" path="name"/>
		    							</div>
	    							</div>
	    							<div class="form-group row">
	    								<div class="col-md-2"></div>
		    							<label class="col-md-2 col-form-label">비밀번호 </label>
		    							<div class="col-md-6">
		    								<form:input type="password" class="form-control" placeholder="영문자, 숫자 혼합 8~15자리" path="pw"/>
		    								<form:errors path="pw"/>
		    							</div>
	    							</div>
	    							<div class="form-group row">
	    								<div class="col-md-2"></div>
		    							<label class="col-md-2 col-form-label">비밀번호 확인 </label>
		    							<div class="col-md-6">
		    								<input type="password" class="form-control" id="pw-chk" placeholder="영문자, 숫자 혼합 8~15자리"/>
		    								<span class="text-left" id="pwChk-error"></span>
		    							</div>
	    							</div>
	    							<div class="form-group row">
	    								<div class="col-md-2"></div>
		    							<label class="col-md-2 col-form-label">전화번호 </label>
		    							<div class="col-md-6">
		    								<form:input type="text" class="form-control" path="phone"/>
		    							</div>
	    							</div>
	    							<div class="form-group row">
	    								<div class="col-md-2"></div>
		    							<label class="col-md-2 col-form-label">이메일 </label>
		    							<div class="col-md-6">
		    								<form:input type="text" class="form-control" path="email"/>
		    							</div>
	    							</div>
	    							<form:input type="hidden" path="email_chk" value="N"/>
	    							<form:input type="hidden" path="talk_chk" value="N"/>
	    							<form:input type="hidden" path="sms_chk" value="N"/>
	    							<form:input type="hidden" path="reg_date"/>
	    							<form:input type="hidden" path="last_login_date"/>
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
	</div>
<!-- End Page -->
</div>
<script type="text/javascript">
	var pwFlag = false;
	var pwRule = /^(?=.*[a-z])(?=.*[0-9]).{8,15}$/;
	
	function passwordCheck() {
		var pw = $("#pw").val();
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
				$("#pwChk-error").text("");
				pwFlag = false;
			}
		}
	}
	
	$("#pw").blur(function() {
		passwordCheck();
	});
	
	$("#pw-chk").blur(function() {
		passwordCheck();
	});
	
	// 수신여부 init
	var chkArr = ["${userVo.email_chk}", "${userVo.talk_chk}", "${userVo.sms_chk}"];
	
	$("input[type='checkbox']").each(function(idx) {
		if (chkArr[idx] === "Y") {
			if (!$(this).is(":checked")) {
				$(this).click();
			}
		} else {
			if ($(this).is(":checked")) {
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
	
	$("#userCreate").click(function() {
		passwordCheck();
		
		if (pwFlag) {
			alert("비밀번호를 확인해주세요.");
			return false;
		}
		
		if (!confirm("등록하시겠습니까?")) return false;
	});
	
	$("#userList").click(function() {
		location.href = "${pageContext.request.contextPath}/user/userListPage.do?auth_type=public";
	});
</script>
