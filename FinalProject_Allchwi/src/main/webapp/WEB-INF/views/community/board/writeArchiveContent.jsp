<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="container">


	<div class="jumbotron">
		<h4>자료올리기</h4>
		<hr class="my-4">
		<div class="card card-body">
			<form>
				<div class="form-group">
					<label for="exampleFormControlInput1">글제목</label> <input
						type="text" class="form-control" id="exampleFormControlInput1"
						placeholder="글제목을 입력해주세요.">
				</div>
				<div class="form-group">
					<label for="exampleFormControlSelect1">말머리를 선택해 주세요.</label> <select
						class="form-control" id="exampleFormControlSelect1">
						<option>과제</option>
						<option>참고자료</option>
						<option>수업자료</option>
					</select>
				</div>
				<div class="form-group">
					<label for="exampleFormControlTextarea1">글내용</label>
					<textarea class="form-control" id="exampleFormControlTextarea1"
						rows="3"></textarea>
				</div>


				<div class="form-group">
					<label for="exampleFormControlFile1">Example file input</label> <input
						type="file" class="form-control-file" id="exampleFormControlFile1">
				</div>




			</form>
		</div>
	</div>
</div>