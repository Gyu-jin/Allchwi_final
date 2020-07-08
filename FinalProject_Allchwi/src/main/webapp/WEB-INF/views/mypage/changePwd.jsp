<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="${cp}/resources/js/jquery-3.5.1.js"></script>
<style>
.pw_cont02{width:100%; min-width:1200px; background:#fff;height:600px; padding-top: 30px;}

.pw_cont02 .box1 {width:1020px; height:420px; border: 1px solid #ccc; background-color:#ffffff;
				 margin:0 auto;margin-top:80px;}
.pw_cont02 .box1 .title_box  {width:100%; height:90px;padding-top: 40px; border-bottom: 1px solid #ccc; letter-spacing:1px;color:black;}
.pw_cont02 .box1 .title_box .left{width: 80%;height: 50px;float:left;padding-left: 50px;font-size: 13px;font-weight:800;}

.pw_cont02 .box1 .main_box {width:50%;  margin:0 auto;margin-top:20px;padding-top:10px;}
.pw_cont02 .box1 .main_box .input_box{width:90%; height:40px;margin:0 auto; margin-top:20px;}

.pw_cont02 .box1 .main_box .input_box .left_box2{width:27%; float:left;margin-top:10px;
												font-size:13px; font-weight:600; color:black;letter-spacing:1px;}
.pw_cont02 .box1 .main_box .input_box .right_box{width:65%; float:left; 
												font-size:13px; font-weight:600; color:black;letter-spacing:1px;}
.pw_cont02 .box1 .main_box .input_box .right_box .pw_blank{width:95%; height:30px; background-color:rgba(241, 241, 241, 0.43);padding-left:5%;
															border:1px solid #999; font-size:16px; font-weight:600;border-radius:7px;}
.pw_cont02 .box1 .main_box .input_box .right_box .pw_blank:focus{outline:none; border-color:#2196f3;}

.pw_cont02 .box1 .main_box3 {width:50%;margin:0 auto;text-align:center;margin-top:50px;}

.pw_cont02 .box1 .main_box3 .button{background-color:#fff;padding:6px 40px;color:#ff005a;border-color:#ff005a;border-radius:5px;}
.pw_cont02 .box1 .main_box3 .button:hover{border-color:#2916f3;color:#2916f3;}
.pw_cont02 .box1 .main_box3 .button:focus{outline:none;}

</style>
<div id="t_container_sub">
	<div class="pw_cont02">
		<div class="box1">
			<div class="title_box">
				<div class="left">비밀번호 재설정</div>
			</div>
			<form class="form-horizontal" action="#" method="POST" id="resetPwd">
			<div class="main_box">
				<div class="input_box">
					<div class="left_box2">
						<b>·</b>&nbsp;새 비밀번호
					</div>
					<div class="right_box">
						<input type="password" id="input-password" name="password" class="pw_blank" placeholder="새 비밀번호">
					</div>
				</div>
				<div class="input_box">
					<div class="left_box2">
						<b>·</b>&nbsp;비밀번호 확인
					</div>
					<div class="right_box">
						<input type="password" id="input-confirm" name="password" class="pw_blank" placeholder="비밀번호 확인">
					</div>
				</div>
			</div>			
			<div class="main_box3">
				<input type="submit" class="button" value="변경">
			</div>
			</form>
		</div>


	</div>	
</div>
