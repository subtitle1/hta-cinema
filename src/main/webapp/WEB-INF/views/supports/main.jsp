<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<link rel="stylesheet" href="/resources/css/movieList.css" />
  	<link rel="stylesheet" href="/resources/css/navbar.css" />
  	<link rel="stylesheet" href="/resources/css/common.css" />
  	<link rel="stylesheet" href="/resources/css/supports/supports.css" />
  	<link rel="icon" href="/resources/images/favicon.ico" type="image/x-icon">
<title>고객센터</title>
</head>
<body>
<%@include file="../common/tags.jsp" %>
<%@include file="../common/navbar.jsp"%>
<div class="container">
	<div class="menu mt-5">
		<div>
			<div class="col p-0 page-title text-center">
				<h3>고객센터</h3>
			</div>
		</div>
		<div class="row mypage">
			<div class="col p-0 aside text-center mt-3">
				<ul class="nav flex-column p-0">
					<li class=""><a href="#" class="nav-link p-0">고객센터 메인</a></li>
				</ul>
				<ul class="nav flex-column p-0">
					<li class=""><a href="/supports/faq" class="nav-link p-0">자주 묻는 질문</a></li>
				</ul>
				<ul class="nav flex-column p-0">
					<li class=""><a href="/supports/inquiry" class="nav-link p-0">1:1 문의</a></li>
				</ul>
				<ul class="nav flex-column p-0">
					<li class=""><a href="#" class="nav-link p-0">이용약관</a></li>
				</ul>
			</div>
			<div class="text-center mt-3 mb-3">
				<span>HTA CINEMA 고객센터</span>
				<span>10:30~18:30</span>
			</div>
		</div>
	</div>
	
	<div class="supports col-9">
		<div class="row mt-3">
			<div class="col bolck-content">
				<a href="#"><img alt="" src="/resources/images/supports/ico-faq.png">
					<p class="mt-3">자주 묻는 질문</p>
					<p>자주 묻는 질문을 확인해보세요.</p>
				</a>
			</div>
			<div class="col bolck-content">
				<a href="/supports/inquiry"><img alt="" src="/resources/images/supports/ico-oneandone.png">
					<p class="mt-3">1:1 문의</p>
					<p>해결되지 않은 문제가 있나요?<br>
					일대일로 문의 주세요.
					</p>
				</a>
			</div>
		</div>
		<div class="row">
			<div class="col">
				<p>자주 묻는 질문 BEST5</p>
				<table class="table table-borderless table-hover mb-5" style="table-layout:fixed;  border-top: 2px solid #000; border-bottom: 1px solid #000" >
					<tbody>
						<tr>
							<td>1111</td>
						</tr>
						<tr>
							<td>1111</td>
						</tr>
						<tr>
							<td>1111</td>
						</tr>
					</tbody>				
				</table>
			</div>
			<div class="col">
				<p>공지사항</p>
			</div>
			<table class="table table-hover mb-5" style="table-layout:fixed;  border-top: 2px solid #000; border-bottom: 1px solid #000" >
				<tbody>
				</tbody>				
			</table>
		</div>
	</div>
</div>
</body>
</html>