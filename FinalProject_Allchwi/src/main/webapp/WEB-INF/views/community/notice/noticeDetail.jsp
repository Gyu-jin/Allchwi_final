<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript" src="${cp}/resources/js/jquery-3.5.1.js"></script>

<style>
#top {
	float: right;
}
#top > p{
	margin: 5px;
}
#btnGroup {
	float: right;
	margin-top: 10px;
}
#bottom {
	clear: right;
	margin-top: 10px;
}
</style>
<div class="container">
	<div class="jumbotron" style="padding: 2rem;">
		<div>
			<h4>${ntv.notice_title }</h4>
			<div id="top">
				<p>
					등록일 :
					<fmt:formatDate value="${ntv.notice_regdate}"
						pattern="yyyy-MM-dd HH:mm" />
				</p>
				<p>조회수 : ${ntv.notice_view}</p>
			</div>
		</div>
		<hr class="my-4" style="clear: right; margin: 0px">
		<div class="card card-body" style="height: 15rem; margin-top: 25px">
			<p>${ntv.notice_content }</p>
		</div>
		<div id="btnGroup">
			<button class="btn btn-primary" id="update">수정</button>
			<button class="btn btn-danger" id="delete" onclick="deleteNotice('${ntv.notice_num}')">삭제</button>
		</div>
		<div id="bottom">
			이전글&nbsp&nbsp
			<c:choose>
				<c:when test="${prev != null }">
					<a href="${cp}/community/noticeDetail?notice_num=${prev.notice_num }">${prev.notice_title }</a>
				</c:when>
				<c:otherwise>
					이전글이 존재하지 않습니다.
				</c:otherwise>
			</c:choose>

			<hr class="my-2">
			다음글&nbsp&nbsp
			<c:choose>
				<c:when test="${next != null }">
					<a href="${cp}/community/noticeDetail?notice_num=${next.notice_num }">${next.notice_title }</a>
				</c:when>
				<c:otherwise>
					다음글이 존재하지 않습니다.
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</div>
<script type="text/javascript">
	//글 삭제하는함수
	function deleteNotice(notice_num){
		location.href="${cp}/community/noticeDelete?notice_num="+notice_num;
	}
</script>
