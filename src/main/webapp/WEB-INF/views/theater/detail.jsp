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
	border-radius: 5px;
	color: #fff;
	padding: 20px;
	cursor: pointer;
	padding: 5px 10px;
}

.theater-menu{
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
	padding: 50px;
	border-radius: 10px;
	width: 1100px;
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
	background-image: url('/resources/images/theater/theater-menu.jpg') 
}

.movie-name{
	overflow: hidden;
    padding: 40px 0 0 0;
    text-align: center;
    color: #fff;
    font-size: 3.0666em;
    font-weight: 400;
    line-height: 1.1;
    text-shadow: 2px 2px 10px rgb(0 0 0 / 70%);
}

.inner-wrap {
    width: 1100px;
    margin: 0 auto;
}
.pt40 {
    padding-top: 40px!important;
}

.info-tab li{
	display: inline-block;
	position: relative;
	width: 32%;
	border: 1px solid #503396;
	padding-right: 0px;
    float: left;
}

.tab-info.current{
    border-bottom: 0;
}


.info-tab{
	cursor: pointer;
}

.contents-wrap{
	margin-top: 50px;
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
			<h2 class=movie-name>영화이름</h2>
		</div>
		
		
		 <div class="inner-wrap pt40">
		 	<ul class="info-tab">
		 		<li class="tab-info current" data-tab="info-1">극장정보</li>
		 		<li class="tab-info" data-tab="info-2">상영시간표</li>
		 		<li class="tab-info" data-tab="info-3">관람료</li>
		 	</ul>
		 	<div class="contents-wrap">
			 	<div id="info-1" class="info-content current">
			 		<div class="theater-info-text">
			 			<p class="big">
							"남의 중심! 강남 소비문화의 중심지인 지하철 2호선 , 신분당선  - 강남역과 연결"<br>
							"로맨틱 멀티플렉스! 젊은 도시 강남이 한 눈에 보이는 최상의 View를 제공"
			 			</p>
			 			<p>(프라다)가 선택한 수려한 디자인의 상영관 의자를 체험해보세요!</p>
			 			<div class=detail-info-wrap">
			 				<h2 class="tit small mt70">시설안내</h2>
			 				<h3 class="tit small">보유시설</h3>
			 				<p>시설 출력</p>
			 				
			 				<h2 class="tit small mt70">교통안내</h2>
			 				<h3 class="tit small">약도</h3>
			 			</div>
			 		</div>
			 	</div>
			 	<div id="info-2" class="info-content">
			 		상영시간표
			 	</div>
			 	<div id="info-3" class="info-content">
			 		관람료 표
			 	</div>
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