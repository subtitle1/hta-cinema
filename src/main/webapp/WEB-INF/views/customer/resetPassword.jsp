<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>HTA CINEMA</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<link rel="stylesheet" href="/resources/css/common.css" />
	<link rel="stylesheet" href="/resources/css/customer/resetPassword.css" />
	<link rel="icon" href="/resources/images/favicon.ico" type="image/x-icon">
</head>
<body>
	<div class="container">
		<div class="content-wrap mx-auto">
			<div class="row">
				<div class="col">
					<a class="nav-link my-5" href="/">
						<img id="img-logo" src="/resources/images/logo/logo-htacinema-purple.png">
					</a>
				</div>
			</div>
			<div class="row mb-4">
				<div class="col">
					<h3>비밀번호 재설정</h3>
				</div>
			</div>
			<div class="row">
				<div class="col px-0 mx-0">
					<ul class="ul-green">
						<li>보안인증이 완료되었습니다. 새로 사용하실 비밀번호를 입력해주세요.</li>
					</ul>
				</div>
			</div>
			<form action="">
				<div class="row p-0 row-top">
					<div class="col-3 m-0 ps-3 py-3 col-label">
						<label>아이디</label>
					</div>
					<div class="col-9 align-self-center">
						<span>${CUSTOMER_ID }</span>
					</div>
				</div>
				<div class="row p-0 row-other">
					<div class="col-3 m-0 ps-3 py-3 col-label">
						<label for="input-newPassword">새 비밀번호</label>
					</div>
					<div class="col-9 align-self-center">
						<input type="password" class="form-control" id="input-newPassword" name="newPassword" 
						placeholder="영문, 숫자, 특수기호 중 2가지 이상 조합" maxlength="16" 
						data-bs-toggle="tooltip" data-bs-placement="top" data-bs-trigger="manual" 
						title="비밀번호 설정 시 사용가능한 특수문자는 ~ ! @ # $ % ^ & * + = - ? _ 입니다." />
					</div>
				</div>
				<div id="div-password-error" class="row p-0 row-other" hidden>
					<div class="col-3 m-0 ps-3 py-3 col-label"></div>
					<div class="col-9 align-self-center">
						<span class="error">비밀번호는 영문, 숫자, 특수기호 중 2가지 이상을 조합해야 하며 10자리 이상 16자리 이하여야 합니다.</span>
					</div>
				</div>
			</form>
			<div class="row p-0 row-other">
				<div class="col-3 m-0 ps-3 py-3 col-label">
					<label for="input-check-newPassword">새 비밀번호 확인</label>
				</div>
				<div class="col-9 align-self-center">
					<input type="password" class="form-control" id="input-newPassword-check" 
					placeholder="영문, 숫자, 특수기호 중 2가지 이상 조합" maxlength="16" 
					data-bs-toggle="tooltip" data-bs-placement="top" data-bs-trigger="manual" 
					title="비밀번호 설정 시 사용가능한 특수문자는 ~ ! @ # $ % ^ & * + = - ? _ 입니다." />
				</div>
			</div>
			<div id="div-match-error" class="row p-0 row-other" hidden>
				<div class="col-3 m-0 ps-3 py-3 col-label"></div>
				<div class="col-9 align-self-center">
					<span class="error">비밀번호와 비밀번호 확인의 입력값이 일치하지 않습니다.</span>
				</div>
			</div>
			<div class="row mt-3 mb-4">
				<div class="col px-0 mx-0">
					<ul>
						<li>비밀번호는 영문, 숫자, 특수문자 중 2가지 이상 조합 10자리 이상으로 설정해주세요.</li>
						<li>비밀번호 설정 시 사용가능한 특수문자는 ~ ! @ # $ % ^ & * + = - ? _ 입니다.</li>
					</ul>
				</div>
			</div>
			<div class="row">
				<div class="d-grid col-6 mx-auto">
					<button id="btn-resetPassword" type="submit" class="btn btn-primary btn-lg" disabled>확인</button>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	$(function() {
		const engReg = /[a-zA-Z]/;
		const numReg = /[0-9]/;
		const specialReg = /[~!@#$%^&*+=?_-]/;
		const allowedReg = /^[a-zA-Z0-9~!@#$%^&*+=?_-]+$/;
		
		const newPasswordInput = $("#input-newPassword");
		const newPasswordCheckInput = $("#input-newPassword-check");
		const passwordErrorDiv = $("#div-password-error");
		const matchErrorDiv = $("#div-match-error");
		
		const savedValue = {newPasswordInputSavedValue: "", newPasswordCheckInputSavedValue: ""};
		
		const newPasswordInputTooltip = new bootstrap.Tooltip(newPasswordInput);
		const newPasswordCheckInputTooltip = new bootstrap.Tooltip(newPasswordCheckInput);
		
		function showErrorMessage(divElement, flag) {
			if (flag) {
				divElement.prev().removeClass("row-other");
				divElement.prop("hidden", false);
			} else {
				divElement.prev().addClass("row-other");
				divElement.prop("hidden", true);
			}
		}
		
		function checkNewPasswordInputValueMatch() {
			if (newPasswordCheckInput.val() === "" || newPasswordInput.val() === newPasswordCheckInput.val()) {
				showErrorMessage(matchErrorDiv, false);
			} else {
				showErrorMessage(matchErrorDiv, true);
			}
		}
		
		function passwordCommonValidation(inputElement, savedValueKey, tooltip) {
			const value = inputElement.val();
			console.log("allowedReg.test: " + allowedReg.test(value));
			
			if (allowedReg.test(value) || value === "") {
				savedValue[savedValueKey] = value;
			} else {
				inputElement.val(savedValue[savedValueKey]);
				tooltip.show();
				setTimeout(function() {
					tooltip.hide();
				}, 3000);
				console.log("savedValue: " + savedValue[savedValueKey]);
				clearTimeout();
			}
			
			checkNewPasswordInputValueMatch();
		}
		
		function passwordValidation(inputElement) {
			const value = inputElement.val();
			
			if (!(value.length >= 10 && value.length <= 16)) {
				showErrorMessage(passwordErrorDiv, true);
				return;
			}
			
			let totalCombination = 0;
			if (engReg.test(value)) {
				totalCombination++;
			}
			if (numReg.test(value)) {
				totalCombination++;
			}
			if (specialReg.test(value)) {
				totalCombination++;
			}
			console.log("totalCombination: " + totalCombination);
			if (totalCombination < 2) {
				showErrorMessage(passwordErrorDiv, true);
			} else {
				showErrorMessage(passwordErrorDiv, false);
			}
		}
		
		newPasswordInput.keyup(function(event) {
			passwordCommonValidation($(this), "newPasswordInputSavedValue", newPasswordInputTooltip);
			passwordValidation($(this));
		});
		newPasswordCheckInput.keyup(function(event) {
			passwordCommonValidation($(this), "newPasswordCheckInputSavedValue", newPasswordCheckInputTooltip);
		});
	});
</script>
</html>