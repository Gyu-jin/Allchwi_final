<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.container-fluid {
	background-color: #eee;
	padding: 30px 0 30px 0;
}

.card {
	width: 440px;
}

.remote {
	position: fixed;
	margin-left: 1050px;
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

.nav-tabs .nav-item .show .nav-link, .nav-tabs .nav-link.active {
	color: #ff936f;
	background-color: transparent;
	border-color: transparent transparent #f3f3f3;
	border-bottom: 4px solid !important;
	font-size: 20px;
	font-weight: bold;
}

.nav-tabs {
	margin-top: 20px
}

.btn_wishlist {
	padding: 10px 12px;
	border-radius: 10px;
	background-color: #ff936f;
	float: right;
	color:white;
	margin-top: 9px;
}

.btn_pay {
	padding: 10px 160px;
	border-radius: 10px;
	background-color: #7185bb;
	margin-top: 9px;
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
						<div class="nav nav-tabs nav-fill nav-tabs-fixed-top" id="nav-tab"
							role="tablist">
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
										<h3>모찌에게 배우는 진짜 산책</h3>
									</span>
									<!-- 별점 -->
									<div class="info">
										<a class="starimg"> <img
											src="https://user-images.githubusercontent.com/65140754/86704557-f98df180-c04f-11ea-98d7-6ef52adba462.png">
											<img
											src="https://user-images.githubusercontent.com/65140754/86704557-f98df180-c04f-11ea-98d7-6ef52adba462.png">
											<img
											src="https://user-images.githubusercontent.com/65140754/86704557-f98df180-c04f-11ea-98d7-6ef52adba462.png">
											<img
											src="https://user-images.githubusercontent.com/65140754/86704557-f98df180-c04f-11ea-98d7-6ef52adba462.png">
											<img
											src="https://user-images.githubusercontent.com/65140754/86704557-f98df180-c04f-11ea-98d7-6ef52adba462.png">
											(리뷰갯수)
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
											<li class="ohu"><font color="#ff936f">￦10,000</font>/시간
											</li>
										</ul>
									</div>
								</div>
							</div>
							</p>
						</div>
						<!-- 튜터소개 -->
						<div class="tab-pane fade" id="nav-tutor" role="tabpanel"
							aria-labelledby="nav-tutor-tab">ㅌㅌ소개 튜터정보 신분 인증 됨 한국 미용사
							자격증 메이크업 아티스트3급 자격증 서비스 강사 자격증 이미지컨설턴트 1급 퍼스널컬러 컨설턴트 1급 탈잉 퍼스널컬러
							최다리뷰 만족도100% 오로지와 함께 나만의 예쁨을 찾아보세요♥ 코로나19로 인해 클래스 장소에 늘 손소독제가
							준비되어 있으며, 진단하실때 외에는 마스크 착용하고 계셔도 됩니다 :) 7월 할인이벤트와 함께 오로지별과 어제와 다른
							나를 만나보세요 ♥ --------------------------------- 오로지 빛나는 당신만 생각합니다
							[오로지:별] 오로지별과 함께하는 뷰티풀라이프 안녕하세요 :) 뷰티를 사랑하고, 늘 함께 하고 싶은 오로지입니다

							다양한 분들을 만나며, 제가 늘 뿌듯하고 행복했던 순간은 변화된 모습에 만족하며 설레임이 가득한 분들의 미소와 함께할
							때였어요 저에게는 말로 이룰수 없는 뿌듯함, 저와 함께 하신 분들께는 자존감과 빛나는 매력을, 제가 10년 넘게
							뷰티와 함께한 가장 큰 이유 인것 같아요 :) 저 또한 뷰티를 처음 시작한 이유는 외모 콤플렉스로 인한 자존감을
							높이고 싶었던 이유가 컷던 것 같아요 늘 남들과 비교하고, 만족하지 못했던 모습에서 점점 변화된 제 모습을 보며
							느꼈던 행복, 새로움을 시도하는 자신감 이제 많은 분들께 이 특별함을 전하고 싶어요 늘 전문적이고 섬세한 클래스로
							한분, 한분 더 빛나는 모습을 함께 찾아가겠습니다 모든 개인이 자신만의 색을 가지고 있듯이 다양하고, 특별한 클래스로
							준비하였습니다 퍼스널컬러 진단을 중심으로 메이크업에서 스타일링 제안까지 모든것이 빛나는 변화를 위한 오로지의
							마음입니다 단순히 정보만 알려주는 클래스가 아닌 아름다움을 최상으로 끌어올릴 수 있도록 친구처럼, 언니처럼, 공감하고
							함께 찾아가는 클래스로 준비하겠습니다 당신도 몰랐던 내 안의 아름다움, 어제와 다른 나를 만나보세요♥ [오로지별
							클래스가 제일잘해요] - 퍼스널 컬러진단 - 퍼스널 브랜딩 (임직원/영업조직등 기업) - 메이크업 / 메이크업레슨 -
							퍼스널 쇼퍼 - 이미지컨설팅 및 비즈니스 매너 (웨딩/면접/기업 임직원/학교/단체) - 토탈 뷰티컨설팅
							(메이크업/패션/스킨케어/이너뷰티) [오로지별 클래스는 자신있어요] - 뷰티학과 졸업 - 미용사 자격증 (헤어 /
							메이크업) - 메이크업 3급 자격증 - CS강사 자격증 - 코디네이터 자격증 - 퍼스널컬러 컨설턴트 1급 - 뷰티
							이미지메이킹 1급 [ 오로지별 클래스와 함께했어요] - 2016 미스코리아 뷰티클래스 담당 - 한국 분장인협회
							메이크업 심사의원 - 한국암웨이 코스메틱 교육&VIP관리 - 신단주 뷰티아카데미 본점 메이크업 전담강사 - 뷰
							성형외과 메인 컨설팅 코디네이터 - 3,000명 이상 퍼스널컬러 컨설팅 - 취업대학교 이미지컨설팅 진행 (취업,면접
							이미지컨설팅) - 동국대, 숭실대, 대안학교, 중학교 등 학교특강 다수진행 - GS리테일, 올리브영, 롯데첨단소재,
							삼성카드, ING생명, 2016 미스코리아, 네파 , 듀오 등 기업 이미지컨설팅</div>
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
							<a href="#" class="btn_pay">결제하기</a>
						</div>
					</div>
				</div>
				<!-- //시간&날짜/ 결제창 -->
			</div>
		</div>
	</div>
</div>

<script>
	$(document).ready(function() {
		// Add smooth scrolling to all links in navbar + footer link
		$(".navbar a, footer a[href='#myPage']").on('click', function(event) {
			// Make sure this.hash has a value before overriding default behavior
			if (this.hash !== "") {
				// Prevent default anchor click behavior
				event.preventDefault();

				// Store hash
				var hash = this.hash;

				// Using jQuery's animate() method to add smooth page scroll
				// The optional number (900) specifies the number of milliseconds it takes to scroll to the specified area
				$('html, body').animate({
					scrollTop : $(hash).offset().top
				}, 900, function() {

					// Add hash (#) to URL when done scrolling (default click behavior)
					window.location.hash = hash;
				});
			} // End if
		});

		$(window).scroll(function() {
			$(".slideanim").each(function() {
				var pos = $(this).offset().top;

				var winTop = $(window).scrollTop();
				if (pos < winTop + 600) {
					$(this).addClass("slide");
				}
			});
		});
	})
</script>
