<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
#container_detail {
	width: 100%;
	padding: 50px 0 50px 0;
	letter-spacing: 0;
}

.card {
	width: 440px;
	background: white;
}

.remote {
	width: 100%;
	background: whitesmoke;
	position: sticky;
	left: 63%;
}

.remote.active {
	position: fixed;
	top: 0px;
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

.btn_wishlist img {
	width: 20px;
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

.class_wrap {
	background: whitesmoke;
}

.class_navi {
	background: white;
	color: gray;
	border-bottom: 1px solid #999;
	padding: 10px 0px;
	position: sticky;
	top: 0px;
	z-index: 1;
}

.class_navi.active {
	
}

#container_detail .class_wrap .class_detail {
	float: left;
}

#container_detail .class_wrap .class_detail .info {
	line-height: 150%;
	margin-top: 20px;
}

#container_detail .class_wrap .class_detail .tutor_profile {
	width: 180px;
	float: left;
	color: #000;
	text-align: center;
	margin: 100px 0 50px 0;
}

#container_detail .class_wrap .class_detail .tutor_profile .name {
	width: 180px;
	font-size: 20px;
	line-height: 200%;
}

#container_detail .class_wrap .class_detail .class_title {
	float: right;
	padding-top: 40px;
	margin: 50px 0 50px 0;
}

#container_detail .class_wrap .detail_sec_bor {
	border-top: 1px solid #e3e3e3;
	overflow: hidden;
}

#container_detail .class_wrap .class_detail .sec01 {
	padding-top: 125px;
	position: relative;
}

#container_detail .class_navi ul li a.on {
	color: #ff936f;
	font-weight: bold;
	font-size: 20px;
	border-bottom: 2px solid #ff936f;
}

#container_detail .class_navi ul li {
	width: 180px;
	display: inline-block;
	text-align: center;
	font-size: 20px;
	padding: 20px 0 20px 0;
}

.btn_wishlist {
	padding: 10px 18px;
	border-radius: 10px;
	background-color: #ff936f;
	float: right;
	color: white;
	margin-top: 9px;
}

.btn_write {
	padding: 10px 20px;
	border-radius: 10px;
	background-color: #ff936f;
	float: right;
	color: white;
	margin-top: 10px;
}

.modal-footer {
	background-color: #ff936f;
}

.btn_send {
	color: white;
	font-weight: bold;
}

.review_box {
	text-align: center;
	padding: 30px;
	background: #cacaca54;
	font-size: 20px;
	font-weight: bold;
	color: #000;
	vertical-align: middle;
	margin-top: 85px;
}

.sec01 .review_count01 {
	margin-top: 30px;
	border-bottom: 1px solid #e5e5e5;
	padding-bottom: 150px;
}

.sec01 .review_count01 ul li {
	width: 50%;
	height: 60px;
	float: left;
	text-align: center;
	color: #000;
	cursor: default;
}

.sec01 .review_list dd {
	margin-left: 130px;
}

.sec01 .review_list {
	position: relative;
}

.sec01 .review_list dl dt {
	width: 86px;
	float: left;
	text-align: center;
	font-size: 16px;
	color: #000;
	cursor: default;
	line-height: 100%;
}

#container_detail .tutor_t {
	margin: 30px;
}

.sec01 .review_list ul li {
	border-bottom: 1px solid #e5e5e5;
	padding: 30px 0;
	cursor: default;
}

#container_detail .tutor_t dl.tutor_txt dt {
	width: 80px;
	height: 80px;
	background: none;
	padding: 0;
	border-radius: 100px;
	overflow: hidden;
}

#container_detail .tutor_t dl.tutor_txt dd {
	width: 300px;
	left: 100px;
	top: -80px;
	border-radius: 5px;
	padding: 10px;
	position: relative;
	background: lightgray;
	color: #666;
	letter-spacing: 0;
}

#container_detail .tutor_t dl.tutor_txt dd:after {
	right: 100%;
	top: 50%;
	border: solid transparent;
	content: " ";
	position: absolute;
	border-right-color: lightgray;
	border-width: 10px;
	margin-top: -10px;
}

.btn_pay {
	display: inline-block;
	padding: 10px 0 10px 0;
	width: 407px;
	text-align: center;
	border-radius: 10px;
	background-color: #7185bb;
	font-size: 30px;
	color: white;
}

a, span {
	color: inherit;
	font-size: inherit;
	font-weight: inherit;
	line-height: inherit;
	text-decoration: none;
}

li {
	list-style: none;
}

.qna_list ul li {
	border-bottom: 1px solid #e5e5e5;
	padding: 10px 0;
	cursor: default;
}

.qna_list {
	border: 1px solid #d4cdcd;
	margin-top: 65px;
}

.reply_box {
	margin-top: 20px;
}
</style>

<div class="container-fluid" id="container_detail">
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
						<!-- //carousel -->
					</div>
					<!-- class_navi -->
					<div class="class_wrap">
						<div id="class_navi" class="class_navi">
							<ul style="margin: 0">
								<li><a href="#sumary" id="li1" class="on">요약</a></li>
								<li><a href="#tutor" id="li2" class="">튜터</a></li>
								<li><a href="#intro" id="li3" class="">수업소개</a></li>
								<li><a href="#review" id="li4" class="">리뷰</a></li>
								<li><a href="#qna" id="li5" class="">문의</a></li>
							</ul>
						</div>
						<!-- class wrap -->

						<!--class_navi 내용  -->
						<!-- 1.요약 -->
						<div class="class_detail" id="sumary">
							<!-- 강사프로필 -->
							<div class="tutor_profile">
								<div class="tutor_img">
									<img alt="tutorprofile" class="roundImg"
										src="${cp}/resources/img/모찌.jpg" />
								</div>
								<div class="name">정모찌</div>
							</div>
							<div class="class_title">
								<!-- 수업명 -->
								<div class="title">
									<h3>정모찌의 실전산책</h3>
									<h3>모찌에게 배우는 진짜 산책</h3>
								</div>

								<!-- 별점 -->
								<div class="info">
									<a class="starimg"> <c:forEach var="index" begin="1"
											end="5">
											<img
												src="https://user-images.githubusercontent.com/65140754/86704557-f98df180-c04f-11ea-98d7-6ef52adba462.png">
										</c:forEach> (리뷰갯수)
									</a>
									<!-- 찜하기 -->
									<a href="#" class="btn_wishlist"> <!-- 예스찜 --> <img
										src="https://user-images.githubusercontent.com/65140754/86716818-8474e900-c05c-11ea-8c48-5764f4d57b28.png">
										<!-- 노찜 
												<img src="https://user-images.githubusercontent.com/65140754/86717485-2e547580-c05d-11ea-9dcf-27e47ad3f8e2.png">
												--> 찜하기
									</a>
								</div>
								<!-- 기본정보 -->
								<div class="info">
									<ul>
										<li class="ar" id="regionAll">온라인</li>
										<li class="hu"><font color="#ff936f">3</font>시간/회</li>
										<li class="gr">최대인원:<font color="#ff936f">2~50</font>명
										</li>
										<li class="ohu"><font color="#ff936f">￦10,000</font>/시간</li>
									</ul>
								</div>
							</div>
						</div>
						<!-- //1.요약 -->
						<!-- 2.튜터소개 -->
						<div class="class_detail detail_sec_bor" id="tutor">
							<div class="sec01">
								<h1>튜터정보</h1>
								<div class="cert">
									<ul>
										<li class="com">숙명여자대학교 미디어학부</li>
										<li class="com">신분 인증 됨</li>
									</ul>
								</div>
								<div class="d_info04">

									안녕하세요! 빈피디입니다.<br> 저는 MCN 회사 비디오빌리지에서 빈피디로 활약하며<br>
									3만 구독자 채널이었던 &lt;걸스빌리지&gt; 채널을 50만 구독자 채널로 키워내고,<br> 신규
									채널이었던 &lt;스튜디오V&gt;를 3달 만에 10만 구독자 채널로 성장시켰습니다.<br> 또한
									여행박사에서는 다양한 트렌지션을 활용한 여행 콘텐츠를 제작하였습니다.<br> <br> 그간의
									노하우를 바탕으로 여러분들에게<br> 3시간 동안 쉽고 친절하게 프리미어 속성 과외를 해드리겠습니다!<br>
									소규모로 진행할 예정이기 때문에 궁금해 하시는 모든 것들을 옆에서 바로바로 알려드릴게요.<br> ★★최대
									2인 과외로 진행★★<br> <br> &lt;경력&gt;<br> - 2015~2018
									비디오빌리지 걸스빌리지, 스튜디오V PD<br> - 2018~2020 여행박사 영상 콘텐츠 제작 감독<br>
									- 2020~ 현재 브랜드사 유튜브 채널 담당 <br> <br> *2019 시청자미디어재단
									인천센터 &lt;크리에이터 되기&gt;, &lt;미디어로 바로 보는 세상&gt; 강연
								</div>
							</div>
						</div>
						<!-- //2.튜터소개 -->
						<!-- 3.수업소개 -->
						<div class="class_detail detail_sec_bor" id="intro">
							<div class="sec01">
								<h1>수업소개</h1>
								<div class="d_info04">
									♥ ♥ 프리미어 초보들에게 3시간만에 마법을 선사해드립니다.♥ ♥ <br> <br> 처음에
									켜자마자 잔뜩 겁을 먹게 되는 프리미어 패널들<br> 3시간 수업을 들은 이후에는 프리미어 작업환경이
									재밌게만 느껴지실 거예요.<br> <br> 3시간 동안 영상가져오기, 컷편집, 자막 삽입, 자막
									효과, 화면 전환, 효과음 삽입, BGM삽입, 영상 뽑는 방법 모두 알려드립니다.<br> 처음 프리미어를
									접하는 기초생분들에게 딱인 수업이죠. <br> 예능에서만 보던 효과들 이제 나도 할 수 있다! <br>
									실전으로 영상을 편집할 때 꼭 필요한 것부터 쏙쏙 알려드릴테니<br> 부담갖지 말고 신청해주세요!
								</div>
								<h1>수업대상</h1>
								<h1>커리큘럼</h1>
								회차만큼 출력
							</div>
						</div>
						<!-- //3.수업소개 -->
						<!-- 4.리뷰 -->
						<div class="class_detail detail_sec_bor" id="review">
							<!-- 리뷰작성 모달 -->
							<div class="modal fade" id="modalContactForm" tabindex="-1"
								role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header text-center">
											<h4 class="modal-title w-100 font-weight-bold">review</h4>
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										<div class="modal-body mx-3">
											<div class="md-form mb-5">
												<label data-error="wrong" data-success="right" for="form34">Your
													name</label> <input type="text" id="form34"
													class="form-control validate">

											</div>
											<div class="md-form">
												<label data-error="wrong" data-success="right" for="form8">content</label>
												<textarea type="text" id="form8"
													class="md-textarea form-control" rows="4"></textarea>

											</div>

										</div>
										<div class="modal-footer d-flex justify-content-center">
											<a href="#" class="btn_send">작성완료</a>
										</div>
									</div>
								</div>
							</div>
							<!-- 리뷰작성 모달 -->
							<div class="sec01">
								<h1>리뷰(2)</h1>
								<div class="btn_write">
									<a href="#" class="btn_write_review" data-toggle="modal"
										data-target="#modalContactForm">리뷰쓰기</a>
									<!-- 로그아웃상태 > 로그인 페이지로 이동
									     로그인상태 > 수강했으면 리뷰작성 모달 띄우기 / 수강안했으면 작성할수x
									 -->
								</div>
								<div class="review_box">
									<c:forEach var="index" begin="1" end="5">
										<img
											src="https://user-images.githubusercontent.com/65140754/86704557-f98df180-c04f-11ea-98d7-6ef52adba462.png">
									</c:forEach>
									5.0
								</div>

								<div class="review_count01">
									<ul>
										<li>커리큘럼 <c:forEach var="index" begin="1" end="5">
												<img
													src="https://user-images.githubusercontent.com/65140754/86704557-f98df180-c04f-11ea-98d7-6ef52adba462.png">
											</c:forEach>
										</li>
										<li>준비성 <c:forEach var="index" begin="1" end="5">
												<img
													src="https://user-images.githubusercontent.com/65140754/86704557-f98df180-c04f-11ea-98d7-6ef52adba462.png">
											</c:forEach>
										</li>
										<li>친절도 <c:forEach var="index" begin="1" end="5">
												<img
													src="https://user-images.githubusercontent.com/65140754/86704557-f98df180-c04f-11ea-98d7-6ef52adba462.png">
											</c:forEach>
										</li>
										<li>시간준수 <c:forEach var="index" begin="1" end="5">
												<img
													src="https://user-images.githubusercontent.com/65140754/86704557-f98df180-c04f-11ea-98d7-6ef52adba462.png">
											</c:forEach>
										</li>
									</ul>
								</div>
								<div class="review_list" id="bookmarkReview">
									<ul>
										<div id="innerReviewDiv">
											<c:forEach var="index" begin="1" end="3">
												<li><dl>
														<dt>
															<p class="profile_img"
																style="height: 86px; background-size: cover; background-position: center; background-image: url(//user-images.githubusercontent.com/65140754/87009744-92636f00-c200-11ea-88b2-252fb36f6fa3.png);"></p>
															<p class="name">임다은</p>
														</dt>
														<dd>산책이란 무엇인가에 대해 제대로 배울 수 있는 시간이였습니다. 모찌짱짱 최고귀염둥이
															옴쫍쫍 ㅠㅠ</dd>
														<dd class="date">2020-06-27 00:16:41</dd>
													</dl></li>
											</c:forEach>
										</div>
									</ul>
								</div>
							</div>
						</div>
						<!-- //4.리뷰 -->
						<!-- 5.qna -->
						<div class="class_detail detail_sec_bor" id="qna">
							<div class="sec01">
								<h1>Q&A</h1>
								<textarea type="text" id="form8"
									class="md-textarea form-control" rows="4"></textarea>

								<div class="btn_write">
									<a href="#" class="btn_write_qna">문의하기</a>
								</div>
								<div class="qna_list" id="bookmarkqna">
									<ul>
										<c:forEach var="index" begin="1" end="1">
											<li><dl>
													<dt>
														<p class="profile_img"
															style="width: 50px; height: 50px; background-size: cover; background-position: center; background-image: url(//user-images.githubusercontent.com/65140754/87009744-92636f00-c200-11ea-88b2-252fb36f6fa3.png);"></p>
														<p class="name">임다은</p>
													</dt>
													<dd>어쩌구 저쩌구가 궁금합니다</dd>
													<dd class="date">2020-06-27 00:16:41</dd>
												</dl></li>
											<div class="reply_box">
												^댓글 (collapse로 접히게) <input type="text" id="reply_content">
												<input type="submit" id="reply_send" value="등록">
											</div>
										</c:forEach>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!--// class wrap -->
				<!-- 시간&날짜/ 결제창 -->
				<div class="col-md-4 remote">
					<div class="remote_wrap">
						<div class="class_type">
							<h3>클래스유형</h3>
						</div>
						<div class="card">
							<div class="card-header">
								<a class="collapsed card-link" data-toggle="collapse"
									data-parent="#accordion" href="#card-element-1">
									07.08(수)14:00~16:00 강남</a>
							</div>
							<div id="card-element-1" class="collapse">
								<div class="card-body">상세장소 : 강사 공방</div>
							</div>
						</div>
						<div class="card">
							<div class="card-header">
								<a class="collapsed card-link" data-toggle="collapse"
									data-parent="#accordion" href="#card-element-2">
									07.08(수)14:00~16:00 강남</a>
							</div>
							<div id="card-element-2" class="collapse">
								<div class="card-body">상세장소 : 강사 공방</div>
							</div>
						</div>

						<div class="tutor_t">
							<dl class="tutor_txt">
								<dt>
									<div
										style="background: #000; z-index: 0; width: 100%; height: 100%; background-size: cover; background-position: center; background-image: url('${cp}/resources/img/모찌.jpg');">
									</div>
								</dt>
								<dd>
									신촌,홍대 부근의 모임공간에서 컨설팅이 진행됩니다.<br> 공간 대여 비용은 컨설팅 비용에 포함되어
									있으나 공간에서 드시는 음료는 직접 구매 부탁드립니다. <br> 감사합니다 :)
								</dd>
							</dl>
						</div>
						<div class="button_pay">
							<a href="${cp }/class/apply" class="btn_pay">수업신청하기</a>

						</div>
					</div>
				</div>
				<!-- //시간&날짜/ 결제창 -->
			</div>
		</div>
	</div>
</div>
<script>
	var navOffset = $('.class_navi').offset();
	$(window).scroll(function() {
		if ($(document).scrollTop() > navOffset.top) {
			$('.class_navi').addClass('active');
		} else {
			$('.class_navi').removeClass('active');
		}
	});
	var remoteOffset = $('.remote').offset();
	$(window).scroll(function() {
		if ($(document).scrollTop() > remoteOffset.top) {
			$('.remote').addClass('active');
		} else {
			$('.remote').removeClass('active');
		}
	});
	$("#class_navi a").click(function() {
		$(this).addClass('on');
		$("#class_navi a").not(this).removeClass('on');
	});
	$("#card-header collapse").click(function() {
		$(this).addClass('show');
	});
</script>
