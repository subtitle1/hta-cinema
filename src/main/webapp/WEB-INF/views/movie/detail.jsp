<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HTA CINEMA</title>
  	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
  	<link rel="stylesheet" href="/resources/css/movieDetail.css" />
  	<link rel="stylesheet" href="/resources/css/movieList.css" />
  	<link rel="stylesheet" href="/resources/css/navbar.css" />
  	<link rel="stylesheet" href="/resources/css/common.css" />
</head>
<style>
</style>
<body>
	<%@include file="../common/tags.jsp" %>
	<%@include file="../common/navbar.jsp"%>
	<div>
		<div class="mt-3 bg-dark movie-head">
			<div class="container">
				<div class="row" id="movie-head">
					<div class="col ms-3 mt-5 mb-5">
						<h1 id="title"></h1>
						<p id="original-title"></p>
						<button id='btn-${param.no }' class='btn btn-outline-light btn-like col-2 float-end' data-no='${param.no }' type='button'>
							<img class='me-3' src='/resources/images/movie/unlike.png'><span style="color:white;" id="likeCount"></span>
						</button>
						<div class="raing">
							<p>예매율</p>
							<img alt="" src="/resources/images/movie/ico-ticket-gray.png">
						</div>
					</div>
					<div class="col mt-5 mb-5">
						<img class="rounded float-end" id="poster" src=""
							style="width: 18rem;">
						<button type='button' class='ticketing btn btn-primary mt-3 float-end'>예매</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="container">
		<div>
			<nav>
				<div class="nav nav-tabs nav-justified mt-5" id="nav-tab" role="tablist">
					<button class="nav-link active" id="nav-main-tab"
						data-bs-toggle="tab" data-bs-target="#nav-main" type="button"
						role="tab" aria-controls="nav-main" aria-selected="true">주요정보
					</button>
					<button class="nav-link" id="nav-review-tab" data-bs-toggle="tab"
						data-bs-target="#nav-review" type="button" role="tab"
						aria-controls="nav-review" aria-selected="false">실관람평</button>
					<button class="nav-link" id="nav-video-tab" data-bs-toggle="tab"
						data-bs-target="#nav-video" type="button" role="tab"
						aria-controls="nav-video" aria-selected="false">예고편</button>
				</div>
			</nav>
		</div>
		<div id="error">
			<span></span>
		</div>
		<div id="info-lists" class="tab-content" id="nav-tabContent">
			<div class="tab-pane fade show active" id="nav-main" role="tabpanel"
				aria-labelledby="nav-main-tab">
				<div class="row mt-5 mb-5 ms-1">
					<div class="col">
						<span id="tagline"></span><br><br>
						<span id="overview"></span><br>
						<br><span>장르: </span><span id="genre"></span> <span id="runtime"></span>분 | 개봉일: <span id="openDt"></span><br> <span>출연진:
						</span><span id="actors"></span>
					</div>
				</div>
				<div class="row border p-4 mt-5 mb-5">
					<div class="col border-end" style="text-align: center;">
						<dl>
							<dt>관람포인트</dt>
							<dd>배우·연출</dd>
						</dl>
						<div style="margin-left: 58px;">
							<!--차트가 그려질 부분-->
							<canvas id="pointGraph" width="260" height="260"></canvas>
						</div>
						<!-- 데이터 없을 때 -->
						<!-- <div>
							<img alt="" src="/resources/images/movie/no-graph01.jpg">
						</div> -->
					</div>
					<div class="col border-end" style="text-align: center;">
						<dl>
							<dt>실관람 평점</dt>
							<dd>0</dd>
						</dl>
						<div>
							<img alt="" src="/resources/images/movie/no-graph02.jpg">
						</div>
					</div>
					<div class="col" style="text-align: center;">
						<dl>
							<dt>예매율</dt>
							<dd>0</dd>
						</dl>
						<div style="margin-left: 58px;">
							<canvas id="barGraph" width="260" height="260"></canvas>
						</div>
						<!-- 데이터 없을 때 -->
						<!-- <div>
							<img alt="" src="/resources/images/movie/no-graph03.jpg">
						</div> -->
					</div>
				</div>
				<div class="row">
					<h4>
						<span class="title2"></span><span id="no-review">에 대한 <span class="reviewCount"></span>개의 이야기가 있어요!</span>
					</h4>
				</div>
				<div class="row mt-3 rounded border p-3 mb-3">
					<div class="col">
						<span id="review-header">영화의 어떤 점이 좋았는지 이야기해주세요.</span>
					</div>
					<div class="col text-end review-head">
						<c:choose>
							<c:when test="${not empty LOGIN_USER }">
								<a data-bs-toggle="modal" data-bs-target="#reviewModal" href="" id="review-btn" >
								<img alt="" src="/resources/images/movie/ico-story-write.png"> 관람평 쓰기 </a>
							</c:when>
							<c:otherwise>
								<img alt="" src="/resources/images/movie/ico-story-write.png"><span class="text-secondary"> 관람평 쓰기</span>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				<!-- 관람평 -->
				<div class="review-box">
				</div>
			</div>
			<div class="tab-pane fade" id="nav-review" role="tabpanel" aria-labelledby="nav-review-tab">
				<div class="mt-4">
					<h4>
						<span class="title2"></span><span id="no-review">에 대한 <span class="reviewCount"></span>개의 이야기가 있어요!</span>
					</h4>
				</div>
				<div class="row mt-4 rounded border p-3 mb-3" style="margin-left: 0px; margin-right: 11px;">
					<div class="col">
						<span id="review-header">영화의 어떤 점이 좋았는지 이야기해주세요.</span>
					</div>
					<div class="col text-end review-head">
						<c:choose>
							<c:when test="${not empty LOGIN_USER }">
								<a data-bs-toggle="modal" data-bs-target="#reviewModal" href="#" id="review-btn" >
								<img alt="" src="/resources/images/movie/ico-story-write.png"> 관람평 쓰기 </a>
							</c:when>
							<c:otherwise>
								<img alt="" src="/resources/images/movie/ico-story-write.png"><span class="text-secondary"> 관람평 쓰기</span>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				<div class="row mt-3 ms-1">
					<div class="row">
					<div class="review-box">
					</div>
						<div class="col">
							<nav aria-label="Page navigation example">
								<!-- ajax 페이지네이션 -->
								<ul class="pagination justify-content-center">
								</ul>
							</nav>
						</div>
					</div>
				</div>
			</div>
			<div class="tab-pane fade" id="nav-video" role="tabpanel"
				aria-labelledby="nav-video-tab">
				<div class="row mt-3">
					<h1>예고편</h1>
				</div>
				<div class="row mt-3 mb-3 main"></div>
				<div class="row mt-3 mb-3">
					<span class="mb-3">예고편 / 스틸컷 살펴보기</span>
					<div class="col me-3 videoLists"></div>
				</div>
			</div>
		</div>
	</div>

	<!-- 관람평 모달 -->
	<div class="modal fade" id="reviewModal" tabindex="-1" aria-labelledby="review-btn" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">관람평 작성하기</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"	aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form id="review-form" method="post" action="">
						<input type="hidden" id="movie-id" name="movieNo" value="${param.no }">
						<div class="text-center mt-2 mb-3">
							<h4 class="title2">영화명</h4>
							<h4>영화 어떠셨나요?</h4>
							<div>
								<span id="error-txt" class="text-danger" style="font-weight: bold"></span>
							</div>
						</div>
						<div class="border p-3 bg-light mb-3">
							<div class="star-rating">
								<input type="radio" id="5-stars" name="reviewScore" value="5" />
								<label for="5-stars" class="star">&bigstar;</label>
								<input type="radio" id="4-stars" name="reviewScore" value="4" />
								<label for="4-stars" class="star">&bigstar;</label>
								<input type="radio" id="3-stars" name="reviewScore" value="3" />
								<label for="3-stars" class="star">&bigstar;</label>
								<input type="radio" id="2-stars" name="reviewScore" value="2" />
								<label for="2-stars" class="star">&bigstar;</label> 
								<input type="radio" id="1-star" name="reviewScore" value="1" />
								<label for="1-star" class="star">&bigstar;</label>
							</div>
							<div class="row mt-3 p-2">
						    	<textarea id="review-content" placeholder="실관람평을 남겨주세요." class="form-control" name="content" id="content" rows="3" maxlength="100"></textarea>				
							</div>
						</div>
						<div class="text-center mt-2 mb-3">
							<h4><strong>관람포인트</strong>는 무엇인가요?</h4>
						</div>
						<div class="border p-3 bg-light text-center">
							<div class="row mt-3 mb-3 p-2">
								<div>
									<div class="btn-group" role="group" aria-label="Basic checkbox toggle button group">
										<c:forEach var="point" items="${pointTypes }" varStatus="loop">
											<input type="checkbox" name="pointNo" value="${point.no }" class="btn-check" id="btncheck-${loop.count }" autocomplete="off">
											<label class="btn btn-outline-dark" for="btncheck-${loop.count }">${point.pointName }</label>
										</c:forEach>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer text-center">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">취소</button>
					<button type="button" class="btn review-submit btn-dark">등록</button>
				</div>
			</div>
		</div>
	</div>
</body>

<!-- 오류 모달 -->
<%@include file="../common/errorModal.jsp"%>
<script type="text/javascript">
	$(function() {
		
		var reviewModal = new bootstrap.Modal(document.getElementById("reviewModal"), {
			keyboard: false
		});
		
		var errorModal = new bootstrap.Modal(document.getElementById("modal-info-error"), {
			keyboard: false
		});
		
		Chart.defaults.global.legend.display = false; // 범례 제거
		// 방사형 그래프
   		let pointChart = new Chart(document.getElementById("pointGraph"), {
        type: 'radar', // 차트의 형태
        data: { // 차트에 들어갈 데이터
            labels: [
            	'ost',
                '연출',
                '스토리',
                '영상미',
                '배우'
            ],
            datasets: [{
            	label: '관람 포인트',
            	data: [20, 40, 60, 80, 100], // json으로 받아 데이터 뿌릴 곳
            	fill: true,
                backgroundColor: 'rgba(255, 99, 132, 0.2)',
                borderColor: 'rgb(255, 99, 132)',
                pointBackgroundColor: 'rgb(255, 99, 132)',
                pointBorderColor: '#fff',
                pointHoverBackgroundColor: '#fff',
                pointHoverBorderColor: 'rgb(255, 99, 132)'
            }],
        },
      	options: {
      		responsive: false,
			scale: {
        		   ticks: {
        		        callback: function() {return ""},
        		        backdropColor: "rgba(0, 0, 0, 0)"
        		   }
        	 	}
       		}
    	});
		
   		let barChart = new Chart(document.getElementById("barGraph"), {
   		type: 'bar',
        data: { 
        	labels: [
                 //x 축
                 '남성','여성'
             ],
             datasets: [{ 
                     fill: false, 
                     data: [
                         100, 100 
                     ],
                     backgroundColor: [
                         'rgba(255, 99, 132, 0.2)',
                         'rgba(153, 102, 255, 0.2)',
                     ],
                     borderColor: [
                         'rgba(255, 99, 132, 1)',
                         'rgba(153, 102, 255, 1)',
                     ],
                     borderWidth: 1
                 }]
         	},
         	options: {
         		responsive: false,
             	scales: {
                	yAxes: [{
                    	ticks: {
                    		callback: function() {return ""},
            		        backdropColor: "rgba(0, 0, 0, 0)",
                        	beginAtZero: true
                        }
                    }]
             	}
         	}
     	});
   		
		let movieId = $("#movie-id").val();
		let detailUrl = "https://api.themoviedb.org/3/movie/" + movieId;
		let imageUrl = "https://image.tmdb.org/t/p/w500/";
		let actorUrl = "https://api.themoviedb.org/3/movie/"+ movieId +"/credits";
		let videoUrl = "https://api.themoviedb.org/3/movie/"+ movieId +"/videos";
		
		// 1. 영화 상세 정보를 가져오는 url
		$.ajax({
			type: 'get',
			url: detailUrl,
			data: {
				"api_key": "935cc74a36fab18e33ea802df5ebd3f4",
				language: "ko-KR",
				region: "KR"
			},
			dataType: 'json',
			success: function(movie) {
				let imagePath = imageUrl + movie.poster_path;
				let genres = movie.genres.map(genre => genre.name).join(", ");
				
				$("#title").text(movie.title);
				$(".title2").text(movie.title);
				$("#original-title").text(movie.original_title);
				$("#poster").attr("src", imagePath);
				$("#tagline").text(movie.tagline);
				$("#overview").text(movie.overview);
				$("#genre").text(genres+" /");
				$("#runtime").text(movie.runtime);
				$("#openDt").text(movie.release_date);
			},
			error: function() {
				let $div1 = $("#movie-head");
				let $div2 = $("#info-lists");
				$div1.empty();
				$div2.empty();
				$("#error span").text("정보를 제공하지 않는 영화입니다.");
			}
		})
		
		// 2. 출연진을 가져오는 url(language를 한국어로 설정해도 영어로만 가져오는 issue)
		$.ajax({
			type: 'get',
			url: actorUrl,
			data: {
				"api_key": "935cc74a36fab18e33ea802df5ebd3f4",
				language: "ko-KR",
				region: "KR"
			},
			dataType: 'json',
			success: function(actors) {
				let actorList = actors.cast.map(actor => actor.name).filter((actor, index) => index < 6).join(", ");
				$("#actors").text(actorList);
			}
		});
		
		// 3. 유튜브 url
		$.ajax({
			type: 'get',
			url: videoUrl,
			data: {
				"api_key": "935cc74a36fab18e33ea802df5ebd3f4",
			},
			dataType: 'json',
			success: function(videos) {
				
				let $div = $(".main");
				let videoList = videos.results.map(video => video.key).filter((video, index) => index < 3);
				
				let output = "<iframe height='600px' src='https://www.youtube.com/embed/"+videoList[0]+"'></iframe>";
				$div.append(output);
				
				$.each(videoList, function(index, video) {
					let $listDiv = $(".videoLists");
					let lists = "<iframe class='me-3' height='200px' src='https://www.youtube.com/embed/"+video+"'></iframe>";
					$listDiv.append(lists);
				})
			}
		})
		
		// 관람평 쓰기 버튼 클릭 시
		$("#review-btn").click(function() {
			$.ajax({
				type: "get",
				url: "/rest/myReview",
				data: {movieNo: movieId},
				dataType: 'json',
				async: false,
				success: function (response) {
					console.log(response);
					if (response.movieNo == movieId) {
						$("#span-error").text("이미 작성한 관람평이 있습니다.");
						errorModal.show();
					} else {
						reviewModal.show();
					}
				}
			})
		})
		
		// 리뷰 버튼 모달, 리뷰 등록
		$(".review-submit").click(function(e) {
			e.preventDefault();
			
			// 평점 선택자
			let rate = $(":input[name=reviewScore]:checked").val();
			let allCheckBox = $(":checkbox[name=pointNo]");
			let checkedList = $(":checkbox[name=pointNo]:checked");
			let reviewBox = $("#review-content").val();
			
			if (rate == null) {
				$("#error-txt").text("평점을 선택해 주세요.");
				return;
			}
			
			if (reviewBox == "") {
				$("#error-txt").text("관람평을 입력해 주세요!");
				return;
			}
			
			if (checkedList.length == 0) {
				$("#error-txt").text("관람 포인트를 선택해 주세요.");
				return;
			}
			
			if (checkedList.length > 2) {
				$("#error-txt").text("관람포인트는 두 개까지 선택하실 수 있습니다.");
				allCheckBox.prop('checked', false);
				return;
			}
			
			let checkedPoints = [];
			$(":checkbox[name=pointNo]:checked").each(function(index) {
				checkedPoints.push($(this).val());
			});
			
			$(".review-box").empty();
			reviewModal.hide();
			
			$.ajax({
				type: "post",
				url: "/rest/review",
				data: {   
						  movieNo: movieId, 
						  reviewScore: rate, 
						  content: reviewBox, 
						  pointNo: checkedPoints
					   },
				dataType:"json",
				success: function(response) {
					if (response.status) {
						getReviews();
						
					} else {
						$("#span-error").text(response.error);
						errorModal.show();
					}
				}
			})
		})
		
		let currentPageNo = 1;
		getReviews();
		
		// 리뷰 목록 출력
		function getReviews() {
			
			$.getJSON('/rest/review', {page: currentPageNo,	movieNo: movieId}, function(response) {
				let reviews = response.items.reviews;
				
				// 리뷰가 없을 때
				if (reviews == "") {
					$("#no-review").text("에는 아직 등록된 리뷰가 존재하지 않습니다.");
					$("#review-header").text("첫번째 관람평의 주인공이 되어 보세요!");
				// 리뷰가 있을 때
				} else {
					// 사용자가 작성한 리뷰가 있는지 조회
					let reviewNo = 0;
					
					$.ajax({
						type: "get",
						url: "/rest/myReview",
						data: {movieNo: movieId},
						dataType: 'json',
						async: false,
						success: function (response) {
							reviewNo = response.no;
						}
					});
					
					$.each(reviews, function(index, review) {
						let $reviewBox = $(".review-box");
						let points = review.reviewPoints.map(point => point.pointName).join(", ");
						
						// 아이디 끝자리 비공개
						let originId = review.customerId;
						let idLen = originId.length;
						let length = idLen - 2;
						let maskedId = review.customerId.substring(0, length);
						maskedId += "**";
						
						// rest로 회원정보 조회, response로 받은 reviewNo와 no가 같으면 유틸 버튼 표시
						let output = "<div class='row text-center mt-3 mb-3'>"
							output += "<div class='col-1'>"
							output += "<img src='/resources/images/movie/bg-photo.png' style='width: 50px;'><br>"
							output += "<span>"+maskedId+"</span>"
							output += "</div>"
							output += "<div id='review-"+review.reviewNo+"' data-review-no='"+review.reviewNo+"' class='col rounded border p-3' style='background-color: #f8f8fa'>"
							output += "<div class='row'>"
							output += "<div class='col-1 mt-2'>"
							output += "<span id='txt'>관람평</span>"
							output += "</div>"
							output += "<div class='col-1'>"
							output += "<span id='score-txt'>"+ review.reviewScore +"</span>"
							output += "</div>"
							output += "<div class='col-2 mt-2'>"
							output += "<span id='points-txt'>"+ points +"</span>"
							output += "</div>"
							output += "<div class='col mt-2'>"
							output += "<span>"+review.reviewContent+"</span>"
							output += "</div>"
							output += "<div class='col-1 dropstart util-btn-"+review.reviewNo+"' data-util-no='"+review.reviewNo+"'>"
							output += "</div>"
							output += "</div>"
							output += "</div>"
							output += "</div>"; 
					
						$reviewBox.append(output);
					});
					
					
					// 내가 작성한 리뷰에만 버튼 보이게 하기
					let myReview = $("#review-"+reviewNo).data("review-no");
				
					let utilbtn = "";
					let $btnDiv = $(".util-btn-"+reviewNo);
					
					if (myReview == reviewNo) {
						utilbtn += `<button type='button' class='btn util-btn dropdown-toggle' id='utils' data-bs-toggle='dropdown' aria-expanded='false'>
										<img src='/resources/images/movie/btn-alert.png'>
									</button>
									<ul class='dropdown-menu' aria-labelledby='utils'>
										<button type='button' class='dropdown-item edit' href='#'>수정</button>
										<button type='button' class='dropdown-item delete' href='#'>수정</button>
									</ul>`
									
						$btnDiv.append(utilbtn);
					}
				}
				
				let paging = response.items.pagination;
				let pageNav = "";
				
				$(".reviewCount").text(paging.totalRecords);
				let ul = $(".pagination");
				
				// 이전 페이지
				if (!paging.existPrev) {
					pageNav += "<li class='page-item disabled'><a class='page-link' href='#'>이전</a></li>"
				} else {
					pageNav += "<li class='page-item'><a class='page-link' href='#'>이전</a></li>"
				}
				
				// 현재 페이지
				if (paging.pageNo == 0) {
					pageNav += "<li class='page-item disabled'><a class='page-link' href='#'>1</a></li>"
				} else {
					for (let i = paging.beginPage; i <= paging.endPage; i++) {
						if (currentPageNo == i) {
							pageNav += "<li class='page-item active'><a class='page-link' data-page='"+i+"' href='#'>"+i+"</a></li>"
						} else {
							pageNav += "<li class='page-item'><a class='page-link' data-page='"+i+"' href='#'>"+i+"</a></li>"
						}
					}
				}
				
				// 다음 페이지
				if (!paging.existNext) {
					pageNav += "<li class='page-item disabled'><a class='page-link' href='#'>다음</a></li>"
				} else {
					pageNav += "<li class='page-item'><a class='page-link' href='#'>다음</a></li>"
				}
				ul.html(pageNav); // dom에 새로 생성한 html 컨텐츠가 추가되는 순간!
			})
		}
		
		// 페이지 버튼 클릭 시
		$(".pagination").on('click', '.page-link', function() {
			currentPageNo = $(this).attr("data-page");
			$(".review-box").empty();
			getReviews();
		})
		
		// 영화 좋아요 개수 출력
		$.ajax({
			type: 'get',
			url: "/rest/count",
			data: {movieNo: movieId},
			dataType: 'json',
			success: function(response) {
				$("#likeCount").text(response.likeCount);
			}
		})
		
		// 좋아요
		$("#btn-"+movieId).click(function() {
			
			let movieNo = $(this).attr("data-no");
			let button = $(this);
			let unlike = "/resources/images/movie/unlike.png";
			let like = "/resources/images/movie/like.png";
			
			if (button.find('img').attr('src') == unlike) {
				
				$.ajax({
					type: "post",
					url: "/rest/like",
					data: {movieNo: movieId},
					datType: "json",
					success: function(response) {
						if (response.error) {
							$("#span-error").text(response.error);
							errorModal.show();
							return;
						}
						
						button.find('span').text(response.items.likeCount);
						button.find('img').attr("src", like);
					}
				})
			} else {
				$.ajax({
					type: "delete",
					url: "/rest/like",
					data: {movieNo: movieId},
					datType: "json",
					success: function(response) {
						button.find('span').text(response.items.likeCount);
						button.find('img').attr("src", unlike);
					}
				})
			}
		});
		
		showMyMovies();

		// 로그인 시 하트 표시
		function showMyMovies() {
			$.ajax({
				type: "get",
				url: "/rest/myMovies",
				success: function(response) {
					if (response.status) {
						let movieNo = (response.items.map(item => item.movieNo));
						$.each(movieNo, function(index, movie) {
							$("#btn-"+movie).find('img').attr('src', "/resources/images/movie/like.png");
						})
					} else {}
				}
			})
		};
		
		// 리뷰 수정
		$(".review-box").on('click', '.edit', function() {
			reviewModal.show();
		})
		
		// 리뷰 삭제
		$(".review-box").on('click', '.delete', function() {
			//
		})
	})
</script>
</html>