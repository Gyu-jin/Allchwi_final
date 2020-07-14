<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${cp}/resources/css/classEnrollment/classDate.css">
<div class="tutor_cont">	
	<div class="dim" id="dim" style="display: none;"></div>
	<div class="dim2" id="dim2" style="display: none;">
		<iframe id="regiDate" frameborder="0" width="100%" height="100%"></iframe>
	</div>
	<div class="title_box right">
		<h3>장소/일정</h3>
		<span class="pink">*</span>필수
	</div>
		<div class="box">
		<div class="title">수업시작일</div>
		<div class="cont">
			<div class="inner1">
				<div class="gray5 title">수업 시작일을 알려주세요</div>
				<div class="certificate class" style="padding:0"></div>
				<div class="plus button" style="margin-top:20px" onclick="add_date(1)">
					<img src="https://front-img.taling.me/Content/Images/tutor/Images/icon_add_wh.png"> 수업일정 추가
				</div>
				<script>
					function add_date(val){
						url = "${cp}/class/dateModal";
						$('#regiDate').attr('src', url);

						setTimeout(
							function() 
							{
								$('#dim').show();
								$('#dim2').show();
							}, 300);						
						}
					
					function cls_date(){
						location.reload();						
						$('#dim').hide();
						$('#dim2').hide();
					}

					function add_date2(val, val2){
						url = "/tutor/registerRegionDetail.php?dateId="+val+"&id="+val2;
						$('#regiDate').attr('src', url);	
						setTimeout(
							function() 
							{
								$('#dim').show();
								$('#dim2').show();
							}, 300);
						}

					function del_date(val){
						$.ajax({
							type: 'POST',
							url: '/tutor/delDate.php',							
							data: "dateId="+val,							
							success: function (response) {
								alert("수업 일정이 삭제되었습니다");										
							},
							error: function(response) {
								isUploading = false;
							}
						});
					}
				</script>
			</div>
		</div>
	</div>
	<div class="box">	
		<div class="title"><b class="pink">*</b> 장소 및 추가비용 코멘트<br>
		</div>
		<div class="cont">
			<textarea class="basic len980 hei190" placeholder="스터디룸, 준비물 등 추가 비용이 있는 경우 반드시 적어주세요.		
				(ex. 시간당 1,000원 ~ 1,500원 정도의 스터디룸비는 별도입니다)" id="RegionContent" name="RegionContent"></textarea>
		</div>
	</div>
	<div class="box">
		<div class="title"><b class="pink">*</b> 신청 학생에게 보낼 메시지</div>
		<div class="cont">
			<textarea class="basic len980 hei190" placeholder="수강생과 수업 연결 시에 메시지가 전달됩니다." id="Message" name="Message"></textarea>
		</div>
	</div>
	
	<div class="next button" onclick="setMode(3);">저장하기</div>
</div>