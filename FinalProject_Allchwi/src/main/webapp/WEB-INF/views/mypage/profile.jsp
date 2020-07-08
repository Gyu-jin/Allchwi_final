<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="${cp}/resources/js/jquery-3.5.1.js"></script>
<link rel="stylesheet" href="/allchwi/resources/css/mypage/mypageForm.css">
<div class="container">
	<form method="POST" action="#" enctype="multipart/form-data">
		<!--profile head-->
		<div class="profileHead">
			<h1>내 프로필</h1>
		</div>
		<!--profile body-->
		<div class="container">
			<div class="inner-cont" style="padding-top: 0">
				<div class="pf"
					style="background-image: url(/allchwi/resources/img/profile-defaultImg.jpg)"
					id="picture-cover">
					<!-- a 카메라 이미지를 버튼처럼 사용 -->
					<img class="camera"	src="/allchwi/resources/img/btn_pfimg.png">
					<input type="file" id="picture" name="picture">
				</div>
			</div>
			<div class="inner-cont">
				<div class="label-title">ID</div>
				<div class="contents">alfkwl1239@naver.com</div>
			</div>
			<div class="inner-cont">
				<div class="label-title">이름</div>
				<div class="contents">조영호</div>
			</div>
			<div class="inner-cont">
				<div class="label-title">별명</div>
				<div class="contents">
					<input type="text" placeholder="" id="nick" class="full"
						name="Description" value="">
					<p class="regintxt01 clearbt redtxt">ex) 열정만수르, 요조숙녀, 열혈남 (8자
						이내)</p>
					<div class="count_char">
						<font id="nick-count">0</font>/8
					</div>
				</div>
			</div>
			<div class="inner-cont">
				<div class="label-title">내소개</div>
				<div class="contents">
					<textarea class="full" id="introduction" placeholder=""
						name="Intro"></textarea>
					<div class="count_char">
						<font id="introduction-count">0</font>/300
					</div>
				</div>
			</div>
			<div class="pink-submit" id="regInfo">저장하기</div>
			<div style="padding-top: 400px"></div>
		</div>
	</form>
</div>
<script type="text/javascript">
//a 이미지 변경되었을때 
$('#picture').change(function (e) {
	var file = (e.target || window.event.srcElement).files[0];

	var reader = new FileReader();
	reader.onload = function() {
		$('#picture-cover').css("background-image", "url('"+reader.result+"')");			
	}
	reader.readAsDataURL(file);
});
</script>