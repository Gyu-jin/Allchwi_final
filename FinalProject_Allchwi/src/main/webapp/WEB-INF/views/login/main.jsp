<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="/allchwi/resources/css/login/loginForm.css">
<div id=loginbody>
<div class="login-form">
    <form action="#" method="post">
      <h1>로그인</h1>
      <div class="form-group" style="margin: 0 0 30px;">
        <input type="email" name="id" placeholder="E-mail Address">
        <span class="input-icon"><i class="fa fa-envelope"></i></span>
      </div>
      <div class="form-group" style="margin: 0 0 30px;">
        <input type="password" name="pwd" placeholder="Password">
        <span class="input-icon"><i class="fa fa-lock"></i></span>
      </div>      
      <button class="login-btn">로그인</button>
      <div class="other">      
      	<a class="reset-psw" href="${cp}/login/searchPwd">비밀번호 찾기</a>
      	<a class="reset-psw" href="${cp}/login/join">회원가입</a>
      	<!-- 
      	<a class="reset-psw" href="${cp}/mypage/mypageForm">마이페이지테스트</a>
      	 -->
      </div>
      <div class="seperator"><b>or</b></div>
      <p>다른 방법으로 로그인</p>
      <!-- 카카오 로그인 아이콘 -->
      <div class="social-icon">
		 <c:if test="${userId eq null}">
       		<a href=" https://kauth.kakao.com/oauth/authorize?client_id=4f883a7141cac9d993029eba73513c89&redirect_uri=http://localhost:8091/kakaologin/login&response_type=code">
            	<img src="${cp}/resources/img/kakao_login_medium_narrow.png">
        	</a>
  		 </c:if>
      </div>
    </form>
  </div>
	<h1>카카오 로그인 결과</h1>
	<!-- 
		카카오 서버 주소 : https://kauth.kakao.com
		파라미터
		client_id -> rest api
		redirect_uri -> http://localhost:8091/kakaologin/login
		주소/ 프로젝트명 / 매핑경로
		response_type=code -> 코드형식으로 받아오겠다.
	 -->
    <c:if test="${userId ne null}">
        <h1>로그인 성공입니다</h1>
        <p>${userInfo.get("email")}</p>
        <p>${userInfo.get("nickname")}</p>
        <img src="${userInfo.get('img')}">
        <input type="button" value="로그아웃" onclick="location.href='${pageContext.request.contextPath}/logout'">
        <!-- 
        <a href="${pageContext.request.contextPath}/logout">로그아웃</a>
         -->
    </c:if>
</div>
