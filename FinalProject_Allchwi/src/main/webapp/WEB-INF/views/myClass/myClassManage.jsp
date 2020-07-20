<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript" src="${cp }/resources/js/jquery-3.5.1.js"></script>
<link rel="stylesheet"
	href="/allchwi/resources/css/myClass/myClassManage.css">
<div class="container">
	<!--MyTItleBox head-->
	<div class="title-box">
		<h1>수업 신청서 관리</h1>
		<!-- forEach 돌려서 출력하기 -->
		<select>
			<option value="">전체</option>
			<option value="">클래스타이틀1</option>
			<option value="">클래스타이틀2</option>
			<option value="">클래스타이틀3</option>
		</select>
	</div>
	<div class="my-class-list">
		<c:forEach var="vo" items="${list}">
		<div class="class-box">
			<div class="class-info">
				<!--
				<div class="image"
					style="background-image: url(${cp}/mypage/getimg?pro_num=${vo.pro_num });">
				</div>
				-->
				<img src="${cp}/mypage/getimg?pro_num=${vo.pro_num }" style="height: 130px; width: 130px;">
				<div>
					<font>
						<c:choose>
							<c:when test="${vo.mb_nickname == null}">
	                		${vo.mb_name}
	                	</c:when>
		                <c:otherwise>
		                	${vo.mb_nickname}                
		                </c:otherwise>
						</c:choose>
					</font>
				</div>
				<div class="information-box">
					<p>신청일시: ${vo.apply_regdate }</p>
					<h3
						style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">${vo.class_title }</h3>
					<div class="price">
						<font>￦</font>${vo.final_price}</div>
					<div class="start-date">
						<c:choose>
							<c:when test="${vo.apply_auth == 0}">
	                			<button>수업승인하기</button>
	                		</c:when>
		                <c:otherwise>
		                		<button disabled="disabled">승인완료</button>                
		                </c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
		</div>
		</c:forEach>
		<div style="padding-top: 100px"></div>
	</div>
</div>
