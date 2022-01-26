<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="modal fade" id="modal-login-form" data-bs-backdrop="static" tabindex="-1" aria-labelledby="loginFormModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="loginFormModalLabel">로그인</h5>
				<button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<form method="post" action="login.do">
					<input type="text" class="form-control" name="id" maxlength="12" />
					<input type="password" class="form-control mt-3" name="password" maxlength="12" />
					<div class="form-check mt-3">
						<input class="form-check-input" type="checkbox" value="checked" id="flexCheckChecked" name="saveId" checked>
						<label class="form-check-label" for="flexCheckChecked">
							아이디 저장
						</label>
					</div>
					<div class="d-grid">
						<button id="btn-login" type="button" class="btn btn-primary mt-3" disabled>로그인</button>
					</div>
				</form>
				<button id="btn-call-login-error" data-bs-target="#modal-login-error" data-bs-toggle="modal" hidden></button>
			</div>
		</div>
	</div>
</div>
<div class="modal fade" id="modal-login-error" data-bs-backdrop="static" tabindex="-1" aria-labelledby="loginErrirModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-sm modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="loginErrirModalLabel">알림</h5>
				<button type="button" class="btn-close btn-close-white" data-bs-target="#modal-login-form" data-bs-toggle="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<span id="span-login-error-message"></span>
				<div class="d-flex justify-content-center mt-3">
					<button class="btn btn-primary" data-bs-target="#modal-login-form" data-bs-toggle="modal">확인</button>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	$(function() {
		function checkInputValueEmpty() {
			if (($("[name='id']").val() === "") || ($("[name='password']").val() === "")) {
				$("#btn-login").attr("disabled", true);
			} else {
				$("#btn-login").attr("disabled", false);
			}
		}
		
		$("[name='id']").keyup(function(event) {
			console.log("input-id keyup")
			checkInputValueEmpty();
		});
		$("[name='password']").keyup(function(event) {
			console.log("input-password keyup")
			checkInputValueEmpty();
		});
		
		// 로그인 버튼을 클릭했을 때 실행되며, ajax 통신을 통해 서버에 아이디와 비밀번호를 전송하고 서버에서 로그인 처리 결과를 받아온다.
		$("#btn-login").click(function(event) {
			let id = $("[name='id']").val();
			let password = $("[name='password']").val();
			
			$.ajax({
				type: "post",
				url: "/login",
				data: {"id": id, "password": password},
				dataType: "json",
				success: function(response) {
					if (response.status) {
						window.location.reload();
					} else {
						$("#span-login-error-message").text(response.error);
						$("#btn-call-login-error").trigger("click");
					}
				}
			});
		});
	});
</script>