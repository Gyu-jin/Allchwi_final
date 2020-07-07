<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${cp}/resources/css/classEnrollment/classEnrollment.css">
<script>

	function nextClassPage(e){
		$('#pills-tab li:nth-child('+ e +') a').target;
		$('#pills-tab li:nth-child('+ e +') a').relatedTarget;
		$('#pills-tab li:nth-child('+ e +') a').tab('show');
	}
	function formatMoney(val) {
		if (val.length < 4)
			return val;
		return formatMoney(val.substring(0, val.length - 3)) + ',' + val.substring(val.length - 3, val.length);
	}
	updateCalculation();
	function updateCalculation() { //다회차일때
		
		
		var unitPrice = Number($('#UnitPrice').val());
		var time = Number($('#Time').val());
		var totalTimes = Number($('#TotalTimes').val());

		var x = $('#TotalTimes').val();
		if(x && x.length > 0) {
			if(!$.isNumeric(x)) {
				x = x.replace(/[^0-9]/g,"");
			}
			$('#TotalTimes').val(x);
		}
		
		$('#calc-unit-price').text(formatMoney(unitPrice.toString()));
		$('#calc-time').text(time);
		$('#calc-total-times').text(totalTimes);

		$('#calc-result').text(formatMoney((unitPrice * time * totalTimes).toString()));
		$('#calc-fee').text(formatMoney(unitPrice.toString()));
		$('#calc-fee2').text(formatMoney(unitPrice.toString()) + '원');
		$('#calc-fee3').text(formatMoney(unitPrice.toString()) + '원');
		$('#calc-fee4').text(formatMoney(unitPrice.toString())+'원' );
		$('#calc-fee5').text(formatMoney(unitPrice.toString()) + '원');

		$('#calc-result2').text(formatMoney((unitPrice * time * totalTimes - unitPrice).toString()) + '원');
	}
	
	$('#UnitPrice').change(updateCalculation);
	$('#Time').change(updateCalculation);
	$('#TotalTimes').change(updateCalculation);
</script>
<div class="classOpen">

<div class="title_box">
	<!-- Nav 부트스트랩 목록 -->
	<h3>튜터 등록</h3>
	<div class="steps">
		<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
			<li class="nav-item" role="presentation">
				<a class="nav-link active" id="pills-home-tab" data-toggle="pill"
					href="#pills-info" role="tab" aria-selected="true">01기본정보</a>
			</li>
			<li class="nav-item" role="presentation">
				<a class="nav-link" id="pills-profile-tab" data-toggle="pill" href="#pills-title"
					role="tab" aria-selected="false">02제목/이미지</a>
			</li>
			<li class="nav-item" role="presentation">
				<a class="nav-link"	id="pills-contact-tab" data-toggle="pill" href="#pills-price"
					role="tab" aria-selected="false">03가격</a>
			</li>
			<li class="nav-item" role="presentation">
				<a class="nav-link"	id="pills-contact-tab" data-toggle="pill" href="#pills-class"
					role="tab" aria-selected="false">04수업</a>
			</li>
		</ul>
	</div>
</div>

<!-- 선택된 페이지 출력 -->
<div class="tab-content" id="pills-tabContent">
	<!-- 01튜터 기본정보 입력 페이지 -->
	<div class="tab-pane fade show active" id="pills-info" role="tabpanel">
		<div class="info1">
            <span class="pink">*</span>필수
        </div>
		<div class="box">
			<div class="title">
				튜터번호인증<b class="pink">*</b>
			</div>
			<div class="cont input-group col-5">
				<input type="text" id="phone" name="phone" class="form-control" placeholder="개인연락처를 - 없이 입력해주세요."> 
			</div>
		</div>

	<div class="box">
		<div class="title">
			프로필사진<b class="pink">*</b>
		</div>
		<div class="cont">
			<div class="caution caution1">
				<b class="pink">주의</b><br> <span class="gray8">* 얼굴이 나오지
					않은 동물/캐릭터/단순배경사진/증명사진은 승인되지 않습니다.</span><br>
			</div>
			<div style="margin: 30px 0">
				<img class="upf_b" src="${cp}/resources/img/btn_pfimg.png">
				<div class="upf" id="picture-cover"
					style="background-image:url('${cp}/resources/img/profile-defaultImg.jpg')">
					<input type="hidden" id="ProfileThumbnailUrl" value="${cp}/resources/img/profile-defaultImg.jpg"> 
					<input type="file" id="picture" name="picture" style="width: 150px; height: 130px; opacity: 0;">
				</div>
			</div>
			<script>
				$('#picture').change(function(e) {
									var file = (e.target || window.event.srcElement).files[0];

									var reader = new FileReader();
									reader.onload = function() {
										$('#picture-cover').css(
												"background-image",
												"url('" + reader.result + "')");
									}
									reader.readAsDataURL(file);
								});
			</script>
		</div>
	</div>
	<div class="box">
		<div class="title">
			별명<b class="pink">*</b>
		</div>
        <div class="input-group col-5">
        	<input type="text" class="form-control" id="nickname" name="nickname" placeholder="튜터님의 정체성을 가장 잘 드러낼 수 있는 별명을 입력해주세요.">
        </div>
    </div>
	<div class="box">
            <div class="title">인증<b class="pink">*</b></div>
            <div class="cont">
                <div class="caution caution2">
                    <div class="pink" style="padding-bottom:5px;font-weight:600;">인증 가이드</div>

                    <ul class="gray8">
                        <li>수강생들에게 신뢰를 주기 위해 신분 또는 학력 인증은 필수입니다.</li>
                        <li>파일은 jpg, png, gif, bmp등 이미지 파일만 가능합니다.</li>
                        <li>관리자 확인 후 업로드해주신 파일은 바로 삭제됩니다.</li>
                        <li>튜터등록은 내국인 또는 취업비자를 소지한 외국인만 가능합니다.</li>
                    </ul>
                </div>
                <div class="inner1">
                    <div class="certificate_title">
                    	자격증
	                    <font class="certificate_gray">
	                   		 날짜/자격증/주관사 공인 확인 가능한 자격증 사본(최대 10개)
	                    </font>
                    </div>
                    <input type="hidden" name="deleteCert" id="deleteCert" value="">
                    <div class="certificate" style="position: relative;">
                    	<input type="text" class="form-control col-8" name="certName[]" placeholder="예) 토익900,HSK 6급,GTQ1급, 임상경력 등" style="display: inline;">
                        <div class="verify left10" style="position: absolute;">업로드</div>
                        <input type="file" name="cert[]" style="width:80px;height:50px;position:absolute;top:0;opacity:0;cursor:pointer; z-index: 2">
                        <div style="padding-top:10px;" class="col-4">
                            <img alt="" id="img-Cert0" style="float: none; margin: 0 auto; position:fixed ; overflow: hidden; max-width:400px;">
                        </div>
                    </div>
                    <div class="plus btn_hover" onclick="add_certificate()">
                        <img src="https://front-img.taling.me/Content/Images/tutor/Images/icon_add_wh.png"> 자격증추가
                    </div>
                </div>
            </div>
        </div>
	    <div class="button_box">
	         <button type="button" class="btn btn-outline-danger"  onclick="nextClassPage(2)">다음단계</button>
	    </div>
	</div>
	
	
	<!-- /////////////////// 02제목/이미지 페이지  /////////////////////-->
	<div class="tab-pane fade" id="pills-title" role="tabpanel">	
		<div class="info1">
            <span class="pink">*</span>필수
        </div>
        <div class="box">
        	<div class="title">수업등록지역<b class="pink">*</b></div>
        	<div class="cont">
        		<input type="text" class="form-control col-4"id="address" placeholder="수업 대표지역을 검색해주세요." onclick="execDaumPostcode()">
				<div id="map" style="width:60%;height:300px;margin-top:10px;display:none"></div>
				
				<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
				<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=472c28df1aaa1946fb26fe353232eace&libraries=services"></script>
				<script>
				    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
				        mapOption = {
				            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
				            level: 4 // 지도의 확대 레벨
				        };
				    
				    //지도를 미리 생성
				    var map = new daum.maps.Map(mapContainer, mapOption);
				    
				    //지도 드래그 막기
				    map.setDraggable(false);  
				    // 마우스 휠로 지도 확대,축소 가능여부를 설정합니다
				    map.setZoomable(false); 
				    
				    //주소-좌표 변환 객체를 생성
				    var geocoder = new daum.maps.services.Geocoder();
				    //마커를 미리 생성
				    var marker = new daum.maps.Marker({
				        position: new daum.maps.LatLng(37.537187, 127.005476),
				        map: map
				    });
				
				
				    function execDaumPostcode() {
				        new daum.Postcode({
				            oncomplete: function(data) {
				                var addr = data.address; // 최종 주소 변수
				
				                // 주소 정보를 해당 필드에 넣는다.
				                document.getElementById("address").value = addr;
				                // 주소로 상세 정보를 검색
				                geocoder.addressSearch(data.address, function(results, status) {
				                    // 정상적으로 검색이 완료됐으면
				                    if (status === daum.maps.services.Status.OK) {
				
				                        var result = results[0]; //첫번째 결과의 값을 활용
				
				                        // 해당 주소에 대한 좌표를 받아서
				                        var coords = new daum.maps.LatLng(result.y, result.x);
				                        // 지도를 보여준다.
				                        mapContainer.style.display = "block";
				                        map.relayout();
				                        // 지도 중심을 변경한다.
				                        map.setCenter(coords);
				                        // 마커를 결과값으로 받은 위치로 옮긴다.
				                        marker.setPosition(coords)
				                    }
				                });
				            }
				        }).open();
				    }
				</script>
        	</div>
        </div>
        
		<div class="box">
			<div class="title">수업등록지역(대표)<b class="pink">*</b></div>
			<div class="cont row">
				<select class="custom-select col-3" id="CateMain" name="regionMain" onchange="addSelect2(this.value)">
					<option>수업 대표 지역을 선택해 주세요</option>
				</select>
				<select class="custom-select col-3" id="CateSub" name="regionSub">				
				</select>
			</div>
		</div>
		<div class="box" id="classBox">
		<div class="title">수업형태<b class="pink">*</b></div>
			<div class="cont">
				<div class="rds">
					<input type="hidden" value="0" name="classOption" id="classOption">
					<!--classOption 0이면 원데이 / 1 이면 다회차-->
					<div class="rd"><label id="classOption0" onclick="rd(0,0)" class="on"></label>오프라인 클래스</div>
					<div class="rd"><label id="classOption1" onclick="rd(0,1)" class=""></label>온라인 수업</div>
				</div>
				<script>
					function rd(elm,val){	
						var num =val;
						var name = '';
						if(elm=='0'){//수업형태
							$('#classOption').val(num);
							name = "#classOption"+num;
							if(num){
								$('#classOption-info0').hide();
								$('#classOption-info1').show();
							}else{
								$('#classOption-info0').show();
								$('#classOption-info1').hide();
							}
							$('#classOption0').removeClass('on');$('#classOption1').removeClass('on');
						}
						else{//elm==1 // 수업참여인원
	
							$('#groupOption').val(num);
							name = "#groupOption"+num;
							$('#groupOption0').removeClass('on');$('#groupOption1').removeClass('on');
	
							if(num==0)
							{
								$('#minmax').hide();
							}
							else
							{
								$('#minmax').show();
							}
						}
						$(name).addClass('on');
					}
					$(function(){
						rd(0,0);
						rd(1,0);
					});
				</script>
				<div class="inner3 gray5" id="classOption-info0" style="display: block;">
					* 시범강의가 아닌, 하루 만에 무언가를 얻어갈 수 있는 원데이 클래스를 준비해주세요.
				</div>
				<div class="inner3 gray5" id="classOption-info1" style="display: none;">
					* 다회차 수업일 때 탈잉 수강생들은 보통 <span class="pink">4~6회차 수업</span>을 선호합니다.<br>
					되도록 한 달 내에 끝낼 수 있도록 커리큘럼을 만들어주세요.
				</div>
			</div>
		</div>
		<div class="box" id="groupBox">
			<div class="title">수업참여인원<b class="pink">*</b></div>
			<div class="cont">
				<div class="rds">
					<input type="hidden" value="1" name="groupOption" id="groupOption">
					<!--classOption 0이면 1:1 / 1 이면 그룹-->
					<div class="rd"><label id="groupOption0" onclick="rd(1,0)" class=""></label>1:1 수업</div>
					<div class="rd"><label id="groupOption1" onclick="rd(1,1)" class="on"></label>그룹수업</div>
				</div>
				<div class="inner2" style="display: block;" id="minmax">
					<select class="custom-select col-3" id="MinPerson" name="MinPerson">
						<option value="">최소인원수</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
						<option value="7">7</option>
						<option value="8">8</option>
						<option value="9">9</option>
						<option value="10">10</option>
						<option value="11">11</option>
						<option value="12">12</option>
						<option value="13">13</option>
						<option value="14">14</option>
						<option value="15">15</option>
						<option value="16">16</option>
						<option value="17">17</option>
						<option value="18">18</option>
						<option value="19">19</option>
						<option value="20">20</option>
						<option value="30">30</option>
						<option value="40">40</option>
						<option value="50">50</option>
					</select>
					 명 ~ 
					<select class="custom-select col-3" id="MaxPerson" name="MaxPerson">
						<option value="">최대인원수</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
						<option value="7">7</option>
						<option value="8">8</option>
						<option value="9">9</option>
						<option value="10">10</option>
						<option value="11">11</option>
						<option value="12">12</option>
						<option value="13">13</option>
						<option value="14">14</option>
						<option value="15">15</option>
						<option value="16">16</option>
						<option value="17">17</option>
						<option value="18">18</option>
						<option value="19">19</option>
						<option value="20">20</option>
						<option value="30">30</option>
						<option value="40">40</option>
						<option value="50">50</option>
					</select>
					
					<div class="inner3 gray5">
						탈잉 수강생들이 선호하는 그룹수업은 평균적으로 <span class="pink">2~6인 내외</span>입니다.<br><br>
						* 그룹수업인데 일대일 수업도 가능한 경우, 수업소개 페이지에 별도 기재 부탁드립니다.<br>
						&nbsp;&nbsp;ex) 일대일 수업을 원하는 경우, 실시간톡으로 문의주세요.
					</div>
				</div>			
			</div>
		</div>
		<div class="box">
			<div class="title">수업제목<b class="pink">*</b></div>
			<div class="cont">
				<div class="inner1">
					<input type="text" class="form-control col-7" id="Title" name="Title"  placeholder="수강생을 끌어당길 수 있는 개성넘치는 제목을 만들어 보세요.">
				</div>
			</div>
		</div>
		
		<div class="box">
		<div class="title">커버이미지<b class="pink">*</b><br><br></div>
		<div class="cont">
			<div class="drag_cont">
				<div class="drag_box" id="dropZone">
					<div class="imgupbt" id="dragInfo">
						<img src="https://front-img.taling.me/Content/Images/Tutor/Images/icon_img_area.png"><br><br>
						이미지를 드래그 해주세요
					</div>
				</div>
				<div class="right">
					<input id="imgnonefile" name="picture" accept="image/*" style="position: absolute;opacity:0;cursor:pointer;" type="file">
					<div class="plus button" id="imgUp" data-send="coverImage"><img src="https://front-img.taling.me/Content/Images/Tutor/Images/icon_add_wh.png"> 이미지추가</div><br>
					<div class="verify" style="margin:10px 0" onclick="deleteImage()"><img src="https://front-img.taling.me/Content/Images/Tutor/Images/icon_del_bk.png"> 이미지삭제</div>
					<div style="margin-top:40px">
						<span class="pink">권장사항</span><br><br>
						<span class="gray5">- <font class="pink">10MB 이하의</font> jpg,jpeg,png 파일<br></span>
					</div>
				</div>
			</div>
			
			<script>	
				$(function(){
					$('[data-send]').click(function (e) {
						$('#targetId').val($(this).attr('data-send'));
						$('#filter').show();
						$('#image_box').show();
					});

					$('#imgUp').click(function(e){
						$('#imgnonefile').click();
					});
				});

				function hd_imbox(){
					$('#filter').hide();
					$('#image_box').hide();
					$('#targetId').val('');									
				}

				// 파일 리스트 번호
				var fileIndex = 0;
				// 등록할 전체 파일 사이즈
				var totalFileSize = 0;
				// 파일 리스트
				var fileList = new Array();
				// 파일 사이즈 리스트
				var fileSizeList = new Array();
				// 등록 가능한 파일 사이즈 MB
				var uploadSize = 10;
				// 등록 가능한 총 파일 사이즈 MB
				var maxUploadSize = 100;

				var selectIndex = 0;
			 
				$(function (){
					// 파일 드롭 다운
					fileDropDown();
				});
			 
				// 파일 드롭 다운
				function fileDropDown(){
					var dropZone = $("#dropZone");
					//Drag기능 
					dropZone.on('dragenter',function(e){
						e.stopPropagation();
						e.preventDefault();
						// 드롭다운 영역 css
						//dropZone.css('background-color','#E3F2FC');
					});
					dropZone.on('dragleave',function(e){
						e.stopPropagation();
						e.preventDefault();
						// 드롭다운 영역 css
						//dropZone.css('background-color','#FFFFFF');
					});
					dropZone.on('dragover',function(e){
						e.stopPropagation();
						e.preventDefault();
						// 드롭다운 영역 css
						//dropZone.css('background-color','#E3F2FC');
					});
					dropZone.on('drop',function(e){								
						e.preventDefault();
						// 드롭다운 영역 css
						//dropZone.css('background-color','#FFFFFF');
						
						var files = e.originalEvent.dataTransfer.files;
						if(files != null){
							if(files.length < 1){
								alert("폴더 업로드 불가");
								return;
							}
							selectFile(files);

						}else{
							alert("ERROR");
						}
					});								
				}
			 
				// 파일 선택시
				function selectFile(fileObject){
					var files = null;
			 
					if(fileObject != null){
						// 파일 Drag 이용하여 등록시
						files = fileObject;
					}else{
						// 직접 파일 등록시
						//files = $('#multipaartFileList_' + fileIndex)[0].files;
					}
					
					// 다중파일 등록
					if(files != null){
						for(var i = 0; i < files.length; i++){
							// 파일 이름
							var fileName = files[i].name;
							var fileNameArr = fileName.split("\.");
							// 확장자
							var ext = fileNameArr[fileNameArr.length - 1];
							// 파일 사이즈(단위 :MB)
							var fileSize = files[i].size / 1024 / 1024;
							
							if($.inArray(ext, ['exe', 'bat', 'sh', 'java', 'php', 'html', 'js', 'css', 'xml']) >= 0){
								// 확장자 체크
								alert("등록 불가 확장자");
								break;
							}else if(fileSize > uploadSize){
								// 파일 사이즈 체크
								alert("용량 초과\n업로드 가능 용량 : " + uploadSize + " MB");
								break;
							}else{
								// 전체 파일 사이즈
								totalFileSize += fileSize;
								
								// 파일 배열에 넣기
								fileList[fileIndex] = files[i];
								
								// 파일 사이즈 배열에 넣기
								fileSizeList[fileIndex] = fileSize;
			
								// 업로드 파일 목록 생성
								innerImg(files[i], fileIndex);

								selectIndex = fileIndex;
								
								// 파일 번호 증가
								fileIndex++;
							}

							// 첫번째 테두리 
							
							
						}
					}else{
						alert("ERROR");
					}
				}

				function onImage(val, num)
				{
					$('#dropZone').css({'background':'url('+val+')', 'background-repeat' : 'no-repeat', 'background-position':'center' , 'background-size':'cover' , 'box-sizing':'border-box'});

					$('#dragInfo').hide();

					selectIndex = num;
				}

				function deleteImage(){
					// 전체 파일 사이즈 수정
					totalFileSize -= fileSizeList[selectIndex];
					
					// 파일 배열에서 삭제
					delete fileList[selectIndex];
					
					// 파일 사이즈 배열 삭제
					delete fileSizeList[selectIndex];
					
					// 업로드 파일 테이블 목록에서 삭제
					$("#img-cover" + selectIndex).remove();
					$('#dragInfo').show();

					$('#dropZone').css({'background':'url()', 'background-color':'#edf0f4', 'background-repeat' : 'no-repeat', 'background-position':'center' , 'background-size':'cover' , 'box-sizing':'border-box'});
				}

				
				function innerImg(files, num)
				{
					var reader = new FileReader();											
					reader.readAsDataURL(files);
					var html = "";
					var on = "";
					
					reader.onload = function() {									
												
						var oImg = ($('<div>').attr('id', 'img-cover'+num)
							.addClass('cover_img')
							.css({'background-image':'url('+reader.result+')'})										
						).on({
							'click': function() { onImage(reader.result, num) }
						});

						oImg.append($('<img>').attr('src', reader.result)
							.data('fileData', files)
							.css({'width':'0','height':'0'})										
						);
		
						$('#fileList').append(oImg);										
						
						$('#dragInfo').hide();
						$('#dropZone').css({'background':'url('+reader.result+')', 'background-repeat' : 'no-repeat', 'background-position':'center' , 'background-size':'cover' , 'box-sizing':'border-box'});
					};
					reader.onloadend = function() {						
						$('#fileList').find('div').removeClass('on');
						$('#fileList div:first-child').addClass('on');

					};							
				}						 
				
				$('#imgnonefile').change(function (e) {
					var file = (e.target || window.event.srcElement).files[0];					
					innerImg(file, fileIndex)
					fileIndex++;
				});							
			</script>
			<div style="display:inline;padding:2px 7px;border-radius:3px;position:absolute;background:#ff005a;color:#fff;font-size:12px;line-height:1;margin-top:8px;" class="">
				첫 번째
			</div>
			<div style="overflow:hidden" id="fileList" class="ui-sortable">

				<script class="ui-sortable-handle" style="">fileIndex = 1</script>
			</div>
			<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
			<script>
				$("#fileList").sortable();
				$("#fileList").disableSelection();
				$("#fileList").sortable({
				  out: function( event, ui ) {					
					$('#fileList').find('div').removeClass('on');
					$('#fileList div:first-child').addClass('on');
				  }
				});
			</script>
		</div>
		</div>	
		<div class="button_box">
	         <button type="button" class="btn btn-outline-danger" onclick="nextClassPage(3)">다음단계</button>
		</div>
	</div>
	<!-- ///////////////////////// 03겨격 /////////////////////// -->
	<div class="tab-pane fade" id="pills-price" role="tabpanel">
		<div class="info1">
            <span class="pink">*</span>필수
        </div>
        <div class="box">
			<div class="title">가격/시간/횟수<b class="pink">*</b></div>
			<div class="cont">
				<div class="inner1" style="margin:0">
					<div class="gray5 title">시간당 가격</div>
					<input type="text" id="UnitPrice" name="UnitPrice" class="form-control col-4" placeholder="시간당 가격을 입력하세요" style="display: inline-block;">원
				</div>
				<script>
					$('#UnitPrice').change(function(){updateCalculation()});
				</script>
				<div class="inner1">
					<div class="gray5 title">1회당 수업시간</div>
					<select class="custom-select col-4" id="Time" name="Time">
						<option value="0">1회당 수업시간을 선택하세요</option>
						<option value="1" selected="">1시간</option>
						<option value="2">2시간</option>
						<option value="3">3시간</option>
						<option value="4">4시간</option>
						<option value="5">5시간</option>
						<option value="6">6시간</option>
					</select>
					<script>
						$('#Time').change(function(){updateCalculation()});
					</script>
					시간
				</div>
				<div class="inner1">
					<div class="gray5 title">총 수업횟수</div>			
									
						<select id="TotalTimes" name="TotalTimes" class="custom-select col-4">
							<option value="0">총 수업횟수를 선택하세요</option>
							<option value="2">2회</option>
							<option value="3">3회</option>
							<option value="4">4회</option>
							<option value="5">5회</option>
							<option value="6">6회</option>
						</select>회
				</div>
				<script>
					$('#TotalTimes').change(function(){updateCalculation()});
				</script>
			</div>
		</div>
        <div class="box">
		<div class="title">총 수업가격<b class="pink"></b></div>
			<div class="cont">
				<div class="caution caution2" style="overflow:hidden">
					<font><span id="calc-unit-price">0</span>원&nbsp;&nbsp;X&nbsp;&nbsp;<span id="calc-time">0</span>시간&nbsp;&nbsp;X&nbsp;&nbsp;<span id="calc-total-times">0</span>회</font>
					<div class="rs">
						총&nbsp;&nbsp;<font class="pink"><b><span id="calc-result">0</span></b>원</font><br>
						연결수수료&nbsp;&nbsp;<b><span id="calc-fee">0</span></b>원
					</div>
				</div>
			</div>
		</div>
		<div class="button_box">
	         <button type="button" class="btn btn-outline-danger" onclick="nextClassPage(4)">다음단계</button>
		</div>
	</div>
	
	<!-- ////////////////////// 수업 상세입력 ///////////////////////// -->
	<div class="tab-pane fade" id="pills-class" role="tabpanel">
		<div class="box">
			<div class="title">튜터소개<b class="pink">*</b></div>
			<div class="cont" style="padding-top:15px">
				<div class="inner1">
					<textarea class="basic len980 form-control" placeholder="수강생은 튜터님에 대해 많은 관심을 가지고 있습니다. TIP을 참고하여 최대한 자세히 소개를 해주세요." id="TutorInfo" name="TutorInfo"></textarea>
				</div>
			</div>
		</div>	
		<div class="box">
			<div class="title">수업소개<b class="pink">*</b></div>
				<div class="cont">
					<div class="inner1">
						<textarea class="basic len980 form-control" placeholder="수업소개는 수강생이 가장 주의깊게 살펴보는 부분입니다. 수강생들이 수업에 대해 알 수 있도록 TIP의 질문을 반드시 포함하여 작성해주세요." id="Introduction" name="Introduction"></textarea>
					</div>
				</div>
		</div>
		<div class="box">
			<div class="title">수업대상<b class="pink">*</b></div>
			<div class="cont">
				<div class="inner1">
					<textarea class="basic len980 form-control" placeholder="TIP의 내용을 참고하여 튜터님의 수업을 수강하기에 적합한 수업대상에 대해 알려주세요. " id="Target" name="Target"></textarea>
				</div>
			</div>
		</div>
		<div class="box">
			<div class="title">커리큘럼<b class="pink">*</b></div>
			<div class="cont">

				<!--여기서부터 커리큘럼 가져와서 붙인것 from Tutor2/default03.php-->
				<div class="curri inner1" id="Curri1">
					<div class="index">
						<b>1</b>회차
					</div>
					<div class="box">
						<textarea class="basic len980 form-control" placeholder="커리큘럼을 입력해 주세요." id="Curriculum1" name="Curriculum1"></textarea>
					</div>
				</div>
				<div class="curri" id="Curri2">
					<div class="index">
						<b>2</b>회차
					</div>
					<div class="box">
					<textarea class="basic len980 form-control" placeholder="커리큘럼을 입력해 주세요." id="Curriculum2" name="Curriculum2"></textarea>
					</div>
				</div>
				<div class="curri" id="Curri3">
					<div class="index">
						<b>3</b>회차
					</div>
					<div class="box">
					<textarea class="basic len980 form-control" placeholder="커리큘럼을 입력해 주세요." id="Curriculum3" name="Curriculum3"></textarea>
					</div>
				</div>
				<div class="curri" id="Curri4" style="display: none;">
					<div class="index">
						<b>4</b>회차
					</div>
					<div class="box">
						<textarea class="basic len980 form-control" placeholder="커리큘럼을 입력해 주세요." id="Curriculum4" name="Curriculum4"></textarea>
					</div>
				</div>
			</div>
		</div>
		<div class="button_box">
	       	<button type="button" class="btn btn-outline-danger" onclick="setMode();">튜터등록 완료</button>
		</div>
	</div>
</div>
</div>
