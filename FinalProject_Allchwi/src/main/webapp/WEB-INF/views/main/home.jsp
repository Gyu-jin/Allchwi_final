<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- home.jsp -->

<div>
	<!-- 네비게이션바 -->
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="#">Navbar</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="#">Home
						<span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item"><a class="nav-link" href="#">Link</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> Dropdown </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="#">Action</a> <a
							class="dropdown-item" href="#">Another action</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Something else here</a>
					</div></li>
				<li class="nav-item"><a class="nav-link disabled" href="#"
					tabindex="-1" aria-disabled="true">Disabled</a></li>
			</ul>
		</div>
	</nav>

	<!-- Just an image -->
	<nav class="navbar navbar-light bg-light">
		<a class="navbar-brand" href="#"> <img
			src="/docs/4.5/assets/brand/bootstrap-solid.svg" width="30"
			height="30" alt="" loading="lazy">
		</a>
	</nav>

	<!-- 네비게이션 바 끝 -->
	 <div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-7">
        <!-- 메인 배너 -->
	<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="${cp}/resources/img/배너1.png" class="d-block w-100" alt="배너1">
    </div>
    <div class="carousel-item">
      <img src="${cp}/resources/img/배너2.png" class="d-block w-100" alt="배너2">
    </div>
    <div class="carousel-item">
      <img src="${cp}/resources/img/배너3.png" class="d-block w-100" alt="배너3">
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
	<!-- 메인배너 끝 -->
        </div>
        <div class="col-md-2"></div>
      </div>
	
	<!-- 카테고리 아이콘  -->
	<!-- 카테고리 아이콘 끝  -->
	<!-- 이번주 시작 -->
	<!-- 이번주 시작 끝 -->
</div>