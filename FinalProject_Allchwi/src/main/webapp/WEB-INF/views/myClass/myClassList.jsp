<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="${cp}/resources/css/myClass/myClassList.css">

<div class="container">
		<!--MyTItleBox head-->
		<div class="title-box">
		    <h1>나의 탈잉</h1>
		    <ul>
		        <li class="cursor on"><a href="/My/MyTuteeClassList/">오프라인</a></li>
		        <li class="cursor"><a href="/My/MyTuteeVodList/">온라인<div class="title-tab-cir">0</div></a></li>
		    </ul>
		</div>		
		<div class="my-class-list">
			<c:forEach var="vo" items="${list}">
			<div class="class-box">
				<div class="class-info"> 
					<div class="image" style="text-align: center;">
						<img src="${cp}/class/getimg?cover_num=${vo.cover_num }">
					</div>
					<div class="information-box">
						<div>신청일시: ${vo.apply_regdate }
						<c:choose>
						<c:when test="${vo.apply_auth==0 }">
							<div class="apply-auth button_gray">승인대기</div>
						</c:when>
						<c:otherwise>						
							<div class="apply-auth button_gray">승인완료</div>
						</c:otherwise>
						</c:choose>
						</div>
						<h3 style="overflow: hidden;text-overflow: ellipsis;white-space: nowrap;">${vo.class_title }</h3>
						<div class="stars-box">
							<font class="class-type">
							<c:choose>
								<c:when test="${vo.class_form=='0' }">
								오프라인
								</c:when>
								<c:otherwise>
								온라인
								</c:otherwise>
							</c:choose>
							</font>&nbsp;|&nbsp; &nbsp;
							<font class="class-stars">
									<img src="https://front-img.taling.me/Content/Images/class/icon_star_new.png" width="15px">
									<img src="https://front-img.taling.me/Content/Images/class/icon_star_new.png" width="15px">
									<img src="https://front-img.taling.me/Content/Images/class/icon_star_new.png" width="15px">
									<img src="https://front-img.taling.me/Content/Images/class/icon_star_new.png" width="15px">
									<img src="https://front-img.taling.me/Content/Images/class/icon_star_new.png" width="15px">								 
							</font>
							<span>	(${vo.class_rating })</span>						
						</div>
						<div class="start-date">
							<font>결제일 : ${vo.pay_regdate }</font>&nbsp;|&nbsp;
							<font>수업 시작일 : <fmt:formatDate value="${vo.class_date }" pattern="yyyy-MM-dd"/> &nbsp;&nbsp;${vo.class_startTime }</font>&nbsp;|&nbsp; 
							<font>${vo.scategory_name} </font>
						</div>
						<jsp:useBean id="today" class="java.util.Date" />
						<fmt:formatDate var="now" value="${today}" pattern="yyyy-MM-dd" />
						<fmt:formatDate var="startDate" value="${vo.class_date }" pattern="yyyy-MM-dd" />
						<c:if test="${startDate >= now && vo.class_finish == '0'}">
							<div class="review-fold cursor on" onclick="classFinish('${vo.apply_num}')" style="display: inline-block; float: left; margin-right: 20px;">수강완료
							</div>
						</c:if>
						<c:if test="${vo.class_finish=='1'}">
							<div class="review-fold cursor on" onclick="review()">리뷰작성
							</div>
						</c:if>
						<div class="price"><font>￦</font><fmt:formatNumber type="number" maxFractionDigits="3" value="${vo.class_fee }" /></div>
					</div>
				</div>
			</div>
			</c:forEach>
			
			<div style="padding-top:100px">
				<ul class="pagination justify-content-center" style="margin: 20px 0">
				<c:choose>
					<c:when test="${pu.startPageNum>1 }">
						<li class="page-item"><a class="page-link"
							href="${cp }/mypage/myClassList?pageNum=${pu.startPageNum-1 }">이전</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item disabled"><a class="page-link" href="#">이전</a></li>
					</c:otherwise>
				</c:choose>



				<c:forEach var="i" begin="${pu.startPageNum}"
					end="${pu.endPageNum }">
					<c:choose>
						<c:when test="${pu.pageNum==i}">
							<li class="page-item active"><a class="page-link"
								href="${cp }/mypage/myClassList?pageNum=${i }">${i }</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link"
								href="${cp }/mypage/myClassList?pageNum=${i }">${i }</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:choose>
					<c:when test="${pu.totalPageCount>pu.endPageNum }">
						<li class="page-item"><a class="page-link"
							href="${cp }/mypage/myClassList?pageNum=${pu.endPageNum+1 }">다음</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item disabled"><a class="page-link" href="#">다음</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
			</div>
		</div>
</div>
<script type="text/javascript"> 
		var pageNum = 1;
		
		
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
		function classFinish(apply_num){

			if (confirm("첫수업 완료시 수업완료를 해주세요.\n정말 완료하시겠습니까?") == true){    

				$.ajax({
				    type: "post",
				    dataType: "text",
				    url: "${cp}/mypage/finishUpdate",
				    data: {apply_num: apply_num},
				    success: function(data) {
				    	if(data == 'success'){
				    		alert('수업완료신청 되었습니다.');
				    		location.href = "${cp}/mypage/myClassList";
				    	}else{				    		
				    		alert('다시 신청해주세요!');
				    	}
				    }
				});

			}else{   //취소

			    return;

			}
		}
		
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