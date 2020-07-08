<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="${cp}/resources/js/jquery-3.5.1.js"></script>
<style>
.pw_cont02 {
	width: 100%;
	min-width: 1200px;
	height: 600px;
	padding-top: 30px;
}

.pw_cont02 .box1 {
	width: 1020px;
	height: 420px;
	border: 1px solid #ccc;
	background-color: #ffffff;
	margin: 0 auto;
	margin-top: 50px;
}

.pw_cont02 .box1 .title_box {
	width: 100%;
	height: 90px;
	padding-top: 30px;
	border-bottom: 1px solid #ccc;
	letter-spacing: 1px;
	color: black;
}

.pw_cont02 .box1 .title_box .left {
	width: 80%;
	height: 50px;
	float: left;
	padding-left: 50px;
	font-size: 20px;
	font-weight: 800;
}

.pw_cont02 .box1 .main_box {
	width: 50%;
	margin: 0 auto;
	margin-top: 20px;
	padding-top: 10px;
}

.pw_cont02 .box1 .main_box .input_box {
	width: 90%;
	height: 40px;
	margin: 0 auto;
	margin-top: 20px;
}

.pw_cont02 .box1 .main_box .input_box .left_box {
	width: 27%;
	float: left;
	margin-top: 10px;
	font-size: 14px;
	font-weight: 600;
	color: black;
	letter-spacing: 1px;
}

.pw_cont02 .box1 .main_box .input_box .right_box {
	width: 65%;
	float: left;
	font-size: 13px;
	font-weight: 600;
	color: black;
	letter-spacing: 1px;
}
/*
.pw_cont02 .box1 .main_box .input_box .right_box .pw_blank {
	width: 95%;
	height: 30px;
	background-color: rgba(241, 241, 241, 0.43);
	padding-left: 5%;
	border: 1px solid #999;
	font-size: 16px;
	font-weight: 600;
	border-radius: 7px;
}
*/

.pw_cont02 .box1 .foot_box {
	width: 50%;
	margin: 0 auto;
	text-align: center;
	margin-top: 50px;
}
.foot_box input{
	width: 200px;
}
</style>
<div class="container">
	<div class="pw_cont02">
		<div class="box1">
			<div class="title_box">
				<div class="left">비밀번호 재설정</div>
			</div>
			<form action="#" method="POST" id="resetPwd">
				<div class="main_box">
					<!--1 회원정보중 회원 번호를 넘겨서 업데이트 시켜줘야함 -->
					<input type="hidden" id="mb_num" name="mb_num"
						class="form-control" value="#">
					<div class="input_box">
						<div class="left_box">
							<b>·</b>&nbsp;새 비밀번호
						</div>
						<div class="right_box">
							<input type="password" id="inPwd"
								class="form-control" placeholder="새 비밀번호">
						</div>
					</div>
					<div class="input_box">
						<div class="left_box">
							<b>·</b>&nbsp;비밀번호 확인
						</div>
						<div class="right_box">
							<input type="password" id="cfmPwd" name="password"
								class="form-control" placeholder="비밀번호 확인">
						</div>
					</div>
				</div>
				<div class="foot_box">
					<input type="submit" class="btn btn-danger btn-lg" value="비밀번호 변경">
				</div>
			</form>
		</div>
	</div>
</div>
<script type="text/javascript">
<!-- a 기존비밀번호와 달라야함.(ajax사용) / 자리수 8이상, 10자리 이내, 영문 숫자 특문 조합 / -->
</script>
