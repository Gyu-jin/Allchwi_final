<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.container {
    max-width: 1040px;
    margin: 0 auto;
    margin-top: 50px;
}
.h2 {
    font-weight: 500;
    font-size: 26px;
    line-height: 1.45;
    letter-spacing: -0.6px;
    display: inline-block;
}
.mb30 {
    margin-bottom: 30px;
}
.media{
	background-color: black;
}
.title{
	margin: 10px;
	border-bottom: 1px solid #e4e4e4
}
.playVideo{
	margin: 10px 10px 10px 10px;
	padding-bottom :20px;
	border-bottom: 1px solid #e4e4e4
}
.cont{
	margin: 10px;
	padding-bottom: 30px;
	border-bottom: 1px solid #e4e4e4
	
}
.listBtn{
	float: right;
}

</style>
<div class="container">
	<div class="title">
		<button type="button" class="btn btn-primary listBtn" >목록</button>
		<h2 class="h2 mb30">온라인 강의</h2>	
	</div>
	<div class=playVideo id="vodCurri">
		<video width="100%" height="500px" class="media"  controls autoplay="autoplay" id="video" >
       		<source src="${cp}/video/0b1432e6-b247-4908-bb86-47f49a9d4dd0_ONE PIECE 008.mp4" type="video/mp4">
      		Your browser does not support the video tag.
     	</video>
	</div>
	<div class="cont">
		줄거리리리릴리리
	</div>
	<button type="button" id="bbb">as</button>
</div>


<script type="text/javascript">
	
var video = document.getElementById("video");

video.onloadeddata = function() {

	//video.currentTime = 50;
	video.play();
};

	
$(window).bind('beforeunload',function(e){
	var saveTime = parseInt($('#video')[0].currentTime);

	if(saveTime > 180){
		var fd = new FormData();
		fd.append('saveTime', saveTime);
		fd.append('oline_num', oline_num);
		
		//브라우저에서 지원하는 비동기 서버통신
		navigator.sendBeacon('${cp}/community/saveTime', fd);
	}
});


</script>