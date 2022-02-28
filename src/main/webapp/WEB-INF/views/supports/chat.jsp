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
  	<link rel="stylesheet" href="/resources/css/movieDetail.css" />
  	<link rel="stylesheet" href="/resources/css/supports/supports.css" />
  	<link rel="icon" href="/resources/images/favicon.ico" type="image/x-icon">
<title>고객센터</title>
</head>
<body>
<%@include file="../common/tags.jsp" %>
<%@include file="../common/navbar.jsp"%>
<div class="container">
	<div>
		<div class="menu mt-5">
			<div>
				<div class="col p-0 page-title text-center">
					<h3>고객센터</h3>
				</div>
			</div>
			<div class="row mypage">
				<div class="col p-0 aside text-center mt-3">
					<ul class="nav flex-column p-0">
						<li class=""><a href="/supports" class="nav-link p-0">자주 묻는 질문</a></li>
					</ul>
					<ul class="nav flex-column p-0">
						<li class=""><a href="/supports/inquiry" class="nav-link p-0">1:1 문의</a></li>
					</ul>
					<ul class="nav flex-column p-0">
						<li class=""><a href="/supports/chat" class="nav-link p-0">채팅 문의</a></li>
					</ul>
				</div>
				<div class="text-center mt-3 mb-3">
					<span>HTA CINEMA 고객센터</span>
					<span>10:30~18:30</span>
				</div>
			</div>
		</div>
		
		<div class="supports col-9">
			<div class="row">
				<div class="offset ms-4 col-7 p-0" style="margin-left: 20px;">
					<c:choose>
						<c:when test="${not empty LOGIN_USER }">
							<div class="mt-4 mb-3">
								<button class="btn-primary btn-sm">새 채팅 문의 등록</button>
							</div>
							<div class="mt-4 mb-3">
								<span>일대일 채팅 문의를 남겨 보세요.</span>
							</div>
							<c:if test="${empty chatList }">
							
							</c:if>
							<div class="mb-3 bg-light" id="chatroom" style = "width:400px; height: 600px; border:1px solid;"></div>
							<div>
								<input type="text" id="message" style = "height : 30px; width : 340px" placeholder="내용을 입력하세요." autofocus>
								<button class="btn btn-primary btn-sm" id="send">전송</button>
							</div>
						</c:when>
						<c:otherwise>
							<p>로그인한 사용자만 사용하실 수 있는 페이지입니다.</p>		
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
<script type="text/javascript">
</script>
</html>