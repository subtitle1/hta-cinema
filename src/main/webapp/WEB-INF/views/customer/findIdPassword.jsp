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
     <link rel="stylesheet" href="/resources/css/findIdPassword.css" />
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col">
				<a class="nav-link my-5" href="/">
					<img id="img-logo" src="/resources/images/nav/logo-htacinema.png">
				</a>
			</div>
		</div>
		<div class="row mb-4">
			<div class="col">
				<h3>아이디/비밀번호 찾기</h1>
			</div>
		</div>
		<ul class="nav nav-tabs nav-justified" id="myTab" role="tablist">
			<li class="nav-item" role="presentation">
				<button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home" type="button" role="tab" aria-controls="home" aria-selected="true">아이디 찾기</button>
			</li>
			<li class="nav-item" role="presentation">
				<button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile" type="button" role="tab" aria-controls="profile" aria-selected="false">비밀번호 찾기</button>
			</li>
		</ul>

		<div class="tab-content">
			<div class="tab-pane active" id="home" role="tabpanel" aria-labelledby="home-tab">아이디 찾기</div>
			<div class="tab-pane" id="profile" role="tabpanel" aria-labelledby="profile-tab">비밀번호 찾기</div>
		</div>
	</div>
</body>
</html>