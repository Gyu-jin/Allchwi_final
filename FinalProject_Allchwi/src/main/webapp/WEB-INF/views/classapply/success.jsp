<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:choose>
	<c:when test="${code=='success' }">
	    <h1>수업 신청 성공!</h1>
	    <a href="${cp }/">홈으로 돌아가기</a>	
	</c:when>
	<c:otherwise>
		 <h1>수업 신청에 실패했습니다..</h1>
		 다시 시도해주세요ㅠ
	    <a href="${cp }/">홈으로 돌아가기</a>	
	</c:otherwise>
</c:choose>
