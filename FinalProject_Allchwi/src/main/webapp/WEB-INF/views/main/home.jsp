<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	background-color: #A9C8FB;
}

.q_menu ul {
	display: flex;
	justify-content: space-between;
	height: 51px;
	margin-bottom: 34px;
	width: 70%;
	margin-top: 20px
}

.q_menu li {
	text-align: center;
	cursor: pointer;
	list-style: none;
}

.q_menu img {
	vertical-align: middle;
	border-style: none;
	width: 50px;
}

mark {
	background-color: transparent;
	color: gray;
}
.card img{
	width: 100%;
	height: 100%;
}
</style>
<div>
	<!-- 메인 배너 -->
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
				<img src="${cp}/resources/img/배너1.png" class="d-block w-100"
					alt="배너1">
			</div>
			<div class="carousel-item">
				<img src="${cp}/resources/img/배너2.png" class="d-block w-100"
					alt="배너2">
			</div>
			<div class="carousel-item">
				<img src="${cp}/resources/img/배너3.png" class="d-block w-100"
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
			<li><a href="#">
					<div class="icon popular">
						<img src="${cp}/resources/img/popular.png" alt="">
					</div> <mark>인기수업</mark>
			</a></li>
			<li><a href="#">
					<div class="icon design">
						<img src="${cp}/resources/img/design.png" alt="">
					</div> <mark>디자인</mark>
			</a></li>
			<li><a href="#">
					<div class="icon work">
						<img src="${cp}/resources/img/work.png" alt="">
					</div> <mark>실무역량</mark>
			</a></li>
			<li><a href="#">
					<div class="icon beauty">
						<img src="${cp}/resources/img/beauty.png" alt="">
					</div> <mark>뷰티</mark>
			</a></li>
			<li><a href="#">
					<div class="icon video">
						<img src="${cp}/resources/img/video.png" alt="">
					</div> <mark>영상</mark>
			</a></li>
			<li><a href="#">
					<div class="icon language">
						<img src="${cp}/resources/img/language.png" alt="">
					</div> <mark>외국어</mark>
			</a></li>
	</div>

	<!-- 카테고리 아이콘 끝  -->
	<!-- 이번주 시작 -->
	<div class="container">
  <div class="row">
    <div class="col-sm">
      <div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">카테고리이름</h6>
		</div>
		<div class="card-body">
			<p><img src="${cp}/resources/img/it.jpg" alt=""></p>
			<p class="mb-0">수업정보</p>
		</div>
	</div>
    </div>
    <div class="col-sm">
     <div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">카테고리이름</h6>
		</div>
		<div class="card-body">
			<p><img src="${cp}/resources/img/it.jpg" alt=""></p>
			<p class="mb-0">수업정보</p>
		</div>
	</div>
    </div>
    <div class="col-sm">
      <div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">카테고리이름</h6>
		</div>
		<div class="card-body">
			<p><img src="${cp}/resources/img/it.jpg" alt=""></p>
			<p class="mb-0">수업정보</p>
		</div>
	</div>
    </div>
  </div>
</div>
	
	<!-- 이번주 시작 끝 -->
</div>