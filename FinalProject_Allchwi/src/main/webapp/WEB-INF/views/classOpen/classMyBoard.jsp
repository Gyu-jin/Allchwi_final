<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${cp}/resources/css/classMyboard/classMyboard.css">
<div class="container">
	<div class="title-box">
		<h1>내 수업</h1>
		<select class="class-option" onchange="fnSelectTitle(this);">
			<option value="1">제목1</option>
			<option value="2">제목2</option>
			<option value="3">제목3</option>
		</select>
	</div>  
	<div class="static-container">  
		<h3>수업상태</h3>
		<div class="static-box">
			<div class="image"
				style="background-image: url(//s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/Cover/s_139514f9729f8ab233882a8bb5ab5844a5a9b461.png);"
				onclick="location.href='/Talent/Detail/26923'"
				style="cursor:pointer;"></div>
			<div class="info-box">
				<img src="https://front-img.taling.me/Content/Images/icon_img_area.png" class="more-text cursor" onclick="location.href='/My/TutorGuidea';">
				<div>
					<h3 onclick="location.href='/Talent/Detail/26923'" style="cursor: pointer">누구나 배울수 있는 기타수업</h3>
				</div>
				<div>
					<span class="date">최종업데이트 : 2020.06.24</span>
					<div class="button_gray cursor"onClick="fnStatusChange('CS01','26923');" style="float:right;">심사요청하기</div>
					<a href="${cp}/class/classDate"><div class="button_gray" style="margin-right : 10px; float:right;">시간/날짜 설정</div></a> 
				</div>
				<div style="margin-top: 56px">
					<div class="button-box">
						<div class="button_gray cursor"onClick="fnStatusChange('CS01','26923');">수업수정</div>
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