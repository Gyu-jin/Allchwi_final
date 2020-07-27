<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
.display-4{
	display: inline;
}
button[name='subBtn'], #a-update{
	float: right;
}
 #uploadBtn, #a-delete{
	float: right;
	color: #fff;
    background-color: #F44336;
    border-color: #F44336;
}


#uploadBtn:hover, #a-delete:hover {
    color: #fff;
    background-color: #FF9800;
    border-color: #FF9800;
}
</style>
<script src="http://malsup.github.com/jquery.form.js"></script> 
<div class="container">

	<div class="title-box">
		<h1>과제 게시판</h1>
		<button type="button" id="uploadBtn" class="btn btn-primary"
			data-toggle="modal" data-target="#a-uploadModal" data-whatever="@mdo">과제
			올리기(튜터)</button>

		<!-- 과제 올리기(튜터) 버튼 클릭 시 나타나는 과제 업로드 모달 -->
		
		<div class="modal fade" id="a-uploadModal" tabindex="-1" role="dialog"
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
					
					<!-- Assignment insert form -->
					
					<form class="a-upload-form">
						<div class="modal-body">

							<div class="form-group">
								<label for="recipient-name" class="col-form-label">과제
									타이틀:</label> <input type="text" class="form-control"
									name="assign_title">
							</div>
							<div class="form-group">
								<label for="message-text" class="col-form-label">과제 내용:</label>
								<textarea class="form-control" name="assign_content"></textarea>
							</div>
							<input type="hidden" name="commu_num"
								value="${commuInfo.commu_num }">

						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">취소</button>
							<button type="submit" class="btn btn-primary" id="a-uploadBtn"
								data-dismiss="modal">올리기</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 과제 목록 -->
	<c:choose>
		<c:when test="${not empty list }">
			<c:forEach var="vo" items="#{list }" varStatus="status">
				<div class="jumbotron">
				
					<h1 class="display-4">${vo.assign_title }</h1>
					
					<!-- 튜터만 수정/삭제 가능 -->
					
					<button type="button" class="btn btn-primary" id="a-update" 
					data-toggle="modal" data-target="#a-updateModal" data-whatever="${vo.assign_num }">수정</button>
					
					<button type="button" class="btn btn-primary" id="a-delete" onclick="deleteA(${vo.assign_num })">삭제</button>
					
				
					<p class="lead">${vo.assign_content }</p>
					<hr class="my-4">
					<p>과제 관련 파일은 자료실에서 다운받아 주세요 - 튜터 ${vo.assign_num }</p>

					<p>
						<a class="btn btn-primary" data-toggle="collapse"
							href="#collapse${status.index }" role="button" aria-expanded="false"
							aria-controls="collapse${status.index }"> 과제 제출하러 가기! </a>
					</p>
					<!-- 과제 제출 & 제출한 과제 목록 -->
					<div class="collapse" id="collapse${status.index }">
						<div class="card card-body">
							<div class="content-box">
								<form name="form-assign" >
								<input type="hidden" name="assign_num" value="${vo.assign_num }">
									<div class="form-group">
										<label for="exampleFormControlTextarea1">과제 답변 입력하기</label>
										<textarea class="form-control" name="sub_content" rows="3"></textarea>
									</div>
									<div class="flex-div">
										<div class="col-md-6">
											<label for="exampleFormControlFile1">과제 파일 올려주세요</label> 
											<input multiple type="file" name="assign_file" class="form-control-file" id="file">
										</div>
										<div class="col-md-6">
											<button type="submit" class="btn btn-outline-warning"
												name="subBtn" >제출하기</button>
										</div>
									</div>
								</form>
								
								<div class="submitAssign"></div>
							</div>
						</div>

					</div>

				</div>
			</c:forEach>
		</c:when>
		<c:otherwise>
			<div class="jumbotron">
					<h1 class="display-4">과제가 없습니다..</h1>
					</div>
		</c:otherwise>
	</c:choose>


		
					<!-- 수정 모달 -->
					<div class="modal fade" id="a-updateModal" tabindex="-1" role="dialog"
							aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog" id="modaldialog">
							</div>	
					</div>
					
					
<script>
	// 튜터 : 수정 할 글 정보 불러오기
	$("#a-updateModal").on('show.bs.modal',function(e){
		var assign_num = $(e.relatedTarget).data('whatever');
		console.log("assign_num:"+assign_num);
		$.ajax({
			url : "${cp }/assign/update?assign_num="+assign_num,
			dataType: "json",
			success : function(data) {
				$("#modaldialog").empty();
					var html="<div class='modal-content'>"+
								"<div class='modal-header'>"+
								"<h5 class='modal-title' id='updateModalLabel'>과제 올리기(수정)</h5>"+
								"<button type='button' class='close' data-dismiss='modal' aria-label='Close'>"+
									"<span aria-hidden='true'>&times;</span>"+
								"</button>"+
							"</div>"+
							"<form class='a-update-form'>"+
								"<div class='modal-body'>"+
			
									"<div class='form-group'>"+
										"<label for='recipient-name' class='col-form-label'>과제타이틀:</label>"+
									"<input type='text' class='form-control' name='assign_title' value='"+data.assign_title+"'>"+
									"</div>"+
									"<div class='form-group'>"+
										"<label for='message-text' class='col-form-label'>과제 내용:</label>"+
										"<textarea class='form-control' name='assign_content'>"+data.assign_content+"</textarea>"+
									"</div>"+
									"<input type='hidden' name='assign_num' value='"+data.assign_num+"'>"+
			
								"</div>"+
								"<div class='modal-footer'>"+
									"<button type='button' class='btn btn-secondary' data-dismiss='modal'>취소</button>"+
									"<button type='submit' class='btn btn-primary' id='a-updateBtn' data-dismiss='modal'>수정하기</button>"+
								"</div>"+
							"</form>"+
						"</div>";
					$("#modaldialog").append(html);
				
			}
		});
	});
	
	// 튜터 : 삭제하기 버튼
	function deleteA(assign_num){

		$.ajax({
			url : "${cp }/assign/delete?assign_num="+assign_num,
			success : function(data) {
				if (data == "success") {
					alert("Successfully Delete!");
					location.href = "${cp}/community/assignment"
				} else {
					alert("Delete Fail!");
				}
	
			}
		});
	}
	
	// 튜터 : 수정 모달 - 수정하기 버튼
	$(document).on('click','#a-updateBtn', function() {

		$.ajax({
			url : "${cp }/assign/updateOk",
			type : "POST",
			data : $(".a-update-form").serialize(),
			success : function(data) {
				if (data == "success") {
					alert("Successfully UploadOK!");
					location.href = "${cp}/community/assignment"
				} else {
					alert("Upload Fail!");
				}

			}
		});
	});
	
	// 튜터 : 과제 올리기 버튼
	$("#a-uploadBtn").on('click', function(e) {

		$.ajax({
			url : "${cp }/assign/upload",
			type : "POST",
			data : $(".a-upload-form").serialize(),
			success : function(data) {
				if (data == "success") {
					alert("Successfully Upload!");
					location.href = "${cp}/community/assignment"
				} else {
					alert("Upload Fail!");
				}

			}
		});
	});
	$(document).on("click","button[name='subBtn']",function(e) {
		e.preventDefault();
		var div=$(this).parent().parent().parent().parent().find(".submitAssign");
		var form=$(this).parent().parent().parent();
		
		form.attr('method','post'); 
		var formData = new FormData(form[0]);
		$.post({
			url : "${cp }/assign/data",
			data : formData,
			cache: false,
			processData: false, 
			contentType: false,
			enctype: "multipart/form-data",
			success : function(data){
				if(data=="success"){
					alert("과제 제출 성공");
					var assign_num=$("input[name='assign_num']").val();
					Assign_submitList(assign_num);
				}else{
					alert("과제 제출 실패");
				}
			}
		});
	});
	
	function Assign_submitList(assign_num){
		$.post({
			url : "${cp }/assign/submitList",
			data : {"assign_num":assign_num},
			dataType: "json",			
			success : function(data) {
					
				$(data).each(function(i,sub){
					if(i==0){
						console.log("ss");
						div.append("<div><img src='${cp}/mypage/getimg?pro_num"+sub.pro_num +"'><p>"+sub.sub_regdate+ " , " + sub.sub_content+"</p></div>");
						div.append("<div>"+sub.sub_regdate+ " , " + sub.sub_content+"</div>");
						div.append("<div>"+sub.org_filename +"</div>");
					}else{
						div.append("<div>"+sub.org_filename +"</div>");
						
					}
				});
			}
		});
	}

</script>