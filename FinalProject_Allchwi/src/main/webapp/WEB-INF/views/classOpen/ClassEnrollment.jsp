<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
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
.box{
	width:100%;
    display: flex;
    padding: 30px 0;
    border-bottom: 1px solid #d8d9db;
}
.title{
    width: 30%;
    text-align: center;
    color: #333;
    font-weight: 500;
    font-size: 16px;
    padding: 14px;
    font-weight: bold;
}
.cont{
	width: 70%;
	box-sizing: border-box;
}

.info1{
    margin-top: 10px;
    padding: 20px 0;
    text-align: right;
    font-size: 14px;
    color: #555;
    border-bottom: 1px solid #d8d9db;
    letter-spacing: -0.35px;
}
.pink{
	color: pink;
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
.box .upf_b {
    position: absolute;
    margin-left: 95px;
    margin-top: 90px;
}
.verify {
    display: inline-block;
    font-size: 14px;
    color: #444;
    border-radius: 4px;
    padding: 12px 20px;
    border: solid 1px #aaa;
    cursor: pointer;
}
.certificate_title{
	font-size: 14px;
    font-weight: 500;
    margin-bottom: 15px;
    padding: 0;
    width: initial;
    font-weight: bold;
    color: #333;
}
.certificate_gray{
	line-height: 1.29;
    font-size: 14px;
    color: #888;

}
.button_box {
    /* display: flex; */
    width: 480px;
    margin: 40px auto 40px 550px;
}
div{
	margin: 0;
    padding: 0;
    font-size: 14px;
    color: #111;
    font-family: 'Noto Sans KR', sans-serif;
    font-weight: 400;
}
</style>

<div class="title_box">
	<h3>튜터 등록</h3>
	<div class="steps">
		<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
			<li class="nav-item" role="presentation"><a
				class="nav-link active" id="pills-home-tab" data-toggle="pill"
				href="#pills-info" role="tab" aria-selected="true">01기본정보</a></li>
			<li class="nav-item" role="presentation"><a class="nav-link"
				id="pills-profile-tab" data-toggle="pill" href="#pills-title"
				role="tab" aria-selected="false">02제목/이미지</a></li>
			<li class="nav-item" role="presentation"><a class="nav-link"
				id="pills-contact-tab" data-toggle="pill" href="#pills-price"
				role="tab" aria-selected="false">03가격</a></li>
			<li class="nav-item" role="presentation"><a class="nav-link"
				id="pills-contact-tab" data-toggle="pill" href="#pills-class"
				role="tab" aria-selected="false">04수업</a></li>
		</ul>
	</div>
</div>

<div class="tab-content" id="pills-tabContent">
	<!-- 01튜터 기본정보 입력 페이지 -->
	<div class="tab-pane fade show active" id="pills-info" role="tabpanel">
		<div class="info1">
            <span class="pink">*</span>필수
        </div>
		<div class="box">
			<div class="title">
				튜터번호인증<b class="pink">*</b>
			</div>
			<div class="cont input-group col-5">
				<input type="text" id="phone" name="phone" class="form-control" placeholder="개인연락처를 - 없이 입력해주세요."> 
			</div>
		</div>

	<div class="box">
		<div class="title">
			프로필사진<b class="pink">*</b>
		</div>
		<div class="cont">
			<div class="caution caution1">
				<b class="pink">주의</b><br> <span class="gray8">* 얼굴이 나오지
					않은 동물/캐릭터/단순배경사진/증명사진은 승인되지 않습니다.</span><br>
			</div>
			<div style="margin: 30px 0">
				<img class="upf_b" src="${cp}/resources/img/btn_pfimg.png">
				<div class="upf" id="picture-cover"
					style="background-image:url('${cp}/resources/img/profile-defaultImg.jpg')">
					<input type="hidden" id="ProfileThumbnailUrl" value="${cp}/resources/img/profile-defaultImg.jpg"> 
					<input type="file" id="picture" name="picture" style="width: 150px; height: 130px; opacity: 0;">
				</div>
			</div>
			<script>
				$('#picture').change(function(e) {
									var file = (e.target || window.event.srcElement).files[0];

									var reader = new FileReader();
									reader.onload = function() {
										$('#picture-cover').css(
												"background-image",
												"url('" + reader.result + "')");
									}
									reader.readAsDataURL(file);
								});
			</script>
		</div>
	</div>
	<div class="box">
		<div class="title">
			별명<b class="pink">*</b>
		</div>
        <div class="input-group col-5">
        	<input type="text" class="form-control" id="nickname" name="nickname" placeholder="튜터님의 정체성을 가장 잘 드러낼 수 있는 별명을 입력해주세요.">
        </div>
    </div>
	<div class="box">
            <div class="title">인증<b class="pink">*</b></div>
            <div class="cont">
                <div class="caution caution2">
                    <div class="pink" style="padding-bottom:5px;font-weight:600;">인증 가이드</div>

                    <ul class="gray8">
                        <li>수강생들에게 신뢰를 주기 위해 신분 또는 학력 인증은 필수입니다.</li>
                        <li>파일은 jpg, png, gif, bmp등 이미지 파일만 가능합니다.</li>
                        <li>관리자 확인 후 업로드해주신 파일은 바로 삭제됩니다.</li>
                        <li>튜터등록은 내국인 또는 취업비자를 소지한 외국인만 가능합니다.</li>
                    </ul>
                </div>
                <div class="inner1">
                    <div class="certificate_title">
                    	자격증
	                    <font class="certificate_gray">
	                   		 날짜/자격증/주관사 공인 확인 가능한 자격증 사본(최대 10개)
	                    </font>
                    </div>
                    <input type="hidden" name="deleteCert" id="deleteCert" value="">
                    <div class="certificate" style="position: relative;">
                    	<input type="text" class="form-control col-8" name="certName[]" placeholder="예) 토익900,HSK 6급,GTQ1급, 임상경력 등" style="display: inline;">
                        <div class="verify left10">업로드</div>
                        <input type="file" name="cert[]" style="width:80px;height:50px;position:absolute;top:0;left:668px;opacity:0;cursor:pointer; z-index: 2">
                        <div style="padding-top:10px;" class="col-4">
                            <img alt="" id="img-Cert0" style="float: none; margin: 0 auto; position:fixed ; overflow: hidden; max-width:400px;">
                        </div>
                    </div>
                    <div class="plus button" onclick="add_certificate()">
                        <img src="https://front-img.taling.me/Content/Images/tutor/Images/icon_add_wh.png"> 자격증추가
                    </div>
                </div>
            </div>
        </div>
        <div class="button_box">
            <button type="button" class="btn btn-outline-danger" onclick="setMode(1);">저장 후 다음단계</button>
        </div>
	</div>
	
	
	
	
	
	
	
	
	
	<div class="tab-pane fade" id="pills-title" role="tabpanel">제목/이미지</div>
	<div class="tab-pane fade" id="pills-price" role="tabpanel">가격</div>
	<div class="tab-pane fade" id="pills-class" role="tabpanel">수업</div>
</div>