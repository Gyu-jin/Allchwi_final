<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
@font-face {
	font-family: 'CookieRunOTF-Bold';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.0/CookieRunOTF-Bold00.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

.classApply {
	margin: auto;
	width: 80%;
}

.title_box h3 {
	float: left;
	display: inline-block;
}

.title_box .steps {
	float: right;
	display: flex;
}

.tab-content {
	display: block;
}

.title_box {
	overflow: hidden;
	margin-top: 30px;
	padding: 19px 0;
	border-bottom: 1px solid #c9c9c9;
}

.box {
	width: 100%;
	display: flex;
	padding: 30px 0;
	border-bottom: 1px solid #d8d9db;
}

.title {
	width: 40%;
	text-align: center;
	color: #333;
	font-weight: 500;
	font-size: 16px;
	padding: 14px 14px 14px 70px;
	font-weight: bold;
	text-align: center;
}

.cont {
	width: 70%;
	box-sizing: border-box;
}

.info1 {
	margin-top: 10px;
	padding: 20px 0;
	text-align: left;
	font-size: 24px;
	color: #555;
	border-bottom: 1px solid #d8d9db;
	letter-spacing: -0.35px;
}

.orange {
	color: #ff936f;
	font-weight: 900;
	font-family: 'CookieRunOTF-Bold';

}

.box .pf {
	width: 90px;
	height: 90px;
	border-radius: 50%;
	margin-top: 20px;
	float: left;
	margin-right: 20px;
}

.box .upf {
	width: 130px;
	height: 130px;
	border-radius: 50%;
	background-position: center;
	background-size: cover;
}

.button_box {
	/* display: flex; */
	width: 480px;
	margin: 3% 0% 3% 44%;
}

.button_box2 {
	width: 200px;
}

div {
	margin: 0;
	padding: 0;
	color: #111;
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: 400;
}

.form-control:disabled, .form-control[readonly] {
	background-color: #ffffff;
	opacity: 1;
}

.col-3 {
	padding: 10%;
}

.tutor_txt dt {
	width: 80px;
	height: 80px;
	background: none;
	padding: 0;
	border-radius: 100px;
	overflow: hidden;
}

.tutor_txt dd {
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

.tutor_txt dd:after {
	right: 100%;
	top: 50%;
	border: solid transparent;
	content: " ";
	position: absolute;
	border-right-color: lightgray;
	border-width: 10px;
	margin-top: -10px;
}

.col-md-2 {
	text-align: center;
	margin: 0 auto;
	align-items: center;
	padding-left: 5%;
}

.form-inline .btn-group-toggle {
	display: flex;
	margin: 10px;
}

.btn-secondary:not (:disabled ):not (.disabled ).active, .btn-secondary:not
	 (:disabled ):not (.disabled ):active, .show>.btn-secondary.dropdown-toggle
	{
	color: #fff;
	background-color: #ff936f;
	border-color: #ff936f;
}

.label-1, .label-12, .label-1-content {
	padding-top: 15px;
	padding-bottom: 15px;
	width: 150px;
	font-size: 16px;
	color: #333;
	letter-spacing: -0.4px;
	font-weight: bold;
}

.label-12 {
	margin-top: 158px;
}

.label-1, .label-12 {
	text-align: center;
	display: inline-flex;
	float: left;
}

.box .inner1 {
	margin-top: 30px;
}

textarea.len980 {
	height: 190px;
	background: #fff;
}

.form-control, .custom-select, textarea.basic {
	font-size: 14px;
	border-radius: 4px;
	border: 1px solid #ddd;
	box-sizing: border-box;
}

.input-group .form-control {
	height: 38px;
}

.input-group-prepend {
	height: 38px;
}

.nav-pills .nav-link.active, .nav-pills .show>.nav-link {
	font-weight: bold;
	color: #fff;
	background-color: #7185bb;
}
.tutor_img{
	background: #000; 
	z-index: 0; 
	width: 100%; 
	height: 100%; 
	background-size: cover; 
	background-position: center; 
	background-image: url('/allchwi/resources/img/모찌.jpg');
}
</style>
<div class="classApply">

	<div class="title_box">
		<h3>클래스 신청서</h3>
		<div class="steps">
			<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
				<li class="nav-item" role="presentation"><a
					class="nav-link active" id="pills-home-tab" data-toggle="pill"
					href="#pills-info" role="tab" aria-selected="true">01클래스 일정</a></li>
				<li class="nav-item" role="presentation"><a class="nav-link"
					id="pills-profile-tab" data-toggle="pill" href="#pills-title"
					role="tab" aria-selected="false">02클래스신청</a></li>
				<li class="nav-item" role="presentation"><a class="nav-link"
					id="pills-contact-tab" data-toggle="pill" href="#pills-price"
					role="tab" aria-selected="false">03결제</a></li>
			</ul>
		</div>
	</div>
	<form action="${cp}/class/applyOk" method="post">
		<input type="hidden" name="ml_num" value="1">
		<div class="tab-content" id="pills-tabContent">
			<!-- 01 클래스 일정 선택 탭-->
			<div class="tab-pane fade show active" id="pills-info" role="tabpanel"
				data-num="1">
			
			<c:forEach var="vo" items="${classDate_list }">
			
				<div class="info1">
					<span class="orange">${vo.class_title }</span>
				</div>
				<div class="box">
					<div class="col-md-6">
						<div class="title">
							수업일정선택<b class="pink">*</b>
							<div class="col-3">
								<div class="tutor_t">
									<dl class="tutor_txt">
										<dt>
											<div class="tutor_img"></div>
										</dt>
										<dd>
											${vo.class_comment }
											<br>
											${vo.class_msg }
										</dd>
									</dl>
								</div>
							</div>
						</div>
					</div>
	
					<!--  수업 일정 선택 라디오 버튼  : class_info테이블의 일정 번호 받아와서 동적생성 할 예정.. -->
					<div class="col-md-6">
					
						<div class="input-group">
							<div class="input-group-prepend">
								<div class="input-group-text">
									<input type="radio"
										aria-label="Radio button for following text input"
										name="date_num" value="${vo.date_num }">
								</div>
							</div>
	
							<input type="text" class="form-control" disabled="disabled"
								aria-label="Text input with radio button" 
								value="시작 날짜 : ${vo.class_date } / 시작 시간 : ${vo.class_startTime}">
						</div>
					</div>
	
				</div>
			</c:forEach>
				
	
	
				<div class="button_box">
					<button type="button" class="btn btn-outline-danger" id="wirteBtn"
						data-num='2'>수업 신청서 작성하기</button>
				</div>
	
	
			</div>
	
			<!-- 02 수업신청서 작성 탭 -->
			<div class="tab-pane fade" id="pills-title" role="tabpanel"
				data-num='2'>
	
				<div class="info1">
					<span class="orange">모찌의 실전 산책!</span>
				</div>
				<div class="box">
					<div class="col-md-5">
						<div class="title">
							수업신청서<b class="pink">*</b>
							<div class="col-3">
								<div class="tutor_t">
									<dl class="tutor_txt">
										<dt>
											<div class="tutor_img">
											</div>
										</dt>
										<dd>
											수업준비를 위해 <br> 아래항목들에 대해 미리 말씀해주세요.<br> 감사합니다 :)
										</dd>
									</dl>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-2">
						<div class="label-1">나의 스킬 레벨</div>
						<div class="label-1">튜터에게 전할말</div>
						<div class="label-12">연락 가능한 번호</div>
					</div>
	
					<div class="col-md-5">
	
						<div class="btn-group btn-group-toggle" data-toggle="buttons">
							<label class="btn btn-secondary active"> 
							<input type="radio" name="stu_lev" value="1" checked> 입문자
							</label> <label class="btn btn-secondary"> 
							<input type="radio" name="stu_lev" value="2"> 초/중급자
							</label> <label class="btn btn-secondary"> 
							<input type="radio"	name="stu_lev" value="3"> 상급자
							</label>
						</div>
						<br>
	
	
						<div class="cont">
							<div class="inner1">
								<textarea class="basic len980 form-control"
									placeholder="튜터에게 회원님에 대해 알려주세요. 수업을 듣는 목적은 무엇인가요? 튜터의 어떤 점이 마음에 들어 신청하셨나요?"
									id="Introduction" name="stu_msg"></textarea>
							</div>
						</div>
	
						<input type="text" id="phone" name="stu_phone" class="form-control"
							style="width: 300px; margin-top: 20px;"
							placeholder="개인연락처를 - 없이 입력해주세요.">
	
					</div>
	
				</div>
				<div class="button_box">
					<button type="button" class="btn btn-outline-danger" id="payBtn">결제하기</button>
				</div>
	
			</div>
	
			<!-- 03 결제 탭  -->
			<div class="tab-pane fade" id="pills-price" role="tabpanel"
				data-num='3'>
				<div class="info1">
					<span class="orange">모찌의 실전 산책!</span>
				</div>
				<div class="box">
					<div class="col-md-5">
						<div class="title">
							결제하기<b class="pink">*</b>
							<div class="col-3">
								<div class="tutor_t">
									<dl class="tutor_txt">
										<dt>
											<div class="tutor_img">
											</div>
										</dt>
										<dd>
											결제 후에 신청이 완료됩니다.<br> 수업이 조기 마감될 수 있으니<br> 서둘러주세요 :)
										</dd>
									</dl>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-2">
						<div class="label-1">전체수업료</div>
						<div class="label-1">보유적립금</div>
						<div class="label-1">사용하기</div>
						<div class="label-1">결제금액</div>
						<div class="label-1">결제수단</div>
					</div>
	
					<div class="col-md-5">
	
						<div class="label-1-content">
							<span style="color: red">76,000원</span>
						</div>
						<div class="label-1-content">3000 포인트</div>
						<div class="label-1-content">
							<input type="text" name="point" style="width: 88px">
							포인트
						</div>
						<div class="label-1-content" style="width: 200px">수업료 - 사용포인트
							값</div>
						<div class="label-1-content">
							<div class="button_box2">
								<button type="submit" class="btn btn-outline-danger">신용카드/체크카드</button>
							</div>
	
						</div>
	
	
	
	
					</div>
				</div>
			</div>
		</div>
	</form>
</div>
<script>
	// [수업신청서 작성하기 ] 버튼 클릭 시, 다음 탭으로 이동
	$("#wirteBtn").click(function() {
		$('#pills-tab li:nth-child(2) a').tab('show');
	});
	// [결제하기] 버튼 클릭 시, 다음  탭으로 이동
	$("#payBtn").click(function() {
		$('#pills-tab li:nth-child(3) a').tab('show');
	});
	// [신용카드/체크카드] 버튼 클릭 시, 결제 창 띄움 and ClassApply table insert
	$("#cardPay").click(function() {
		var date_num=$("input[name=classdate]:checked").val();
		var stu_lev=$("input[name=levels]:checked").val();
		console.log(date_num+","+stu_lev);
		$.post("${cp}/class/applyOk", {"date_num":date_num,"stu_lev":stu_lev}, function(data) {
			console.log("콜백" + data);
			if(data=="success"){
				location.href="${cp}/class/success?date_num="+date_num;
			}else{
				alert("수업 신청 오류;");
				location.href="${cp}/";
			}
		});
	});
</script>