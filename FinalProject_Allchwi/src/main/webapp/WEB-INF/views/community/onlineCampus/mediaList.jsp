<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
.container {
    max-width: 1040px;
    margin: 0 auto;
    margin-top: 50px;
}
.sect-curri .h2 {
    position: relative;
}
.h2 {
    font-weight: 500;
    font-size: 26px;
    line-height: 1.45;
    letter-spacing: -0.6px;
}
.mb30 {
    margin-bottom: 30px;
}
.sect-curri .h2 span {
    position: absolute;
    right: 0;
    top: 8px;
    padding-left: 25px;
    font-size: 16px;
    background: url(https://front-img.taling.me/Content/Images/Vod/icon_vod_curriculum.png) no-repeat left center;
    background-size: 20px;
}
li {
    list-style: none;
}
.curriculum ol h3 {
    position: relative;
    padding: 15px 20px;
    font-size: 18px;
    letter-spacing: -0.45px;
    font-weight: 500;
    color: #fff;
    background-color: #393b42;
}
.curriculum ol .total-time {
    position: absolute;
    right: 20px;
    top: 15px;
    font-size: 14px;
    font-weight: normal;
}
ul {
    list-style: none;
    padding-left: 0px;
}
.curriculum .lecture li {
    margin: 30px 0;
    position: relative;
}
.curriculum .lecture li .thumb {
    float: left;
    width: 272px;
    height: 160px;
}
.thumb {
    overflow: hidden;
    border-radius: 6px;
}
.curriculum .lecture li a {
    display: block;
    overflow: hidden;
    height: 100%;
}
.thumb img {
    width: 100%;
    height: 100%;
    -o-object-fit: cover;
    object-fit: cover;
}
.curriculum .lecture li .txt {
    float: right;
    width: -webkit-calc(100% - 306px);
    width: -moz-calc(100% - 306px);
    width: calc(100% - 306px);
    padding-left: 30px;
    padding-right: 20px;
    background: url(https://front-img.taling.me/Content/Images/Vod/icon_vod_curriculum.png) no-repeat left 8px;
    background-size: 20px 20px;
}
.curriculum .lecture li .tit {
    display: block;
    float: left;
    width: -webkit-calc(100% - 40px);
    width: -moz-calc(100% - 40px);
    width: calc(100% - 40px);
    font-size: 16px;
    color: #111;
    font-weight: bold;
    line-height: 32px;
}
.curriculum .lecture li .time {
    float: right;
    width: 40px;
    line-height: 32px;
    text-align: right;
}
.button_gray{
	padding: 9px;
    box-sizing: border-box;
    background: #393b42;
    text-align: center;
    font-size: 14px;
    color: #fff;
    border-radius: 4px;
    letter-spacing: -0.35px;
    width: 100px;
    height: 38px;
    float: right;
}
.cursor{
	cursor: pointer;
}
</style>
    
<div class="container">
	<h2 class="h2 mb30">온라인 강의
	<div class="button_gray cursor" onclick="writeShow(${commuInfo.commu_num})">강의업로드</div>
	</h2>
	<div class=curriculum id="vodCurri">
		<ol>
			<li class="lst">
				<h3>
					ot. 오리엔테이션 - 튜터와 수업 소개
					<span class="total-time">3:59</span>
				</h3>
				<div class="lecture">
					<ul>
						<li>
							<div class="thumb">
								<a href="/vod/play/903">
								<img src="https://front-img.taling.me/Content/Images/Vod/marketing/ot2.jpg" alt="">
								</a>
							</div>
							<div class="txt">
								<a href="/vod/play/903">
								<span class="tit">ot. 튜터와 수업소개</span>
								<span class="time">3:59</span>
								<p class="">#퍼포먼스 마케팅 #연봉 3배 #무조건 성과 내는 마케팅 비법</p>
								</a>
							</div>
						</li>
					</ul>
				</div>
			</li>
		</ol>
	</div>
</div>
<div class="container">
	<div class="modal-container"></div>
</div>


<script>
function writeShow(commu_num){		
	alert("asd");
	var url = "${cp}/community/mediaModal?commu_num="+commu_num;
	   $('.modal-container').load(url,function(result){
		$('#myModal').modal();
	});		
}

</script>