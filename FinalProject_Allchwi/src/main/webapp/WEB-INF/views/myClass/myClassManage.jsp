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
			<option value="0">전체</option>
			<c:forEach var="mc" items="${myClass}">
				<option value="${mc.class_num}">${mc.class_title}</option>
			</c:forEach>
		</select>
	</div>
	<div class="my-class-list">
		<c:choose>
		<c:when test="${list.size() > 0}">
		<c:forEach var="vo" items="${list}">
		<div class="class-box">
			<div class="class-info">
				<div class="member" style="text-align: center;">
				<img src="${cp}/mypage/getimg?pro_num=${vo.pro_num }" style="height: 150px; width: 150px; display: block; margin-left: 10%">
					<font style="margin-left: 10%;">
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
					<p style="margin-left: 7%">신청일시: ${vo.apply_regdate }</p>
					<h3
						style="margin-left: 7%">${vo.class_title }</h3>
					<div class="price">
						<fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="${vo.final_price}"/>
					</div>
					<div class="start-date">
						<c:choose>
							<c:when test="${vo.apply_auth == 0}">
	                			<button type="button" class="btn btn-primary">수업승인하기</button>
	                		</c:when>
		                	<c:otherwise>
		                		<button type="button" class="btn btn-primary" disabled="disabled">승인완료</button>                
		                	</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
		</div>
		</c:forEach>
		</c:when>
		<c:otherwise>
			<div class="class-box" style="text-align: center;">
				<h2>등록 신청한 회원이 존재하지 않습니다.</h2>
			</div>
		</c:otherwise>
		</c:choose>
		<div style="padding-top: 100px"></div>
	</div>
</div>
