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
  	<link rel="stylesheet" href="/resources/css/supports/supports.css" />
  	<link rel="icon" href="/resources/images/favicon.ico" type="image/x-icon">
<title>고객센터</title>
</head>
<body>
<%@include file="../common/tags.jsp" %>
<%@include file="../common/navbar.jsp"%>
<div class="container">
	<nav style="box-sizing: border-box;">
		<div>
			<div class="row">
				<div class="col p-0 page-title">
					<h1>고객센터</h1>
				</div>
			</div>
		</div>
		<div class="row mypage">
			<div class="col-2 p-0 aside">
				<ul class="nav flex-column p-0">
					<li class=""><a href="#" class="nav-link p-0">고객센터 메인</a></li>
				</ul>
				<ul class="nav flex-column p-0">
					<li class=""><a href="#" class="nav-link p-0">자주 묻는 질문</a></li>
				</ul>
				<ul class="nav flex-column p-0">
					<li class=""><a href="/supports/inquiry" class="nav-link p-0">1:1 문의</a></li>
				</ul>
				<ul class="nav flex-column p-0">
					<li class=""><a href="#" class="nav-link p-0">이용약관</a></li>
				</ul>
			</div>
		</div>
	</nav>
	
	<div class="supports offset-md-1 col-9 p-0">
		<div class="row">
			<div class="col">
				<h1>1:1 문의</h1>
			</div>
		</div>
		<div>
			<form action="post" enctype="multipart/form-data">
				<table class="table">
					<colgroup>
						<col style="width:150px;">
						<col>
						<col>
						<col>
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">
								<label for="ask-type">문의지점</label>
								<span class="red">*</span>
							</th>
							<td colspan="">
								<div class="row">
									<div class="col">
										<select id="region" class="form-select">
											<option selected disabled>지역선택</option>
											<c:forEach var="region" items="${regions }" >
												<option value="${region.no }">${region.name }</option>
											</c:forEach>
										</select>
									</div>
									<div class="col">
										<select id="theater" name="theaterNo" class="form-select" disabled>
											<option selected disabled>극장선택</option>
										</select>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row">
								<label for="ask-type">문의유형</label>
								<span class="red">*</span>
							</th>
							<td colspan="3">
								<select id="ask-type" name="qnaNo" class="form-select">
									<option selected disabled>문의유형 선택</option>
									<c:forEach var="category" items="${categories }">
										<option value="${category.no }">${category.typeName }</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row">
								<label for="name">이름</label>
								<span class="red">*</span>
							</th>
							<td>
								<input type="text" value="${LOGIN_USER.name }" class="form-control" maxlength="15"/>
							</td>
						</tr>
						<tr>
							<th scope="row">
								<label for="email">이메일</label>
								<span class="red">*</span>
							</th>
							<td>
								<input type="text" value="${LOGIN_USER.email }" class="form-control" maxlength="15"/>
							</td>
						</tr>
						<tr>
							<th scope="row">
								<label for="phone">휴대전화</label>
								<span class="red">*</span>
							</th>
							<td>
								<input type="text" value="${LOGIN_USER.phoneNumber }" class="form-control"/>
							</td>
						</tr>
						<tr>
							<th scope="row">
								<label for="title">제목</label>
								<span class="red">*</span>
							</th>
							<td>
								<input type="text" id="title" name="title" value="" class="form-control"/>
							</td>
						</tr>
						<tr>
							<th scope="row">
								<label for="textarea">내용</label>
								<span class="red">*</span>
							</th>
							<td>
								<div class="textarea">
									<textarea class="form-control" name="content" id="textarea" rows="5" cols="30" maxlength="1000" placeholder="※ 불편사항이나 문의사항을 남겨주시면 최대한 신속하게 답변 드리겠습니다."></textarea>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row">
								<label for="upfiles">사진첨부</label>
								<span class="red">*</span>
							</th>
							<td>
								<div>
									<p>* JPEG, PNG 형식의 5M 이하의 파일만 첨부 가능합니다. (최대 3개)</p>
									<p>* 개인정보가 포함된 이미지 등록은 자제하여 주시기 바랍니다.</p>
									<input id="upfiles" name="upfiles" type="file" class="form-control mb-2">
									<input id="upfiles" name="upfiles" type="file" class="form-control mb-2">
									<input id="upfiles" name="upfiles" type="file" class="form-control mb-2">
								</div>
							</td>
						</tr>
					</tbody>
				</table>
				<div class="text-center">
					<button class="btn btn-primary">등록</button>
				</div>
			</form>
		</div>
	</div>
</div>
</body>
<script type="text/javascript">
	$(function() {
		
		$("#region").click(function() {
			let $option = $("#theater");
			let regionNo = $("#region option:selected").val();
			
			$option.empty();
			
			if (regionNo) {
				$option.prop("disabled", false);
				
				$.getJSON("/rest/theater", {regionNo: regionNo}, function(response) {
					let theaters = response.items;
					
					$.each(theaters, function(index, theater) {
						let output = "";
						output = "<option value='"+theater.no+"'>"+theater.name+"</option>";
						$option.append(output);
					})
				})
			}
		})
	})
</script>
</html>