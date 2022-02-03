<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset='utf-8'>
<meta http-equiv='X-UA-Compatible' content='IE=edge'>
<title>Page Title</title>
<link rel="stylesheet" href="/resources/css/navbar.css" />
<link rel="stylesheet" href="/resources/css/common.css" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<style>
.tab-content.current {
	display: inherit;
}



.region-tab {
	width: 100%;
	background-color: #234254;
	border-radius: 5px;
	color: #fff;
	padding: 20px;
	cursor: pointer;
	display: inline-block;
	padding: 5px 10px;
}

.theater-menu{
	display: inline-block;
	position: relative;
	/*
	background-image: url('resources/images/theater/theater-menu.jpg')
	*/
}



.tab-content {

	position: absolute;
	display: none;
	color: #000;
	background-color: yellow;
	padding: 20px;
	border-radius: 10px;
	width: 100px;
}




.region-tab li{
	display: inline-block;
	position: relative;
}
.info-content{
	position: absolute;
	display: none;
	color: #000;
	background-color: yellow;
	padding: 20px;
	border-radius: 10px;
	width: 100px;
}
.info-content.current {
	display: inherit;
}



.theater-menu li {
	display: inline-block;
	padding: 5px 10px;
}

.list-tab{
	width:100%;
}


.list-tab .row{
	background-color: yellow;
	width: 100%;
}

.list-tab{
	background-image: url('') 
}

</style>
</head>
<body>
	<%@include file="../common/tags.jsp"%>
	<%@include file="../common/navbar.jsp"%>
	<div class="container">
		<div class="row">
			<ul class="theater-menu">
				<li><a>극장</a></li>
				<li>></li>
				<li><a>전체극장</a></li>
				<li>></li>
				<li><a>극장정보</a></li>
			</ul>
		</div>
		<div class="list-tab">
			<ul class="region-tab">
				<li class="tab-link" style="width: 11.8%" data-tab="tab-1">서울
					<div id="tab-1" class="tab-content">1</div>
				</li>
				<li class="tab-link" style="width: 11.8%" data-tab="tab-2">경기
					<div id="tab-2" class="tab-content">2</div>
				</li>
				<li class="tab-link" style="width: 11.8%" data-tab="tab-3">인천
				<div id="tab-3" class="tab-content">2</div>
				</li>
				<li class="tab-link" style="width: 11.8%" data-tab="tab-4">대전
				<div id="tab-4" class="tab-content">2</div>
				</li>
				<li class="tab-link" style="width: 11.8%" data-tab="tab-5">부산
				<div id="tab-5" class="tab-content">2</div>
				</li>
				<li class="tab-link" style="width: 11.8%" data-tab="tab-6">광주
				<div id="tab-6" class="tab-content">2</div>
				</li>
				<li class="tab-link" style="width: 11.8%" data-tab="tab-7">강원
				<div id="tab-7" class="tab-content">7</div>
				</li>
			</ul>
			
		</div>
		
		
		 <div class="info">
		 	<ul class="info-tab">
		 		<li class="tab-info current" data-tab="info-1">극장정보</li>
		 		<li class="tab-info" data-tab="info-2">상영시간표</li>
		 		<li class="tab-info" data-tab="info-3">관람료</li>
		 	</ul>
		 	<div id="info-1" class="info-content current">
		 		보유시설	대중교통
		 	</div>
		 	<div id="info-2" class="info-content">
		 		상영시간표
		 	</div>
		 	<div id="info-3" class="info-content">
		 		관람료 표
		 	</div>
		 </div>
	</div>
	<script>
	
		$(document).ready(function(){
			$('ul.info-tab li').click(function(){
				var tab_id = $(this).attr('data-tab');
				$('ul.info-tab li').removeClass('current');
				$('.info-content').removeClass('current');
				$(this).addClass('current');
				$("#" + tab_id).addClass('current');
			})
		})
	
		$(document).ready(function() {
			
			$('ul.region-tab li').mouseover(function() {
				var tab_id = $(this).attr('data-tab');

				$('ul.region-tab li').removeClass('current');
				$('.tab-content').removeClass('current');

				$(this).addClass('current');
				$("#" + tab_id).addClass('current');
			})
			$('ul.region-tab li').mouseleave(function() {
				$('ul.region-tab li').removeClass('current');
				$('.tab-content').removeClass('current');
			})
		})
		
		
	</script>
</body>

</html>