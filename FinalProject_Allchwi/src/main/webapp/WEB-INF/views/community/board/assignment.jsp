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
		<h1>과제 게시판</h1>
		<button type="button" class="btn btn-primary" data-toggle="modal"
			data-target="#exampleModal" data-whatever="@mdo">과제 올리기(튜터)</button>
		

		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">과제 올리기</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<form>
							<div class="form-group">
								<label for="recipient-name" class="col-form-label">과제 타이틀:</label>
								<input type="text" class="form-control" id="recipient-name">
							</div>
							<div class="form-group">
								<label for="message-text" class="col-form-label">과제 내용:</label>
								<textarea class="form-control" id="message-text"></textarea>
							</div>
							
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">취소</button>
						<button type="button" class="btn btn-primary">올리기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="jumbotron">
		<h1 class="display-4">오늘의 과제!</h1>
		<p class="lead">우리집 댕댕이 한시간 산책시키기</p>
		<hr class="my-4">
		<p>과제 관련 파일은 자료실에서 다운받아 주세요 - 튜터</p>

		<p>
			<a class="btn btn-primary" data-toggle="collapse"
				href="#collapseExample" role="button" aria-expanded="false"
				aria-controls="collapseExample"> 과제 제출하러 가기! </a>
		</p>
		<div class="collapse" id="collapseExample">
			<div class="card card-body">
				<div class="content-box">
					<form id="form-assign" method="post">
						<div class="form-group">
							<label for="exampleFormControlTextarea1">과제 답변 입력하기</label>
							<textarea class="form-control" name="assign_content" rows="3"></textarea>
						</div>
						<div class="flex-div">
							<div class="col-md-6">
								<label for="exampleFormControlFile1">과제 파일 올려주세요</label>
								<input type="file" name="assign_file" class="form-control-file">
							</div>
							<div class="col-md-6">
								<button type="button" class="btn btn-outline-warning"
									id="subBtn">제출하기</button>
							</div>
						</div>
					</form>
				</div>
			</div>

		</div>

	</div>
	
<script>
	$("#subBtn").click(function(){
		var formData=$("#form-assign").serialize();
		$.post("${cp}/", data, function(data, textStatus, req) {
			
		})
	});
</script>