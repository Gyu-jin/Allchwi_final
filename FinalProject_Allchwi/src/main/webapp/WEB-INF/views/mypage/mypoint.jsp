<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="${cp}/resources/js/jquery-3.5.1.js"></script>
<link rel="stylesheet" href="/allchwi/resources/css/mypage/mypointForm.css">
<div class="container">
	<form method="POST" action="#" enctype="multipart/form-data">
		<!--profile head-->
		<div class="pointHead">
			<h1>내 포인트</h1>
		</div>
		<!--profile body-->
		<div class="container">
			<div class="inner-cont" style="padding-top: 0">
				<div>
					<p>이름 |아이디</p>
					<p>현재 포인트</p>
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
				<div class="label-title">닉네임</div>
				<div class="contents">
					<input type="text" placeholder="닉네임을 입력해주세요" id="nickname" name="mb_nickname" class="form-control" value="">
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
					<textarea class="form-control" id="introduction" placeholder="자기 소개 입력"	name="mb_about"></textarea>
					<div class="count_char">
						<font id="introduction-count">0</font>/300
					</div>
				</div>
			</div>
			<div id="btn-cont">
				<input type="submit" value="저장" name="saveInfo" id="saveInfo" class="btn btn-danger btn-lg" onsubmit="return formCheck()" disabled="disabled">
			</div>
			<div style="padding-top: 400px"></div>
		</div>
	</form>
</div>
<script type="text/javascript">
//a 이미지 변경되었을때 값을 파일에 넣고, 배경이미지 변경
$('#picture').change(function (e) {
	var file = (e.target).files[0];

	var reader = new FileReader();
	reader.onload = function() {
		$('#picture-cover').css("background-image", "url('"+reader.result+"')");			
	}
	reader.readAsDataURL(file);
});
//a 별명 및 소개 글 글자수 체크 기능 위한 변수 선언
var oldNickVal;
var oldIntroVal;
/*
$(function(){
	//a 초기 글자수 값
	$('#nick-count').text($('#nickname').val().length);
	oldValNick = $('#nickname').val();
});
*/
//a propertychange change keyup paste -> 텍스트 변경 실시간감지하여 함수 발생 처리
$("#nickname").on("propertychange change keyup paste", function() {
	//currentVal -> 현재 변경된 데이터 셋팅
	var currentVal = $(this).val();
	if(currentVal == oldNickVal) {
		return;
	}
	//$(this).val()이 8자 이상 넘어갔을때
	if($(this).val().length>8){
		//s 알림창 띄우고 추가된 내용을 지우고 이전까지 입력된 내용을 적은 뒤 리턴
		alert('별명은 8자 이하로 작성해주세요');
		$('#nickname').val(oldNickVal).focus();
		return;
	} 
	//a 현재 입력된 값의 길이를 카운트영역에 입력
	$('#nick-count').text($(this).val().length);
	//a 현재 값을 기존 초기 값에 대입 
	oldNickVal = currentVal;
	formCheck();
});
//a propertychange change keyup paste -> 텍스트 변경 실시간감지하여 함수 발생 처리 
$("#introduction").on("propertychange change keyup paste input", function() {
	//currentVal -> 현재 변경된 데이터 셋팅
	var currentVal = $(this).val();
	if(currentVal == oldIntroVal) {
		return;
	}
	//$(this).val()이 300자 이상 넘어갔을때
	if($(this).val().length>300){
		//s 알림창 띄우고 추가된 내용을 지우고 이전까지 입력된 내용을 적은 뒤 리턴
		alert('내소개는 300자 이하로 써주세요');
		$('#introduction').val(oldIntroVal).focus();
		return;
	}
	//a 현재 입력된 값의 길이를 카운트영역에 입력
	$('#introduction-count').text($(this).val().length);
	//a 현재 값을 기존 초기 값에 대입
	oldIntroVal = currentVal;
	formCheck();
});
//a 입력된 값이 있으면 버튼 활성화 함수
function formCheck(){
	let nick = $("#nickname").val();
	let intro = $("#introduction").val();
	if(nick != "" && intro != ""){
		$("#saveInfo").removeAttr("disabled");
		return true;
	} else {
		$("#saveInfo").attr("disabled", true);
		return false;	
	}
}
</script>