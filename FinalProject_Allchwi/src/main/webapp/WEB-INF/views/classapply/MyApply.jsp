<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
@charset "UTF-8";

.title-box {
    position: relative;
    padding-top: 60px;
    border-bottom: 1px solid #e4e4e4;
    margin-bottom: 40px;
    overflow: hidden;
}

.title-box h1 {
    float: left;
    font-size: 26px;
    color: #333;
    line-height: 1.85;
    padding-bottom: 10px;
}
.title-box .class-option {
    width: 400px;
    border: 1px solid #ddd;
    background: #fff;
    border-radius: 4px;
    padding: 9px 11px;
    float: right;
    margin-top: -5px;
    color: #888;
    letter-spacing: -0.35px;
}
select, textarea {
    padding: 0 10px;
    font-weight: 400;
}
option {
    font-weight: normal;
    display: block;
    white-space: pre;
    min-height: 1.2em;
    padding: 0px 2px 1px;
}
}
.static-container {
    margin-bottom: 50px;
    
}
.static-container h3 {
    color: #333;
    font-size: 20px;
    letter-spacing: -0.5px;
    font-weight: 400;
}
.static-container .static-box {
    display: flex;
    margin-top: 30px;
    margin-left: 10%;
}
.static-container .static-box .image {
    width: 80px;
    height: 80px;
    background-position: center;
    background-size: cover;
}
.static-container .static-box .info-box {
    position: relative;
    margin-left: 40px;
    width: 760px;
    box-sizing: border-box;
}
.static-container .static-box .proc-bar {
    width: 100%;
    background: #ddd;
    height: 6px;
    border-radius: 3px;
    margin-bottom: 10px;
}
.static-container .static-box .info-box h3 {
    color: #333;
    font-size: 20px;
    letter-spacing: -0.5px;
    font-weight: 500;
    margin-top: 20px;
}
.static-container .static-box .info-box .date {
    color: #888;
    font-size: 14px;
    letter-spacing: -0.35px;
    line-height: 2.3;
}
.button-box {
    display: flex;
    float: right;
}
.static-container .static-box .info-box .button_gray {
    width: 117px;
    height: 42px;
}
.button_gray {
    padding: 9px;
    box-sizing: border-box;
    background: #555;
    text-align: center;
    font-size: 14px;
    color: #fff;
    border-radius: 4px;
    width: 78px;
    height: 42px;
    letter-spacing: -0.35px;
    width: 117px;
    height: 42px;
}
.static-container .static-box .info-box .button_white {
    width: 88px;
    height: 42px;
}
.button_white {
    padding: 9px;
    box-sizing: border-box;
    border: 1px solid #aaa;
    text-align: center;
    font-size: 14px;
    color: #555;
    background: #fff;
    border-radius: 4px;
    width: 78px;
    height: 42px;
    letter-spacing: -0.35px;
}
.static-container {
    margin-top: 30px;
}
.static-container .box_blue {
    background: #626fbc;
    color: #fff;
}
.static-container .box {
    width: 530px;
    height: 239px;
    box-sizing: border-box;
    padding: 30px;
}
.static-container .box_blue h3 {
    color: #fff;
}
.static-container .box h3 {
    color: #333;
    letter-spacing: -0.5px;
    font-size: 20px;
}
.static-containertable {
    width: 100%;
    margin-top: 25px;
}
table {
    width: 100%;
    border-collapse: collapse;
    border-spacing: 0;
}
tbody {
    display: table-row-group;
    vertical-align: middle;
    border-color: inherit;
}
.static-container table tr {
    margin: 3px 0;
}
.container .static-container table td {
    color: #fff;
}
.static-container {
    margin-bottom: 50px;
}
td, th {
    padding: 0;
    font-family: 'Noto Sans KR', sans-serif;
    font-weight: 400;
    font-size: 14px;
    color: #111;
    word-break: break-all;
}
.more-text {
    width: 16px;
    float: right;
}
img {
    max-width: 100%;
    max-height: 100%;
    vertical-align: top;
}

</style>
<div class="container">
	<div class="title-box">
		<h1>내 수업신청서</h1>
	</div>
		
		
			
	<c:forEach var="vo" items="${list}"> 
		<div class="static-container">  
			<h3>수업상태</h3>
			<div class="static-box">
				<div class="image"
					style="background-image: url(${cp}/mypage/getimg?pro_num=${vo.pro_num});"></div>
				<div class="info-box">
					<img src="https://front-img.taling.me/Content/Images/icon_img_area.png" class="more-text cursor">
					<div>
						<h3 onclick="location.href='/Talent/Detail/26923'" style="cursor: pointer">${vo.class_title }</h3>
					</div>
					<div>
						<span class="date">수업 시작일 : <fmt:formatDate value="${vo.class_date}" pattern="yyyy-MM-dd"/></span>
						<span class="date">수업 신청서 제출일 : <fmt:formatDate value="${vo.apply_regdate}" pattern="yyyy-MM-dd"/></span>
						<span class="date">튜터 연락처 : ${vo.tutor_phone}</span>
					
					</div>
				
				</div>
			</div>
		</div>	
	</c:forEach>
</div>