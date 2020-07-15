<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
.input-search {
	width: 35%;
}
</style>
<script>


</script>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
 
  <div class="collapse navbar-collapse" id="navbarNavDropdown">
    <ul class="navbar-nav"> 
    <!-- big_category -->
      <c:forEach var="blist" items="${bigcalte_list }"> 
     	 <li class="nav-item dropdown">
      		<a class="nav-link dropdown-toggle" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	          	${blist.bcategory_name }
	       	</a>
	      <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
    <!-- 선택한 big_category에 해당하는 small_category -->
      		<c:forEach var="slist" items="${smallcate_list }"> 
	      		<c:if test="${blist.bcategory_num == slist.bcategory_num }">
					<a class="dropdown-item" href="${cp}/list/search?scategory_num=${slist.scategory_num}">${slist.scategory_name}</a>	        			
				</c:if>
	     	</c:forEach>
	      </div>
	    </li>		
      </c:forEach>
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
					<form class="form-inline" action="${cp }/list/search" method="POST">
					<!-- header 검색창을 통해 검색했을 때만 keyword가 나타나도록 ..-->
						<c:if test="${!empty keyword }">
							<p><h5>" ${keyword } " 키워드로 상세 검색하기</h5></p>
						</c:if> 
				
						<br>
						<input type="hidden" name="keyword" value="${keyword }">
						<input type="hidden" name="scategory_num" value="${scategory_num }">
						<div class="label-1">
							지역
						</div> 
						<select class="custom-select my-1 mr-sm-2"
							id="BigLoc">
							<option selected value="0">선택</option>
								<c:forEach var="vo" items="${bloc_list }">
									<option value="${vo.bloc_num }">${vo.bloc_name }</option>
								</c:forEach>
						</select> 
						<select class="custom-select my-1 mr-sm-2" id="SmallLoc" name="sloc_num">
							<option value='0'>세부 지역 선택</option>
						</select> <br>
						<div class="label-1">
							기간
						</div> 
						<div class='col-md-3'>
							<div class="form-group">
								<div class="input-group date" id="datetimepicker7"
									data-target-input="nearest">
									<input type="text" class="form-control datetimepicker-input"
										data-target="#datetimepicker7" /><!-- name="startDate" /> -->
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
										data-target="#datetimepicker8" /><!-- name="endDate" /> -->
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
						
						<button type="submit" class="btn btn-primary my-1"
							id="detailSearchBtnOffline">수업찾기</button>
					</form>
		
				</div>
		
				<!-- @@@@@온라인 검색탭@@@@@@ -->
				<div class="tab-pane fade" id="nav-profile" role="tabpanel"
					aria-labelledby="nav-profile-tab">
					<form class="form-inline" action="${cp }/list/search">
						<c:if test="${!empty keyword }">
							<p><h5>" ${keyword } " 키워드로 상세 검색하기</h5></p>
						</c:if> 
						<br>
						<div class="label-1">
							시작 날짜
						</div> 
						<div class='col-md-3'>
							<div class="form-group">
								<div class="input-group date" id="datetimepicker9"
									data-target-input="nearest">
									<input type="text" class="form-control datetimepicker-input"
										data-target="#datetimepicker9" /><!-- name="startDate" /> -->
									<div class="input-group-append" data-target="#datetimepicker9"
										data-toggle="datetimepicker">
										<div class="input-group-text">
											<i class="fa fa-calendar"></i>
										</div>
									</div>
								</div>
							</div>
						</div>
						<br>
						<div class="label-1">
							수업형태
						</div> 
						<div class="btn-group btn-group-toggle" data-toggle="buttons" style="display: inline-flex;">
							<label class="btn btn-secondary active"> 
								<input type="radio" name="month" value="0" checked> 1개월
							</label> 
							<label class="btn btn-secondary"> 
								<input type="radio" name="month" value="1"> 2개월
							</label> 
							<label class="btn btn-secondary"> 
								<input type="radio" name="month" value="2"> 3개월
							</label> 
						</div>
		
						<br><br>
						<button type="submit" class="btn btn-primary my-1"
							id="detailSearchBtnOnline">수업찾기</button>
					</form>
		
				</div>
			</div>

		</div>

	</div> 


<div class="jumbotron">
<h1>${bcategory_name }</h1>
<h5>${scategory_name }</h5>
	<select class="custom-select my-1 mr-sm-2"
		id="inlineFormCustomSelectPref2">
		<option selected value="1">정확도순</option>
		<option value="2">최신순</option>
		<option value="3">인기순</option>
	</select> <br>

	<div class="row" id="searchList">

		<c:choose>
			<c:when test="${!empty list }">
				<c:forEach var="vo" items="${list }" varStatus="status">
				<div class='col-md-4'>
					<div class='card mb-4 shadow-sm'>
						<svg class='bd-placeholder-img card-img-top' width='100%' height='225' xmlns='http://www.w3.org/2000/svg' 
						preserveAspectRatio='xMidYMid slice' focusable='false' role='img' aria-label='Placeholder: Thumbnail'>
						<title>	${vo.getClass_title() }</title>
					   	<rect width='100%' height='100%' fill='#55595c'></rect>
					   	<text x='50%' y='50%' fill='#eceeef' dy='.3em'>
					   	
					   	${vo.getClass_title() } 번호 :${vo.getClass_num() } </text></svg>
						<div class='card-body'>
							<p class='card-text'>튜터: ${vo.getTutor_nickname() }</p>
							<div class='d-flex justify-content-between align-items-center'>
							<div class='btn-group'>
								<button type='button' class='btn btn-sm btn-outline-secondary'>♡</button>
								<button type='button' class='btn btn-sm btn-outline-secondary'>위시리스트</button>
							</div>
							<small class='text-muted'>${status.count }번째 수업</small>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
			</c:when>
			<c:otherwise>
				<div class="col-md-12" style="text-align:center;padding:20%">
					<h3>검색 결과가 없습니다..</h3>
				</div>
			</c:otherwise>
		</c:choose>
	</div>
<div>
	<c:forEach var="i" begin="${pu.startPageNum }" end="${pu.endPageNum }">
		<c:choose>
			<c:when test="${i==pu.pageNum}">
				<a href="${cp }/list/search?pageNum=${i}&scategory_num=${scategory_num}&bcategory_num=${bcategory_num}&keyword=${keyword}&sloc_num=${sloc_num}"
				style="text-decoration: none;font-weight: bold;">
				<span style="color:red">[${i }]</span>
				</a>
			</c:when>
			<c:otherwise>
				<a href="${cp }/list/search?pageNum=${i}&scategory_num=${scategory_num}&bcategory_num=${bcategory_num}&keyword=${keyword}&sloc_num=${sloc_num}" 
				style="text-decoration: none">
				<span style="color:gray">[${i }]</span>
				</a>
			</c:otherwise>
		</c:choose>
		
	</c:forEach>
</div>
<input type="hidden" id="keyword" value="${keyword }">
</div>


<script>
	// date 형식에서 시간 삭제 
	$('#datetimepicker7').datetimepicker({
		format : 'L'
	});
	$('#datetimepicker8').datetimepicker({
		format : 'L'
	});
	$('#datetimepicker9').datetimepicker({
		format : 'L'
	});
	
	
	
	//Big Location Select-Option
	$('#BigLoc').on('change',function(){
		var bloc_num = $(this).val();
		$.ajax({
		    type: "post",
		    dataType: "json",
		    url: "${cp}/locatrion/search",
		    data: {bloc_num: bloc_num},
		    success: function(data) {
		    	$("#SmallLoc").empty();
		    	$("#SmallLoc").append("<option value='0'>세부 지역 선택</option>");		
		    	$(data).each(function(i,sloc){				
					$("#SmallLoc").append("<option value='"+sloc.sloc_num+"'>"+sloc.sloc_name+"</option>");		
				});
		    }
		});
	});
			
	
</script>
