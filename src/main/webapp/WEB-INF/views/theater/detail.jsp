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
				<li><a href="/theater/list">전체극장</a></li>
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
						</div>
						<div class="theater-facility">
							<c:forEach var="facility" items="${dto.facilityList}">
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
							</c:forEach>
						</div>
					</div>
					<div>
						<h2 class="tit small mt70">교통안내</h2>
						<h3 class="tit small">약도</h3>
						<p>도로명주소:"${dto.theater.streetAddress }"</p>
						<a
							href="http://m.map.naver.com/map.nhn?lng=${dto.theater.latitude}&lat=${dto.theater.longitude}& level=2"
							class="button purple" target="_blank" title="새창열림">실시간 길찾기</a>
					</div>

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
						<c:forEach var="transportation" items="${dto.transportationList}">
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
			<div id="info-2" class="info-content">
				<div class="theater-list">
					<div class="theater-tit">
						<p class="movie-grade age-all"></p>
						<p>
							<a href="/movie-detail?rpstMovieNo=${dto. }" title="나의 촛불 상세보기">나의
								촛불</a>
						</p>
						<p class="infomation">
							<span>상영중</span>/상영시간 88분
						</p>
					</div>
					<div class="theater-type-box">
						<div class="theater-type">
							<p class="theater-name">4관</p>
							<p class="chair">총 103석</p>
						</div>
						<div class="theater-time">
							<div class="theater-type-area">2D</div>
							<div class="theater-time-box">
								<table class="time-list-table">
									<caption>상영시간을 보여주는 표 입니다.</caption>
									<colgroup>
										<col style="width: 99px;">
										<col style="width: 99px;">
										<col style="width: 99px;">
										<col style="width: 99px;">
										<col style="width: 99px;">
										<col style="width: 99px;">
										<col style="width: 99px;">
										<col style="width: 99px;">
									</colgroup>
									<tbody>
										<tr>
											<td class="" brch-no="1372" play-schdl-no="2202101372052"
												rpst-movie-no="20005300" theab-no="04" play-de="20220210"
												play-seq="3">
												<div class="td-ab">
													<div class="txt-center">
														<a href="" title="영화예매하기">
															<div class="ico-box">
																<i class="iconset ico-off"></i>
															</div>
															<p class="time">14:10</p>
															<p class="chair">14석</p>
															<div class="play-time">
																<p>14:10~15:48</p>
																<p>3회차</p>
															</div>
														</a>
													</div>
												</div>
											</td>
											<td class="" brch-no="1372" play-schdl-no="2202101372050"
												rpst-movie-no="20005300" theab-no="04" play-de="20220210"
												play-seq="5">
												<div class="td-ab">
													<div class="txt-center">
														<a href="" title="영화예매하기">
															<div class="ico-box">
																<i class="iconset ico-off"></i>
															</div>
															<p class="time">19:00</p>
															<p class="chair">3석</p>
															<div class="play-time">
																<p>19:00~20:38</p>
																<p>5회차</p>
															</div>
														</a>
													</div>
												</div>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<div class="theater-type-box">
						<div class="theater-type">
							<p class="theater-name">6관</p>
							<p class="chair">총 103석</p>
						</div>
						<div class="theater-time">
							<div class="theater-type-area">2D</div>
							<div class="theater-time-box">
								<table class="time-list-table">
									<caption>상영시간을 보여주는 표 입니다.</caption>
									<colgroup>
										<col style="width: 99px;">
										<col style="width: 99px;">
										<col style="width: 99px;">
										<col style="width: 99px;">
										<col style="width: 99px;">
										<col style="width: 99px;">
										<col style="width: 99px;">
										<col style="width: 99px;">
									</colgroup>
									<tbody>
										<tr>
											<td class="" brch-no="1372" play-schdl-no="2202101372053"
												rpst-movie-no="20005300" theab-no="06" play-de="20220210"
												play-seq="5">
												<div class="td-ab">
													<div class="txt-center">
														<a href="" title="영화예매하기">
															<div class="ico-box">
																<i class="iconset ico-off"></i>
															</div>
															<p class="time">15:35</p>
															<p class="chair">48석</p>
															<div class="play-time">
																<p>15:35~17:13</p>
																<p>5회차</p>
															</div>
														</a>
													</div>
												</div>
											</td>
											<td class="" brch-no="1372" play-schdl-no="2202101372054"
												rpst-movie-no="20005300" theab-no="06" play-de="20220210"
												play-seq="7">
												<div class="td-ab">
													<div class="txt-center">
														<a href="" title="영화예매하기">
															<div class="ico-box">
																<i class="iconset ico-off"></i>
															</div>
															<p class="time">20:05</p>
															<p class="chair">45석</p>
															<div class="play-time">
																<p>20:05~21:43</p>
																<p>7회차</p>
															</div>
														</a>
													</div>
												</div>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<div class="theater-type-box">
						<div class="theater-type">
							<p class="theater-name">7관</p>
							<p class="chair">총 104석</p>
						</div>
						<div class="theater-time">
							<div class="theater-type-area">2D</div>
							<div class="theater-time-box">
								<table class="time-list-table">
									<caption>상영시간을 보여주는 표 입니다.</caption>
									<colgroup>
										<col style="width: 99px;">
										<col style="width: 99px;">
										<col style="width: 99px;">
										<col style="width: 99px;">
										<col style="width: 99px;">
										<col style="width: 99px;">
										<col style="width: 99px;">
										<col style="width: 99px;">
									</colgroup>
									<tbody>
										<tr>
											<td class="" brch-no="1372" play-schdl-no="2202101372062"
												rpst-movie-no="20005300" theab-no="07" play-de="20220210"
												play-seq="1">
												<div class="td-ab">
													<div class="txt-center">
														<a href="" title="영화예매하기">
															<div class="ico-box">
																<i class="iconset ico-sun"></i>
															</div>
															<p class="time">09:20</p>
															<p class="chair">50석</p>
															<div class="play-time">
																<p>09:20~10:58</p>
																<p>1회차</p>
															</div>
														</a>
													</div>
												</div>
											</td>
											<td class="" brch-no="1372" play-schdl-no="2202101372061"
												rpst-movie-no="20005300" theab-no="07" play-de="20220210"
												play-seq="2">
												<div class="td-ab">
													<div class="txt-center">
														<a href="" title="영화예매하기">
															<div class="ico-box">
																<i class="iconset ico-off"></i>
															</div>
															<p class="time">11:10</p>
															<p class="chair">71석</p>
															<div class="play-time">
																<p>11:10~12:48</p>
																<p>2회차</p>
															</div>
														</a>
													</div>
												</div>
											</td>
											<td class="" brch-no="1372" play-schdl-no="2202101372056"
												rpst-movie-no="20005300" theab-no="07" play-de="20220210"
												play-seq="3">
												<div class="td-ab">
													<div class="txt-center">
														<a href="" title="영화예매하기">
															<div class="ico-box">
																<i class="iconset ico-off"></i>
															</div>
															<p class="time">13:05</p>
															<p class="chair">69석</p>
															<div class="play-time">
																<p>13:05~14:43</p>
																<p>3회차</p>
															</div>
														</a>
													</div>
												</div>
											</td>
											<td class="" brch-no="1372" play-schdl-no="2202101372058"
												rpst-movie-no="20005300" theab-no="07" play-de="20220210"
												play-seq="5">
												<div class="td-ab">
													<div class="txt-center">
														<a href="" title="영화예매하기">
															<div class="ico-box">
																<i class="iconset ico-off"></i>
															</div>
															<p class="time">18:05</p>
															<p class="chair">61석</p>
															<div class="play-time">
																<p>18:05~19:43</p>
																<p>5회차</p>
															</div>
														</a>
													</div>
												</div>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
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