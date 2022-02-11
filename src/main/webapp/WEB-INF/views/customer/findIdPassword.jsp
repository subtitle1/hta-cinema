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
	<link rel="stylesheet" href="/resources/css/customer/customerCommon.css" />
	<link rel="icon" href="/resources/images/favicon.ico" type="image/x-icon">
</head>
<body>
<%@include file="/WEB-INF/views/common/noticeModal.jsp"%>
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
					<h3>아이디/비밀번호 찾기</h3>
				</div>
			</div>
			<ul class="nav nav-tabs nav-justified" id="myTab" role="tablist">
				<li class="nav-item" role="presentation">
					<button class="nav-link active" id="findId-tab" data-bs-toggle="tab" data-bs-target="#findId" 
					type="button" role="tab" aria-controls="findId" aria-selected="true">아이디 찾기</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="findPassword-tab" data-bs-toggle="tab" data-bs-target="#findPassword" 
					type="button" role="tab" aria-controls="findPassword" aria-selected="false">비밀번호 찾기</button>
				</li>
			</ul>
			<div class="tab-content">
				<div class="tab-pane active" id="findId" role="tabpanel" aria-labelledby="findId-tab">
					<form id="form-findId">
						<input type="hidden" name="find" value="id" />
						<div class="row mt-4">
							<div class="col p-0">
								<h5>간편 찾기</h5>
							</div>
						</div>
						<div class="row p-0 row-top">
							<div class="col-3 m-0 ps-3 py-3 col-label">
								<label for="input-findId-name">이름</label>
							</div>
							<div class="col-9 align-self-center">
								<input type="text" class="form-control" id="input-findId-name" name="name" placeholder="이름" maxlength="17" />
							</div>
						</div>
						<div class="row p-0 row-other">
							<div class="col-3 m-0 ps-3 py-3 col-label">
								<label for="input-findId-birthDate">생년월일</label>
							</div>
							<div class="col-9 align-self-center">
								<input type="text" class="form-control" id="input-findId-birthDate" name="birthDate" placeholder="생년월일 앞8자리" maxlength="8" />
							</div>
						</div>
						<div id="div-birthDate-error" class="row p-0 row-other" hidden>
							<div class="col-3 m-0 ps-3 py-3 col-label"></div>
							<div class="col-9 align-self-center">
								<span class="error">잘못된 생년월일 형식입니다.</span>
							</div>
						</div>
						<div class="row p-0 row-other">
							<div class="col-3 m-0 ps-3 py-3 col-label">
								<label for="input-findId-phoneNumber">휴대폰 번호</label>
							</div>
							<div class="col-9 align-self-center">
								<input type="text" class="form-control" id="input-findId-phoneNumber" name="phoneNumber" placeholder="'-' 없이 입력" maxlength="11" />
							</div>
						</div>
						<div id="div-findId-phoneNumber-error" class="row p-0 row-other" hidden>
							<div class="col-3 m-0 ps-3 py-3 col-label"></div>
							<div class="col-9 align-self-center">
								<span class="error">잘못된 휴대폰 번호 형식입니다.</span>
							</div>
						</div>
						<div class="row mt-4">
							<div class="d-grid col-6 mx-auto">
								<button id="btn-findId" type="button" class="btn btn-primary btn-lg">아이디 찾기</button>
							</div>
						</div>
					</form>
				</div>
				<div class="tab-pane" id="findPassword" role="tabpanel" aria-labelledby="findPassword-tab">
					<form id="form-findPassword" action="/customer/resetPasswordForm" method="post">
						<input type="hidden" name="find" value="password" />
						<div class="row mt-4">
							<div class="col p-0">
								<h5>간편 찾기</h5>
							</div>
						</div>
						<div class="row p-0 row-top">
							<div class="col-3 m-0 ps-3 py-3 col-label">
								<label for="input-findPassword-id">아이디</label>
							</div>
							<div class="col-9 align-self-center">
								<input type="text" class="form-control" id="input-findPassword-id" name="id" placeholder="아이디" maxlength="12" />
							</div>
						</div>
						<div class="row p-0 row-other">
							<div class="col-3 m-0 ps-3 py-3 col-label">
								<label for="input-findPassword-name">이름</label>
							</div>
							<div class="col-9 align-self-center">
								<input type="text" class="form-control" id="input-findPassword-name" name="name" placeholder="이름" maxlength="17" />
							</div>
						</div>
						<div class="row p-0 row-other">
							<div class="col-3 m-0 ps-3 py-3 col-label">
								<label for="input-findPassword-phoneNumber">휴대폰 번호</label>
							</div>
							<div class="col-6 align-self-center">
								<input type="text" class="form-control" id="input-findPassword-phoneNumber" name="phoneNumber" placeholder="'-' 없이 입력" maxlength="11" />
							</div>
							<div class="col-3 align-self-center">
								<button id="btn-request-authentication" type="button" class="btn btn-primary">인증요청</button>
							</div>
						</div>
						<div class="row p-0 row-other">
							<div class="col-3 m-0 ps-3 py-3 col-label">
								<label for="input-findPassword-authenticationCode">인증번호</label>
							</div>
							<div class="col-6 align-self-center">
								<input type="number" class="form-control" id="input-findPassword-authenticationCode" />
							</div>
							<div class="col-3 align-self-center">
								<button type="button" id="btn-check-authentication" class="btn btn-primary" disabled>인증확인</button>
							</div>
						</div>
						<div class="row p-0 row-other" hidden>
							<div class="col-3 m-0 ps-3 py-3 col-label"></div>
							<div class="col-9 align-self-center">
								<span class="error">인증번호가 일치하지 않습니다.</span>
							</div>
						</div>
						<div class="row mt-4">
							<div class="d-grid col-6 mx-auto">
								<button id="btn-findPassword" type="submit" class="btn btn-primary btn-lg" disabled>비밀번호 찾기</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
<script src="/resources/js/customer/regExp.js"></script>
<script src="/resources/js/customer/showErrorDiv.js"></script>
<script src="/resources/js/customer/onlyNumberAllowedValidation.js"></script>
<script src="/resources/js/customer/nameValidation.js"></script>
<script src="/resources/js/customer/birthDateValidation.js"></script>
<script src="/resources/js/customer/findIdPasswordPhoneNumberValidation.js"></script>
<script src="/resources/js/customer/idValidation.js"></script>
<script src="/resources/js/customer/phoneNumberValidation.js"></script>
<script>
	$(function() {
		const findIdNameInput = $("#input-findId-name");
		const findIdBirthDateInput = $("#input-findId-birthDate");
		const findIdPhoneNumberInput = $("#input-findId-phoneNumber");
		const findPasswordIdInput = $("#input-findPassword-id");
		const findPasswordNameInput = $("#input-findPassword-name");
		
		const birthDateErrorDiv = $("#div-birthDate-error");
		const findIdPhoneNumberErrorDiv = $("#div-findId-phoneNumber-error");
		
		const findPasswordRequestAuthenticationButton = $("#btn-request-authentication");
		const findPasswordCheckAuthenticationButton = $("#btn-check-authentication");
		
		const noticeModal = new bootstrap.Modal(document.getElementById("modal-notice"), {
			keyboard: false
		});
		
		// 인증번호에 사용되는 4자리 난수, 1000 ~ 9999
		const fourDigitRandomNumber = Math.floor(Math.random()*(9999 - 1000 + 1)) + 1000;
		
		// 유효성 검사를 통과했는지 여부를 저장하는 변수로 true이면 통과한 것이다.
		let findIdPhoneNumberValidationFlag = false;
		let findPasswordPhoneNumberValidationFlag = false;
		
		// 아이디 찾기의 이름에 키보드 입력이 있을 때마다 실행되며 input 값에 대해 유효성 검사를 실시한다.
		findIdNameInput.keyup(function() {
			nameValidation($(this));
		});
		
		// 아이디 찾기의 생년월일에 키보드 입력이 있을 때마다 실행되며 input 값에 대해 유효성 검사를 실시한다.
		findIdBirthDateInput.keyup(function() {
			onlyNumberAllowedValidation($(this));
			showErrorDiv(birthDateErrorDiv, !birthDateValidation($(this)));
		});
		
		// 아이디 찾기의 휴대폰 번호에 키보드 입력이 있을 때마다 실행되며 input 값에 대해 유효성 검사를 실시한다.
		findIdPhoneNumberInput.keyup(function() {
			onlyNumberAllowedValidation($(this));
			findIdPhoneNumberValidationFlag = findIdPasswordPhoneNumberValidation($(this));
			showErrorDiv(findIdPhoneNumberErrorDiv, !findIdPhoneNumberValidationFlag);
		});
		
		// 비밀번호 찾기의 아이디에 키보드 입력이 있을 때마다 실행되며 input 값에 대해 유효성 검사를 실시한다.
		findPasswordIdInput.keyup(function() {
			idKeyboardInputValidation($(this));
		});
		
		// 비밀번호 찾기의 이름에 키보드 입력이 있을 때마다 실행되며 input 값에 대해 유효성 검사를 실시한다.
		findPasswordNameInput.keyup(function() {
			nameValidation($(this));
		});
		
		function findIdPasswordAjax(formId) {
			let formData = $("#" + formId).serialize();
			
			$.ajax({
				type: "post",
				url: "/customer/findIdPassword",
				data: formData,
				dataType: "json",
				success: function(response) {
					if (response.status) {
						if (formId === "form-findId") {
							let {items:{id, createdDate}} = response;
							
							let message = "회원님의 아이디는 [" + id + "] 입니다.<br>"
								+ "가입일: " + createdDate;
							document.getElementById("span-notice-message").innerHTML = message;
						} else {
							$("#input-findPassword-authenticationCode").attr("placeholder", fourDigitRandomNumber);
							$("#btn-check-authentication").prop("disabled", false);
							$("#form-findPassword").find("input:not(#input-findPassword-authenticationCode)").prop("readonly", true);
							
							document.getElementById("span-notice-message").innerHTML = "인증번호를 전송했습니다.<br>"
								+ "인증번호가 도착하지 않았을 경우 재전송을 눌러주세요.";
						}
					} else {
						document.getElementById("span-notice-message").innerHTML = response.error;
					}
					noticeModal.show();
				}
			});
		}
		
		$("#btn-findId").click(function(event) {
			findIdPasswordAjax("form-findId");
		});
		
		findPasswordRequestAuthenticationButton.click(function(event) {
			findIdPasswordAjax("form-findPassword");
		});
		
		findPasswordCheckAuthenticationButton.click(function(event) {
			let targetDiv = $(this).parent().parent();
			
			if ($("#input-findPassword-authenticationCode").val() == fourDigitRandomNumber) {
				$("#btn-request-authentication").prop("disabled", true);
				$("#btn-findPassword").prop("disabled", false);
				targetDiv.remove();
				$(".error").parent().parent().remove();
				
				document.getElementById("span-notice-message").innerHTML = "휴대폰 인증을 완료했습니다.";
				noticeModal.show();
			} else {
				targetDiv.removeClass("row-other");
				targetDiv.next().prop("hidden", false);
			}
		});
	});
</script>
</html>