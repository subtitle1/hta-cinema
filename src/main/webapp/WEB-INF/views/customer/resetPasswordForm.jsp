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
			<form id="form-resetPassword">
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
					<button id="btn-resetPassword" type="button" class="btn btn-primary btn-lg" disabled>확인</button>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	$(function() {
		// 비밀번호 유효성 검사를 위한 정규표현식들
		const engReg = /[a-zA-Z]/;
		const numReg = /[0-9]/;
		const specialReg = /[~!@#$%^&*+=?_-]/;
		const allowedReg = /^[a-zA-Z0-9~!@#$%^&*+=?_-]+$/;
		
		const newPasswordInput = $("#input-newPassword");
		const newPasswordCheckInput = $("#input-newPassword-check");
		const passwordErrorDiv = $("#div-password-error");
		const matchErrorDiv = $("#div-match-error");
		
		const newPasswordInputTooltip = new bootstrap.Tooltip(newPasswordInput);
		const newPasswordCheckInputTooltip = new bootstrap.Tooltip(newPasswordCheckInput);
		
		// 비밀번호 input에 잘못된 입력이 있을 때를 대비해 기존의 값을 저장하는 객체
		const savedValue = {newPasswordInputSavedValue: "", newPasswordCheckInputSavedValue: ""};
		
		// 유효성 검사를 통과했는지 여부를 저장하는 변수로 true이면 통과한 것이다.
		let passwordValidationFlag = false;
		let passwordInputValueMatchFlag = false;
		
		/*
		 * divElement: 에러 메세지를 표시할 엘리먼트, flag: true/false
		 * flag에 따라 divElement의 바로 이전에 있는 엘리먼트의 클래스에 row-other를 제거하거나 추가한다.
		 * flag에 따라 divElement의 hidden 속성을 추가하거나 제거한다.
		 * flag가 true이면 divElement의 바로 이전에 있는 엘리먼트의 클래스에서 row-other를 제거하고
		 *  divElement의 hidden 속성을 제거해서 보이게 한다.
		 */
		function showErrorMessage(divElement, flag) {
			if (flag) {
				divElement.prev().removeClass("row-other");
				divElement.prop("hidden", false);
			} else {
				divElement.prev().addClass("row-other");
				divElement.prop("hidden", true);
			}
		}
		
		
		// 비밀번호와 비밀번호 확인의 값이 동일한지 체크하고 결과에 따라 에러 메세지를 보이거나 flag의 값을 변경한다.
		// 비밀번호 확인 input의 값이 비어있으면 에러 메세지를 보이지 않는다.
		function checkNewPasswordInputValueMatch() {
			if (newPasswordCheckInput.val() === "") {
				showErrorMessage(matchErrorDiv, false);
				passwordInputValueMatchFlag = false;
				return;
			}
			
			if (newPasswordInput.val() === newPasswordCheckInput.val()) {
				showErrorMessage(matchErrorDiv, false);
				passwordInputValueMatchFlag = true;
			} else {
				showErrorMessage(matchErrorDiv, true);
				passwordInputValueMatchFlag = false;
			}
		}
		
		/*
		 * inputElement: 유효성 검사를 실시할 inputElement
		 * savedValueKey: 값을 저장할 savedValue 객체의 key
		 * tooltip: input 엘리먼트에 해당하는 tooltip
		 * 비밀번호와 비밀번호 확인에 동일하게 적용되는 유효성 검사이다.
		 * 비밀번호에는 영문, 숫자, 일부 특수문자의 입력만 허용된다.
		 * 비밀번호 input이 비어있거나 허용된 값만 있으면 savedValue 객체에 그 값을 저장한다.
		 * 비밀번호 input에 허용되지 않는 값이 포함되어 있으면 이전으로 되돌리고 툴팁을 표시한다.
		 * 마지막에는 비밀번호와 비밀번호 확인의 값이 동일한지 체크한다.
		 */
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
		
		/*
		 * 비밀번호에서만 적용되는 유효성 검사이다.
		 * 비밀번호의 길이와 조합이 적절한지 확인한다.
		 * 비밀번호는 10자리 이상, 16자리 이하만 가능하다.
		 * 비밀번호는 영문, 숫자, 일부 특수문자 중 2가지 이상이 조합되어야 한다.
		 * 유효성 검사 통과 여부에 따라 에러메세지를 표시하거나 flag의 값을 변경한다.
		 */
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
				passwordValidationFlag = false;
			} else {
				showErrorMessage(passwordErrorDiv, false);
				passwordValidationFlag = true;
			}
		}
		
		// 모든 유효성 검사를 통과했는지 확인하고 결과에 따라 "확인" 버튼을 활성화/비활성화한다.
		function checkAllFlagTrue() {
			console.log("passwordValidationFlag: " + passwordValidationFlag);
			console.log("passwordInputValueMatchFlag: " + passwordInputValueMatchFlag);
			if (passwordValidationFlag && passwordInputValueMatchFlag) {
				$("#btn-resetPassword").prop("disabled", false);
			} else {
				$("#btn-resetPassword").prop("disabled", true);
			}
		}
		
		// 비밀번호와 비밀번호 확인에 입력이 있을 때마다 실행되며 input 값에 대해 유효성 검사를 실시한다.
		newPasswordInput.keyup(function(event) {
			passwordCommonValidation($(this), "newPasswordInputSavedValue", newPasswordInputTooltip);
			passwordValidation($(this));
			checkAllFlagTrue();
		});
		newPasswordCheckInput.keyup(function(event) {
			passwordCommonValidation($(this), "newPasswordCheckInputSavedValue", newPasswordCheckInputTooltip);
			checkAllFlagTrue();
		});
		
		$("#btn-resetPassword").click(function(event) {
			let jsonNewPasswordForm = $("#form-resetPassword").serializeArray();
			
			$.ajax({
				type: "post",
				url: "/login",
				data: jsonLoginForm,
				dataType: "json",
				success: function(response) {
					if (response.status) {
						checkSaveIdChecked();
						
						window.location.reload();
					} else {
						document.getElementById("span-login-error-message").innerHTML = response.error;

						$("#btn-call-login-error").trigger("click");
					}
				}
			});
		});
	});
</script>
</html>