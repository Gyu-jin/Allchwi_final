<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet"
	href="${cp}/resources/css/classMyboard/classMyboard.css">
<style>
@charset "UTF-8";

.nickname {
	width: 200px;
	height: 50px;
	font-weight: bold;
}
</style>
<div class="container">
	<div class="title-box">
		<h1>수업신청정보</h1>
	</div>



	<c:forEach var="vo" items="${list}">
		<span class="date">수업 신청서 제출일  : <fmt:formatDate
				value="${vo.apply_regdate}" pattern="yyyy-MM-dd" /></span>
		<div class="static-container">
			<h3>튜터 정보</h3>
			<div class="static-box">
				<div class="profile-box">
					<div class="image"
						style="background-image: url(${cp}/mypage/getimg?pro_num=${vo.pro_num});">

					</div>

					<div class="nickname">${vo.tutor_nickname }</div>
				</div>
				<div class="info-box">
					<img
						src="https://front-img.taling.me/Content/Images/icon_img_area.png"
						class="more-text cursor">
					<div>
						<h3 onclick="location.href='/Talent/Detail/26923'"
							style="cursor: pointer">${vo.class_title }</h3>
					</div>
					<div>
						<span class="date">수업 시작일 : <fmt:formatDate
								value="${vo.class_date}" pattern="yyyy-MM-dd" /></span> <span
							class="date">튜터 연락처 : ${vo.tutor_phone}</span>

					</div>

				</div>
			</div>
		</div>
	</c:forEach>
</div>