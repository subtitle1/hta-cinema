<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<link rel="stylesheet" href="/resources/css/movieList.css" />
  	<link rel="stylesheet" href="/resources/css/navbar.css" />
  	<link rel="stylesheet" href="/resources/css/common.css" />
  	<link rel="stylesheet" href="/resources/css/movieDetail.css" />
  	<link rel="stylesheet" href="/resources/css/supports/supports.css" />
  	<link rel="icon" href="/resources/images/favicon.ico" type="image/x-icon">
<title>고객센터</title>
</head>
<body>
<%@include file="../common/tags.jsp" %>
<%@include file="../common/navbar.jsp"%>
<div class="container">
	<div class="menu mt-5">
		<div>
			<div class="col p-0 page-title text-center">
				<h3>고객센터</h3>
			</div>
		</div>
		<div class="row mypage">
			<div class="col p-0 aside text-center mt-3">
				<ul class="nav flex-column p-0">
					<li class=""><a href="#" class="nav-link p-0">고객센터 메인</a></li>
				</ul>
				<ul class="nav flex-column p-0">
					<li class=""><a href="/supports/faq" class="nav-link p-0">자주 묻는 질문</a></li>
				</ul>
				<ul class="nav flex-column p-0">
					<li class=""><a href="/supports/inquiry" class="nav-link p-0">1:1 문의</a></li>
				</ul>
				<ul class="nav flex-column p-0">
					<li class=""><a href="#" class="nav-link p-0">이용약관</a></li>
				</ul>
			</div>
			<div class="text-center mt-3 mb-3">
				<span>HTA CINEMA 고객센터</span>
				<span>10:30~18:30</span>
			</div>
		</div>
	</div>
	
	<div class="supports col-9">
		<div class="row">
			<div class="offset col-7 p-0" style="margin-left: 20px;">
				<div class="mt-5 mb-5">
					<h1>자주 묻는 질문</h1>
				</div>
				<div>
					<nav>
						<div class="nav nav-tabs nav-justified mt-3" id="nav-tab" role="tablist">
							<button class="nav-link active faq-list" name="option" value="전체" id="nav-all-tab" data-bs-toggle="tab" data-bs-target="#nav-all" type="button"
								role="tab" aria-controls="nav-all" aria-selected="true">전체</button>
							<button class="nav-link faq-list" name="option" value="예매" id="nav-ticket-tab" data-bs-toggle="tab" data-bs-target="#nav-ticket" type="button" role="tab"
								aria-controls="nav-ticket" aria-selected="false">영화예매</button>
							<button class="nav-link faq-list" name="option" value="극장" id="nav-theater-tab" data-bs-toggle="tab" data-bs-target="#nav-theater" type="button" role="tab"
								aria-controls="nav-theater" aria-selected="false">극장</button>
						</div>
					</nav>
				</div>
				<div id="faq-lists" class="tab-content" id="nav-tabContent">
					<div class="tab-pane fade show active" id="nav-all" role="tabpanel" aria-labelledby="nav-all-tab">
						<div class="row mt-3 faq">
						</div>
					</div>
					<div class="ms-4 tab-pane fade" id="nav-ticket" role="tabpanel" aria-labelledby="nav-ticket-tab">
						<div class="row mt-3 faq">
						</div>
					</div>
					<div class="ms-4 tab-pane fade" id="nav-theater" role="tabpanel" aria-labelledby="nav-theater-tab">
						<div class="row mt-3 faq">
						</div>
					</div>
				</div>
				<%-- <c:if test="${pagination.totalRecords gt 0 }">
					<!-- 페이지 내비게이션 표시 -->
					<div class="row mt-3 mb-3">
						<div class="col">
							<nav>
					  			<ul class="pagination justify-content-center">
					    			<li class="page-item ${pagination.existPrev ? '' : 'disabled' }">
					      				<a class="page-link" href="/supports/faq?page=${pagination.prevPage }" data-page="${pagination.prevPage }">이전</a>
					    			</li>
				
					    			<c:forEach var="num" begin="${pagination.beginPage }" end="${pagination.endPage }">
						    			<li class="page-item ${pagination.pageNo eq num ? 'active' : '' }">
						    				<a class="page-link" href="/supports/faq?page=${num }" data-page="${num }">${num }</a>
						    			</li>	    			
					    			</c:forEach>
				
					    			<li class="page-item ${pagination.existNext ? '' : 'disabled' }">
					      				<a class="page-link" href="/supports/faq?page=${pagination.nextPage }" data-page="${pagination.nextPage }">다음</a>
					    			</li>
					  			</ul>
							</nav>
						</div>
					</div>
				</c:if> --%>
			</div>
		</div>
	</div>
</div>
</body>
<script type="text/javascript">
	$(function() {
		let option = "전체";
		let currentPage = 1;
		let $div = $("#faq-lists .faq");
		
		showFaqLists();
		
		$(".faq-list").click(function() {
			option = $(this).attr('value');
			$div.empty();
		 	showFaqLists();
		})
		
		function showFaqLists() {
			$.ajax({
				type: "get",
				url: "/rest/supports/faq",
				data: {option: option, page: currentPage},
				dataType: 'json',
				success: function(response) {
					let faqList = response.items.faqList;
					
					$.each(faqList, function(index, faq) {
						console.log(faq);
						let output = "";
						
						output += 	"<div class='accordion accordion-flush mb-3' id='faqlist' style='border-bottom:1px solid #d5d5d5;'>"
						output +=         "<div class='accordion-item'>"
						output +=        	    "<div class='row ps-2 pe-2 pt-3 pb-3'>"
						output += 				"<div class='col-2' style='position:relative;'>"
						output += 					"<div style='position:absolute; top:50%; transform:translateY(-50%); left:40px;'>"
						output += 						"<span><strong>["+faq.questionName+"]</strong></span><br>"
						output += 					"</div>"
						output += 				"</div>"
						output += 				"<div class='col-9 mt-4'>"
						output += 					"<span>Q. "+faq.faqQuestion+"</span>"
						output += 				"</div>"
						output += 				"<div class='col mt-3 text-end'>"
						output += 					"<h2 class='accordion-header' id='faq-heading-"+faq.faqNo+"'>"
						output +=                         "<button class='accordion-button collapsed' style='width: 1px;'" 
						output +=                        	"type='button' data-bs-toggle='collapse' data-bs-target='#faq-content-"+faq.faqNo+"'>"
						output +=                        "</button>"
						output +=                	"</h2>"
						output +=				"</div>"
						output +=			"</div>"
						output +=           "<div id='faq-content-"+faq.faqNo+"' class='accordion-collapse collapse' data-bs-parent='#faqlist'>"
						output +=               "<div class='accordion-body'>"
						output +=                    "<strong>A. </strong><span>"+faq.faqAnswer+"</span>"
						output +=                "</div>"
						output +=            "</div>"
						output +=        "</div>"
						output +=	"</div>";
                
						$div.append(output);
					})
				}
			})
		}
	})
</script>
</html>