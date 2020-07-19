<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${cp}/resources/css/myClass/myClassList.css">
<div class="container">
		<!--MyTItleBox head-->
		<div class="title-box">
    <h1>나의 탈잉</h1>
    <ul>
        <li class="cursor on"><a href="/My/MyTuteeClassList/">오프라인</a></li>
        <li class="cursor"><a href="/My/MyTuteeVodList/">브오디<div class="title-tab-cir">0</div></a></li>
    </ul>
</div>		<!--MyTItleBox head 마무리-->
		<div class="my-class-list">
					<div class="class-box">
				<div class="class-info"> 
					<a href="/Talent/Detail/19154"><div class="image" style="background-image: url(//s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/Cover/s_8ff4dc58b8016c3dcb963680486ffcfe11f7d256.png);"></div></a>
					<div class="information-box">
						<p>신청일시: 2020-07-19 16:49:49</p>
						<h3 style="overflow: hidden;text-overflow: ellipsis;white-space: nowrap;">[온라인 / 1:1 수업] 손 그림 그리는 프로그램을 활용해 얼굴없이 유튜브 시작하기!</h3>
						<div class="stars-box">
							<font class="class-type">원데이 1:1 </font>&nbsp;|&nbsp; &nbsp;
							<font class="class-stars">
																	<img src="https://front-img.taling.me/Content/Images/class/icon_star_new.png" width="15px">
									<img src="https://front-img.taling.me/Content/Images/class/icon_star_new.png" width="15px">
									<img src="https://front-img.taling.me/Content/Images/class/icon_star_new.png" width="15px">
									<img src="https://front-img.taling.me/Content/Images/class/icon_star_new.png" width="15px">
									<img src="https://front-img.taling.me/Content/Images/class/icon_star_new.png" width="15px">								 
															</font>
							<span>	(21)</span>						</div>
						<div class="start-date">
							<font>결제일 : 2020-07-19 16:53:52</font>&nbsp;|&nbsp;
							<font>수업 시작일 : 2020-07-26&nbsp;&nbsp;17:00</font>&nbsp;|&nbsp; 
							<font>온라인</font>
						</div>
						<div class="review-fold cursor on" onclick="review(this)">리뷰작성
						<div class="arrw-box"><img src="https://front-img.taling.me/Content/Images/class/icon_btn_down.png" class="arrw down"><img src="https://front-img.taling.me/Content/Images/class/icon_btn_up.png" class="arrw up"></div></div>
						<div class="price"><font>￦</font>19,000원</div>
					</div>
				</div>
								<div class="review-info textarea">
					<div><textarea placeholder="리뷰를 작성해주세요" name="Content" id="reviewContent19154"></textarea></div>
					<div class="stars-box">
						<div class="stars">
							<i class="glyphicon glyphicon-star active" data-value="1"></i>
							<i class="glyphicon glyphicon-star active" data-value="2"></i>
							<i class="glyphicon glyphicon-star active" data-value="3"></i>
							<i class="glyphicon glyphicon-star active" data-value="4"></i>
							<i class="glyphicon glyphicon-star active" data-value="5"></i>
							<input type="hidden" name="priceScore" id="priceScore19154" value="5">
							<font>5.0</font> (커리큘럼, 전달력, 준비성, 친절도, 시간준수)
						</div>
						<div class="regi-button cursor" onclick="reviewRegi(19154,0)">
							등록
						</div>
					</div>
				</div>
	</div>
			
			<div style="padding-top:100px"></div>
		</div>
</div>
<script type="text/javascript"> 
		$(function(){
			$('#more-button').click(function(){
				if($('#more-button').attr('value')=='0'){
					$('#more-button').attr('value','1');
					$('.container .class-box').show();
					$('#more-button').find('#more-text').text('접기');
					$('#more-button').find('.up').show();
					$('#more-button').find('.down').hide();
				}else{
					$('#more-button').attr('value','0');
					$('.container .class-box').hide();
					$('.container .class-box').slice(0,4).show();
					$('#more-button').find('#more-text').text('더보기');
					$('#more-button').find('.down').show();
					$('#more-button').find('.up').hide();
				}
			});
		});
		function reviewRegi(Id,status){
			// 수업 id 넘버 받아오기. ajax 로 던지기
			// status ( 0:등록,1:수정,2:삭제);

			if ($('#reviewContent'+Id).val() == '')
			{
				alert('리뷰 내용을 등록해주세요.');
				return false;

			}

			if ($('#priceScore'+Id).val() == '')
			{
				alert('별점을 선택해주세요.');
				return false;

			}
			
			var p = [];
            var content_data = $('#reviewContent'+Id).val();
            content_data = content_data.replace(/&/gi,"%26");
			p.push('talentId='+Id);	
			p.push('status='+status);
			p.push('content='+content_data);
			p.push('priceScore='+$('#priceScore'+Id).val());

			var pars = p.join('&');
			
			var Ajax = new Ajax2();
			Ajax.init('/My/MyTuteeProc.php', {
				method: 'post'
				, parameters: pars
				, idTarget: ''
				, oSelf: this
				, onCreate: function(){}
				, onComplete: function(oXHR)
				{	
					if(oXHR.responseText =='0000')
					{
						if(status == 0){ //신규등록 status 0
							alert('리뷰 작성이 완료 되었습니다');
							location.reload();
						}else if(status == 1){ //수정 status 1
							alert('리뷰 수정이 완료 되었습니다');
							location.reload();
						}else if(status == 2){ //삭제 status 2
							alert('리뷰 삭제가 완료 되었습니다');
 							location.reload();
						}
					}
					else
					{
						alert(oXHR.responseText);
					}
				}
			});			
		}

		function review(elm){
			if($(elm).parent().parent().next('.review-info').css('display')!='none')
			{
				$(elm).find('.arrw-box').children('img').show();
				$(elm).find('.arrw-box').find('.up').hide();
				$(elm).parent().parent().next('.review-info').hide();
			}else{
				$(elm).find('.arrw-box').children('img').show();
				$(elm).find('.arrw-box').find('.down').hide();
				$(elm).parent().parent().next('.review-info').show();	
			}
		}
		function fixtab(elm){
			if($(elm).next('.tab').css('display')!='none')
			{
				$(elm).next('.tab').hide();
			}else{
				$(elm).next('.tab').show();	
			}
		}
		function review_modify(val){
			var val = val;
			$('#review'+val).hide();
			$('#reviewModify'+val).show();
		}

		//별 시작
$('.stars i').click(function () {
	var val = Number($(this).data('value'));

	var parent = $(this).parent();
	var children = parent.children('i');
	var childrenInput = parent.children('input');
	
	for (var i = 0; i < 5; i++) {
		$(children[i]).removeClass('active');

		if (i < val) {
			$(children[i]).addClass('active');
		}
	}

	$(parent.children('input')).val(val);
	$(parent.children('font')).text(val+'.0');
});

 


	</script>