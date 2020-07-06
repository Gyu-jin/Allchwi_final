<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="${cp}/resources/vendor/jquery/jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> 
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script> 
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/js/tempusdominus-bootstrap-4.min.js"></script> <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/css/tempusdominus-bootstrap-4.min.css" />

<style>
.form-inline {
	display:block;
    flex-flow: row wrap;
    align-items: center;
}
.col-md-5{
padding-left: 0;
}
</style>
<div class="jumbotron">
        <h1>상세검색페이지</h1>
		<p>입력된 검색어 : ${keyword }</p>
		
        	<form class="form-inline">
			 
				  <select class="custom-select my-1 mr-sm-2" id="inlineFormCustomSelectPref">
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
				  
				  
				  <select class="custom-select my-1 mr-sm-2" ><!-- inlineFormCustomSelectPref의 option value에 따라 동적으로 생성 -->
					    <option selected value="1">강남</option>
					    <option value="2">강북</option>
					    <option value="3">강서</option>
					    <option value="4">강동</option>
				  </select>
			
			<br>
				<select class="custom-select my-1 mr-sm-2" id="inlineFormCustomSelectPref2">
				    <option selected value="1">정확도순</option>
				    <option value="2">최신순</option>
				    <option value="3">인기순</option>
			  	</select>
			
			<div class="btn-group btn-group-toggle" data-toggle="buttons">
				  <label class="btn btn-secondary active">
				    <input type="radio" name="options" id="option1" checked> 오프라인수업
				  </label>
				  <label class="btn btn-secondary">
				    <input type="radio" name="options" id="option2"> 온라인수업
				  </label>
			</div>
			<br>
	
			    <div class='col-md-5'>
			        <div class="form-group">
			           <div class="input-group date" id="datetimepicker7" data-target-input="nearest">
			                <input type="text" class="form-control datetimepicker-input" data-target="#datetimepicker7"/>
			                <div class="input-group-append" data-target="#datetimepicker7" data-toggle="datetimepicker">
			                    <div class="input-group-text"><i class="fa fa-calendar"></i></div>
			                </div>
			            </div>
			        </div>
			    </div>
			    <div class='col-md-5'>
			        <div class="form-group">
			           <div class="input-group date" id="datetimepicker8" data-target-input="nearest">
			                <input type="text" class="form-control datetimepicker-input" data-target="#datetimepicker8"/>
			                <div class="input-group-append" data-target="#datetimepicker8" data-toggle="datetimepicker">
			                    <div class="input-group-text"><i class="fa fa-calendar"></i></div>
			                </div>
			            </div>
			        </div>
			    </div>
		
			<br>
			  <button type="button" class="btn btn-primary my-1" id="detailSearchBtn">상세검색</button>
			</form>
       
      </div>
<div class="jumbotron">

    <div class="container">
		<nav>
		  <div class="nav nav-tabs" id="nav-tab" role="tablist">
		    <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">오프라인</a>
		    <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">온라인</a>

		  </div>
		</nav>
		<div class="tab-content" id="nav-tabContent">
		  <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
		  	  <div class="row" id="searchList">
     			 <!-- 이부분 나중에 :  select 된 자료를 동적으로 생성하기 (제이쿼리,json)-->
        
      		 </div>
		  </div>
		  <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">...</div>

		</div>
    
      </div>
  
</div>
<script>
	$('#datetimepicker7').datetimepicker({
	    format: 'L'
	});
	$('#datetimepicker8').datetimepicker({
	    format: 'L'
	});
	$("#inlineFormCustomSelectPref").click(function(){
		if($("#inlineFormCustomSelectPref option:selected").val()==1){
			console.log("1-서울 선택됨");
		}else if($("#inlineFormCustomSelectPref option:selected").val()==2){
			console.log("2-경기 선택됨");
		}
	});
	
	$("#detailSearchBtn").click(function(){// select 데이터만큼 for
		var html="<div class='col-md-4'>"+
		"<div class='card mb-4 shadow-sm'>"+
			"<svg class='bd-placeholder-img card-img-top' width='100%' height='225' xmlns='http://www.w3.org/2000/svg' preserveAspectRatio='xMidYMid slice' focusable='false' role='img' aria-label='Placeholder: Thumbnail'><title>Placeholder</title>"+
	        "<rect width='100%' height='100%' fill='#55595c'></rect><text x='50%' y='50%' fill='#eceeef' dy='.3em'>클래스커버 대표이미지</text></svg>"+
	       		"<div class='card-body'>"+
		          "<p class='card-text'>클래스 설명</p>"+
		          "<div class='d-flex justify-content-between align-items-center'>"+
		            "<div class='btn-group'>"+
		             "<button type='button' class='btn btn-sm btn-outline-secondary'>♡</button>"+
		              "<button type='button' class='btn btn-sm btn-outline-secondary'>위시리스트</button>"+
	            "</div>"+
	            "<small class='text-muted'>9 mins</small>"+
	          "</div>"+
	        "</div>"+
	      "</div>"+
	    "</div>";
		$("#searchList").append(html);
	});
</script>
