<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="${cp}/resources/css/myClass/myClassList.css">

<div class="container">
		<!--MyTItleBox head-->
		<div class="title-box">
		    <h1>수업료 받기</h1>
		    <ul>
		        <li class="cursor on"><a href="/My/MyTuteeClassList/">오프라인</a></li>
		        <li class="cursor"><a href="/My/MyTuteeVodList/">온라인<div class="title-tab-cir">0</div></a></li>
		    </ul>
		</div>		
		<div class="my-class-list">
			<c:forEach var="vo" items="${list}">
			<div class="class-box">
				<div class="class-info"> 
					<div class="image" style="background-image: url(${cp}/class/getimg?cover_num=${vo.cover_num });"></div>
					<div class="information-box">
						<h3 style="overflow: hidden;text-overflow: ellipsis;white-space: nowrap;">${vo.class_title }</h3>
						<div class="stars-box">
							<font class="class-type">원데이 1:1 </font>&nbsp;|&nbsp; &nbsp;
							
							<span>	(${vo.tutor_nickname })</span>						
						</div>
						<div class="start-date">
							<font>결제일 : ${vo.pay_regdate }</font>&nbsp;|&nbsp;
							<font>수업 시작일 : <fmt:formatDate value="${vo.pay_regdate }" pattern="yy-MM-dd"/> &nbsp;&nbsp;17:00</font>&nbsp;|&nbsp; 
							<font>온라인</font>
						</div>
						<div class="review-fold cursor on" onclick="review(this)">리뷰작성
						<div class="arrw-box"><img src="https://front-img.taling.me/Content/Images/class/icon_btn_down.png" class="arrw down"><img src="https://front-img.taling.me/Content/Images/class/icon_btn_up.png" class="arrw up"></div></div>
						<div class="price"><font>￦</font>${vo.final_price }</div>
					</div>
				</div>
				<!-- <div class="review-info textarea">
					<div><textarea placeholder="리뷰를 작성해주세요" name="Content" id="reviewContent19154"></textarea></div>
					<div class="stars-box">
						<div class="stars">
							<i class="glyphicon glyphicon-star active" data-value="1"></i>
							<i class="glyphicon glyphicon-star active" data-value="2"></i>
							<i class="glyphicon glyphicon-star active" data-value="3"></i>
							<i class="glyphicon glyphicon-star active" data-value="4"></i>
							<i class="glyphicon glyphicon-star active" data-value="5"></i>
							<input type="hidden" name="priceScore" id="priceScore19154" value="5">
							<font>5.0</font> (커리큘럼, 전달력, 준비성, 친절도, 시간준수)
						</div>
						<div class="regi-button cursor" onclick="reviewRegi(19154,0)">
							등록
						</div>
					</div>
				</div> -->
			</div>
			</c:forEach>
			
			<div style="padding-top:100px"></div>
		</div>
</div>
