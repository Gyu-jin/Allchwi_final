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
	
	function fnStatusChange(){
		
		if('${list.class_auth}'=='0'){
			$.ajax({
			    type: "post",
			    dataType: "text",
			    url: "${cp}/class/classStatusUpdate",
			    data: {class_num : '${list.class_num}' ,class_auth: '${list.class_auth}'},
			    success: function(data) {
			    	if(data == 'success'){
			    		alert('심사신청이 되었습니다.');
			    		location.href = "${cp}/class/classBoard?class_num=${list.class_num}"; 
			    	}else{				    		
			    		alert('다시 신청해주세요!');
			    	}
			    }
			});
		}else{
			alert("심사요청을 할수 없습니다.");
		}
	}
	
	function salesStatus(val){
		
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
	<c:choose>
		<c:when test="${not empty list}">
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
						<c:choose>
							<c:when test="${list.class_auth== '0' }">
								<div class="button_gray cursor" onclick="fnStatusChange(${list.class_num});" style="float:right;">심사요청하기</div>
							</c:when>
							<c:when test="${list.class_auth == '1'}">
								<div class="button_gray" style="float:right;">심사대기중</div>
							</c:when>
							<c:when test="${list.class_auth == '2'}">
								<div class="button_gray" style="float:right;">심사완료</div>
							</c:when>																																														
						</c:choose>
						<a href="${cp}/class/classDate?class_num=${list.class_num}">
						<div class="button_gray" style="margin-right : 10px; float:right;">시간/날짜 설정</div></a> 
					</div>
					<div style="margin-top: 56px">
						<div class="button-box">
							<a href="${cp}/class/classInfoUpdate?class_num=${list.class_num}">
							<div class="button_gray cursor">수업수정</div></a>
							<div class="button_gray cursor" style="margin-left: 10px;" onclick="salesStatus(0)">selling</div></a> 
							<div class="button_white cursor" style="margin-left: 10px;" onclick="salesStatus(1)">Soldout</div>
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
		</c:when>
		<c:otherwise>
			<div class="static-container">  
				수업이 존재하지 않습니다.
			</div>
		</c:otherwise>
	</c:choose>
</div>