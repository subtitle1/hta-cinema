<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/tags.jsp" %>
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
			
			ul.tabs{
				margin: 0px;
				padding: 0px;
				list-style: none;
			}
			ul.tabs li{
				background: none;
				color: #222;
				display: inline-block;
				padding: 10px 15px;
				cursor: pointer;
			}
			
			ul.tabs li.current{
				background: #ededed;
				color: #222;
			}
			
			.tab-content{
				display: none;
				background: #ededed;
				padding: 15px;
			}
			
			.tab-content.current{
				display: inherit;
			}
			 li {
				    display: inline-block;
				 }
			.wrap{
				position: relative;
			    display: block;
			    width: 100%;
			    min-height: 190px;
			    border: 3px solid #686571;
			    border-radius: 10px;
			}	 
	
			.tab-content{
				.theater-box .theater-list {
				    display: none;
				    position: absolute;
				    left: 0;
				    top: 48px;
				    width: 100%;
				    min-height: 85px;
				    padding: 30px 0;
				}
			}
			
			.my-fav-theater {
			    position: absolute;
			    padding: 0 20px;
			    width: 100%;
			    bottom: 0;
			    left: 0;
			    line-height: 54px;
			    border-radius: 0 0 10px 10px;
			    background-color: #ecf0f4;
			}

			
	 </style>
</head>
<body>
<div class="container">
<%@include file="../common/nav.jsp"%>


			<div class="mt-5">
				<h1>전체극장</h1>
			</div>
			<div class="wrap">
				<ul class="tabs">
					<li class="tab-link current" style="width: 12.5%" data-tab="tab-1">메뉴_하나</li>
					<li class="tab-link" style="width: 12.5%" data-tab="tab-2">메뉴_둘</li>
					<li class="tab-link" style="width: 12.5%" data-tab="tab-3">메뉴_셋</li>
					<li class="tab-link" style="width: 12.5%" data-tab="tab-4">메뉴_4</li>
					<li class="tab-link" style="width: 12.5%" data-tab="tab-5">메뉴_5</li>
					<li class="tab-link" style="width: 12.5%" data-tab="tab-6">메뉴_6</li>
					<li class="tab-link" style="width: 12.5%" data-tab="tab-7">메뉴_7</li>
				</ul>
			
							<c:forEach var="theaterList" items="${theaters }">
								<li style="width: 23%"><a href="theater/detail.jsp?no="></a></li>
							</c:forEach>
			
				<div id="tab-1" class="tab-content current">
					<ul>
						
						<li style="width: 23%">asdasd</li>
						<li style="width: 23%">asdasd</li>
						<li style="width: 23%">asdasd</li>
						<li style="width: 23%">asdasd</li>
					</ul>
				</div>
				<div id="tab-2" class="tab-content">
					<ul>
						<li style="width: 23%">asdasd</li>
						<li style="width: 23%">asdasd</li>
						<li style="width: 23%">asdasd</li>
						<li style="width: 23%">asdasd</li>
						<li style="width: 23%">asdasd</li>
					</ul>
				</div>
				<div id="tab-3" class="tab-content">
					<ul>
						<li>asdasd</li>
						<li>asdasd</li>
						<li>asdasd</li>
						<li>zxczxczxc</li>
						<li>201</li>
					</ul>
				</div>
				<div id="tab-4" class="tab-content">
					<ul>
						<li>asdasd</li>
						<li>asdasd</li>
						<li>asdasd</li>
						<li>zxczxczxc</li>
						<li>201</li>
					</ul>
				</div>
				<div id="tab-5" class="tab-content">
					<ul>
						<li>asdasd</li>
						<li>asdasd</li>
						<li>asdasd</li>
						<li>zxczxczxc</li>
						<li>201</li>
					</ul>
				</div>
				<div id="tab-6" class="tab-content">
					<ul>
						<li>asdasd</li>
						<li>asdasd</li>
						<li>asdasd</li>
						<li>zxczxczxc</li>
						<li>201</li>
					</ul>
				</div>
				<div id="tab-7" class="tab-content">
					<ul>
						<li>asdasd</li>
						<li>asdasd</li>
						<li>asdasd</li>
						<li>zxczxczxc</li>
						<li>201</li>
					</ul>
				</div>
				<div class="my-fav-theater">
					나의 선호영화관 정보
					<a href="" id="moveLogin" title="로그인하기"> <button> 로그인하기</button> </a>
				</div>
			</div>
</div>
<script type="text/javascript">
$(document).ready(function(){
	
	$('ul.tabs li').click(function(){
		var tab_id = $(this).attr('data-tab');

		$('ul.tabs li').removeClass('current');
		$('.tab-content').removeClass('current');

		$(this).addClass('current');
		$("#"+tab_id).addClass('current');
	})
})
</script>
</body>
</html>