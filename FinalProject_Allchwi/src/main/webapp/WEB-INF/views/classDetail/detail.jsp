<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="${cp}/resources/css/classDetail/classDetail.css">
<script src="${cp}/resources/js/classDetail/classDetail.js"></script>

<div class="container-fluid" id="container_detail">
	<div class="row">
		<div class="col-md-12">
			<div class="row">
				<!-- 왼쪽수업정보 -->
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
					<!-- class wrap -->
					<!-- class_navi -->
					<div class="class_wrap ">
						<div id="class_navi" class="class_navi">
							<ul style="margin: 0">
								<li><a href="#sumary" id="li1" class="on">요약</a></li>
								<li><a href="#tutor" id="li2" class="">튜터</a></li>
								<li><a href="#intro" id="li3" class="">수업소개</a></li>
								<li><a href="#review" id="li4" class="">리뷰</a></li>
								<li><a href="#qna" id="li5" class="">문의</a></li>
							</ul>
						</div>
						<!--class_navi 내용  -->
						<!-- 1.요약 -->
						<div class="class_detail" id="sumary">
							<!-- 강사프로필 -->
							<div class="tutor_profile">
								<div class="tutor_img">
									<img alt="tutorprofile" class="roundImg"
										src="${cp}/resources/img/모찌.jpg" />
								</div>
								<div class="name">${cvo.tutor_nickname }</div>
							</div>
							<div class="class_title">
								<!-- 수업명 -->
								<div class="title">
									<h3>${cvo.class_title }</h3>
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
									<c:choose>
										<c:when test="${empty id}">
											<a onclick="alert('로그인이 필요합니다'); " href="${cp}/login/main" id="btn_wishlist" class="btn_wishlist">
											<img id="wishsrc" src="https://user-images.githubusercontent.com/65140754/86717485-2e547580-c05d-11ea-9dcf-27e47ad3f8e2.png"> 
											찜하기</a>
										</c:when>
										<c:otherwise>
											<a href="javascript:void(0);" class="btn_wishlist" id="btn_before_wish"> 
												<img id="wishsrc" src="https://user-images.githubusercontent.com/65140754/86717485-2e547580-c05d-11ea-9dcf-27e47ad3f8e2.png">
											찜하기</a>
										</c:otherwise>
									</c:choose>
									<!-- ///찜하기 -->
									
								</div>
								<!-- 기본정보 -->
								<div class="info">
									<ul>
										<li class="ar" id="regionAll">
											<c:if test="${cvo.class_form==0}">
												온라인
											</c:if>
											<c:if test="${cvo.class_form==1}">
												지역
											</c:if>
										</li>
										<li class="hu"><font color="#ff936f">${cvo.class_hour}</font>시간/회</li>
										<li class="gr">최대인원:<font color="#ff936f">${cvo.class_min}~${cvo.class_max}</font>명
										</li>
										<li class="ohu"><font color="#ff936f">${cvo.class_price}</font>/시간</li>
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
										<li class="com">자격증</li>
										<li class="com">들어갈자리</li>
									</ul>
								</div>
								<div class="d_info04">

									${cvo.tutor_about}
								</div>
							</div>
						</div>
						<!-- //2.튜터소개 -->
						<!-- 3.수업소개 -->
						<div class="class_detail detail_sec_bor" id="intro">
							<div class="sec01">
								<h1>수업소개</h1>
								<div class="d_info04">
									${cvo.class_about}
								</div>
								<h1>수업대상</h1>
									${cvo.class_target}
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
								<textarea type="text" id="qna_content"
									class="md-textarea form-control" rows="4"></textarea>
								<c:choose>
										<c:when test="${empty id}">
											<div class="btn_write">
												<a onclick="alert('로그인이 필요합니다'); " href="${cp}/login/main">
												문의하기</a>
											</div>
										</c:when>
										<c:otherwise>
											<div class="btn_write">
												<a href="javascript:void(0);" id="btn_write_qna">문의하기</a>
											</div>
										</c:otherwise>
								</c:choose>
								
								<!-- qna 리스트 시작 -->
								<div class="qna_list">
									<ul>
									</ul>
								</div>
								</div>
							</div>
							<!-- qna wrap -->
						</div>
						<!--// class wrap -->
					</div>
					<!-- 왼쪽수업정보끝 -->
				
				<!-- 시간&날짜/ 결제창 -->
				<div class="col-md-4 remote">
					<div class="remote_wrap">
						<div class="class_type">
							<h3>클래스유형</h3>
						</div>
						<c:forEach var="index" begin="1" end="3">
							<div class="accordion" id="accordionExample">
								<div class="card">
									<div class="card-header">
										<a class="collapsed card-link" data-toggle="collapse"
											data-parent="#accordionExample" href="#card-element-${index}">
											07.08(수)14:00~16:00 강남</a>
									</div>
									<div id="card-element-${index}" class="collapse">
										<div class="card-body">상세장소 : 강사 공방</div>
									</div>
								</div>
							</div>
						</c:forEach>
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

//위시전
 $(document).on('click', '#btn_before_wish', function () {
	var btn = $(this);
	$.post('${cp}/class/addWish', {}, function (res) {
		if (res=='success') {
			btn.attr('id', 'btn_after_wish');
			$("#wishsrc").attr("src","https://user-images.githubusercontent.com/65140754/86716818-8474e900-c05c-11ea-8c48-5764f4d57b28.png");
			alert('위시리스트 등록 성공');
		} else {
			alert('위시리스트 등록 오류');
		}
	});
});
//위시후
$(document).on('click', '#btn_after_wish', function () {
	var btn = $(this);
	$.post('${cp}/class/removeWish', {}, function (res) {
		if (res=='success') {
			btn.attr('id', 'btn_before_wish');
			$("#wishsrc").attr("src","https://user-images.githubusercontent.com/65140754/86717485-2e547580-c05d-11ea-9dcf-27e47ad3f8e2.png");
			alert('위시리스트 삭제 성공');
		} else {
			alert('위시리스트 삭제 오류');
		}
	});
});
//qna작성
var qna_content = null;
$(document).on('click', '#btn_write_qna', function () {
	qna_content = document.getElementById('qna_content').value;
	if(qna_content== '' ){
		alert('내용을 작성해주세요');
	}else{
		id='test';
		class_num='4';
		ml_num='1';
		if (id!='test') {
			alert('로그인이 필요합니다');
		}else {
			$.post('${cp}/classDetail/qna', {
				class_num: class_num,
				ml_num: ml_num,
				qna_content:qna_content,
				qna_lev: '0'
			}, function (data,res) {
				if (res=='success') {
					alert('문의등록 성공');
					qnaList();
					$("#qna_content").val("");
				} else {				
					alert('문의실패');
				}
			});
		}
	}
});


</script>
