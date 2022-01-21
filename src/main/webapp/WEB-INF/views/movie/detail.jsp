<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HTA CINEMA</title>
  	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
  	<link rel="stylesheet" href="/resources/css/style.css" />
</head>
<body>
	<%@include file="../common/nav.jsp"%>
	<div>
		<div class="mt-3 bg-dark movie-head">
			<input type="hidden" id="movie-id" value="${param.id }">
			<div class="container">
				<div class="row" id="movie-head">
					<div class="col ms-3 mt-5 mb-5">
						<h1 id="title"></h1>
						<p id="original-title"></p>
						<div class="raing">
							<p>예매율</p>
							<img alt="" src="/resources/images/movie/ico-ticket-gray.png">
						</div>
					</div>
					<div class="col mt-5 mb-5">
						<img class="rounded float-end" id="poster" src=""
							style="width: 18rem;">
						<button type='button'
							class='ticketing btn btn-primary mt-3 float-end'>예매하러 가기</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="container">
		<div>
			<nav>
				<div class="nav nav-tabs nav-justified mt-5" id="nav-tab"
					role="tablist">
					<button class="nav-link active" id="nav-main-tab"
						data-bs-toggle="tab" data-bs-target="#nav-main" type="button"
						role="tab" aria-controls="nav-main" aria-selected="true">주요정보</button>
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
				<div class="row mt-3 ms-1">
					<div class="col">
						<p id="tagline"></p>
						<span id="overview"></span><br>
						<br> <span>장르: </span><span id="genre"></span> <span
							id="runtime"></span>분 | 개봉일: <span id="openDt"></span><br> <span>출연진:
						</span><span id="actors"></span>
					</div>
				</div>
				<div class="row border p-4 mt-5 mb-5">
					<div class="col border-end" style="text-align: center;">
						<dl>
							<dt>관람포인트</dt>
							<dd>배우·연출</dd>
						</dl>
						<div style="margin-left: 38px;">
							<!--차트가 그려질 부분-->
							<canvas id="pointGraph" width="300" height="300"></canvas>
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
						<div style="margin-left: 38px;">
							<canvas id="barGraph" width="300" height="300"></canvas>
						</div>
						<!-- 데이터 없을 때 -->
						<!-- <div>
							<img alt="" src="/resources/images/movie/no-graph03.jpg">
						</div> -->
					</div>
				</div>
				<div class="row">
					<h2>
						<span id="title2"></span>에 대한 00개의 이야기가 있어요!
					</h2>
				</div>
				<div class="row mt-3 rounded border p-3">
					<div class="col">
						<span>영화의 어떤 점이 좋았는지 이야기해주세요.</span>
					</div>
					<div class="col text-end review-head">
						<a data-bs-toggle="modal" data-bs-target="#reviewModal" href="#" id="review-btn">
						<img alt="" src="/resources/images/movie/ico-story-write.png"> 관람평 쓰기 </a>
					</div>
				</div>
				<div class="row text-center mt-3 mb-3">
					<div class="col-1 ">
						<img alt="" src="/resources/images/movie/bg-photo.png"
							style="width: 50px;"> <span>customer id</span>
					</div>
					<div class="col rounded border p-3"
						style="background-color: #f8f8fa">
						<div class="row">
							<div class="col-1">
								<span>관람평</span>
							</div>
							<div class="col-1">
								<span>8</span>
							</div>
							<div class="col-2">
								<span>스토리</span> <span>배우</span>
							</div>
							<div class="col">
								<span>리뷰 내용 어쩌구</span>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="tab-pane fade" id="nav-review" role="tabpanel"
				aria-labelledby="nav-review-tab">
				<div class="row mt-3 ms-1">..</div>
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
	<div class="modal fade" id="reviewModal" tabindex="-1"
		aria-labelledby="review-btn" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="review-btn">관람평 작성하기</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form action="">
						<div class="text-center mt-2 mb-3">
							<h4>영화명</h4>
							<h4>영화 어떠셨나요?</h4>
						</div>
						<div class="border p-3 bg-light mb-3">
							<div class="row mt-3 p-2">
						    	<textarea placeholder="실관람평을 남겨주세요." class="form-control" name="content" id="content" rows="3" maxlength="100"></textarea>				
							</div>
						</div>
						<div class="text-center mt-2 mb-3">
							<h4>관람포인트는 무엇인가요?</h4>
						</div>
						<div class="border p-3 bg-light mb-2">
							<div class="row mt-3 p-2">
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer text-center">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">취소</button>
					<button type="button" class="btn btn-primary">등록</button>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	$(function() {
		
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
            	data: [20, 40, 60, 80, 100],
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
                     label: '예매율',
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
				$("#title2").text(movie.title);
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
					console.log(video);
					let $listDiv = $(".videoLists");
					let lists = "<iframe class='me-3' height='200px' src='https://www.youtube.com/embed/"+video+"'></iframe>";
					$listDiv.append(lists);
				})
			}
		})
		
		// 리뷰 버튼 모달
		$("#review-btn").click(function() {
			
		})
	})
</script>
</html>