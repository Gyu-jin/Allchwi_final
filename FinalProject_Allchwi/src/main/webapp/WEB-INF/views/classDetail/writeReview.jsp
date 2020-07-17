<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 리뷰작성 모달 -->
<div class="modal fade" id="modalContactForm" tabindex="-1"
	role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header text-center">
				<h4 class="modal-title w-100 font-weight-bold">review</h4>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body mx-3">
				<div class="md-form mb-5">
					<label data-error="wrong" data-success="right" for="form34">Your
						name</label> <input type="text" id="form34" class="form-control validate">

				</div>
				<div class="md-form">
					<label data-error="wrong" data-success="right" for="form8">content</label>
					<textarea type="text" id="form8" class="md-textarea form-control"
						rows="4"></textarea>

				</div>

			</div>
			<div class="modal-footer d-flex justify-content-center">
				<a href="#" class="btn_send">작성완료</a>
			</div>
		</div>
	</div>
</div>
<!-- 리뷰작성 모달 -->