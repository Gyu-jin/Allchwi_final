<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

.card img {
	width: 100%;
	height: 100%;
}
.card-body .roundImg {
    width: 40px;
    height: 40px;
    border-radius: 50%;
}
h1{
	padding-top: 30px;
}
.container{
	padding-top: 30px;
}

.q_menu ul {
	display: flex;
	justify-content: space-between;
	height: 51px;
	margin-bottom: 34px;
	width: 100%;
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
	width: 25%;
	height: 25%;
}

mark {
	background-color: transparent;
	color: gray;
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
			<!-- 위시리스트에서 count 제일 많은 클래스 번호 ?? -->
			<li><a href="#">
					<div class="icon popular">
						<img src="${cp}/resources/img/popular.png" alt="">
					</div> <mark>인기수업</mark>
			</a></li>
			<li><a href="${cp }/category/search?bcategory_num=1">
					<div class="icon design">
						<img src="${cp}/resources/img/work.png" alt="">
					</div> <mark>실무역량</mark>
			</a></li>
			<li><a href="${cp }/category/search?bcategory_num=2">
					<div class="icon work">
						<img src="${cp}/resources/img/design.png" alt="">
					</div> <mark>디자인</mark>
			</a></li>
			<li><a href="${cp }/category/search?bcategory_num=3">
					<div class="icon beauty">
						<img src="${cp}/resources/img/beauty.png" alt="">
					</div> <mark>뷰티</mark>
			</a></li>
			<li><a href="${cp }/category/search?bcategory_num=4">
					<div class="icon video">
						<img src="${cp}/resources/img/video.png" alt="">
					</div> <mark>영상</mark>
			</a></li>
			<li><a href="${cp }/category/search?bcategory_num=5">
					<div class="icon language">
						<img src="${cp}/resources/img/music.png" alt="">
					</div> <mark>음악</mark>
			</a></li>
			<li><a href="${cp }/category/search?bcategory_num=6">
					<div class="icon language">
						<img src="${cp}/resources/img/language.png" alt="">
					</div> <mark>언어</mark>
			</a></li>
			<li><a href="${cp }/category/search?bcategory_num=7">
					<div class="icon language">
						<img src="${cp}/resources/img/cook.png" alt="">
					</div> <mark>라이프스타일</mark>
			</a></li>
	</div>

	<!-- 카테고리 아이콘 끝  -->
	
	
	<!-- 이번주 시작 -->
	<h1 class="h3 mb-0 text-gray-800">이번주 시작</h1>
	<div class="container col-md-12">
		<div class="row">
		<c:forEach var="index" begin="1" end="4">
			<div class="col-3">
				<div class="card shadow mb-4">
					<a href="${cp}/classDetail/detail?class_num=4">
						<div class="card-body">
							<p>
								<img src="${cp}/resources/img/it.jpg" alt="">
							</p>
							<p class="t1 tov2">모찌의 실무산책</p>
							<div class="t2">
								<span class="profile">
									<img class="roundImg"
									src="${cp}/resources/img/it.jpg"
									alt="">
								</span>	
								<span class="name">정모찌</span> 
								<span class="d_day">07월07일 </span> 
								<span>목동</span>
							</div>
						</div>
					</a>
				</div>
			</div>
		</c:forEach>
		</div>
	</div>

	<!-- 이번주 시작 끝 -->
</div>