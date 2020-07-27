<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- home.jsp -->
<style>
.carousel-inner {
	position: relative;
	width: 70%;
	margin: auto;
	overflow: hidden;
}

.carousel {
	position: relative;
	background-color: #bfd8ee;
}

h1 {
	padding-top: 30px;
}

.container {
	padding-top: 30px;
}

.q_menu ul {
	display: flex;
	justify-content: space-between;
	height: 51px;
	margin-bottom: 34px;
	width: 100%;
	margin-top: 20px;
	padding-left: 0;
}

.q_menu li {
	text-align: center;
	cursor: pointer;
	list-style: none;
}

.q_menu img {
	vertical-align: middle;
	border-style: none;
	width: 25%;
	height: 25%;
}

mark {
	background-color: transparent;
	color: gray;
}

.c-cover {
	width: 100%;
	height: 140px;
}

.t1 {
	font-weight: bold;
	color: #636363;
}

.card-body .roundImg {
	width: 40px;
	height: 40px;
	border-radius: 50%;
}
.tutor ul{
	position: relative;
    width: 100%;
    height: 100%;;
    display: flex;
}

.tutor ul li .img {
	overflow: hidden;
	width: 150px;
    height: 150px;;
	margin-bottom: 10px;
	border-radius: 50%;
}
.tutor ul li .t span{
	display: block;
    overflow: hidden;
    width: 100%;
    text-align: center;
    font-weight: bold;
}
.tutor ul li .t .score{
    text-align: center;
}
.roundImg{
	width: 100%;
}
li {
    list-style: none;
}
.sec01{
	margin-bottom: 30px;
}
</style>
<div>
	<!-- 메인 배너  -->
	<div id="carouselExampleIndicators" class="carousel slide"
		data-ride="carousel">
		<ol class="carousel-indicators">
			<li data-target="#carouselExampleIndicators" data-slide-to="0"
				class="active"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="${cp}/resources/img/배너1.png" id="b1" class="d-block w-100"
					alt="배너1">
			</div>
			<div class="carousel-item">
				<img src="${cp}/resources/img/배너2.png" id="b2" class="d-block w-100"
					alt="배너2">
			</div>
			<div class="carousel-item">
				<img src="${cp}/resources/img/배너3.png" id="b3" class="d-block w-100"
					alt="배너3">
			</div>
		</div>
		<a class="carousel-control-prev" href="#carouselExampleIndicators"
			role="button" data-slide="prev"> <span
			class="carousel-control-prev-icon" aria-hidden="true"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
			role="button" data-slide="next"> <span
			class="carousel-control-next-icon" aria-hidden="true"></span> <span
			class="sr-only">Next</span>
		</a>
	</div>
	<!-- 메인배너 끝 -->

	<!-- 카테고리 아이콘  -->
	<div class="q_menu">
		<ul>
			<li><a href="${cp }/list/search?bcategory_num=1">
					<div class="icon design">
						<img src="${cp}/resources/img/work.png" alt="">
					</div> <mark>실무역량</mark>
			</a></li>
			<li><a href="${cp }/list/search?bcategory_num=2">
					<div class="icon work">
						<img src="${cp}/resources/img/design.png" alt="">
					</div> <mark>디자인</mark>
			</a></li>
			<li><a href="${cp }/list/search?bcategory_num=3">
					<div class="icon beauty">
						<img src="${cp}/resources/img/beauty.png" alt="">
					</div> <mark>뷰티</mark>
			</a></li>
			<li><a href="${cp }/list/search?bcategory_num=4">
					<div class="icon video">
						<img src="${cp}/resources/img/video.png" alt="">
					</div> <mark>영상</mark>
			</a></li>
			<li><a href="${cp }/list/search?bcategory_num=5">
					<div class="icon language">
						<img src="${cp}/resources/img/music.png" alt="">
					</div> <mark>음악</mark>
			</a></li>
			<li><a href="${cp }/list/search?bcategory_num=6">
					<div class="icon language">
						<img src="${cp}/resources/img/language.png" alt="">
					</div> <mark>언어</mark>
			</a></li>
			<li><a href="${cp }/list/search?bcategory_num=7">
					<div class="icon language">
						<img src="${cp}/resources/img/cook.png" alt="">
					</div> <mark>라이프스타일</mark>
			</a></li>
	</div>

	<!-- 카테고리 아이콘 끝  -->


	<!-- 인기수업 -->
	<h1 class="h3 mb-0 text-gray-800">인기 수업 TOP 8!</h1>
	<div class="container col-md-12">
		<div class="row">
			<c:forEach var="list" items="${top_list }">
				<div class="col-3">
					<div class="card shadow mb-4">
						<a href="${cp}/classDetail/detail?class_num=${list.class_num}">
							<div class="card-body">
								<p>
									<img src="${cp}/class/getimg?cover_num=${list.cover_num}"
										class="c-cover">
								</p>
								<p class="t1">${list.class_title }</p>
								<div class="t2">
									<span class="profile"> <img class="roundImg"
										src="${cp}/mypage/getimg?pro_num=${list.pro_num}" alt="">
									</span> <span class="name">${list.tutor_nickname }</span>
									<p>${list.bloc_name }${list.sloc_name }</p>
								</div>
							</div>
						</a>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<!-- //인기수업  -->
	<!-- 평점높은튜터 -->
	<h1 class="h3 sec01">높은 리뷰 평점</h1>
	<div class="tutor">
		<ul>
			<c:forEach var="best_tutor" items="${best_tutor }">
				<li style="width: 120px; margin-right: 100px;">
				<a href="${cp}/classDetail/detail?class_num=${best_tutor.class_num}">
						<div class="img">
							<img class="roundImg"
								src="${cp}/mypage/getimg?pro_num=${best_tutor.pro_num}">
						</div>
						<div class="t">
							<span class="name">${best_tutor.tutor_nickname}</span> <span
								class="score">${best_tutor.tot_avg}(${best_tutor.cnt})</span>
						</div>
				</a></li>

			</c:forEach>
		</ul>
	</div>
<script type="text/javascript">
var currentIndex = $('div.active').index() + 1;
$('#carouselExampleIndicators').on('slide.bs.carousel', function (event) {
	var crs= document.getElementById("carouselExampleIndicators");
	currentIndex = $('div.active').index() + 1;
	if(currentIndex==1){
		crs.style.backgroundColor = "#fff2cc";
	}else if(currentIndex==2){
		crs.style.backgroundColor = "#fbe5d7";
	}else if(currentIndex==3){
		crs.style.backgroundColor = "#bfd8ee";	
	}

});
</script>