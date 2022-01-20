<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/tags.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>Page Title</title>
    <link rel="stylesheet" href="/resources/css/final1.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<%@ include file="../common/nav.jsp" %>
    <div class="container" style="width: 1250px;">
        <div class="row mb-3">
            <h2>빠른예매</h2>
            <div  class="left-container">
              <div class="box">
                    <div class="text-title">
                        <h3>관람인원선택</h3>
                        <button class="reset-button" type="button"><img src="/resources/images/resetbutton.png" class="btn-reset-icon"/>초기화</button>
                    </div>
                </div>
            </div>
            <div class="all-check-people">
                <div class="check-people">
                    <p class="txt">성인</p>
                    <div class="count">
                        <button type="button" class="down" title="성인 좌석 선택 감소">
                            -
                        </button>
                        <div class="number">
                            <button type="button" class="now" title="성인 현재 좌석 선택 수">
                                0
                            </button>
                        </div>
                        <button type="button" class="up" title="성인 좌석 선택 증가">+</button>
                    </div>
                </div>
                <div class="check-people">
                    <p class="txt">청소년</p>
                    <div class="count">
                        <button type="button" class="down" title="청소년 좌석 선택 감소">
                            -
                        </button>
                        <div class="number">
                            <button type="button" class="now" title="청소년 현재 좌석 선택 수">
                                0
                            </button>
                        </div>
                        <button type="button" class="up" title="청소년 좌석 선택 증가">+</button>
                    </div>
                </div>
                <div class="check-people">
                    <p class="txt">우대</p>
                    <div class="count">
                        <button type="button" class="down" title="우대 좌석 선택 감소">
                            -
                        </button>
                        <div class="number">
                            <button type="button" class="now" title="우대 현재 좌석 선택 수">
                                0
                            </button>
                        </div>
                        <button type="button" class="up" title="우대 좌석 선택 증가">+</button>
                    </div>
                </div>
            </div>
            <div class="seat-view">
                <div class="seat">
                    <img src="/resources/images/img-theater-screen.png" alt="screen-seat" class="screen-seat">
                    <div class="seat-wrapper">
                        <div class="toggle-seat" id="seat-layout">
                            <form action="">
                                <section>
                                    <div id="show-seat">
                                      
                                    </div>
                                </section>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        <div class="right-container">
            <div class="movie-container">
                <div class="title-area">
                    <span class="movie-grade"><img src="/resources/images/12세이상관람자.png" alt="12age" class="img-age"/></span>
                    <div class="ptag">
                        <p class="tit">청춘적니</p>
                        <p class="cate">2D(자막)</p>
                    </div>
                </div>
                <div class="movie-detail-area">
                    <p class="place">고양스타필드</p>
                    <p class="special">MX관</p>
                    <p class="date"><span>2022.01.22</span>
                        <em>(토)</em>
                    </p>
                    <div class="other-time">
                        <button type="button" class="now-time">
                            "16:50~19:28"
                            <i class="arr"></i>
                        </button>
                        <ul>
                            <!--버튼클릭시 li의 visibility :visible 으로 설정 -->
                            <li>
                                <button type="button" class="btn">"17:10~20:30"</button>
                            </li>
                            <li>
                                <button type="button" class="btn">"17:10~20:30"</button>
                            </li>
                            <li>
                                <button type="button" class="btn">"17:10~20:30"</button>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="img-card">
                    <img src="/resources/images/SXTvhvgm4fbptvsfROZJoGb0DHYqiB1V_150.jpg" alt="" class="img-movie">
                </div>
                <div>
                    <div class="kind-seat">
                                <div class="seat-condition-choise" title="선택한 좌석"><em class="seat-em">선택</em></div>
                                <div class="seat-condition-finish" title="예매완료"><em class="seat-em">예매완료</em></div>
                                <div class="seat-condition-common" title="일반"><em class="seat-em">일반</em></div>
                                <div class="seat-condition-disabled" title="장애인석"><em class="seat-em">장애인석</em></div>
                        <!--선택하면 selected class들어감 -->
                    </div>
                    <div class="choise-seat">
                        <p class="tit-seat">선택좌석</p>
                        <!-- 좌석선택시 class가 choice로 바뀌고 title과 내용이 변경-->
                        <div class="wrap">
                            <div class="seat-all" title="선택완료 좌석">A1</div>
                            <div class="seat-position" title="구매가능좌석">-</div>
                            <div class="seat-position" title="구매가능좌석">-</div>
                            <div class="seat-position" title="구매가능좌석">-</div>
                            <div class="seat-position" title="구매가능좌석">-</div>
                            <div class="seat-position" title="구매가능좌석">-</div>
                        </div>
                    </div>
                </div>
                <div class="pay-area">
                    <p class="count">
                        <!--좌석선택시 span과 em의 내용이 바뀐다.-->
                        <span>청소년 </span>
                        <em>1</em>
                    </p>
                    <div class="pay">
                        <p class="tit-pay">최종결제금액</p>
                    </div>   
                    <div class="money">
                        <!--변경시 em태그의 숫자가 변경된다. -->
                        <em>22,000</em>
                        <span>원</span>
                    </div>
                </div>
                <div class="btn-group">
                    <a href="#자바스크립트" class="button" id="pagePrevious" title="이전">이전</a>
                    <a href="#자바스크립트" class="button" id="pageNext" title="다음">다음</a>
                </div>
            </div>
        </div>
    </div>
</div>
    <script type="text/javascript">
        $(function(){
            $("#show-seat").append(function(){
            let seat1 = 10;
            let seat2 = 13;
            let lefts = 161;
            let tops = 50;
            let button = "";
            let el = $(this);
            for(let i = 0; i<seat1; i++) {
                for(let j = 0; j<seat2; j++) {
                    button = document.createElement('button');
                    button.setAttribute('rownm',i);
                    button.setAttribute('seatNo',j);
                    button.type = "button";
                    button.setAttribute('class','seat-condition-common');
                    $(button).css('position','absolute');
                    $(button).css('width','18px');
                    $(button).css('top',tops+'px');
                    $(button).css('left',lefts+'px');
                    lefts += 20;
                    el.append(button);
                }
                tops += 20;
                lefts = 161;
            }
        })
       
    })
    </script>
</body>
</html>