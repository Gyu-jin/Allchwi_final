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
    text-align: left;
    font-size: 24px;
    color: #555;
    border-bottom: 1px solid #d8d9db;
    letter-spacing: -0.35px;
}
.orange{
	color: #ff936f;
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

<div class="tab-content" id="pills-tabContent">
	<!-- 01클래스 일정 선택 -->
	<div class="tab-pane fade show active" id="pills-info" role="tabpanel">
		
		
		<div class="info1">
            <span class="orange">클래스 명</span>
        </div>
		<div class="box">
			<div class="title">
				수업일정선택<b class="pink">*</b>
			</div>
			<div class="cont input-group col-5">
				<input type="text" id="phone" name="phone" class="form-control" placeholder="개인연락처를 - 없이 입력해주세요."> 
			</div>
		</div>


        <div class="button_box">
            <button type="button" class="btn btn-outline-danger" onclick="setMode(1);">수업 신청서 작성하기</button>
        </div>
        
    
	</div>
	
	
	
	
	
	
	
	
	
	<div class="tab-pane fade" id="pills-title" role="tabpanel">수업 신청서</div>
	<div class="tab-pane fade" id="pills-price" role="tabpanel">결제</div>

</div>