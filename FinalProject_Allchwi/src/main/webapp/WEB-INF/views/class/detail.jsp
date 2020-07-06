<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
#container_detail .class_wrap .class_d_wrqp {
	position: relative;
}
#container_detail .class_wrap .class_price {
    width: 340px;
    float: right;
    background: #fff;
    padding: 20px 20px 10px 20px;
}
#container_detail {
	width: 100%;
	background: #e3e3e3;
	padding: 50px 0 50px 0;
	letter-spacing: 0;
}
#container_detail .class_wrap {
    width: 1200px;
    margin: 0 auto;
    overflow: hidden;
}
.fixedLayerRemote {
    position: fixed !important;
    top: 0px !important;
    background: #ffffff !important;
    z-index: 100 !important;
}
</style>
<h1>상품 상세페이지</h1>
<!-- 수업사진 슬라이드 -->
<div id="container_detail">
	<div id="class_wrap">
		<div class="class_img">
			<div id="carouselExampleIndicators" class="carousel slide"
				data-ride="carousel" data-interval="false">
				<ol class="carousel-indicators">
					<li data-target="#carouselExampleIndicators" data-slide-to="0"
						class="active"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
				</ol>
				<div class="carousel-inner">
					<div class="carousel-item active">
						<!-- coverimg테이블 -->
						<img src="${cp}/resources/img/수업소개이미지_1.png" class="d-block w-100"
							alt="배너1">
					</div>
					<div class="carousel-item">
						<img src="${cp}/resources/img/수업소개이미지_2.png" class="d-block w-100"
							alt="배너2">
					</div>
					<div class="carousel-item">
						<img src="${cp}/resources/img/수업소개이미지_3.png" class="d-block w-100"
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
		</div>
		<div class="class_d_wrqp">
			<div id="class_navi" class="class_navi" style="left: 0px;">
				<ul>
					<li><a href="#sumary" class="on" id="sli">요약</a></li>
					<li><a href="#tutorinfo" id="tli" class="">튜터</a></li>
					<li><a href="#Introduction" id="ili" class="">수업소개</a></li>
					<li><a href="#review" id="rli" class="">리뷰</a></li>
					<li><a href="#qna" id="qli" class="">실시간톡</a></li>
				</ul>
			</div>
		</div>
		<!-- 시간/장소/금액-->
		<div id="container_detail">
			<div class="class_price fixedLayerRemote" id="class_price"
				style="position: relative; top: 0px; left: 909.5px;">
				<div class="regions">
					<div class="title">원데이 클래스</div>
					<!--new region id box-->
					<div class="region" id="region">
						<div class="option">
							<div class="top">
								<div class="timedetail">
									<div class="indate">07.06(월)</div>
									19:00~22:00
								</div>
								<span>|</span>
								<div class="region_name">강남</div>
								<img
									src="https://front-img.taling.me/Content/Images/icon_up.png"
									class="up"><img
									src="https://front-img.taling.me/Content/Images/icon_down.png"
									class="dwn">
							</div>
							<div class="box">

								<div class="info">
									<div class="detail_info">
										상세장소 : 협의 후 결정<br>
									</div>
								</div>

							</div>
						</div>

						<div class="option">
							<div class="top">
								<div class="timedetail">
									<div class="indate">07.11(토)</div>
									11:00~14:00
								</div>
								<span>|</span>
								<div class="region_name">신촌홍대</div>
								<img
									src="https://front-img.taling.me/Content/Images/icon_up.png"
									class="up"><img
									src="https://front-img.taling.me/Content/Images/icon_down.png"
									class="dwn">
							</div>
							<div class="box">

								<div class="info">
									<div class="detail_info">
										상세장소 : 협의 후 결정<br>
									</div>
								</div>

							</div>
						</div>

						<div class="option">
							<div class="top">
								<div class="timedetail">
									<div class="indate">07.13(월)</div>
									19:00~22:00
								</div>
								<span>|</span>
								<div class="region_name">강남</div>
								<img
									src="https://front-img.taling.me/Content/Images/icon_up.png"
									class="up"><img
									src="https://front-img.taling.me/Content/Images/icon_down.png"
									class="dwn">
							</div>
							<div class="box">

								<div class="info">
									<div class="detail_info">
										상세장소 : 협의 후 결정<br>
									</div>
								</div>

							</div>
						</div>


					</div>

					<!--여기까지 new region id box-->

				</div>

				<!--원써니 수정 장소/시간 pc 끝-->
				<div class="tutor_t">
					<dl class="tutor_txt">
						<dt>
							<div
								style="background: #000; z-index: 0; width: 100%; height: 100%; background-size: cover; background-position: center; background-image: url('//img.taling.me/Content/Uploads/Profile/s_5025f91028fd813c30a5762681b577fc7f2b7470.png');"></div>
						</dt>
						<dd>
							수업 장소 대여료는 튜터가 부담하며 수업 장소는 강남의 경우 강남역 부근의 스터디룸에서 진행됩니다.<br>
							주말 강의는 홍대 슈퍼스타트에서 진행됩니다. <br> <br> 코로나19로 인해 수강생보다 넓은
							강의장을 대여하고 있습니다. <br> 수강인원에 따라 수업이 통합되거나 스터디룸 컨디션에 따라 변경될 수
							있습니다. <br> 수업이 확정되거나 예약 상황에 따라 장소에 대한 자세한 안내 문자 드리겠습니다.
						</dd>
					</dl>
				</div>

				<button type="button" class="btn btn-lg btn-primary" disabled>수업
					신청하기</button>

				<div class="price">
					<div class="hp1">
						<b>￦22,000원</b> / 시간
					</div>
					<div class="tp1">￦66,000 / 총 1회 3시간</div>
				</div>
			</div>
		</div>
	</div>
</div>