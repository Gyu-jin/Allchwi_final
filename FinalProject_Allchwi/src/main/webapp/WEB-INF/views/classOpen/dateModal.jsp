<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="${cp}/resources/vendor/jquery/jquery.min.js"></script>
<script src="${cp}/resources/vendor/jquery-ui/jquery-ui.js"></script>
<link rel="stylesheet" href="${cp}/resources/vendor/jquery-ui/jquery-ui.css">	
<script src="${cp}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<link href="${cp}/resources/css/sb-admin-2.min.css" rel="stylesheet">
<link rel="stylesheet" href="${cp}/resources/css/classEnrollment/dateModal.css">
<title>탈잉 - 배움이 쉽고 즐거워진다</title>
<script type="text/javascript">
			
			var week = ['일', '월', '화', '수', '목', '금', '토'];
			var globalChkStatus = true;

			$(function(){		
				var classCount = $('#classCount').val();
				
				 $.datepicker.setDefaults({
				        dateFormat: 'yy-mm-dd',
				        prevText: '이전 달',
				        nextText: '다음 달',
				        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
				        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
				        dayNames: ['일', '월', '화', '수', '목', '금', '토'],
				        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
				        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
				        showMonthAfterYear: true,
				        yearSuffix: '년'
				    });
				 
				 // 일정 등록 방식 tab
				 $('.option','.radio').click(function(){
					if(!$(this).hasClass('on')){
						$(this).siblings('.option').removeClass('on');
						$(this).addClass('on');
						var num = $(this).attr('value');
						if(num =='1'){
							$('#dateInuptDiv').hide();
							$('#negoMessageDiv').show();
							globalChkStatus = false;
						}else if(num=='0'){
							$('#dateInuptDiv').show();
							$('#negoMessageDiv').hide();
							globalChkStatus = true;
						}
					}
				});
				
				for (let i = 2; i <= classCount; i++) {	
					 $('#type').append("<div class='grp'>"+
								"<div class='head1'>"+
								"<div class='title'>"+i+"회차</div>"+
							"</div>"+
							"<div class='formbox'>"+
								"<div class='formbox border cal'>"+
									"<input type='text' id='startDate"+ i +"' name='startDate[]' readonly='readonly' class='cal hasDat' placeholder='수업 일자 선택' value=''>"+
								"</div>"+
								"<div style='width:100%;overflow:hidden;'>"+
									"<div id='classTime"+ i +"' class='formbox border calendar'>수업 시작 시간</div>	"+
									"<input type='hidden' id='startTime"+ i +"'class='cal' name='startTime[]' value=''>"+
									"<input type='hidden' id='endTime"+ i +"' class='cal' name='endTime[]' value=''>"	+
								"</div>"+
							"</div>"+
						"</div>");
				}
				 
				//시작일 선택
				for (let i = 1; i <= classCount; i++) {								
					dateCalpickerSet(i);
					classTimeClick(i);
				}
				
				$('.option','.formbox').click(function(){
					let classCount = $('#classCount').val();
					if($(this).attr('value')=='3'){
						$(this).addClass('on');
						$(this).siblings('.option').removeClass('on');
						$('#oneday').show();
						$('#type').hide();
						//매주반복 선택시 - 주차별 detail 장소 시간 정보 초기화
						$('#type').find('input[name="startDate[]"]').val('');
						var oldDate = new Date($("#startDate1").val());
						for(let i = 2;i<=classCount;i++){	
							oldDate.setDate(oldDate.getDate()+7);
							$('#type').find('#startDate'+i).val($.datepicker.formatDate('yy-mm-dd',oldDate));
							$('#type').find('#classTime'+i).text($('#classTime1').text());
							$('#type').find('#startTime'+i).val($('#startTime1').val());
							$('#type').find('#endTime'+i).val($('#endTime1').val());
						}
					}
					else if($(this).attr('value')=='4'){
						$(this).addClass('on');
						$(this).siblings('.option').removeClass('on');
						for(let i = 2;i<=classCount;i++){	
							$('#type').find('#startDate'+i).val("");
							$('#type').find('#classTime'+i).text('수업 시작 시간');
							$('#type').find('#startTime'+i).val("");
							$('#type').find('#endTime'+i).val("");
						}
						$('#type').show();
					}
				});
				
				$('.moption','.formbox').click(function(){		
					$(this).addClass('on');
					$(this).siblings('.moption').removeClass('on');
					$('#monthDate').val($(this).val());
				});
				
			});
			
			// jquery Ui datepicker set
			function dateCalpickerSet(index){
				$("#startDate"+index).datepicker({
					changeMonth: true,
					changeYear: true,
					dateFormat: "yy-mm-dd",
					showOn: "button",
					buttonImage: "/allchwi/resources/img/icon_input_calendar.png",
					buttonImageOnly: true,
					buttonText: "등록일 선택",
					onClose: function(e){
						var date = new Date($("#startDate"+index).datepicker({ dateFormat: 'yy-mm-dd' }).val()),
						week = new Array('일', '월', '화', '수', '목', '금', '토');
						if (week[date.getDay()]!= undefined){
							$('#dayWeek').text(week[date.getDay()]);
						}
					}
				});	
			}
			
			// 시간 선택 popUp창 클릭이벤트
			function classTimeClick(index){
				$('#classTime'+index).click(function(){
					var height = $(window).scrollTop()+50;
					if(index==1){								
						$('#curriDate').show();
					}
					$('#back').show();
					$('#popClassTime').css('top',height);
					$('#popClassTime').show();
					$('#popClassTimes').val(index);
				});
			}
			
			function clspop(){
				$('#back').hide();
				$('#popClassTime').hide();
			}
			

			function setMode(val)
				{
					Mode = val;
					$('#frm-register-detail').submit();
				}

				$('#frm-register-detail').submit(function (e) {
					e.preventDefault();
					var TotalTimes = "";
					var data = $('#selectRegion').val();
					if($('#selectRegion').val() == '' || $('#selectRegion').val() == null ){ alert('장소를 선택하세요');$('#selectRegion').focus();return false;}		
					if($('#Region').val() == '0' || $('#selectRegion').val() == null ){ alert('장소를 선택하세요');$('#Region').focus();return false;}			
					
					if(globalChkStatus == true){
						if($('#startDate').val() == "" ){
							alert('수업 시작 일을 입력하세요');
							return false;
						}

						if($('#startTime1').val() == "" ){
							alert('수업 시작 시간을 입력하세요');
							return false;
						}
					

					//만약 다회차 - ''직접입력''을 선택했다면 
					//각 회차에 대해 시작 일시와 시간을 넣었는지 확인
					if($('#curriDate').is(':visible')&&$('#radios2').find('.option').eq(1).hasClass('on')){
						
						var i = 2;
						for(i; i < parseInt(TotalTimes) +1;i++){
							if($('#startDate'+i).val()==''){alert(i+'회차의 수업일자를 선택해주세요');return;}
							if($('#startTime'+i).val()==''||$('#endTime'+i).val()==''){
								alert(i+'회차의 수업 시작시간을 선택해주세요');
								return;
							}
						}

					}
				}
				
					var formData = new FormData(this);
					 
					isUploading = true;
					$.ajax({
						type: 'POST',
						url: '/tutor/registerRegionDetail/Proc',
						contentType: false,
						data: formData,
						processData: false,
						success: function (response) {
							parent.cls_date();
						},
						error: function(response) {
							isUploading = false;
						}
					});
					return false;
				});
				
				function calClose() {
					$('#popClassTime').hide();
				}

				//시간표시
				function selectTime(val) {

					var classTime = parseInt() * 10; //회당 학습시간
					var startTime = val; //시작시간
					var endTime = val + classTime; //종료시간 
					var popClassTimes = $('#popClassTimes').val(); //회차
					var startDateStr = ""; //시작 시간대 (오전,오후,저녁) 
					var endDateStr = ""; //종료 시간대 (오전,오후,저녁)
					var minuteStr = ""; //시분 표시
					var timeText = ""; //시간 표시					

					if (startTime < 120) {
						startDateStr = "오전 "
					} else if (startTime >= 120 && startTime < 180) {
						startDateStr = "오후 "
					} else if (startTime >= 180) {
						startDateStr = "저녁 "
					}

					// 12시 넘을시에 1시로 숫자 초기화
					if (startTime < 130) {
						startDateStr = startDateStr
								+ parseInt(startTime / 10);
					} else {
						startDateStr = startDateStr
								+ parseInt((startTime - 120) / 10);
					}

					if (endTime < 120) {
						endDateStr = "오전 "
					} else if (endTime >= 120 && endTime < 180) {
						endDateStr = "오후 "
					} else if (endTime >= 180) {
						endDateStr = "저녁 "
					}

					// 12시 넘을시에 1시로 숫자 초기화
					if (endTime < 130) {
						endDateStr = endDateStr
								+ parseInt(endTime / 10);
					} else {
						endDateStr = endDateStr
								+ parseInt((endTime - 120) / 10);
					}

					if (startTime % 10 == 5) {
						minuteStr = ":30";
					} else {
						minuteStr = ":00";
					}

					timeText = startDateStr + minuteStr + " ~ "
							+ endDateStr + minuteStr;

					$('#startTime' + popClassTimes).val(startTime);
					$('#endTime' + popClassTimes).val(endTime);
					$('#classTime' + popClassTimes).text(timeText);
					$('#back').hide()
					$('#popClassTime').hide();
				}
			</script>
</head>
<body style="margin: 8px; background: transparent;">
<form method="POST" id="frm-register-detail" enctype="multipart/form-data">
	<input type="hidden" id="dateId" name="dateId" value="">
	<input type="hidden" id="talentId" name="talentId" value="">
	<input type="hidden" id="monthDate" class="cal"  name="monthDate">
	<input type="hidden" id="classCount" class="cal" name="classCount" value="4">			
	<div class="tutor_cont">
		<div class="phone_box region_box" id="class_box" style="top:50px">
			<div class="head">
				수업일정
				<span class="button">
					<img src="${cp}/resources/img/cls_w.png" onclick="parent.cls_date()">
				</span>
			</div>
			<div class="box">
				<div class="gray5 title">일정을 등록하세요</div>
				 <div class="formbox">
					<div class="formbox radio" style="height:46px;">
						<div class="option on" value="0" id="DetailTab1"> 수업 시작일 설정 </div>	
					</div>
					<!--수업 시작일  선택시 화면 시작-->
					<div id="dateInuptDiv" style="margin-top:10px">
					<!-- 수업시작일 시작 -->
					<div class="formbox border cal">
						<input type="text" id="startDate1" class="cal hasDat" name="startDate[]" placeholder="수업 시작일을 입력하요"  readonly="readonly">
					</div>
					<c:if test="true">
						<!--수업 시간 선택 시작 -->
						<div style="width:100%;overflow:hidden;">
							<div id="classTime1" class="formbox border calendar">수업 시작 시간</div>
							<input type="hidden" id="startTime1" class="cal" name="startTime1" value="">			
							<input type="hidden" id="endTime1"class="cal" name="endTime1" value="">	
						</div>
					</c:if>			
					<c:choose>
						<c:when test="true">
							<div id="curriDate" style="display:none">
								<div class="formbox" id="radios2" style="overflow:hidden">
									<div class="option" value="3">매주 <font id="dayWeek"></font>요일 반복</div>
									<div class="option " value="4">직접입력</div>
								</div>
								<div class="multisc" id="type" style="display: none;"></div>
							</div>
						</c:when>
						<c:otherwise>
							<div id="curriDate">
								<div class="formbox" id="radios3" style="overflow:hidden">
									<div class="moption" value="3">3개월</div>
									<div class="moption " value="6">6개월</div>
									<div class="moption " value="1">1년</div>
								</div>
							</div>
						</c:otherwise>
					</c:choose>
					<!--다회차 종료-->
					<div id="back" onclick="clspop()"></div>
					<!--시간 입력 팝업 시작 -->
					<div class="popcont calendar" id="popClassTime" style="display:none;">
						<img src="${cp}/resources/img/cls_g.png" id="calCls" onclick="calClose()">
						<div class="inbox">
							<div class="title">
								<img src="${cp}/resources/img/schedule_clock.png" class="clock" style="width:21px;margin-top:2px;position:absolute;margin-left:-23px;">시작 시간 선택
							</div>
							<div class="subinfo">
								튜터님께서 설정하신<br>1회당 수업시간은 <font class="pink">시간</font> 입니다.
							</div>
							<div class="title2">
							오전
							</div>
							<div class="time_cont">
									<div class="time_box" onclick="selectTime(60)">06:00</div>
									<div class="time_box" onclick="selectTime(65)">06:30</div>
									<div class="time_box" onclick="selectTime(70)">07:00</div>
									<div class="time_box" onclick="selectTime(75)">07:30</div>
									<div class="time_box" onclick="selectTime(80)">08:00</div>
									<div class="time_box" onclick="selectTime(85)">08:30</div>
									<div class="time_box" onclick="selectTime(90)">09:00</div>
									<div class="time_box" onclick="selectTime(95)">09:30</div>
									<div class="time_box" onclick="selectTime(100)">10:00</div>
									<div class="time_box" onclick="selectTime(105)">10:30</div>
									<div class="time_box" onclick="selectTime(110)">11:00</div>
									<div class="time_box" onclick="selectTime(115)">11:30</div>
							</div>
							<div class="title2">
								오후
							</div>
								<div class="time_cont">
									<div class="time_box" onclick="selectTime(120)">12:00</div>
									<div class="time_box" onclick="selectTime(125)">12:30</div>
									<div class="time_box" onclick="selectTime(130)">13:00</div>
									<div class="time_box" onclick="selectTime(135)">13:30</div>
									<div class="time_box" onclick="selectTime(140)">14:00</div>
									<div class="time_box" onclick="selectTime(145)">14:30</div>
									<div class="time_box" onclick="selectTime(150)">15:00</div>
									<div class="time_box" onclick="selectTime(155)">15:30</div>
									<div class="time_box" onclick="selectTime(160)">16:00</div>
									<div class="time_box" onclick="selectTime(165)">16:30</div>
									<div class="time_box" onclick="selectTime(170)">17:00</div>
									<div class="time_box" onclick="selectTime(175)">17:30</div>
								</div>
							<div class="title2">
								저녁
							</div>
							<div class="time_cont">
								<div class="time_box" onclick="selectTime(180)">18:00</div>
								<div class="time_box" onclick="selectTime(185)">18:30</div>
								<div class="time_box" onclick="selectTime(190)">19:00</div>
								<div class="time_box" onclick="selectTime(195)">19:30</div>
								<div class="time_box" onclick="selectTime(200)">20:00</div>
								<div class="time_box" onclick="selectTime(205)">20:30</div>
								<div class="time_box" onclick="selectTime(210)">21:00</div>
								<div class="time_box" onclick="selectTime(215)">21:30</div>
								<div class="time_box" onclick="selectTime(220)">22:00</div>
							</div>
							<input type="hidden" id="popClassTimes">
						</div>
					</div>		
					<!--시간 입력 팝업 끝 -->
				</div>
				<!--수업 시작일  선택시 화면 끝-->
	
				<div class="final_box">
					<div class="next button prev" onclick="parent.cls_date()">
					취소
					</div>
					<div class="next button on" onclick="setMode(0);">
					저장
					</div>
				</div>
			</div>
		</div>
		</div>
	</div>
</form>
</body>
</html>

