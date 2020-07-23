<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript" src="${cp }/resources/js/jquery-3.5.1.js"></script>

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

.content-box {
	margin-bottom: 400px;
}

.flex-div {
	display: flex;
}

#subBtn {
	float: right;
}
</style>
<div class="container">

	
	<div class="jumbotron">
		<h4>${vo.room_title }</h4>						
		<p style="float:right;">${vo.room_regdate} </p>
		<br>	
		<p style="float:right">조회수: ${vo.room_view}</p>
		<br>
		
		<hr class="my-4">
		<div class="card card-body">
			<p>${vo.room_content }</p>
			<br>
			<br>
			<a href="${cp }/community/download?room_num=${vo.room_num }">${vo.org_filename } /${vo.filesize }바이트 </a>
		
		
		<br>	
		<br>
		<div style="margin-left:670px">
			이전글<a href="${cp }/community/archiveDetail?room_num=${prev.room_num }">${prev.room_title }</a>
			&nbsp;
			&nbsp;
			다음글<a href="${cp}/community/archiveDetail?room_num=${next.room_num }">${next.room_title }</a>
		</div>	
			
			
			
		</div>




		
		

	</div>
</div>