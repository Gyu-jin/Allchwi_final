<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="${cp}/resources/vendor/jquery/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/js/tempusdominus-bootstrap-4.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/css/tempusdominus-bootstrap-4.min.css" />

<style>
.form-inline {
	display: block;
	flex-flow: row wrap;
	align-items: center;
}

.col-md-5 {
	padding-left: 0;
}

#inlineFormCustomSelectPref2 {
	width: 150px;
}
.btn-secondary:not(:disabled):not(.disabled).active, .btn-secondary:not(:disabled):not(.disabled):active, .show>.btn-secondary.dropdown-toggle {
    color: #fff;
    background-color: #F44336;
    border-color: #656776;
}
.form-inline .btn-group-toggle {
    display: inline-block;
	margin:10px;
}

.btn-group, .btn-group-vertical {
    position: relative;
    display: inline-flex;
    vertical-align: middle;
    padding-top: 0.25rem;
}
.col-xs-1{
	text-align: center;
}
.label-1{
    display: inline-flex;
    padding-top: 13px;
    float: left;
    width: 100px;
    font-size: 16px;
    color: #333;
    letter-spacing: -0.4px;
    font-weight: bold;
    text-align: center;
}
.inbox{
 display: inline-flex;
}
</style>
<div class="jumbotron">

	<nav>
		<div class="nav nav-tabs" id="nav-tab" role="tablist">
			<a class="nav-item nav-link active" id="nav-home-tab"
				data-toggle="tab" href="#nav-home" role="tab"
				aria-controls="nav-home" aria-selected="true">오프라인</a> <a
				class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab"
				href="#nav-profile" role="tab" aria-controls="nav-profile"
				aria-selected="false">온라인</a>

		</div>
	</nav>
	<div class="tab-content" id="nav-tabContent">
		<div class="tab-pane fade show active" id="nav-home" role="tabpanel"
			aria-labelledby="nav-home-tab">
			<form class="form-inline">
				<p>입력된 검색어 : ${keyword }</p>
				<div class="label-1">
					카테고리
				</div> 
				<div class="inbox">
				<div class="btn-group-toggle" data-toggle="buttons">
					<label class="btn btn-secondary active btn btn-primary"> 
					<input type="checkbox"> 실무역량
					</label>
				</div>
				<div class="btn-group-toggle" data-toggle="buttons">
					<label class="btn btn-secondary active"> 
					<input type="checkbox"> 디자인
					</label>
				</div>
				<div class="btn-group-toggle" data-toggle="buttons">
					<label class="btn btn-secondary active"> 
					<input type="checkbox"> 뷰티
					</label>
				</div>
				<div class="btn-group-toggle" data-toggle="buttons">
					<label class="btn btn-secondary active"> 
					<input type="checkbox"> 요리
					</label>
				</div>
				<div class="btn-group-toggle" data-toggle="buttons">
					<label class="btn btn-secondary active"> 
					<input type="checkbox"> 영상
					</label>
				</div>
				<div class="btn-group-toggle" data-toggle="buttons">
					<label class="btn btn-secondary active"> 
					<input type="checkbox"> 음악
					</label>
				</div>
				<div class="btn-group-toggle" data-toggle="buttons">
					<label class="btn btn-secondary active"> 
					<input type="checkbox"> 외국어
					</label>
				</div>
			</div>
				<br> 
				<div class="label-1">
					지역
				</div> 
				<select class="custom-select my-1 mr-sm-2"
					id="inlineFormCustomSelectPref">
					<option selected value="1">서울</option>
					<option value="2">경기</option>
					<option value="3">강원</option>
					<option value="4">충남</option>
					<option value="5">충북</option>
					<option value="6">경남</option>
					<option value="7">경북</option>
					<option value="8">충남</option>
					<option value="9">충북</option>
					<option value="10">전남</option>
					<option value="11">전북</option>
					<option value="12">제주</option>
				</select> <select class="custom-select my-1 mr-sm-2">
					<!-- inlineFormCustomSelectPref의 option value에 따라 동적으로 생성 -->
					<option selected value="1">강남</option>
					<option value="2">강북</option>
					<option value="3">강서</option>
					<option value="4">강동</option>
				</select> <br>
				<div class="label-1">
					시작 날짜
				</div> 
				<div class='col-md-5'>
					<div class="form-group">
						<div class="input-group date" id="datetimepicker7"
							data-target-input="nearest">
							<input type="text" class="form-control datetimepicker-input"
								data-target="#datetimepicker7" />
							<div class="input-group-append" data-target="#datetimepicker7"
								data-toggle="datetimepicker">
								<div class="input-group-text">
									<i class="fa fa-calendar"></i>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="label-1">
					끝 날짜
				</div> 
				<div class='col-md-5'>
					<div class="form-group">
						<div class="input-group date" id="datetimepicker8"
							data-target-input="nearest">
							<input type="text" class="form-control datetimepicker-input"
								data-target="#datetimepicker8" />
							<div class="input-group-append" data-target="#datetimepicker8"
								data-toggle="datetimepicker">
								<div class="input-group-text">
									<i class="fa fa-calendar"></i>
								</div>
							</div>
						</div>
					</div>
				</div>

				<br>
				<button type="button" class="btn btn-primary my-1"
					id="detailSearchBtn">상세검색</button>
			</form>

		</div>

		<!-- @@@@@온라인 검색탭@@@@@@ -->
		<div class="tab-pane fade" id="nav-profile" role="tabpanel"
			aria-labelledby="nav-profile-tab">
			<form class="form-inline">

				<p>입력된 검색어 : ${keyword }</p>
				<div class="label-1">
					카테고리
				</div> 
				<div class="btn-group-toggle" data-toggle="buttons" id="category1">
					<label class="btn btn-secondary active btn btn-primary"> 
					<input type="checkbox"> 실무역량
					</label>
				</div>
				<div class="btn-group-toggle" data-toggle="buttons" id="category2">
					<label class="btn btn-secondary active"> 
					<input type="checkbox"> 디자인
					</label>
				</div>
				<div class="btn-group-toggle" data-toggle="buttons" id="category3">
					<label class="btn btn-secondary active"> 
					<input type="checkbox"> 뷰티
					</label>
				</div>
				<div class="btn-group-toggle" data-toggle="buttons" id="category4">
					<label class="btn btn-secondary active"> 
					<input type="checkbox"> 요리
					</label>
				</div>
				<div class="btn-group-toggle" data-toggle="buttons" id="category5">
					<label class="btn btn-secondary active"> 
					<input type="checkbox"> 영상
					</label>
				</div>
				<div class="btn-group-toggle" data-toggle="buttons" id="category6">
					<label class="btn btn-secondary active"> 
					<input type="checkbox"> 음악
					</label>
				</div>
				<div class="btn-group-toggle" data-toggle="buttons" id="category7">
					<label class="btn btn-secondary active"> 
					<input type="checkbox"> 외국어
					</label>
				</div>

				<br>
				<div class="label-1">
					수업형태
				</div> 
				<div class="btn-group btn-group-toggle" data-toggle="buttons" style="display: inline-flex;">
					<label class="btn btn-secondary active"> <input
						type="radio" name="options" id="option1" checked> 1개월
					</label> <label class="btn btn-secondary"> <input type="radio"
						name="options" id="option2"> 2개월
					</label> <label class="btn btn-secondary"> <input type="radio"
						name="options" id="option3"> 3개월
					</label>
				</div>

				<br><br>
				<button type="button" class="btn btn-primary my-1"
					id="detailSearchBtn">상세검색</button>
			</form>

		</div>
	</div>

</div>


<div class="jumbotron">
	<select class="custom-select my-1 mr-sm-2"
		id="inlineFormCustomSelectPref2">
		<option selected value="1">정확도순</option>
		<option value="2">최신순</option>
		<option value="3">인기순</option>
	</select> <br>

	<div class="row" id="searchList">

		<!-- 이부분 나중에 :  select 된 자료를 동적으로 생성하기 (제이쿼리,json)-->
	</div>


</div>


<script>
	$('#datetimepicker7').datetimepicker({
		format : 'L'
	});
	$('#datetimepicker8').datetimepicker({
		format : 'L'
	});
	$("#inlineFormCustomSelectPref")
			.click(
					function() {
						if ($("#inlineFormCustomSelectPref option:selected")
								.val() == 1) {
							console.log("1-서울 선택됨");
						} else if ($(
								"#inlineFormCustomSelectPref option:selected")
								.val() == 2) {
							console.log("2-경기 선택됨");
						}
					});

	$("#detailSearchBtn").click(function() {
		$.getJSON("/searchList", data, function(data, textStatus, req) {
			var html = "<div class='col-md-4'>"
				+ "<div class='card mb-4 shadow-sm'>"
				+ "<svg class='bd-placeholder-img card-img-top' width='100%' height='225' xmlns='http://www.w3.org/2000/svg' preserveAspectRatio='xMidYMid slice' focusable='false' role='img' aria-label='Placeholder: Thumbnail'><title>Placeholder</title>"
				+ "<rect width='100%' height='100%' fill='#55595c'></rect><text x='50%' y='50%' fill='#eceeef' dy='.3em'>클래스커버 대표이미지</text></svg>"
				+ "<div class='card-body'>"
				+ "<p class='card-text'>클래스 설명</p>"
				+ "<div class='d-flex justify-content-between align-items-center'>"
				+ "<div class='btn-group'>"
				+ "<button type='button' class='btn btn-sm btn-outline-secondary'>♡</button>"
				+ "<button type='button' class='btn btn-sm btn-outline-secondary'>위시리스트</button>"
				+ "</div>"
				+ "<small class='text-muted'>9 mins</small>"
				+ "</div>" + "</div>" + "</div>" + "</div>";
		$("#searchList").append(html);
		});
		
	});
</script>
