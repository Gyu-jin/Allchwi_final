<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
@font-face {
	font-family: 'CookieRunOTF-Bold';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.0/CookieRunOTF-Bold00.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}
#h-top {
    line-height: 1;
    border-bottom: 1px solid #e5e5e5;
    height: 100px;
}
#h-title{
	font-family: 'CookieRunOTF-Bold';
	font-size: 2rem;
}

#h-title a{
	text-decoration: none;
	color:#7185bb;
}
</style>
<div class="container">
  <header class="blog-header py-3">
    <div class="row flex-nowrap justify-content-between align-items-center" id="h-top">
      <div class="col-3 pt-1">
        <a class="text-muted" href="#">Subscribe</a>
      </div>
      <div class="col-6 text-center" id="h-title">
        <a href="${cp }/onclass/community">${commuInfo.commu_title}</a>
      </div>
      <div class="col-3 d-flex justify-content-end align-items-center">
        <a class="text-muted" href="#" aria-label="Search">
          <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="mx-3" role="img" viewBox="0 0 24 24" focusable="false"><title>Search</title><circle cx="10.5" cy="10.5" r="7.5"></circle><path d="M21 21l-5.2-5.2"></path></svg>
        </a>
        <a class="btn btn-sm btn-outline-secondary" href="#">출석체크</a>
      </div>
    </div>
      <div class="nav-scroller py-1 mb-2">
	    <nav class="nav d-flex justify-content-between">
	      <a class="p-2 text-muted" href="${cp}/community/notice">공지사항</a>
	      <a class="p-2 text-muted" href="${cp}/community/archive">자료실</a>
	      <a class="p-2 text-muted" href="${cp}/community/mediaList">강의듣기</a>
	      <a class="p-2 text-muted" href="${cp}/community/assignment">과제</a>
	      <a class="p-2 text-muted" href="${cp}/community/freeboard">자유게시판</a>
	      <a class="p-2 text-muted" href="${cp}/community/qna">QnA</a>
	    </nav>
	  </div>
  </header>
</div>