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
<link rel="stylesheet" href="/resources/css/theaterDetail.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
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
					<div id="tab-1" class="tab-content">
						<ul>
							<c:forEach var="theater" items="${dto.theaterList.seoul}">
								<li class="theaterName" style="width: 23.6%"><a
									href="detail?no=${theater.no}">${theater.name}</a></li>
							</c:forEach>
						</ul>
					</div>
				</li>
				<li class="tab-link" style="width: 11.8%" data-tab="tab-2">경기
					<div id="tab-2" class="tab-content">
						<ul>
							<c:forEach var="theater" items="${dto.theaterList.kyungki}">
								<li class="theaterName" style="width: 23.6%"><a
									href="detail?no=${theater.no}">${theater.name}</a></li>
							</c:forEach>
						</ul>
					</div>
				</li>
				<li class="tab-link" style="width: 11.8%" data-tab="tab-3">인천
					<div id="tab-3" class="tab-content">
						<ul>
							<c:forEach var="theater" items="${dto.theaterList.incheon}">
								<li class="theaterName" style="width: 23.6%"><a
									href="detail?no=${theater.no}">${theater.name}</a></li>
							</c:forEach>
						</ul>
					</div>
				</li>
				<li class="tab-link" style="width: 11.8%" data-tab="tab-4">대전
					<div id="tab-4" class="tab-content">
						<ul>
							<c:forEach var="theater" items="${dto.theaterList.daejeon}">
								<li class="theaterName" style="width: 23.6%"><a
									href="detail?no=${theater.no}">${theater.name}</a></li>
							</c:forEach>
						</ul>
					</div>
				</li>
				<li class="tab-link" style="width: 11.8%" data-tab="tab-5">부산
					<div id="tab-5" class="tab-content">
						<ul>
							<c:forEach var="theater" items="${dto.theaterList.busan}">
								<li class="theaterName" style="width: 23.6%"><a
									href="detail?no=${theater.no}">${theater.name}</a></li>
							</c:forEach>
						</ul>
					</div>
				</li>
				<li class="tab-link" style="width: 11.8%" data-tab="tab-6">광주
					<div id="tab-6" class="tab-content">
						<ul>
							<c:forEach var="theater" items="${dto.theaterList.kwangju}">
								<li class="theaterName" style="width: 23.6%"><a
									href="detail?no=${theater.no}">${theater.name}</a></li>
							</c:forEach>
						</ul>
					</div>
				</li>
				<li class="tab-link" style="width: 11.8%" data-tab="tab-7">강원
					<div id="tab-7" class="tab-content">
						<ul>
							<c:forEach var="theater" items="${dto.theaterList.kangwon}">
								<li class="theaterName" style="width: 23.6%"><a
									href="detail?no=${theater.no}">${theater.name}</a></li>
							</c:forEach>
						</ul>
					</div>
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
						<div class=detail-info-wrap">
							<h2 class="tit small mt70">시설안내</h2>
							<h3 class="tit small">보유시설</h3>
							<c:forEach var="facility" items="${dto.facilityList}">
								<div class="theater-facility">
									<c:choose>
										<c:when test="${facility.facilityTypeName eq '일반상영관'}">
											<p>
												<i class="iconset ico-facility-theater"></i> "일반상영관"
											</p>
										</c:when>
										<c:when test="${facility.facilityTypeName == '장애인석'}">
											<p>
												<i class="iconset ico-facility-disabled"></i> "장애인석"
											</p>
										</c:when>
										<c:when test="${facility.facilityTypeName == '컴포트'}">
											<p>
												<i class="iconset ico-facility-comfort"></i> "컴포트"
											</p>
										</c:when>
										<c:when test="${facility.facilityTypeName == 'MX'}">
											<p>
												<i class="iconset ico-facility-mx"></i> "MX"
											</p>
										</c:when>
										<c:when test="${facility.facilityTypeName == '부티크'}">
											<p>
												<i class="iconset ico-facility-boutique"></i> "부티크"
											</p>
										</c:when>
										<c:when test="${facility.facilityTypeName == '스위트룸'}">
											<p>
												<i class="iconset ico-facility-sweet"></i> "스위트룸"
											</p>
										</c:when>
										<c:when test="${facility.facilityTypeName == '로얄석'}">
											<p>
												<i class="iconset ico-facility-royal"></i> "로얄석"
											</p>
										</c:when>
										<c:when test="${facility.facilityTypeName == '커플석'}">
											<p>
												<i class="iconset ico-facility-couple"></i> "커플석"
											</p>
										</c:when>
										<c:when test="${facility.facilityTypeName == '발코니'}">
											<p>
												<i class="iconset ico-facility-balcony"></i> "발코니"
											</p>
										</c:when>
									</c:choose>
								</div>
							</c:forEach>

							<h2 class="tit small mt70">교통안내</h2>
							<h3 class="tit small">약도</h3>
							<div>도로명주소:"${dto.theater.streetAddress }"</div>
								<a
									href="http://m.map.naver.com/map.nhn?lng=${dto.theater.latitude}&lat=${dto.theater.longitude}& level=2"
									class="button purple" target="_blank" title="새창열림">실시간 길찾기</a>
							<div class="public-transportation">
								<!-- 버스 정보 -->

								<!-- 만약 아무대중교통도 없으면 대중교통 없다고 출력 -->
								<c:if test="${empty dto.transportationList }">
									<div class="transportation-section">
										<div class="icon-box">
											<p>이용가능한 대중교통이 없습니다.</p>
										</div>
									</div>
								</c:if>
								<!-- 버스정보 있으면 출력 -->
								<c:forEach var="transportation"
									items="${dto.transportationList}">
									<c:choose>
										<c:when test="${100 eq transportation.typeNo }">
											<div class="transportation-section">
												<div class="icon-box">
													<i class="iconset ico-bus" title="버스">버스</i>
												</div>
												<div class="info">
													<p class="tit">버스</p>
													<ul class="dot-list">
														<li>"${transportation.content }"</li>
													</ul>
												</div>
											</div>
										</c:when>
										<c:when test="${101 eq transportation.typeNo }">
											<div class="transportation-section">
												<div class="icon-box">
													<i class="iconset ico-metro" title="지하철">지하철</i>
												</div>
												<div class="info">
													<p class="tit">지하철</p>
													<ul class="dot-list">
														<li>"${transportation.content }"</li>
													</ul>
												</div>
											</div>
										</c:when>
									</c:choose>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
				<div id="info-2" class="info-content">상영시간표</div>
				<div id="info-3" class="info-content">
					<div class="fee-info">
						<h2>영화관람료</h2>
						<p>2D</p>
						<div class="fee-table">
							<div class="row">
								<div class="col"width: 50%>
									<table>
										<thead>
										</thead>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		$(document).ready(function() {
			$('ul.info-tab li').click(function() {
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