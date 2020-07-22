<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet"
	href="${cp}/resources/css/classDetail/classDetail.css">
<script src="${cp}/resources/js/classDetail/classDetail.js"></script>
<input type="hidden" id="ml_num" value="${ml_num }">
<input type="hidden" id="class_num" value="${class_num }">
<input type="hidden" id="finished" value="${finished }">
<div class="container-fluid" id="container_detail">
	<div class="row">
		<div class="col-md-12">
			<div class="row">
				<!-- 왼쪽수업정보 -->
				<div class="col-md-8">
					<!-- carousel -->
					<div class="carousel slide" id="carousel">
						<ol class="carousel-indicators">
							<c:forEach var="cover" items="${cdv.getCoverList()}">
								<c:choose>
									<c:when test="${cover.cnt==1}">
										<li data-slide-to="${cover.cnt}" data-target="#carousel"
											class="active"></li>
									</c:when>
									<c:otherwise>
										<li data-slide-to="${cover.cnt}" data-target="#carousel"></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</ol>
						<div class="carousel-inner">
							<c:forEach var="cover" items="${cdv.getCoverList()}">
								<c:choose>
									<c:when test="${cover.cnt==1}">
										<div class="carousel-item active">
											<img class="d-block w-100" alt="Carousel"
												src="${cp}/class/getimg?cover_num=${cover.cover_num}" />
										</div>
									</c:when>
									<c:otherwise>
										<div class="carousel-item">
											<img class="d-block w-100" alt="Carousel"
												src="${cp}/class/getimg?cover_num=${cover.cover_num}" />
										</div>
									</c:otherwise>
								</c:choose>
							</c:forEach>
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
										src="${cp}/mypage/getimg?pro_num=${cdv.pro_num}" />
								</div>
								<div class="name">${cdv.tutor_nickname }</div>
							</div>
							<div class="class_title">
								<!-- 수업명 -->
								<div class="title">
									<h3>${cdv.class_title }</h3>
								</div>

								<!-- 별점 -->
								<div class="info">
									<a class="starimg"> <c:forEach var="index" begin="1"
											end="5">
											<img
												src="https://user-images.githubusercontent.com/65140754/86704557-f98df180-c04f-11ea-98d7-6ef52adba462.png">
										</c:forEach> (${rpu.totalRowCount })
									</a>
									<!-- 찜하기 -->
									<c:choose>
										<c:when test="${empty ml_num}">
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
												test="${cdv.class_form==0}">
												${cdv.sloc_name }
											</c:if> <c:if test="${cdv.class_form==1}">
												온라인
											</c:if></li>
										<li class="hu"><font color="#ff936f">${cdv.class_hour}</font>시간/회</li>
										<li class="gr">최대인원:<font color="#ff936f">${cdv.class_min}~${cdv.class_max}</font>명
										</li>
										<li class="ohu"><font color="#ff936f">${cdv.class_price}</font>/시간</li>
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
										<c:forEach var="cert" items="${cdv.getCertList()}">
											<li class="com"><img
												src="https://user-images.githubusercontent.com/65140754/88015559-721aa500-cb5c-11ea-9c7b-4acdb7694eaf.png">
												${cert.certif_name }</li>
										</c:forEach>
									</ul>
								</div>
								<div class="d_info04">${cdv.tutor_about}</div>
							</div>
						</div>
						<!-- //2.튜터소개 -->
						<!-- 3.수업소개 -->
						<div class="class_detail detail_sec_bor" id="intro">
							<div class="sec01">
								<h1>수업소개</h1>
								<div class="d_info04">${cdv.class_about}</div>
								<h1>수업대상</h1>
								${cdv.class_target}
								<h1>커리큘럼</h1>
								<div class="currbox">
									<c:forEach var="curr" items="${cdv.getCurriList()}">
										<h3>${curr.curri_count}회차</h3>
										${curr.curri_content}
										<br>
									</c:forEach>
								</div>
							</div>
						</div>
						<!-- //3.수업소개 -->
						<!-- 4.리뷰 -->
						<div class="class_detail detail_sec_bor" id="review">
							<div class="sec01">
								<h1>리뷰(${rpu.totalRowCount })</h1>
								<div class="btn_write" id="btn_write_review">리뷰쓰기</div>

								<!-- 별점평균 -->
								<div class="review_box">
									<c:forEach var="index" begin="1" end="5">
										<img
											src="https://user-images.githubusercontent.com/65140754/86704557-f98df180-c04f-11ea-98d7-6ef52adba462.png">
									</c:forEach>
									5.0
								</div>
								<!-- 상세별점 -->
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
								<!-- 리뷰 목록 -->
								<div class="review_list" id="bookmarkReview">
									<ul>
										<div id="innerReviewDiv">
											<c:if test="${empty rlist}">
												<h3>작성된 리뷰 없음</h3>
											</c:if>
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
									<c:when test="${empty ml_num}">
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
						</div>
						<!-- ///qna -->
					</div>
					<!--// class wrap -->
				</div>
				<!-- 왼쪽수업정보끝 -->
				<!-- 시간&날짜/ 결제창 -->
				<div class="col-md-4 remote">
					<div class="remote_wrap">
						<div class="class_type">
							<c:if test="${cdv.class_form==0 }">
								<h3>오프라인수업</h3>
							</c:if>
							<c:if test="${cdv.class_form==1 }">
								<h3>온라인수업</h3>
							</c:if>
						</div>
						<c:forEach var="dlist" items="${dlist }" varStatus="index">
							<c:set var="today" value="<%=new java.util.Date()%>" />
							<fmt:formatDate value="${today}" pattern="yyyy-MM-dd" var="today" />
							<fmt:formatDate value="${dlist.class_date }" pattern="yyyy-MM-dd"
								var="class_date" />
							<c:if test="${today <= class_date }">
								<div class="accordion" id="accordionExample">
									<div class="card">
										<div class="card-header">
											<a class="collapsed card-link" data-toggle="collapse"
												data-parent="#accordionExample"
												href="#card-element-${index.count}"> ${class_date }&nbsp&nbsp
												<c:if test="${cdv.class_form==0 }">
													${dlist.class_startTime}~ ${dlist.class_endTime }
												</c:if> <c:if test="${cdv.class_form==1 }">
													${dlist.class_month}개월 과정
												</c:if>
											</a>
										</div>
										<div id="card-element-${index.count}" class="collapse">
											<div class="card-body">장소 : ${cdv.bloc_name }&nbsp${cdv.sloc_name}</div>
										</div>
									</div>
								</div>
							</c:if>
						</c:forEach>
						<c:forEach var="dlist" items="${dlist }" varStatus="index">
							<c:if test="${index.last }">
								<div class="tutor_t">
									<dl class="tutor_txt">
										<dt>
											<div
												style="background: #000; z-index: 0; width: 100%; height: 100%; background-size: cover; background-position: center; background-image: url('${cp}/mypage/getimg?pro_num=${cdv.pro_num}');">
											</div>
										</dt>
										<dd>${dlist.class_comment}</dd>
									</dl>
								</div>
							</c:if>
						</c:forEach>

						<c:choose>
							<c:when test="${empty ml_num}">
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
</div>
<script>
	$(".star_rating a").click(function() {
		$(this).parent().children("a").removeClass("on");
		$(this).addClass("on").prevAll("a").addClass("on");
		return false;
	});
</script>