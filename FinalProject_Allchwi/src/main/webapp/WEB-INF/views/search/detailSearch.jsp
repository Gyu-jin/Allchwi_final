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

.col-md-3 {
	padding-left: 0;
	padding-right: 0;
	display: inline-flex;
}

#inlineFormCustomSelectPref2 {
	width: 150px;
}
.btn-secondary:not(:disabled):not(.disabled).active, .btn-secondary:not(:disabled):not(.disabled):active, .show>.btn-secondary.dropdown-toggle {
    color: #fff;
    background-color: #ff936f;
    border-color: #ff936f;
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

.form-inline .custom-select, .form-inline .input-group {
    width: auto;
    margin: 7px;
;
}

.text-div{
	display: inline-flex;
	width:3%;   
	text-align: center;
}
.text-1{
	font-size: 16px;
    color: #333;
    letter-spacing: -0.4px;
    font-weight: bold;

}
.dropdown:hover .dropdown-menu {
    display: block;
    margin-top: 0;
}
</style>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
 
  <div class="collapse navbar-collapse" id="navbarNavDropdown">
    <ul class="navbar-nav">
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          	실무역량
        </a><!-- BigCategoryController : ${cp}/bigcate/?bcate_num=1 (서브쿼리) -->
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
          <a class="dropdown-item" href="#">엑셀</a><!-- SmallCategoryController : ${cp}/smallcate/?scate_num=1 -->
          <a class="dropdown-item" href="#">파워포인트</a>
          <a class="dropdown-item" href="#">프로그래밍</a>
        </div>
      </li>
      
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          	디자인
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
          <a class="dropdown-item" href="#">포토샵</a>
          <a class="dropdown-item" href="#">일러스트</a>
          <a class="dropdown-item" href="#">애니메이션</a>
        </div>
      </li>      
      
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          	뷰티
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
          <a class="dropdown-item" href="#">메이크업</a>
          <a class="dropdown-item" href="#">패션</a>
          <a class="dropdown-item" href="#">헤어</a>
        </div>
      </li>
      
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          	영상
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
          <a class="dropdown-item" href="#">프리미어</a>
          <a class="dropdown-item" href="#">여행영상</a>
          <a class="dropdown-item" href="#">에프터이펙트</a>
        </div>
      </li>     
      
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          	음악
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
          <a class="dropdown-item" href="#">보컬</a>
          <a class="dropdown-item" href="#">피아노</a>
          <a class="dropdown-item" href="#">기타</a>
        </div>
      </li>
      
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          	언어
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
          <a class="dropdown-item" href="#">영어</a>
          <a class="dropdown-item" href="#">중국어</a>
          <a class="dropdown-item" href="#">베트남어</a>
        </div>
      </li>
      
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          	라이프스타일
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
          <a class="dropdown-item" href="#">요리</a>
          <a class="dropdown-item" href="#">반려동물</a>
          <a class="dropdown-item" href="#">플라워</a>
        </div>
      </li>
      
    </ul>
	    <p>
		  <a class="btn btn-primary" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
		    	상세검색
		  </a>
		</p>
	
	  </div>
</nav>

<div class="collapse" id="collapseExample">

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
						<p><h5>" ${keyword } " 키워드로 상세 검색하기</h5></p>
						<div class="label-1">
							카테고리
						</div> 
					
						<div class="btn-group-toggle" data-toggle="buttons">
							<label class="btn btn-secondary active"> 
							<input type="checkbox" name="offcate" value="1"> 실무역량
							</label>
						</div>
						<div class="btn-group-toggle" data-toggle="buttons">
							<label class="btn btn-secondary active"> 
							<input type="checkbox" name="offcate" value="2"> 디자인
							</label>
						</div>
						<div class="btn-group-toggle" data-toggle="buttons">
							<label class="btn btn-secondary active"> 
							<input type="checkbox" name="offcate" value="3"> 뷰티
							</label>
						</div>
						<div class="btn-group-toggle" data-toggle="buttons">
							<label class="btn btn-secondary active"> 
							<input type="checkbox" name="offcate" value="4"> 요리
							</label>
						</div>
						<div class="btn-group-toggle" data-toggle="buttons">
							<label class="btn btn-secondary active"> 
							<input type="checkbox" name="offcate" value="5"> 영상
							</label>
						</div>
						<div class="btn-group-toggle" data-toggle="buttons">
							<label class="btn btn-secondary active"> 
							<input type="checkbox" name="offcate" value="6"> 음악
							</label>
						</div>
						<div class="btn-group-toggle" data-toggle="buttons">
							<label class="btn btn-secondary active"> 
							<input type="checkbox" name="offcate" value="7"> 외국어
							</label>
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
						</select> 
						<select class="custom-select my-1 mr-sm-2">
							
							<!-- inlineFormCustomSelectPref의 option value에 따라 동적으로 생성 -->
						
						</select> <br>
						<div class="label-1">
							기간
						</div> 
						<div class='col-md-3'>
							<div class="form-group">
								<div class="input-group date" id="datetimepicker7"
									data-target-input="nearest">
									<input type="text" class="form-control datetimepicker-input"
										data-target="#datetimepicker7" name="startDate" />
									<div class="input-group-append" data-target="#datetimepicker7"
										data-toggle="datetimepicker">
										<div class="input-group-text">
											<i class="fa fa-calendar"></i>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="text-div"><span class="text-1">~</span></div>
						<div class='col-md-3'>
							<div class="form-group">
								<div class="input-group date" id="datetimepicker8"
									data-target-input="nearest">
									<input type="text" class="form-control datetimepicker-input"
										data-target="#datetimepicker8" name="endDate"/>
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
							id="detailSearchBtnOffline">수업찾기</button>
					</form>
		
				</div>
		
				<!-- @@@@@온라인 검색탭@@@@@@ -->
				<div class="tab-pane fade" id="nav-profile" role="tabpanel"
					aria-labelledby="nav-profile-tab">
					<form class="form-inline">
		
						<p><h5>" ${keyword } " 키워드로 상세 검색하기</h5></p>
						<div class="label-1">
							카테고리
						</div> 
						<div class="btn-group-toggle" data-toggle="buttons" id="category1">
							<label class="btn btn-secondary active"> 
							<input type="checkbox" name="oncate"> 실무역량
							</label>
						</div>
						<div class="btn-group-toggle" data-toggle="buttons" id="category2">
							<label class="btn btn-secondary active"> 
							<input type="checkbox" name="oncate"> 디자인
							</label>
						</div>
						<div class="btn-group-toggle" data-toggle="buttons" id="category3">
							<label class="btn btn-secondary active"> 
							<input type="checkbox" name="oncate"> 뷰티
							</label>
						</div>
						<div class="btn-group-toggle" data-toggle="buttons" id="category4">
							<label class="btn btn-secondary active"> 
							<input type="checkbox" name="oncate"> 요리
							</label>
						</div>
						<div class="btn-group-toggle" data-toggle="buttons" id="category5">
							<label class="btn btn-secondary active"> 
							<input type="checkbox" name="oncate"> 영상
							</label>
						</div>
						<div class="btn-group-toggle" data-toggle="buttons" id="category6">
							<label class="btn btn-secondary active"> 
							<input type="checkbox" name="oncate"> 음악
							</label>
						</div>
						<div class="btn-group-toggle" data-toggle="buttons" id="category7">
							<label class="btn btn-secondary active"> 
							<input type="checkbox" name="oncate"> 외국어
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
							id="detailSearchBtnOnline">수업찾기</button>
					</form>
		
				</div>
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
	// date 형식에서 시간 삭제 
	$('#datetimepicker7').datetimepicker({
		format : 'L'
	});
	$('#datetimepicker8').datetimepicker({
		format : 'L'
	});
	
	
	
	//Big Location Select-Option
	$("#inlineFormCustomSelectPref").click(function() {
		if ($("#inlineFormCustomSelectPref option:selected").val() == 1) {
			console.log("1-서울 선택됨");
			// small_location table 에서 bloc_num 이 1인 sloc_name 가져오기
		} else if ($("#inlineFormCustomSelectPref option:selected").val() == 2) {
			console.log("2-경기 선택됨");
			// small_location table 에서 bloc_num 이 2인 sloc_name 가져오기
		}
	});
	
			
	
	// OffLine tap - 상세검색 버튼
	$("#detailSearchBtnOffline").click(function() {
		$("input[name=offcate]:checked").each(function(){		
			console.log("체크된 카테고리번호 :"+ $(this).val());	
		});	
		
		var startDate=$("input[name=startDate]").val();
		var endDate=$("input[name=endDate]").val();
		
		console.log($("input[name=startDate]").val());
		console.log($("input[name=endDate]").val());
		$.getJSON("../class/searchList?startDate="+startDate, function(data, textStatus, req) {
			$(data).each(function(i,searchClass){
				var html = "<div class='col-md-4'>"
					+ "<div class='card mb-4 shadow-sm'>"
					+ "<svg class='bd-placeholder-img card-img-top' width='100%' height='225' xmlns='http://www.w3.org/2000/svg' preserveAspectRatio='xMidYMid slice' focusable='false' role='img' aria-label='Placeholder: Thumbnail'><title>Placeholder</title>"
					+ "<rect width='100%' height='100%' fill='#55595c'></rect><text x='50%' y='50%' fill='#eceeef' dy='.3em'>"+searchClass.class_title +"</text></svg>"
					+ "<div class='card-body'>"
					+ "<p class='card-text'>튜터:"+searchClass.tutor_nickname+"</p>"
					+ "<div class='d-flex justify-content-between align-items-center'>"
					+ "<div class='btn-group'>"
					+ "<button type='button' class='btn btn-sm btn-outline-secondary'>♡</button>"
					+ "<button type='button' class='btn btn-sm btn-outline-secondary'>위시리스트</button>"
					+ "</div>"
					+ "<small class='text-muted'>"+(i+1)+"번째 수업</small>"
					+ "</div>" + "</div>" + "</div>" + "</div>";
			$("#searchList").append(html);
			});
			
		});
	});
</script>
