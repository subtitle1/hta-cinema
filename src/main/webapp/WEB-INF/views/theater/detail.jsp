<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
   <title></title>
     <meta charset="utf-8">
     <meta name="viewport" content="width=device-width, initial-scale=1">
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	 <style type="text/css">
	 
	 </style>
</head>
<body>
<div class="container">
<%@include file="../common/nav.jsp"%>
	<ul id="theater">
	  <li>서울</li>
	  <li>경기</li>
	  <li>인천</li>
	  <li>대전/충청/세종</li>
	  <li>부산/대구/경상</li>
	  <li>광주/전라</li>
	  <li>강원</li>
	</ul>
	<script type="text/javascript">
	let test = document.getElementById("theater");

	test.addEventListener("mouseover", function (event) {
	  //highlight the mouseover target
	  event.target.style.color = "red";
	}, false);

	test.addEventListener("mouseout", function (event) {
	  // highlight the mouseout target
	  event.target.style.color = "black";
	}, false);
	</script>
</div>
</body>
</html>