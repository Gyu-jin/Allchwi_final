<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
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

.btn_write {
	padding: 10px 20px;
	border-radius: 10px;
	background-color: #ff936f;
	float: right;
	color: white;
	margin-top: 10px;
}
</style>
<div class="container">
	<div class="title-box">
		<h1>Q&A</h1>
	</div>
	<div class="qna_wrap">
		<textarea type="text" id="qna_content"
			class="md-textarea form-control" rows="4"></textarea>
		<c:choose>
			<c:when test="${empty ml_num}">
				<div class="btn_write">
					<a onclick="alert('로그인이 필요합니다'); " href="${cp}/login/main">
						문의하기</a>
				</div>
			</c:when>
			<c:otherwise>
				<div class="btn_write">
					<a href="javascript:void(0);" id="btn_write_qna">문의하기</a>
				</div>
			</c:otherwise>
		</c:choose>

		<!-- qna 리스트 시작 -->
		<div class="qna_list"></div>
	</div>
</div>
