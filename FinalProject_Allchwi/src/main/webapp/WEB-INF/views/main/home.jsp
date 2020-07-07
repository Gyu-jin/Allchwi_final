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

	
	<!-- 이번주 시작 -->
	<h1 class="h3 mb-0 text-gray-800">이번주 시작</h1>
	<div class="container">
		<div class="row">
			<div class="col-3">
				<div class="card shadow mb-4">
					<a href="${cp}/class/detail">
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
			<div class="col-3">
				<div class="card shadow mb-4">
						<a href="${cp}/class/detail">
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
			<div class="col-3">
				<div class="card shadow mb-4">
					<a href="${cp}/class/detail">
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
			<div class="col-3">
			<div class="card shadow mb-4">
					<a href="${cp}/class/detail">
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
	</div>

	<!-- 이번주 시작 끝 -->
</div>