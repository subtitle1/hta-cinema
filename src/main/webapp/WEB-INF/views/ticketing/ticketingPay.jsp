<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>Page Title</title>
    <link rel="stylesheet" href="/resources/css/final2.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
    <div class="container" style="width:1250px ">
        <div class="head">
            <h2>빠른예매</h2>
        </div>
        <div class="left-container">
            <h5>관람권 및 할인적용</h5>
            <div class="sale-ticket">
                    <span>메가박스 포인트/쿠폰</span>
                        <!--클릭시 li태그에 visibility 태그를 visible로 보인다.-->
                        <!--button 클릭시 div style에 display의 block 요소 추가-->
                        <button type="button" id="point-modal-show" class="btn-modal-show">메가박스 멤버십 포인트</button>
                        <button type="button" id="coupon-modal-show" class="btn-modal-show">메가박스 할인 쿠폰</button>
                        <button type="button" id="vipcoupon-modal-show" class="btn-modal-show">메가박스 VIP영화쿠폰</button>
            </div>
            <div class="pay-kakao" >
                <h5>결제수단 선택</h5>
                <div class="text-wrap">
                    <div class="" id="pay-kakao-id"></div>
                    <div class="text-event"><p>1만원 이상 결제시 영화관람권 추첨 이벤트 자동응모!</p></div>
                </div>
                <div class="pay-wrap">
                    <input type="radio" name="radio-kakao-pay" id="kakao-pay-radiobox">
                    <label for="kakao-pay-radiobox">카카오페이 결제</label>
                </div>
                <div class="pay-story">
                    <ul>
                        <li>내통장결제는 본인명의의 계좌를 최초 1회등록 후 비밀번호 입력만으로 간편하게 이용할 수 있는 현금결제 서비스 입니다.</li>
                        <li>은행 점검시간의 경우 내통장결제서비스 이용이 불가합니다.</li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="right-container">
            <div class="title-name">
                <img src="/resources/images/12세이상관람자.png" alt="count-age" class="count-age">
                <p class="title-text">해적:도깨비 깃발</p>
                <p class="screen-system">2D</p>
                <p class="screen-location">강남/4관</p>
                <p class="screen-day">2022.01.31</p>
                <p class="screen-time"><i class="fas fa-clock"></i>10:20~12:36</p>
            </div>
            <div class="pay-container">
                <div class="kind-age">
                    <p class="name">성인1</p>
                    <p class="pay">14,000</p>
                </div>
                <div class="total">
                    <p class="total-title">금액</p>
                    <p class="total-pay"><em>14000</em>원</p>
                </div>
                <i class="fas fa-minus-circle"></i>
                <div class="discount-total">
                    <p class="discount-title">
                        할인적용
                    </p>
                    <p class="discount-pay">
                        <em>0</em>원
                    </p>
                </div>
                <div class="discount-content">
                    <div class="point">
                        <p class="use-point">포인트 사용</p>
                        <p class="point-discount"><em>3,000</em>원</p>
                    </div>
                </div>
                <div class="final-pay">
                    <p class="final-title">최종결제금액</p>
                    <p class="final-total"><em>14,000</em>원</p>
                </div>
                <div class="way-pay">
                    <p class="way-pay-title">결제수단</p>
                    <p class="way-pay-content">카카오페이결제</p>
                </div>
                <div class="btn-final">
                    <button class="btn-pre" type="button">이전</button>
                    <button class="btn-pay" type="button">결제</button>
                </div>
            </div>
        </div>
    </div>
    <div id="point-modal">
        <div class="point-modal">
            <div class="point-modal-header">
                <!--안보이게는   display:flex; 을 추가한다.-->
                <h5 class="tit">메가박스 멤버십 포인트</h5>
            </div>
            <div class="point-modal-body">
                <ul class="dot-list">
                    <li>회원님께서 보유하고 있는 포인트 중 사용가능한 포인트 입니다.</li>
                    <li>포인트 적립 및 사용내역은 나의 메가박스 멤버십 포인트에서 확인하세요</li>
                </ul>
                <div class="usable-point">
                    <i class="fas fa-parking"></i>
                    사용가능한 멤버십 포인트
                    <span><em>0</em>P</span>
                </div>
                <div class="total-point">
                    <div class="point-wrap">
                        <div class="block" data-point=""></div>
                        <div class="block" data-point=""></div>
                        <div class="block" data-point=""></div>
                        <div class="block" data-point=""></div>
                    </div>
                    <div class="point-wrap">
                        <div class="block" data-point=""></div>
                        <div class="block" data-point=""></div>
                        <div class="block" data-point=""></div>
                        <div class="block" data-point=""></div>
                    </div>
                    <div class="text-right">
                        <p>총 <em>0</em>P/ <em>0</em>매</p>
                    </div>
                </div>
                <div class="button-list">
                    <!--적용시 금액 할인되도록-->
                    <button type="button" class="btn-discount-pay" id="btn-point-close">닫기</button>
                    <!--취소시 style의 display값을 none으로 -->
                    <button type="button" class="btn-discount-pay" id="btn-point-submit">적용</button>
                </div>
            </div>
        </div>
    </div>
    <div id="coupon-modal">
        <div class="coupon-modal">
            <div class="coupon-modal-header">
                <!--보이게는 id값에  display:flex; 을 추가한다.-->
                <h5 class="tit">메가박스 할인 쿠폰</h5>
            </div>
            <div class="coupon-modal-body">
                <ul class="dot-list">
                    <li>사용할 쿠폰을 선택해주세요</li>
                </ul>
                <div class="usable-coupon">
                   <p>쿠폰번호</p>
                   <input type="text" title="메가박스 영화 할인쿠폰 16자리 입력" 
                  class="input-text" id="dcouponNo" style="width: 200px;" maxlength="16">
                  <button type="button" class="btn-submit">쿠폰등록</button>
                </div>
                <div class="total-point">
                    <div class="coupon-title">
                        <div class="coupon-name">
                            <p>쿠폰명</p>
                        </div>
                        <div class="coupon-date">
                            <p>유효기간</p>
                        </div>
                        <div class="coupon-use">
                            <p>사용</p>
                        </div>
                    </div>
                    <div class="coupon-content">
                          <!--있으면 생기도록-->
                          <div id="coupon-list">왈왈이 영화 무료 이용권</div>
                           <!--있으면 생기도록-->
                           <div id="coupon-date">2022년12월01일</div>
                            <!--있으면 생기도록-->
                         <div id="coupon-use-btn">
                            <button type="button" id="button-use" data-use="">사용</button>
                         </div>
                         <div id="coupon-list">왈왈이 영화 무료 이용권</div>
                           <!--있으면 생기도록-->
                           <div id="coupon-date">2022년12월01일</div>
                            <!--있으면 생기도록-->
                         <div id="coupon-use-btn">
                            <button type="button" id="button-use" data-use="">사용</button>
                         </div>
                         <div id="coupon-list">왈왈이 영화 무료 이용권</div>
                           <!--있으면 생기도록-->
                           <div id="coupon-date">2022년12월01일</div>
                            <!--있으면 생기도록-->
                         <div id="coupon-use-btn">
                            <button type="button" id="button-use" data-use="">사용</button>
                         </div>
                         <div id="coupon-list">왈왈이 영화 무료 이용권</div>
                           <!--있으면 생기도록-->
                           <div id="coupon-date">2022년12월01일</div>
                            <!--있으면 생기도록-->
                         <div id="coupon-use-btn">
                            <button type="button" id="button-use" data-use="">사용</button>
                         </div>
                         <div id="coupon-list">왈왈이 영화 무료 이용권</div>
                           <!--있으면 생기도록-->
                           <div id="coupon-date">2022년12월01일</div>
                            <!--있으면 생기도록-->
                         <div id="coupon-use-btn">
                            <button type="button" id="button-use" data-use="">사용</button>
                         </div>
                         <div id="coupon-list">왈왈이 영화 무료 이용권</div>
                           <!--있으면 생기도록-->
                           <div id="coupon-date">2022년12월01일</div>
                            <!--있으면 생기도록-->
                         <div id="coupon-use-btn">
                            <button type="button" id="button-use" data-use="">사용</button>
                         </div>
                         <div id="coupon-list">왈왈이 영화 무료 이용권</div>
                           <!--있으면 생기도록-->
                           <div id="coupon-date">2022년12월01일</div>
                            <!--있으면 생기도록-->
                         <div id="coupon-use-btn">
                            <button type="button" id="button-use" data-use="">사용</button>
                         </div>
                         <div id="coupon-list">왈왈이 영화 무료 이용권</div>
                           <!--있으면 생기도록-->
                           <div id="coupon-date">2022년12월01일</div>
                            <!--있으면 생기도록-->
                         <div id="coupon-use-btn">
                            <button type="button" id="button-use" data-use="">사용</button>
                         </div>
                         <div id="coupon-list">왈왈이 영화 무료 이용권</div>
                           <!--있으면 생기도록-->
                           <div id="coupon-date">2022년12월01일</div>
                            <!--있으면 생기도록-->
                         <div id="coupon-use-btn">
                            <button type="button" id="button-use" data-use="">사용</button>
                         </div>
                    </div>
                </div>
                <div class="text-center">
                   <ul class="dot-list">
                       <li>사용가능한 쿠폰만 노출됩니다.</li>
                       <li>전체 쿠폰 목록은 나의 메가박스 할인쿠폰에서 확인 가능합니다.</li>
                       <li>보유하신 쿠폰은 등록 후 이용하실 수 있습니다.</li>
                   </ul>
                </div>
                <div class="button-list">
                    <!--적용시 금액 할인되도록-->
                    <button type="button" class="btn-discount-pay" id="btn-coupon-close">닫기</button>
                    <!--취소시 style의 display값을 none으로 -->
                    <button type="button" class="btn-discount-pay" id="btn-coupon-submit">적용</button>
                </div>
            </div>
        </div>
    </div>
    <div id="vipcoupon-modal">
        <div class="vipcoupon-modal">
            <div class="vipcoupon-modal-header">
                <!--보이게는 id값에  display:flex; 을 추가한다.-->
                <h5 class="tit">메가박스 VIP 영화 쿠폰</h5>
            </div>
            <div class="vipcoupon-modal-body">
                <ul class="dot-list">
                    <li>사용할 쿠폰을 선택해주세요</li>
                </ul>
                <div class="usable-coupon">
                   <p>쿠폰번호</p>
                   <input type="text" title="메가박스 영화 할인쿠폰 16자리 입력" 
                  class="input-text" id="dcouponNo" style="width: 200px;" maxlength="16">
                  <button type="button" class="btn-submit">쿠폰등록</button>
                </div>
                <div class="total-point">
                    <div class="coupon-title">
                        <div class="coupon-name">
                            <p>쿠폰명</p>
                        </div>
                        <div class="coupon-date">
                            <p>유효기간</p>
                        </div>
                        <div class="coupon-use">
                            <p>사용</p>
                        </div>
                    </div>
                    <div class="vipcoupon-content">
                        <div class="coupon-content">
                            <!--있으면 생기도록-->
                            <div id="coupon-list">왈왈이 영화 무료 이용권</div>
                             <!--있으면 생기도록-->
                             <div id="coupon-date">2022년12월01일</div>
                              <!--있으면 생기도록-->
                           <div id="coupon-use-btn">
                              <button type="button" id="button-use" data-use="">사용</button>
                           </div>
                           <div id="coupon-list">왈왈이 영화 무료 이용권</div>
                             <!--있으면 생기도록-->
                             <div id="coupon-date">2022년12월01일</div>
                              <!--있으면 생기도록-->
                           <div id="coupon-use-btn">
                              <button type="button" id="button-use" data-use="">사용</button>
                           </div>
                           <div id="coupon-list">왈왈이 영화 무료 이용권</div>
                             <!--있으면 생기도록-->
                             <div id="coupon-date">2022년12월01일</div>
                              <!--있으면 생기도록-->
                           <div id="coupon-use-btn">
                              <button type="button" id="button-use" data-use="">사용</button>
                           </div>
                           <div id="coupon-list">왈왈이 영화 무료 이용권</div>
                             <!--있으면 생기도록-->
                             <div id="coupon-date">2022년12월01일</div>
                              <!--있으면 생기도록-->
                           <div id="coupon-use-btn">
                              <button type="button" id="button-use" data-use="">사용</button>
                           </div>
                           <div id="coupon-list">왈왈이 영화 무료 이용권</div>
                             <!--있으면 생기도록-->
                             <div id="coupon-date">2022년12월01일</div>
                              <!--있으면 생기도록-->
                           <div id="coupon-use-btn">
                              <button type="button" id="button-use" data-use="">사용</button>
                           </div>
                           <div id="coupon-list">왈왈이 영화 무료 이용권</div>
                             <!--있으면 생기도록-->
                             <div id="coupon-date">2022년12월01일</div>
                              <!--있으면 생기도록-->
                           <div id="coupon-use-btn">
                              <button type="button" id="button-use" data-use="">사용</button>
                           </div>
                           <div id="coupon-list">왈왈이 영화 무료 이용권</div>
                             <!--있으면 생기도록-->
                             <div id="coupon-date">2022년12월01일</div>
                              <!--있으면 생기도록-->
                           <div id="coupon-use-btn">
                              <button type="button" id="button-use" data-use="">사용</button>
                           </div>
                           <div id="coupon-list">왈왈이 영화 무료 이용권</div>
                             <!--있으면 생기도록-->
                             <div id="coupon-date">2022년12월01일</div>
                              <!--있으면 생기도록-->
                           <div id="coupon-use-btn">
                              <button type="button" id="button-use" data-use="">사용</button>
                           </div>
                           <div id="coupon-list">왈왈이 영화 무료 이용권</div>
                             <!--있으면 생기도록-->
                             <div id="coupon-date">2022년12월01일</div>
                              <!--있으면 생기도록-->
                           <div id="coupon-use-btn">
                              <button type="button" id="button-use" data-use="">사용</button>
                           </div>
                    </div>
                </div>
                <div class="button-list">
                    <!--적용시 금액 할인되도록-->
                    <button type="button" class="btn-discount-pay" id="btn-vipcoupon-close">닫기</button>
                    <!--취소시 style의 display값을 none으로 -->
                    <button type="button" class="btn-discount-pay" id="btn-vipcoupon-submit">적용</button>
                </div>
            </div>
        </div>
    </div>
    </div>
</body>
<script type="text/javascript">
	$(function(){
		   $(".btn-pay").click(function(){
		        var IMP = window.IMP; // 생략가능
				IMP.init('imp28206043'); 
				IMP.request_pay({
					pg: 'kakao',
					pay_method: 'card',
					merchant_uid: 'merchant_' + new Date().getTime(),
					name: '주문명 : 아메리카노',
					amount: 2000,
					buyer_name: '이름',
					buyer_postcode: '123-456',
					}, function (rsp) {
						console.log(rsp);
					if (rsp.success) {
						var msg = '결제가 완료되었습니다.';
						msg += '결제 금액 : ' + rsp.paid_amount;
						// success.submit();
					} else {
						var msg = '결제에 실패하였습니다.';
						msg += '에러내용 : ' + rsp.error_msg;
					}
					alert(msg);
				});
			});
	})
</script>
</html>