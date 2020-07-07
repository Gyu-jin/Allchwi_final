<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.container-fluid {
	background-color: #eee;
}
.tab-content{
	
}
.card {
	width: 440px;
}

.remote {
	position: fixed;
	margin-left: 1000px;
	width: 70%;
}

.roundImg {
	width: 200px;
	height: 200px;
	border-radius: 50%;
}

.info {
	line-height: 150%;
	margin-top: 20px;
}

.info ul li {
	width: 140px;
	text-align: center;
	float: left;
	padding-top: 50px;
	list-style: none;
}

.info ul li.ar {
	background:
		url(https://user-images.githubusercontent.com/65140754/86689111-a9a82e00-c041-11ea-8aea-c02eb0d1bfd2.png)
		center top no-repeat;
}

.info ul li.hu {
	background:
		url(https://user-images.githubusercontent.com/65140754/86689750-3fdc5400-c042-11ea-87f2-fe8364438ff3.png)
		center top no-repeat;
}

.info ul li.gr {
	background:
		url(https://user-images.githubusercontent.com/65140754/86689737-3c48cd00-c042-11ea-95b3-593fb577963b.png)
		center top no-repeat;
}

.info ul li.ohu {
	background:
		url(https://user-images.githubusercontent.com/65140754/86689728-3b17a000-c042-11ea-9861-55fe8f7cd520.png)
		center top no-repeat;
}

#tabs .nav-tabs .nav-item.show .nav-link, .nav-tabs .nav-link.active {
	color: black;
	background-color: transparent;
	border-color: transparent transparent #f3f3f3;
	border-bottom: 4px solid !important;
	font-size: 20px;
	font-weight: bold;
}

.nav-tabs .nav-link {
	border: 1px solid transparent;
	border-top-left-radius: .25rem;
	border-top-right-radius: .25rem;
	color: gray;
	font-size: 20px;
}
</style>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-8">
					<!-- carousel -->
					<div class="carousel slide" id="carousel">
						<ol class="carousel-indicators">
							<li data-slide-to="0" data-target="#carousel"></li>
							<li data-slide-to="1" data-target="#carousel"></li>
							<li data-slide-to="2" data-target="#carousel" class="active">
							</li>
						</ol>
						<div class="carousel-inner">
							<div class="carousel-item">
								<img class="d-block w-100" alt="Carousel1"
									src="${cp}/resources/img/수업소개이미지_1.png" />
							</div>
							<div class="carousel-item">
								<img class="d-block w-100" alt="Carousel2"
									src="${cp}/resources/img/수업소개이미지_2.png" />
							</div>
							<div class="carousel-item active">
								<img class="d-block w-100" alt="Carousel3"
									src="${cp}/resources/img/수업소개이미지_3.png" />
							</div>
						</div>
						<!-- carousel-control -->
						<a class="carousel-control-prev" href="#carousel"
							data-slide="prev"> <span class="carousel-control-prev-icon"></span>
							<span class="sr-only">Previous</span>
						</a> <a class="carousel-control-next" href="#carousel"
							data-slide="next"> <span class="carousel-control-next-icon"></span>
							<span class="sr-only">Next</span>
						</a>
						<!-- //carousel-control -->
					</div>
					<!-- //carousel -->
					<!-- nav tab -->
					<nav>
						<div class="nav nav-tabs nav-fill" id="nav-tab" role="tablist">
							<a class="nav-item nav-link active" id="nav-home-tab"
								data-toggle="tab" href="#nav-home" role="tab"
								aria-controls="nav-home" aria-selected="true">강의요약</a> <a
								class="nav-item nav-link" id="nav-tutor-tab" data-toggle="tab"
								href="#nav-tutor" role="tab" aria-controls="nav-profile"
								aria-selected="false">튜터소개</a> <a class="nav-item nav-link"
								id="nav-class-tab" data-toggle="tab" href="#nav-class"
								role="tab" aria-controls="nav-contact" aria-selected="false">수업소개</a>
							<a class="nav-item nav-link" id="nav-review-tab"
								data-toggle="tab" href="#nav-review" role="tab"
								aria-controls="nav-about" aria-selected="false">리뷰</a> <a
								class="nav-item nav-link" id="nav-qna-tab" data-toggle="tab"
								href="#nav-qna" role="tab" aria-controls="nav-about"
								aria-selected="false">문의</a>
						</div>
					</nav>
					<!-- 탭내용 -->
					<div class="tab-content py-3 px-3 px-sm-0" id="nav-tabContent">
						<!-- 1.수업요약 -->
						<div class="tab-pane fade show active" id="nav-home"
							role="tabpanel" aria-labelledby="nav-home-tab">
							<p>
							<div class="row">
								<div class="col-md-1"></div>
								<div class="col-md-3">
									<img alt="Bootstrap Image Preview" class="roundImg"
										src="${cp}/resources/img/모찌.jpg" />
								</div>
								<div class="col-md-8">
									<!-- 수업명 -->
									<span>
										<h3>정모찌의 실전산책</h3>
									</span>
									<!-- 별점 -->
									<div class="info">
										<a class="starimg"> <img
											src="https://user-images.githubusercontent.com/65140754/86701560-183eb900-c04d-11ea-8879-07a4ac705f26.png"><img
											src="https://user-images.githubusercontent.com/65140754/86701560-183eb900-c04d-11ea-8879-07a4ac705f26.png"><img
											src="https://user-images.githubusercontent.com/65140754/86701560-183eb900-c04d-11ea-8879-07a4ac705f26.png"><img
											src="https://user-images.githubusercontent.com/65140754/86701560-183eb900-c04d-11ea-8879-07a4ac705f26.png"><img
											src="https://user-images.githubusercontent.com/65140754/86701560-183eb900-c04d-11ea-8879-07a4ac705f26.png">
											(리뷰갯수)
										</a>
									</div>
									<!-- 기본정보 -->
									<div class="info">
										<ul>
											<li class="ar" id="regionAll">온라인</li>
											<li class="hu"><font color="#ff005a">3</font>시간/회</li>
											<li class="gr">최대인원:<font color="#ff005a">2~50</font>명
											</li>
											<li class="ohu"><font color="#ff005a">￦10,000</font>/시간
											</li>
										</ul>
									</div>
								</div>
							</div>
							</p>
						</div>
						<!-- 튜터소개 -->
						<div class="tab-pane fade" id="nav-tutor" role="tabpanel"
							aria-labelledby="nav-tutor-tab">ㅌㅌ소개</div>
						<!-- 수업소개 -->
						<div class="tab-pane fade" id="nav-class" role="tabpanel"
							aria-labelledby="nav-class-tab">수업소개</div>
						<!-- 리뷰 -->
						<div class="tab-pane fade" id="nav-review" role="tabpanel"
							aria-labelledby="nav-review-tab">리뷰</div>
						<!-- 문의 -->
						<div class="tab-pane fade" id="nav-qna" role="tabpanel"
							aria-labelledby="nav-qna-tab">문의</div>
					</div>


				</div>
				<!-- 시간&날짜/ 결제창 -->
				<div class="col-md-4 remote">
					<div class="row">
						<div class="col-md-12">
							<div id="card">
								<div class="card">
									<div class="card-header">
										<a class="collapsed card-link" data-toggle="collapse"
											data-parent="#card-1" href="#card-element-1">
											07.08(수)14:00~16:00 강남</a>
									</div>
									<div id="card-element-1" class="collapse show">
										<div class="card-body">상세장소 : 강사 공방</div>
									</div>
								</div>
								<div class="card">
									<div class="card-header">
										<a class="collapsed card-link" data-toggle="collapse"
											data-parent="#card-2" href="#card-element-2">
											07.08(수)14:00~16:00 강남</a>
									</div>
									<div id="card-element-2" class="collapse">
										<div class="card-body">상세장소 : 강사 공방</div>
									</div>
								</div>
							</div>
							<dl>
								<dt>강사한마디</dt>
								<dd>잘부탁드립니다</dd>

							</dl>
							<button type="button" class="btn btn-success">결제하기</button>
						</div>
					</div>
				</div>
				<!-- //시간&날짜/ 결제창 -->
			</div>
		</div>
	</div>
</div>