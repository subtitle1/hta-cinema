<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common/tags.jsp" %>
<!DOCTYPE html>
<html>
<head>
	  	<meta charset="utf-8">
	<!--   	<meta name="viewport" content="width=device-width, initial-scale=1"> -->
	  	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
	  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	  	<link rel="stylesheet" href="/resources/css/navbar.css" />
	  	<link rel="stylesheet" href="/resources/css/common.css" />
	  	<link rel="icon" href="/resources/images/favicon.ico" type="image/x-icon">
	<title>HTA CINEMA</title>
</head>
<body>
<%@include file="/WEB-INF/views/common/navbar.jsp"%>
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-4">
				<h2 class="text-center">HTA CINEMA 홈페이지</h2>
				<h5 class="text-center">
					<c:if test="${not empty LOGIN_USER }">
						<c:out value="${LOGIN_USER.name }님 " />
						<c:out value="${message }" />
					</c:if>
				</h5>
				<div class="d-flex justify-content-center">
					<img src="/resources/images/cat.png"/>
				</div>
			</div>
		</div>
	</div>
</body>
</html>