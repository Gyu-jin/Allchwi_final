<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="${cp}/resources/css/classDetail/classDetail.css">
<script src="${cp}/resources/js/classDetail/classDetail.js"></script>
<input type="hidden" id="ml_num" value="${mem.ml_num }">
<input type="hidden" id="class_num" value="${class_num }">
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
										<c:when test="${empty mem}">
											<a onclick="alert('로그인이 필요합니다'); " href="${cp}/login/main"
												id="btn_wishlist" class="btn_wishlist"> <img
												id="wishsrc"
												src="https://user-images.githubusercontent.com/65140754/86717485-2e547580-c05d-11ea-9dcf-27e47ad3f8e2.png">
												찜하기
											</a>
										</c:when>
										<c:otherwise>
											<c:choose>
												<c:when test="${wstatus eq true}">
													<a href="javascript:void(0);" class="btn_wishlist"
														id="btn_after_wish"> <img id="wishsrc"
														src="https://user-images.githubusercontent.com/65140754/86716818-8474e900-c05c-11ea-8c48-5764f4d57b28.png">
														찜하기
													</a>
												</c:when>
												<c:otherwise>
													<a href="javascript:void(0);" class="btn_wishlist"
														id="btn_before_wish"> <img id="wishsrc"
														src="https://user-images.githubusercontent.com/65140754/86717485-2e547580-c05d-11ea-9dcf-27e47ad3f8e2.png">
														찜하기
													</a>
												</c:otherwise>
											</c:choose>
										</c:otherwise>
									</c:choose>
									<!-- ///찜하기 -->

								</div>
								<!-- 기본정보 -->
								<div class="info">
									<ul>
										<li class="ar" id="regionAll"><c:if
												test="${cvo.class_form==0}">
												온라인
											</c:if> <c:if test="${cvo.class_form==1}">
												지역
											</c:if></li>
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
								<div class="d_info04">${cvo.tutor_about}</div>
							</div>
						</div>
						<!-- //2.튜터소개 -->
						<!-- 3.수업소개 -->
						<div class="class_detail detail_sec_bor" id="intro">
							<div class="sec01">
								<h1>수업소개</h1>
								<div class="d_info04">${cvo.class_about}</div>
								<h1>수업대상</h1>
								${cvo.class_target}
								<h1>커리큘럼</h1>
								회차만큼 출력
							</div>
						</div>
						<!-- //3.수업소개 -->
						<!-- 4.리뷰 -->
						<div class="class_detail detail_sec_bor" id="review">
							<div class="sec01">
								<h1>리뷰(${rpu.totalRowCount })</h1>
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
													
															<i class="glyphicon glyphicon-star active" data-value="1"></i>
															<i class="glyphicon glyphicon-star " data-value="2"></i>
															<i class="glyphicon glyphicon-star " data-value="3"></i> 
															<i class="glyphicon glyphicon-star" data-value="4"></i> 
															<i class="glyphicon glyphicon-star" data-value="5"></i> 
												
													<label data-error="wrong" data-success="right" for="form8">content</label>
													
													<textarea type="text" id="form8"
														class="md-textarea form-control" rows="4">
													</textarea>

												</div>

											</div>
											<div class="modal-footer d-flex justify-content-center">
												<a href="#" class="btn_send">작성완료</a>
											</div>
										</div>
									</div>
								</div>
								<!-- 리뷰작성 모달 -->
								<c:choose>
									<c:when test="${empty mem }">
										<div class="btn_write">
											<a onclick="alert('로그인이 필요합니다'); " href="${cp}/login/main">리뷰쓰기</a>
										</div>
									</c:when>
									<c:otherwise>
										<div class="btn_write">
											<a href="#" class="btn_write_review" data-toggle="modal"
												data-target="#modalContactForm">리뷰쓰기</a>
										</div>
									</c:otherwise>
								</c:choose>

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
											<c:forEach var="rlist" items="${rlist }">
												<li><dl>
														<dt>
															<p class="profile_img"
																style="height: 86px; background-size: cover; background-position: center; background-image: url(//user-images.githubusercontent.com/65140754/87009744-92636f00-c200-11ea-88b2-252fb36f6fa3.png);"></p>
															<p class="name">${rlist.miv.mb_name }</p>
														</dt>
														<dd>${rlist.review_content }</dd>
														<dd class="date">${rlist.review_regdate}</dd>
													</dl></li>
											</c:forEach>
										</div>
									</ul>
								</div>
								<!-- 리뷰페이징 -->
								<div>
									<c:forEach var='i' begin='${rpu.startPageNum }'
										end='${rpu.endPageNum }'>
										<c:choose>
											<c:when test='${i==rpu.pageNum}'>
												<a
													href='${cp }/classDetail/detail?pageNum=${i}&class_num=${class_num}'
													style='text-decoration: none; font-weight: bold;'> <span
													style='color: red'>[${i }]</span>
												</a>
											</c:when>
											<c:otherwise>
												<a
													href='${cp }/classDetail/detail?pageNum=${i}&class_num=${class_num}'
													style='text-decoration: none;'> <span
													style='color: gray'>[${i }]</span>
												</a>
											</c:otherwise>
										</c:choose>
									</c:forEach>
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
									<c:when test="${empty mem}">
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
								<div class="qna_wrap"></div>
							</div>
							<%-- <div>
								<c:forEach var='i' begin='${pu.startPageNum }'
									end='${pu.endPageNum }'>
									 <c:choose>
										<c:when test='${i==pu.pageNum}'>
											<a
												href='${cp }/classDetail/qnalist?pageNum=${i}&class_num=${class_num}'
												style='text-decoration: none; font-weight: bold;'> <span
												style='color: red'>[${i }]</span>
											</a>
										</c:when>
										<c:otherwise>
											<a
												href='${cp }/classDetail/qnalist?pageNum=${i}&class_num=${class_num}'
												style='text-decoration: none;'> <span
												style='color: gray'>[${i }]</span>
											</a>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</div> --%>
						</div>
						<!-- ///qna -->
					</div>
					<!--// class wrap -->
				</div>
				<!-- 왼쪽수업정보끝 -->
			</div>
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
								신촌,홍대 부근의 모임공간에서 컨설팅이 진행됩니다.<br> 공간 대여 비용은 컨설팅 비용에 포함되어 있으나
								공간에서 드시는 음료는 직접 구매 부탁드립니다. <br> 감사합니다 :)
							</dd>
						</dl>
					</div>
					<c:choose>
						<c:when test="${empty mem}">
							<div class="button_pay">
								<a onclick="alert('로그인이 필요합니다'); " href="${cp}/login/main"
									class="btn_pay"> 수업 신청하기</a>
							</div>
						</c:when>
						<c:otherwise>
							<div class="button_pay">
								<a href="${cp }/class/apply?class_num=${class_num }"
									class="btn_pay">수업신청하기</a>

							</div>
						</c:otherwise>
					</c:choose>

				</div>
			</div>
			<!-- //시간&날짜/ 결제창 -->
		</div>
	</div>
</div>


