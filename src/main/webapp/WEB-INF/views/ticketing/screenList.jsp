<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>Page Title</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/resources/css/style.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
    <link rel="stylesheet" href="/resources/css/screenList.css">
</head>
<body>
	<%@include file="../common/tags.jsp" %>
	<%@include file="../common/nav.jsp"%>
    <div class="container" style="width: 1250px;">
        <div class="row mb-3">
            <div class="col">
                <h2>빠른 예매</h2>
            </div>
        </div>
        <div class="col-10">
            <div class="my-box">
                <div class="day">
                    <!-- 페이지 네이션으로 입력할 것 -->
                    <!--일에 따라서 class가 바뀐다. -->
                    <div class="month"></div>
                   	<div class="now-day">
                   	</div>
                </div>
                <div class="movie-container">
                <div class="left-one">
                    <h3>영화</h3>
                    <div class="movie-name">
                        <button class="movie-name-button" type="button">전체</button>
                    </div>
                    <div class="movie-list">
                    <c:forEach var="movie" items="${movies}">
                    	<button class="movie-button" type="button" value="${movie.movieNo}" >
                            <img src="${movie.ratingImageURL} " alt="${movie.ratingName}"/>
                            <span class="txt">${movie.movieName}</span>
                            <img src="/resources/images/btn/ico-heart.png" alt="heart" class="buttonicon">
                        </button>
                    </c:forEach>
                    </div>
                    <div class="movie-img">
                        <!--영화 선택하지 않았을 때 -->
                        <!--<p>모든영화<br>
                        목록에서 영화를 선택하세요</p>-->
                       <!--영화를 하나라도 선택했을 때--> 
                        <div class="choice-list" id="choiceMovieList-0">
                            <img src="#">
                            <!--영화 이미지 소스가 들어간다. 선택된 영화에만 button이 출력된다. -->
                            <button type="button" class="del"></button>
                        </div>
                        <div class="choice-list" id="choiceMovieList-1">
                             <!--영화 이미지 소스가 들어간다.-->
                             <button type="button" class="del"></button>
                        </div>
                        <div class="choice-list" id="choiceMovieList-2">
                             <!--영화 이미지 소스가 들어간다.-->
                            <button type="button" class="del"></button>
                        </div>
                    </div>
                </div>
                <div class="center-one">
                    <h3>극장</h3>
                    <div class="theater-list">
                        <button class="theater-all-button">전체</button>
                        <button class="theater-spacial-button">특별관</button>
                    </div>
                    <div class="list-theater-detail">
                        <div class="all-theater-list">
                         	<div class="explain-button"><p>영화를 선택하세요</p></div>
                        </div>
                        <div class="theater-choies">
                        </div>
                    </div>
                    <div class="theater-choies-check">
                        <p class="check-content" style="flex">전체극장<br>
                            목록에서 극장을 선택하세요
                        </p>
                        <!--선택했을 경우 클릭하면 입력되고 아니면 열리지 않는다.-->
                        <div class="check-theater" style="none">
                        </div>
                        <div class="check-theater" style="none">
                        </div>
                        <div class="check-theater" style="none">
                        </div>
                    </div>
                </div>
                <div class="right-one">
                    <h3>시간</h3>
                    <div class="time-check">
                        <button class="pre-time-button" onload="showClock()" ></button>
                        <button class="time-check-button" data-time="">13</button>
                        <button class="time-check-button" data-time="">14</button>
                        <button class="time-check-button" data-time="">15</button>
                        <button class="time-check-button" data-time="">16</button>
                        <button class="time-check-button" data-time="">17</button>
                        <button class="time-check-button" data-time="">18</button>
                        <button class="time-check-button" data-time="">19</button>
                        <button class="time-check-button" data-time="">20</button>
                        <button class="time-check-button" data-time="">21</button>
                        <button class="time-check-button" data-time="">22</button>
                        <button class="next-time-button" ></button>
                    </div>
                    <div class="movie-check">
                        <button type="button"  class="btn-on" id="2201171311021" >
                            <div class="legend"></div>
                            <span class="time">
                                <strong title="상영시작">17:25</strong>
                                <em title="상영종료">~20:13</em>
                            </span>
                            <span class="title">
                                <strong title="하우스 오브 구찌">하우스 오브 구찌</strong>
                                <em>2D(자막)</em>
                            </span>
                            <div class="info">
                                <span class="theater" title="극장">
                                    상봉<br>
                                    6층 4관[백신패스관]
                                </span>
                                <span class="seat">
                                    <strong class="now" title="잔여 좌석">95</strong>
                                    <em class="all" title="전체 좌석">/154</em>
                                </span>
                            </div>
                        </button>
                        <button type="button"  class="btn-on" id="2201171311021">
                            <div class="legend"></div>
                            <span class="time">
                                <strong title="상영시작">17:25</strong>
                                <em title="상영종료">~20:13</em>
                            </span>
                            <span class="title">
                                <strong title="하우스 오브 구찌">하우스 오브 구찌</strong>
                                <em>2D(자막)</em>
                            </span>
                            <div class="info">
                                <span class="theater" title="극장">
                                    상봉<br>
                                    6층 4관[백신패스관]
                                </span>
                                <span class="seat">
                                    <strong class="now" title="잔여 좌석">95</strong>
                                    <em class="all" title="전체 좌석">/154</em>
                                </span>
                            </div>
                        </button>
                        <button type="button"  class="btn-on" id="2201171311021">
                            <div class="legend"></div>
                            <span class="time">
                                <strong title="상영시작">17:25</strong>
                                <em title="상영종료">~20:13</em>
                            </span>
                            <span class="title">
                                <strong title="하우스 오브 구찌">하우스 오브 구찌</strong>
                                <em>2D(자막)</em>
                            </span>
                            <div class="info">
                                <span class="theater" title="극장">
                                    상봉<br>
                                    6층 4관[백신패스관]
                                </span>
                                <span class="seat">
                                    <strong class="now" title="잔여 좌석">95</strong>
                                    <em class="all" title="전체 좌석">/154</em>
                                </span>
                            </div>
                        </button>
                        <button type="button"  class="btn-on" id="2201171311021" >
                            <div class="legend"></div>
                            <span class="time">
                                <strong title="상영시작">17:25</strong>
                                <em title="상영종료">~20:13</em>
                            </span>
                            <span class="title">
                                <strong title="하우스 오브 구찌">하우스 오브 구찌</strong>
                                <em>2D(자막)</em>
                            </span>
                            <div class="info">
                                <span class="theater" title="극장">
                                    상봉<br>
                                    6층 4관[백신패스관]
                                </span>
                                <span class="seat">
                                    <strong class="now" title="잔여 좌석">95</strong>
                                    <em class="all" title="전체 좌석">/154</em>
                                </span>
                            </div>
                        </button>
                        <button type="button"  class="btn-on" id="2201171311021" >
                            <div class="legend"></div>
                            <span class="time">
                                <strong title="상영시작">17:25</strong>
                                <em title="상영종료">~20:13</em>
                            </span>
                            <span class="title">
                                <strong title="하우스 오브 구찌">하우스 오브 구찌</strong>
                                <em>2D(자막)</em>
                            </span>
                            <div class="info">
                                <span class="theater" title="극장">
                                    상봉<br>
                                    6층 4관[백신패스관]
                                </span>
                                <span class="seat">
                                    <strong class="now" title="잔여 좌석">95</strong>
                                    <em class="all" title="전체 좌석">/154</em>
                                </span>
                            </div>
                        </button>
                        <button type="button"  class="btn-on" id="2201171311021">
                            <div class="legend"></div>
                            <span class="time">
                                <strong title="상영시작">17:25</strong>
                                <em title="상영종료">~20:13</em>
                            </span>
                            <span class="title">
                                <strong title="하우스 오브 구찌">하우스 오브 구찌</strong>
                                <em>2D(자막)</em>
                            </span>
                            <div class="info">
                                <span class="theater" title="극장">
                                    상봉<br>
                                    6층 4관[백신패스관]
                                </span>
                                <span class="seat">
                                    <strong class="now" title="잔여 좌석">95</strong>
                                    <em class="all" title="전체 좌석">/154</em>
                                </span>
                            </div>
                        </button>
                    </div>
                </div>
            </div>
        </div>
        </div>
        <div class="footer">
            <div class="advertise-footer">
                <img src="/resources/images/btn/광고.jpg" alt="advertisement">
            </div>
        </div>
      </div>
      <form action="/ticketing/ticketingList" method="post" id="form-post-List">
      	<input type="hidden" name="ticketingday" value="" />
      </form>
</body>
<script type="text/javascript">
	$(function(){
		
		const dataDate = new Date();
		let year = dataDate.getFullYear();
		let month = dataDate.getMonth();
		let dataDay = dataDate.getDate();
		let dayLabel = dataDate.getDay();
		let dayNumber = Number(dataDay);
		$('div.month').text((Number(month)+1)+"월");
		
		const reserveDate = $('div.now-day');
		
		const weekOfDay = ["일", "월", "화", "수", "목", "금", "토"];
		let thisWeek = [];
		let button = "";
		let spanWeekOfDay = "";
		let spanDay = "";
		let div = "";
		for(let i = dayNumber ; i<=dayNumber+11 ; i++) {
			
			div = document.createElement("div");
			button = document.createElement("button");
			spanWeekOfMonth = document.createElement("span");
			spanWeekOfDay = document.createElement("span");
			spanDay = document.createElement("strong");
			spanWeekOfMonth.classList="movie-week-of-month";
			spanWeekOfDay.classList = 'movie-week-of-day';
			spanDay.classList ='movie-day';
			let resultDay = new Date(year, month, i);
			let yyyy = resultDay.getFullYear();
			let mm = Number(resultDay.getMonth())+1;
			let dd = resultDay.getDate();
			let d = resultDay.getDay();
			
			mm = String(mm).length === 1 ? '0'+mm : mm;
			dd = String(dd).length === 1 ? '0'+dd : dd;
			d = String(d).length === 1 ? '0'+d : d;
			spanWeekOfMonth.innerHTML = mm;
			spanWeekOfDay.innerHTML = dd;
			
			button.append(spanWeekOfDay);
			if(d == '01'){
				d=weekOfDay[1];
				button.classList = "mon";
				button.setAttribute('data-day',yyyy+mm+dd+d+'요일');
			} else if(d == '02'){
				d=weekOfDay[2];
				button.classList = "mon";
				button.setAttribute('data-day',yyyy+mm+dd+d+'요일');
			} else if(d == '03'){
				d=weekOfDay[3];
				button.classList = "mon";
				button.setAttribute('data-day',yyyy+mm+dd+d+'요일');
			} else if(d == '04'){
				d=weekOfDay[4];
				button.classList = "mon";
				button.setAttribute('data-day',yyyy+mm+dd+d+'요일');
			} else if(d == '05'){
				d=weekOfDay[5];
				button.classList = "mon";
				button.setAttribute('data-day',yyyy+mm+dd+d+'요일');
			} else if(d == '06'){
				d=weekOfDay[6];
				button.classList ="mon sat";
				button.setAttribute('data-day',yyyy+mm+dd+d+'요일');
			} else if(d == '00'){
				d=weekOfDay[0];
				button.classList="mon sun";
				button.setAttribute('data-day',yyyy+mm+dd+d+'요일');
			}
			if(i===dayNumber){
				button.classList = "active";
				//해당날짜는 버튼이 눌려있게 설정함
				$('input[name=ticketingday]').val(dayNumber);
			}
			spanDay.innerHTML = d;
			button.append(spanDay);
			reserveDate.append(button);
			
			
			thisWeek[i] = yyyy + "-" + mm +'-' +dd +'-'+d ;
		}
		//날짜 클릭시 활성화 버튼과 hidden으로 data값 전송
		$('div.now-day').on('click','button.mon',function(){
			let $btnActive = $(this);
			let dataAttr = $(this).attr('data-day');
			$btnActive.attr('class','active');
			$('input[name=ticketingday]').val(dataAttr);
			if($('button.active').length===2){
				$('.active').attr('class','mon');
				$('input[name=ticketingday]').val("");
			}
		})
		//날짜 클릭했으면 활성화버튼 해제 
		$('div.now-day').on('click','button.active',function(){
			let $btnMon = $(this);
			$btnMon.attr('class','mon');
			$('input[name=ticketingday]').val("");
		})
		//영화버튼 클릭시 극장 정보 가져오기
		$('.movie-button').click(function(){
			let movieNo = $(this).val();
			let $div = $('.all-theater-list');
			let $divP = $('')
			$.getJSON("/rest/screenList",{movieNo: movieNo},function(response){
				
				$('.explain-button p').text("");
				$.each(response.items,function(index, screen){
					let output ="<button class='list-theater-button' data-movieNo="+screen.movieNo+" data-theater="+screen.theaterNo+">"+screen.regionName+"</button>"
					$div.append(output);
				})
			})
			
		})
		$('div.all-theater-list').on('click','button.list-theater-button',function(){
			let theaterNo =$('button.list-theater-button').attr('data-theater');
			let movieNo =$('button.list-theater-button').attr('data-movieno');
			let text = $(this);
			let $theaterNames = $('div.theater-choies');
			$.getJSON("/rest/theaterList",{movieNo: movieNo, theaterNo: theaterNo},function(response){
				
				$.each(response.items,function(index, screen){
					let check = $('button.theater-choies-button').attr('data-values');
					if(check == screen.theaterNo){
						$theaterNames.empty();
					}
					let output ="<button type='button' class='theater-choies-button' data-values="+screen.theaterNo+">"+screen.theaterName+"</button>";
					$theaterNames.append(output);
				})
			})
		})
		//극장관 클릭하면 아래에 조회된다. 
		$('div.theater-choies').on('click','button.theater-choies-button',function(){
			let theaterNo =$('button.list-theater-button').attr('data-theater');
			let movieNo =$('button.list-theater-button').attr('data-movieno');
			$('p.check-content').css('display','none');
			$('div.check-theater').css('display','flex');
			let text = $(this);
			let total = 0;
			$.getJSON("/rest/theaterList",{movieNo: movieNo, theaterNo: theaterNo},function(response){
				$.each(response.items, function(index, theater){
					let $buttons = $('div.check-theater:eq('+total+')');
					let check = $('button.detail-check').attr('data-value');
					let $list  = $('div.theater-choies');
					let $movie = $('div.movie-check');
					console.log(response.items);
					if($buttons.length==3){
						alert("선택한 범위를 벗어났습니다.");
					}
					if(check==theater.theaterNo){
						$buttons.empty();
					} else {
						//아래에 출력되는 값
						let output ="<div class='detail-check-theater'>";
                    	output += "<button type='button' class='detail-check' data-value="+theater.theaterNo+" style=width:0px;height:0px;'></button>";
						output += "<p class='detail-text'>"+theater.theaterName+"</p></div>";
						let textAttr = text.attr('data-value');
						let listput = "<div class='check-theater'>"+theater.theaterName+"</div>"
						$buttons.append(output);
						total++;
						//스케쥴에 출력되는 값 --> 나중에 시간설정 후 옮겨 놓을 것 
						let input ="<button type='button'  class='btn-on' id="+theater.showScheduleStartTime+" >";
                        input += "<div class='legend'></div>";
                        input += "<span class='time'>";
                        input +="<strong title='상영시작'>"+theater.showScheduleStartTime+"</strong>";
                        input +="<em title='상영종료'>"+theater.showScheduleEndTime+"</em>";
                        input +="</span>";
                        input +="<span class='title'>";
                        input +="<strong title="+theater.movieNo+">"+theater.movieName"</strong>";
                        input +="<em>"+theater.showTypeName+(theater.showTypeSubTitle)+"</em>";   
                        input +="</span>";
                        input +="<div class='info'>";
                        input +="<span class='theater' title='극장'>";
                        input +=" "+theaterName+"<br>";       
                        input +=" "+screenName+"";      
                        input +="</span>"; 
                        input +="<span class='seat'>";    
                        input +="<strong class='now' title='잔여좌석'>"+screenTotalSeat+"</strong>";      
                        input +="<em class='all' title='"+screenTotalSeat+"'>/"+screenTotalSeat+"</em>";      
                        input +="</span>";   
                        input +="</div>";
                        input +="</button>";
                        $movie.append(input);
					}
				})
			})
		})
		
		$('div.check-theater').on('click','button.detail-check',function(){
			let theaterNo = $(this).attr('data-theater');
			let movieNo = $(this).attr('data-movieno');
			
			$.getJSON("/rest/list",{movieNo: movieNo, theaterNo: theaterNo},function(response){
				
			})
				})
		function showClock(){
			let currentDate = new Date();
			let divClock = $('div.time-check');
			let msg = "현재시간 : ";
			msg += currentDate.getHours()+"시";
			msg += currentDate.getMinutes()+"분";
			msg += currentDate.getSeconde()+"초";
			setTimeout(slowClock,1000);//1초마다 갱신
			return msg;
		}
		let button = "";
		$('div.time-check').append(function(){
			button = document.createElement("button");
			button.attr('class','time-check-button');
			let currentDate = new Date();
			let msg = Number(crrentDate.getHours());
			for(let i=msg; i<10; i++){
				
			}
		})
	})
</script>
</html>