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
	<link rel="stylesheet" href="/resources/css/navbar.css" />
	<link rel="stylesheet" href="/resources/css/findIdPassword.css" />
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
					<h3>아이디/비밀번호 찾기</h3>
				</div>
			</div>
			<ul class="nav nav-tabs nav-justified" id="myTab" role="tablist">
				<li class="nav-item" role="presentation">
					<button class="nav-link active" id="findId-tab" data-bs-toggle="tab" data-bs-target="#findId" type="button" role="tab" aria-controls="findId" aria-selected="true">아이디 찾기</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="findPassword-tab" data-bs-toggle="tab" data-bs-target="#findPassword" type="button" role="tab" aria-controls="findPassword" aria-selected="false">비밀번호 찾기</button>
				</li>
			</ul>
			<div class="tab-content">
				<div class="tab-pane active" id="findId" role="tabpanel" aria-labelledby="findId-tab">
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
							<input type="number" class="form-control" id="input-findId-birthDate" name="birthDate" placeholder="생년월일 앞8자리" />
						</div>
					</div>
					<div class="row p-0 row-other">
						<div class="col-3 m-0 ps-3 py-3 col-label">
							<label for="input-findId-phoneNumber">휴대폰 번호</label>
						</div>
						<div class="col-9 align-self-center">
							<input type="number" class="form-control" id="input-findId-phoneNumber" name="phoneNumber" placeholder="'-'없이 입력" maxlength="11" />
						</div>
					</div>
					<div class="row mt-4">
						<div class="d-grid col-6 mx-auto">
							<button id="btn-findId" type="button" class="btn btn-primary btn-lg">아이디 찾기</button>
						</div>
					</div>
				</div>
				<div class="tab-pane" id="findPassword" role="tabpanel" aria-labelledby="findPassword-tab">
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
						<div class="col-9 align-self-center">
							<input type="number" class="form-control" id="input-findPassword-phoneNumber" name="phoneNumber" placeholder="'-'없이 입력" />
						</div>
					</div>
					<div class="row p-0 row-other">
						<div class="col-3 m-0 ps-3 py-3 col-label">
							<label for="input-findPassword-verificationCode">인증번호</label>
						</div>
						<div class="col-9 align-self-center">
							<input type="number" class="form-control" id="input-findPassword-verificationCode" name="verificationCode" placeholder="1234" />
						</div>
					</div>
					<div class="row mt-4">
						<div class="d-grid col-6 mx-auto">
							<button id="btn-findPassword" type="button" class="btn btn-primary btn-lg">비밀번호 찾기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>