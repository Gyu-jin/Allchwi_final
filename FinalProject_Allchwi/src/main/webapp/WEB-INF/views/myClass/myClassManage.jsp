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
		<!-- forEach 돌려서 출력하기 / 목록이 존재 할때 select 출력 -->
		<c:choose>
			<c:when test="${myClass.size() > 0}">
				<select name=sortClass onchange="classSort(this.value)">
					<option value="0" <c:if test="${'0' eq class_num}"> selected</c:if>>전체</option>
					<c:forEach var="mc" items="${myClass}">
						<option value="${mc.class_num}" <c:if test="${mc.class_num eq class_num}"> selected</c:if>>${mc.class_title}</option>
					</c:forEach>
				</select>
			</c:when>
		</c:choose>
	</div>
	<div class="my-class-list">
		<c:choose>
			<c:when test="${list.size() > 0}">
				<c:forEach var="vo" items="${list}">
					<div class="class-box">
						<div class="class-info">
							<div class="member" style="text-align: center;">
								<img src="${cp}/mypage/getimg?pro_num=${vo.pro_num }"
									style="height: 150px; width: 150px; display: block; margin-left: 10%">
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
								<h3 style="margin-left: 7%">${vo.class_title }</h3>
								<div class="price">
									<fmt:setLocale value="ko_KR" />
									<fmt:formatNumber type="currency" value="${vo.class_fee}" />
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
		<div>
			<ul class="pagination justify-content-center" style="margin: 20px 0">
				<c:choose>
					<c:when test="${pu.startPageNum>1 }">
						<li class="page-item"><a class="page-link"
							href="${cp}/myClass/myClassManage?pageNum=${pu.startPageNum-1 }&class_num=${class_num}">이전</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item disabled"><a class="page-link" href="#">이전</a></li>
					</c:otherwise>
				</c:choose>
				
				<c:forEach var="i" begin="${pu.startPageNum}"
					end="${pu.endPageNum }">
					<c:choose>
						<c:when test="${pu.pageNum==i}">
							<li class="page-item active"><a class="page-link"
								href="${cp}/myClass/myClassManage?pageNum=${i }&class_num=${class_num}">${i }</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link"
								href="${cp}/myClass/myClassManage?pageNum=${i }&class_num=${class_num}">${i }</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>

				<c:choose>
					<c:when test="${pu.totalPageCount>pu.endPageNum }">
						<li class="page-item"><a class="page-link"
							href="${cp}/myClass/myClassManage?pageNum=${pu.endPageNum+1 }&class_num=${class_num}">다음</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item disabled"><a class="page-link" href="#">다음</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
		<div style="padding-top: 100px"></div>
	</div>
</div>
<script type="text/javascript">
	//post 방식으로 보내기
	function classSort(cn){
		/* get 방식
		var cp = '<c:out value="${cp}"/>'
		location.href= cp + "/myClass/myClassManage?class_num="+cn
		*/
		console.log("실행되는중" + cn);
		//a 동적으로 form을 생성하여 파라미터 값을 보내줌.
		var form = document.createElement("form");
		form.setAttribute("charset", "utf-8");
		form.setAttribute("method", "post");
		form.setAttribute("action", "${cp}/myClass/myClassManage");
		//a 파라미터 값이 null이 아닌 경우 히든 input을 생성하여 값을 넣음.
		var hiddenClassNum = document.createElement("input");
		hiddenClassNum.setAttribute("type", "hidden");
		hiddenClassNum.setAttribute("name", "class_num");
		hiddenClassNum.setAttribute("value", cn);
		//a 폼에 히든 input 추가 
		form.appendChild(hiddenClassNum);
		//a body부분에 폼을 붙이고 페이지 이동
		document.body.appendChild(form);
		form.submit();
	}
</script>