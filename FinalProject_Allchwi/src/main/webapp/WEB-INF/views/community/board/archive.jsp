<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

	<div class="title-box">
		<h1>자료실</h1>

	</div>
	<div class="jumbotron">
		<p>수업 관련 자료를 확인해주세요.</p>
		<hr class="my-4">
		

			<div class="card card-body">
				<div class="content-box">
			<form class="form-assign">
				<div class="form-group">
					<label for="exampleFormControlTextarea1">과제 답변 입력하기</label>
					<textarea class="form-control" id="exampleFormControlTextarea1"
						rows="3"></textarea>
				</div>
				<div class="flex-div">
					<div class="col-md-6">
						<label for="exampleFormControlFile1">Example file input</label> <input
							type="file" class="form-control-file"
							id="exampleFormControlFile1">
					</div>
					<div class="col-md-6">
						<button type="submit" class="btn btn-outline-warning" id="subBtn">제출하기</button>
					</div>
				</div>
			</form>

			</div>
			
		</div>
		
	</div>
	</div>