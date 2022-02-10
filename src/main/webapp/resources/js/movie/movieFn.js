// 영화 좋아요 기능
function likeMovie() {
	$(".poster").on('click', '.btn-like', function() {
		
		let movieNo = $(this).attr("data-no");
		let button = $(this);
		let unlike = "/resources/images/movie/unlike.png";
		let like = "/resources/images/movie/like.png";
		
		if (button.find('img').attr('src') == unlike) {
			
			$.ajax({
				type: "post",
				url: "/rest/like",
				data: {movieNo: movieNo},
				datType: "json",
				success: function(response) {
					if (response.error) {
						$("#span-error").text(response.error);
						errorModal.show();
						
						$("#submit").click(function() {
							errorModal.hide();
						})
						
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
				data: {movieNo: movieNo},
				datType: "json",
				success: function(response) {
					button.find('span').text(response.items.likeCount);
					button.find('img').attr("src", unlike);
				}
			})
		}
	});
}

// 로그인한 사용자가 좋아요 한 영화 리스트
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
			}
		}
	})
};