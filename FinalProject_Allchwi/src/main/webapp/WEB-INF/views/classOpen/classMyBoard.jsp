<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="${cp}/resources/css/classMyboard/classMyboard.css">
<script type="text/javascript">
	function selectTitle(val){
		var v = $(val).val();
		location.href = "${cp}/class/classBoard?class_num="+v;
	}
</script>
<div class="container">
	<div class="title-box">
		<h1>내 수업</h1>
		<select class="class-option" onchange="selectTitle(this);">
			<c:forEach var="vo" items="${title}">
				<option value="${vo.class_num}" <c:if test="${list.class_num==vo.class_num}">selected</c:if>>${vo.class_title }</option>
			</c:forEach>
		</select>
	</div>  
	<div class="static-container">  
		<h3>수업상태</h3>
		<div class="static-box">
			<div class="image"
				style="background-image: url(${cp}/class/getimg?cover_num=${list.cover_num });"></div>
			<div class="info-box">
				<img src="https://front-img.taling.me/Content/Images/icon_img_area.png" class="more-text cursor">
				<div>
					<h3 onclick="location.href='/Talent/Detail/26923'" style="cursor: pointer">${list.class_title }</h3>
				</div>
				<div>
					<span class="date">업데이트 : <fmt:formatDate value="${list.class_regdate}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
					<div class="button_gray cursor" onClick="fnStatusChange('CS01','26923');" style="float:right;">심사요청하기</div>
					<a href="${cp}/class/classDate?class_num=${list.class_num}">
					<div class="button_gray" style="margin-right : 10px; float:right;">시간/날짜 설정</div></a> 
				</div>
				<div style="margin-top: 56px">
					<div class="button-box">
						<div class="button_gray cursor"onClick="fnStatusChange();">수업수정</div>
						<a href="/tutor/registerRegionMessage/26923" target="_blank">
						<div class="button_gray" style="margin-left: 10px;">selling</div></a> 
						<a href="/Talent/Detail/26923" target="_blank">
						<div class="button_white cursor" style="margin-left: 10px;">Soldout</div></a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="static-container">
		<h3>알림판</h3>
		<div class="box box_blue">
			<img src="https://front-img.taling.me/Content/Images/icon_img_area.png" class="more-text" onclick="location.href='/My/TutorGuidea';">
			<h3>수업성과</h3>
			<table>
				<tbody>
					<tr>
						<td>지난 30일간 조회수</td>
						<td class="text_right">2</td>
					</tr>
					<tr>
						<td>지난 30일간 신청수</td>
						<td class="text_right">0</td>
					</tr>
					<tr>
						<td>결제율</td>
						<td class="text_right">0</td>
					</tr>

					<tr>
						<td>전체 후기 수</td>
						<td class="text_right">0</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>