<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-8">
					<!-- carousel -->
					<div class="carousel slide" id="carousel">
						<ol class="carousel-indicators">
							<li data-slide-to="0" data-target="#carousel">
							</li>
							<li data-slide-to="1" data-target="#carousel">
							</li>
							<li data-slide-to="2" data-target="#carousel" class="active">
							</li>
						</ol>
						<div class="carousel-inner">
							<div class="carousel-item">
								<img class="d-block w-100" alt="Carousel1" src="${cp}/resources/img/수업소개이미지_1.png" />
							</div>
							<div class="carousel-item">
								<img class="d-block w-100" alt="Carousel2" src="${cp}/resources/img/수업소개이미지_2.png" />
							</div>
							<div class="carousel-item active">
								<img class="d-block w-100" alt="Carousel3" src="${cp}/resources/img/수업소개이미지_3.png" />
							</div>
						</div> 
						<!-- carousel-control -->
						<a class="carousel-control-prev" href="#carousel" data-slide="prev">
							<span class="carousel-control-prev-icon"></span> <span class="sr-only">Previous</span>
						</a> 
						<a class="carousel-control-next" href="#carousel" data-slide="next">
							<span class="carousel-control-next-icon"></span> <span class="sr-only">Next</span>
						</a>
						<!-- //carousel-control -->
					</div>
					<!-- //carousel -->
					<!-- nav tab -->
					<div class="tabbable" id="tabs-18714">
						<ul class="nav nav-tabs">
							<li class="nav-item">
								<a class="nav-link active show" href="#tab1" data-toggle="tab">Section 1</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="#tab2" data-toggle="tab">Section 2</a>
							</li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane active" id="panel-881204">
								<p>
									<div class="row">
										<div class="col-md-1">
										</div>
										<div class="col-md-3">
											<img alt="Bootstrap Image Preview" src="https://www.layoutit.com/img/sports-q-c-140-140-3.jpg" />
										</div>
										<div class="col-md-8">
											<h3>
												정모찌의 실전산책
											</h3>
										</div>
									</div>
								</p>
							</div>
							<div class="tab-pane" id="tab2">
								<p>
									Howdy, I'm in Section 2.
								</p>
							</div>
						</div>
					</div>
					
					
				</div>
				<!-- 시간&날짜/ 결제창 -->
				<div class="col-md-4">
					<div class="row">
						<div class="col-md-12">
							<div id="card-211584">
								<div class="card">
									<div class="card-header">
										  <a class="collapsed card-link" data-toggle="collapse" data-parent="#card-211584" href="#card-element-193178">
										07.08(수)14:00~16:00 강남</a>
									</div>
									<div id="card-element-53142" class="collapse show">
										<div class="card-body">
											상세장소 : 강사 공방
										</div>
									</div>
								</div>
								<div class="card">
									<div class="card-header">
										 <a class="collapsed card-link" data-toggle="collapse" data-parent="#card-211584" href="#card-element-193178">
										07.08(수)14:00~16:00 강남</a>
									</div>
									<div id="card-element-193178" class="collapse">
										<div class="card-body">
											상세장소 : 강사 공방
										</div>
									</div>
								</div>
							</div>
							<dl>
								<dt>
									강사한마디
								</dt>
								<dd>
									잘부탁드립니다
								</dd>
								
							</dl> 
							<button type="button" class="btn btn-success">
								결제하기
							</button>
						</div>
					</div>
				</div>
				<!-- //시간&날짜/ 결제창 -->
			</div>
		</div>
	</div>
</div>