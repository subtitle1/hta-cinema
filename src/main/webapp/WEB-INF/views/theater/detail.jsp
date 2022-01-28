<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title></title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="/resources/css/style.css" />
<link rel="stylesheet" href="/resources/css/common.css" />
<style type="text/css">
	
</style>
</head>
<body>
	<div class="container">
		<%@include file="/WEB-INF/views/common/nav.jsp"%>
		<%@include file="../common/tags.jsp" %>
	<div class="mt-5">
	<h1>전체극장</h1>
	</div>
		<div class="wrap">
			
				<ul class="theater-menu">
					<li><a>극장</a></li>
					<li>></li>
					<li><a>전체극장</a></li>
					<li>></li>
					<li><a>극장정보</a></li>
				</ul>
				
			
		</div>
	</div>
</body>
</html>