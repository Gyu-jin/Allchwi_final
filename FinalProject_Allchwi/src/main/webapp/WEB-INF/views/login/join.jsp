<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 1아이콘 폰트 사용 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="/allchwi/resources/css/login/loginForm.css">
<div id=loginbody>
<div class="login-form">
    <form action="#" method="post">
      <h1>올취 회원가입</h1>
      <div class="form-group">
        <input type="text" name="name" placeholder="이름(실명)을 입력해주세요" onblur="nameCheck()">
        <span class="input-icon"><i class="fa fa-user-circle-o"></i></span>
      </div>
      <div>
     	<span id="nameMsg" style="font-size: 20px;color: red;padding-left: 20px;"></span>	
      </div>
      <div class="form-group">
        <input type="email" name="id" placeholder="이메일주소를 입력해주세요" >
        <span class="input-icon"><i class="fa fa-envelope"></i></span>
      </div>
      <div>
     	<span id="idMsg" style="font-size: 20px;color: red;padding-left: 20px;"></span>	
      </div>
      <div class="form-group">
        <input type="password" name="pwd" placeholder="비밀번호를 입력해주세요" onblur="pwdCheck()">
        <span class="input-icon"><i class="fa fa-lock"></i></span>
      </div>
      <div>
     	<span id="pwdMsg" style="font-size: 20px;color: red;padding-left: 20px;"></span>	
      </div>      
      <div class="form-group">
        <input type="password" name="pwd1" placeholder="비밀번호를 재입력해주세요" onblur="pwdDCheck()">
        <span class="input-icon"><i class="fa fa-lock"></i></span>
      </div>
      <div>
     	<span id="pwdDMsg" style="font-size: 20px;color: red;padding-left: 20px;"></span>	
      </div>
      <button class="login-btn" disabled="disabled">회원가입</button>
    </form>
  </div>
</div>
<script type="text/javascript">
//가입 버튼 활성화 변수
var nameBl = false;
var idBl = false;
var pwdBl = false;
var pwdBl1 = false;

//이름 유효성 검사
function nameCheck(){
	let name = $("input[name='name']").val();
	console.log(name);
	//메세지 출력위해 객체로 가져오기
	let nameMsg = $("#nameMsg");
	//한글만 가능한 정규식
	let regExp = /([^가-힣\x20])/i;
	//검사
	if(regExp.test(name)){
		nameMsg.html("한글이 아닙니다.[자음, 모음만 처리불가]");
		nameBl = false;
	} else if(name.length < 1){
		nameMsg.html("2글자 이상 입력하세요");
		nameBl = false;	
	} else if(name.length > 5){
		nameMsg.html("5글자 이내로 입력하세요");
		nameBl = false;	
	} else {
		nameMsg.html("");
		nameBl = true;
		buttonUp();
	}
	console.log(nameBl + "체크");
}
//이메일 유효성 검사
function idCheck(){
	let id = $("input[name='id']").val();
	let idMsg = $("#idMsg");
	let regExpId = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	if(!regExpId.test(id)){
		idMsg.html("이메일 형식으로 입력해주세요.");
		idBl = false;
	}else if(id.length < 15){
		idMsg.html("15자리 이상 입력해주세요.");
		idBl = false;			
	} else if(id.length > 20){
		idMsg.html("20자리 이내로 입력해주세요.");
		idBl = false;
	} else {
		idMsg.html("");
		idBl = true;
		buttonUp();
	}
}
//비밀번호 유효성 검사
function pwdCheck(){
	let pwd = $("input[name='pwd']").val();
	let pwdMsg = $("#pwdMsg");
	console.log(pwd);
	// 특문 + 숫자 + 영문
	var regExpPwd =  /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]/;
	if(!regExpPwd.test(pwd)){
		pwdMsg.html("영문 + 숫자 + 특수문자를 조합해주세요.");
		pwdBl = false;
	} else if(pwd.length < 8){
		pwdMsg.html("8자리 이상 입력해주세요.");
		pwdBl = false;			
	} else if(pwd.length > 10){
		pwdMsg.html("10자리 이내로 입력해주세요.");
		pwdBl = false;
	} else {
		pwdMsg.html("");
		pwdBl = true;
		buttonUp();
	}
	console.log(pwdBl + "체크");
}
//비밀번호 확인 유효성 검사
function pwdDCheck(){
	let pwd = $("input[name='pwd']").val();
	let pwd1 = $("input[name='pwd1']").val();
	let pwdDMsg = $("#pwdDMsg");
	if(pwd1 === ""){
		pwdDMsg.html("");
		pwdBl1 = false;
	}else if(!(pwd === pwd1)){
		pwdDMsg.css("color","red"); 
		pwdDMsg.html("비밀번호가 일치하지 않습니다.");
		pwdBl1 = false;
	} else {
		pwdDMsg.css("color","green"); 
		pwdDMsg.html("비밀번호가 일치합니다.");
		pwdBl1 = true;
		buttonUp();
	}
	console.log(pwdBl1 + "중복체크");
}
//버튼 활성화 함수
function buttonUp(){
	let btn = $("#insert");
	if(nameBl && idBl && pwdBl && pwdBl1){
		btn.removeAttr('disabled');
	} else {
		btn.attr('disabled', true);
	}
}
</script>
    