<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- home.jsp -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
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

.q_menu {
	margin-top: 3%;
	margin-bottom: 3%;
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

.tutor {
	padding-bottom: 10%;
}

.tutor ul {
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

.tutor ul li .t span {
	display: block;
	overflow: hidden;
	width: 100%;
	text-align: center;
	font-weight: bold;
}

.tutor ul li .t .score {
	text-align: center;
}

.roundImg {
	width: 100%;
}
.roundpro{
	width: 100%;
	border-radius: 50%;
}

.sec01 {
	margin-bottom: 30px;
	color: #5a5c69;
}

.classtitle-box {
	width: 84%;
	height: 80px;
	font-size: 17px;
	overflow: hidden;
	font-weight: bold;
	line-height: 1.4;
}

.card-body {
	flex: 1 1 auto;
	min-height: 1px;
	padding: 1.25rem;
	height: 350px;
}

.icon {
	margin-bottom: 10px;
}

.row {
	display: flex;
	flex-wrap: wrap;
	margin-right: -.75rem;
	margin-left: -.75rem;
	padding-top: 3%;
	padding-bottom: 3%;
}

.name {
	font-size: 14px;
}

.loc {
	font-size: 14px;
}

.swiper1{
	height: 420px;
}
.swiper2{
	height: 200px;
}

.swiper-slide {
	text-align: center;
	display: flex; /* 내용을 중앙정렬 하기위해 flex 사용 */
	align-items: center; /* 위아래 기준 중앙정렬 */
	justify-content: center; /* 좌우 기준 중앙정렬 */
}

.swiper-slide img {
	box-shadow: 0 0 5px #555;
	max-width: 100%;
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
				<a href="${cp }/classDetail/detail?class_num=12"><img
					src="${cp}/resources/img/banner1.jpg" id="b1" class="d-block w-100"
					alt="배너1"></a>
			</div>
			<div class="carousel-item">
				<a href="${cp}/list/search?bcategory_num=7"><img
					src="${cp}/resources/img/banner2.jpg" id="b2" class="d-block w-100"
					alt="배너2"></a>
			</div>
			<div class="carousel-item">
				<a href="${cp}/list/search?scategory_num=19"><img
					src="${cp}/resources/img/banner3.jpg" id="b3" class="d-block w-100"
					alt="배너3"></a>
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
					<div class="icon">
						<img src="${cp}/resources/img/work.png" alt="">
					</div> <mark>실무역량</mark>
			</a></li>
			<li><a href="${cp }/list/search?bcategory_num=2">
					<div class="icon">
						<img src="${cp}/resources/img/design.png" alt="">
					</div> <mark>디자인</mark>
			</a></li>
			<li><a href="${cp }/list/search?bcategory_num=3">
					<div class="icon">
						<img src="${cp}/resources/img/beauty.png" alt="">
					</div> <mark>뷰티</mark>
			</a></li>
			<li><a href="${cp }/list/search?bcategory_num=4">
					<div class="icon">
						<img src="${cp}/resources/img/video.png" alt="">
					</div> <mark>영상</mark>
			</a></li>
			<li><a href="${cp }/list/search?bcategory_num=5">
					<div class="icon">
						<img src="${cp}/resources/img/music.png" alt="">
					</div> <mark>음악</mark>
			</a></li>
			<li><a href="${cp }/list/search?bcategory_num=6">
					<div class="icon">
						<img src="${cp}/resources/img/language.png" alt="">
					</div> <mark>언어</mark>
			</a></li>
			<li><a href="${cp }/list/search?bcategory_num=7">
					<div class="icon">
						<img src="${cp}/resources/img/cook.png" alt="">
					</div> <mark>라이프스타일</mark>
			</a></li>
	</div>

	<!-- 카테고리 아이콘 끝  -->

	<!-- 인기수업 -->
	<h1 class="h3 mb-0 text-gray-800">인기 수업 TOP 8!</h1>
	<div class="swiper-container swiper1">
		<div class="swiper-wrapper">
			<c:forEach var="list" items="${top_list }">
				<div class="swiper-slide">
					<div class="card shadow mb-4">
						<a href="${cp}/classDetail/detail?class_num=${list.class_num}">
							<div class="card-body">
								<p>
									<img src="${cp}/classImg/getimg?cover_num=${list.cover_num}"
										class="c-cover">
								</p>
								<div class="classtitle-box">${list.class_title }</div>
								<br>
								<div class="t2">
									<span class="profile"> <img class="roundImg"
										src="${cp}/mypageImg/getimg?pro_num=${list.pro_num}" alt="">
									</span> <span class="name">${list.tutor_nickname }</span> &nbsp |
									&nbsp <span class="loc">${list.bloc_name }${list.sloc_name }</span>
								</div>
							</div>
						</a>
					</div>
				</div>
			</c:forEach>
		</div>

		<!-- 네비게이션 -->
		<div class="swiper-button-next"></div>
		<!-- 다음 버튼 (오른쪽에 있는 버튼) -->
		<div class="swiper-button-prev"></div>
		<!-- 이전 버튼 -->

		<!-- 페이징 -->
		<div class="swiper-pagination"></div>
	</div>



	<!-- //인기수업  -->
	<!-- 평점높은튜터 -->
	<h1 class="h3 sec01">리뷰 왕 튜터!</h1>
	<div class="tutor">
		<div class="swiper-container swiper2">
			<div class="swiper-wrapper">
				<c:forEach var="best_tutor" items="${best_tutor }">
					<div class="swiper-slide">
						<div style="width: 120px; margin-right: 100px;">
							<a
								href="${cp}/classDetail/detail?class_num=${best_tutor.class_num}">
								<div class="img">
									<img class="roundpro"
										src="${cp}/mypageImg/getimg?pro_num=${best_tutor.pro_num}">
								</div>
								<div class="t">
									<div class="name">${best_tutor.tutor_nickname}</div> 
									<div class="score">${best_tutor.tot_avg}(${best_tutor.cnt})</div>
								</div>
							</a>
						</div>
					</div>
				</c:forEach>

			</div>
			<!-- 네비게이션 -->
			<div class="swiper-button-next"></div>
			<!-- 다음 버튼 (오른쪽에 있는 버튼) -->
			<div class="swiper-button-prev"></div>
			<!-- 이전 버튼 -->

			<!-- 페이징 -->
			<div class="swiper-pagination"></div>
		</div>
	</div>
</div>
<script type="text/javascript">
	var currentIndex = $('div.active').index() + 1;
	$('#carouselExampleIndicators').on('slide.bs.carousel', function(event) {
		var crs = document.getElementById("carouselExampleIndicators");
		currentIndex = $('div.active').index() + 1;
		if (currentIndex == 1) {
			crs.style.backgroundColor = "#fff2cc";
		} else if (currentIndex == 2) {
			crs.style.backgroundColor = "#fbe5d7";
		} else if (currentIndex == 3) {
			crs.style.backgroundColor = "#bfd8ee";
		}

	});
	new Swiper('.swiper1', {

		slidesPerView : 4, // 동시에 보여줄 슬라이드 갯수
		spaceBetween : 30, // 슬라이드간 간격
		slidesPerGroup : 4, // 그룹으로 묶을 수, slidesPerView 와 같은 값을 지정하는게 좋음

		// 그룹수가 맞지 않을 경우 빈칸으로 메우기
		// 3개가 나와야 되는데 1개만 있다면 2개는 빈칸으로 채워서 3개를 만듬
		loopFillGroupWithBlank : true,

		loop : true, // 무한 반복

		pagination : { // 페이징
			el : '.swiper-pagination',
			clickable : true, // 페이징을 클릭하면 해당 영역으로 이동, 필요시 지정해 줘야 기능 작동
		},
		navigation : { // 네비게이션
			nextEl : '.swiper-button-next', // 다음 버튼 클래스명
			prevEl : '.swiper-button-prev', // 이번 버튼 클래스명
		},
	});
	new Swiper('.swiper2', {

		slidesPerView : 5, // 동시에 보여줄 슬라이드 갯수
		spaceBetween : 0, // 슬라이드간 간격
		slidesPerGroup : 5, // 그룹으로 묶을 수, slidesPerView 와 같은 값을 지정하는게 좋음

		// 그룹수가 맞지 않을 경우 빈칸으로 메우기
		// 3개가 나와야 되는데 1개만 있다면 2개는 빈칸으로 채워서 3개를 만듬
		loopFillGroupWithBlank : true,

		loop : true, // 무한 반복

		pagination : { // 페이징
			el : '.swiper-pagination',
			clickable : true, // 페이징을 클릭하면 해당 영역으로 이동, 필요시 지정해 줘야 기능 작동
		},
		navigation : { // 네비게이션
			nextEl : '.swiper-button-next', // 다음 버튼 클래스명
			prevEl : '.swiper-button-prev', // 이번 버튼 클래스명
		},
	});
</script>