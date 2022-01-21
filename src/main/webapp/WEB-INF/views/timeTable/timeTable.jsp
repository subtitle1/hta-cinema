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
  	<link rel="stylesheet" href="/resources/css/timeTable.css" />     
</head>
<body>
<%-- <%@include file="../common/nav.jsp"%> --%>
<div class="container">
	<div class="mt-5">
		<div class="inner-wrap">
			<div>
				<span>Home</span> >
				<a href="/" title="예매 페이지로 이동">예매</a> >
				<a href="/timeTable/timeTable" title="상영시간표 페이지로 이동">상영시간표</a>
			</div>
		</div>
		<div>
			<div class="movieChoiseArea">
					<div class="tab-left-area1">
							<a href="#masterMovie" title="영화별 선택" class="btn"><img src="../../resources/images/ico-tab-movie-on.png" /> 영화별</a>
					</div>
					<div class="tab-left-area2">
							<a href="#masterBrch" title="극장별 선택" class="btn"><img src="../../resources/images/ico-tab-theater.png" /> 극장별</a>
					</div>
					<div class="tab-left-area3">
							<a href="#masterSpclBrch" title="특별관 선택" class="btn"><img src="../../resources/images/ico-tab-special.png" /> 특별관</a>
					</div>							
					<div class="timeMainTitle">
						<ul>
							<li>전체영화</li>
							<li>큐레이션</li>
						</ul>
					</div>			
					<div class="timeMainMovie">
						<div class="col-3">ddd</div>
						<div class="col-3">ddd</div>
						<div class="col-3">ddd</div>
						<div class="col-3">ddd</div>
						<div class="col-3">ddd</div>
						<div class="col-3">ddd</div>
					</div>
					<div class="timePoster"><img src="../../resources/images/examPoster.jpg" /></div>
			</div>
			<div class="location">
				<h3>
					<span class="font-green">상영시간표</span>
				</h3>
			</div>
			<div class="timeSchedule">
				<h1>시간표</h1>
			</div>
			<div class="movieOption">
				<span>조조할인</span>
				<span>심야할인</span>
			</div>
			<div class="movieTimeList">
				<h1></h1>
			</div>	
		</div>
	</div>
</div>
<script type="text/javascript">

</script>
</body>
</html>