<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Page -->
<div class="page vertical-align text-center" data-animsition-in="fade-in" data-animsition-out="fade-out">
	<div class="page-content vertical-align-middle">
		<div class="panel">
			<div class="panel-body">
				<div class="brand">
					<img class="brand-img" src="${pageContext.request.contextPath}/img/logo-colored.png" alt="...">
					<h2 class="brand-text font-size-18">관리자 로그인</h2>
				</div>
				<form id="login-form">
					<div class="form-group form-material floating" data-plugin="formMaterial">
						<input type="text" class="form-control" id="user_id" name="user_id" />
						<label class="floating-label">ID</label>
					</div>
					<div class="form-group form-material floating" data-plugin="formMaterial">
						<input type="password" class="form-control" id="pw" name="pw" />
						<label class="floating-label">PASSWORD</label>
					</div>
					<span class="text-left" id="chk-error"></span>
					<button type="button" class="btn btn-primary btn-block btn-lg mt-40" id="login-btn">로그인</button>

				</form>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	

	$("#user_id").keydown(function(key) {
		if (key.keyCode === 13)
			login();
	});

	$("#pw").keydown(function(key) {
		if (key.keyCode === 13)
			login();
	});

	$("#login-btn").click(function() {
		login();
	});

	function login() {
		var request = $.ajax({ url : "/login/login.do", method : "post", data : $("#login-form").serialize() });
		request.done(function(data) {
			console.log(data);
			console.log("request done");

			if (data === "success") {
				location.href = "${pageContext.request.contextPath}/main/main.do";
			} else {
				$("#chk-error").text(data);
			}
		});
		request.fail(function(error) {
			console.log(error);
			console.log("request fail");
		});
	}

	//$("#user_id").val("admin");
	//$("#pw").val("Ekdhf123!");

	//$("#login-btn").trigger("click");
</script>