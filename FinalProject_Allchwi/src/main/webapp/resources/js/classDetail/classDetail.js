$(function(){
	var navOffset = $('.class_navi').offset();
	$(window).scroll(function() {
		if ($(document).scrollTop() > navOffset.top) {
			$('.class_navi').addClass('active');

		} else {
			$('.class_navi').removeClass('active');
		}
	});
	var remoteOffset = $('.remote').offset();
	$(window).scroll(function() {
		if ($(document).scrollTop() > remoteOffset.top) {
			$('.remote').addClass('active');
		} else {
			$('.remote').removeClass('active');
		}
	});
	$("#class_navi a").click(function() {
		$(this).addClass('on');
		$("#class_navi a").not(this).removeClass('on');
	});
	$("#card-header collapse").click(function() {
		$(this).addClass('show');
	});
	qnaList(1);

		
});
///////////////////////////qna /////////////////////////////////
//qna작성
$(document).on('click', '#btn_write_qna', function () {
	var qna_content = $('#qna_content').val();
	var class_num = $('#class_num').val( );
	var ml_num = $('#ml_num').val();
	if(qna_content== '' ){
		alert('내용을 작성해주세요');
	}else{
		class_num=class_num;
		ml_num=ml_num;
		if (ml_num=='') {
			alert('로그인이 필요합니다');
		}else {
			$.post('/allchwi/classDetail/qna', {
				class_num: class_num,
				ml_num: ml_num,
				qna_content:qna_content,
				qna_lev: '0'
			}, function (data,res) {
				if (res=='success') {
					qnaList(1);
					alert('문의등록 성공');
					$("#qna_content").val("");
				} else {				
					alert('문의실패');
				}
			});
		}
	}
});
//qna목록
function qnaList(pageNum){
	var class_num = $('#class_num').val();
	 $.getJSON("/allchwi/classDetail/qnalist?class_num="+ class_num+"&pageNum="+pageNum, function(data){
	  var str = "";
	  var qlist=data.qlist;
	  var pu=data.pu;
	  $(qlist).each(function(i){
	   var qna_regdate = new Date(qlist[i].qna_regdate);
	   qna_regdate = qna_regdate.toLocaleDateString("ko-US")
	   var img = "//user-images.githubusercontent.com/65140754/87009744-92636f00-c200-11ea-88b2-252fb36f6fa3.png";
	   str += "<div class='qna_list'>" 
		 + "<ul>"
		 + "<li>"
		 + "<input type='hidden' id='qna_ref' value='"+qlist[i].qna_ref+"'>"
	     + "<dl>"
	     + "<dt>"
	     + "<p class='profile_img' style='width: 50px; height: 50px; background-size: cover; background-position: center; background-image: url("+ img +")'>"
	     + "</p>"
	     + "<p class='name'>"+qlist[i].miv.mb_name+"</p>"
	     + "</dt>"
	     + "<dd>" + qlist[i].qna_content  + "</dd>"
	     + "<dd class='date'>" + qna_regdate + "</dd>"
	     + "</dl>"
	     + "</li>"
	     + "<a type='button' class='showreply' onclick='replyList("+qlist[i].qna_ref+")' data-toggle='collapse' data-target='#reply"+this.qna_ref +"'>"
		 + "<svg width='1em' height='1em' viewBox='0 0 16 16' class='bi bi-chevron-down'"
		 + "fill='currentColor' xmlns='http://www.w3.org/2000/svg'"
		 + "path fill-rule='evenodd' d='M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z'/>"
		 + "</svg>" +"댓글"+ "</a>"
		 +"<div class='reply_box collapse' id='reply"+qlist[i].qna_ref+"'>"
		 +"<table>"
		 +"<tr>"
		 +"<td>"
		 +"<form>"
		 +"<div class='form-group'>"
		 +"<textarea class='form-control reply_content' id='reply_content"+qlist[i].qna_ref+"' cols='60' rows='3'></textarea>"
		 +"</form>"
		 +"</td>"
		 +"<td>"
		 +"<input type='button' id='reply_send' onclick='sendReply("+qlist[i].qna_ref+")' class='btn btn-primary' value='등록'>"
		 +"</td>"
		 +"</tr>"
		 +"</table>"
		 +"</div>"
		 +"<div class='reply_list' id='reply"+qlist[i].qna_ref+"'>"
		 +"<ul>"
		 +"</ul>"
		 +"</div>"
		 +"</div>"
		 +"</ul>"
		 +"</div>";
		
	  });
	  str+="<div id='paging'>"
		  +"<ul>";
	  
	  for (var j = pu.startPageNum; j <= pu.endPageNum; j++) {                                    
	      if(j == pageNum) {
	         str += "<li class='selected'>["+j+"]</a>";
	      } else {
	         str += "<li onclick='currPage("+j+")'>"
	         	 +"["+j+"]" 
	         	 +"</li>"
	         
	      }
      }       
	  str+="</ul>"
	  +"</div>";
//	  // 이전페이지 버튼
//	  str += "<ul>"
//      if(pu.pageNum > pu.startPageNum){
//    	  str += "<a class='first' onclick='/allchwi/classDetail/qnalist?pageNum="+i+"'>처음</li >"
//    	  str += "<li class='previous' onclick='/allchwi/classDetail/qnalist?pageNum="+ (pu.pageNum- 1) + "'>이전</li>"    
//      }
//	  str += "</ul>"



	  $(".qna_wrap").html(str);
	 });
}
function currPage(pageNum){
	qnaList(pageNum);
}
//qna답변 작성
function sendReply(qna_ref) {
	var reply_content=$("#reply_content"+qna_ref).val();
	var class_num = $('#class_num').val();
	var ml_num = $('#ml_num').val();
	if(reply_content== '' ){
		alert('내용을 작성해주세요');
	}else{
		if (ml_num=='') {
			alert('로그인이 필요합니다');
		}else {
			$.post('/allchwi/classDetail/qnareply', {
				class_num: class_num,
				ml_num: ml_num,
				qna_content: reply_content,
				qna_lev: '1',
				qna_ref: qna_ref
			}, function (data,res) {
				if (res=='success') {
					alert('답변등록 성공');
					$("#reply_content"+qna_ref).val("");
					replyList(qna_ref);
				} else {				
					alert('답변실패');
				}
			});
		}
	}
}

//qna댓글목록불러오기
function replyList(qna_ref) {
	 var class_num = $('#class_num').val();
	 $.getJSON("/allchwi/classDetail/commlist" + "?class_num=" + class_num + "&qna_ref=" + qna_ref
			 , function(data){
	  var str = "";
	  var img = "//user-images.githubusercontent.com/65140754/87009744-92636f00-c200-11ea-88b2-252fb36f6fa3.png";
	  $(data).each(function(){
	    var qna_regdate = new Date(this.qna_regdate);
	    qna_regdate = qna_regdate.toLocaleDateString("ko-US");
	   str +="<li>"
		   	+"<dl>"
			+"<dt>"				
			+"<p class='profile_img' style='width:26px; height: 26px; background-size: cover; background-position: center;"					
			+ "background-image: url("+ img +")'>"
			+"<p class='name'>"+ this.miv.mb_name +"</p>"
			+"</dt>"					
			+"<dd>"+this.qna_content+"</dd>"
			+"<dd class='date'>"+ qna_regdate+ "</dd>"
			+"</dl>"		
			+"</li>"  
			+"</ul>"
			+"</div>";
	  });
	  $("#reply"+qna_ref+" ul").html(str);
	 });
}
///////////////////위시리스트////////////////////////////////////
//위시전
$(document).on('click', '#btn_before_wish', function () {
	var btn = $(this);
	var class_num = $('#class_num').val();
	var ml_num = $('#ml_num').val();
	$.post('/allchwi/class/addWish', {
		class_num: class_num,
		ml_num: ml_num
		
	}, function (data,res) {
		if (res=='success') {
			btn.attr('id', 'btn_after_wish');
			$("#wishsrc").attr("src","https://user-images.githubusercontent.com/65140754/86716818-8474e900-c05c-11ea-8c48-5764f4d57b28.png");
			alert('위시리스트 등록 성공');
		} else {
			alert('위시리스트 등록 오류');
		}
	});
});
//위시후
$(document).on('click', '#btn_after_wish', function () {
	var btn = $(this);
	var class_num = $('#class_num').val();
	var ml_num = $('#ml_num').val();
	$.post('/allchwi/class/removeWish', {
		class_num: class_num,
		ml_num: ml_num
	}, function (data,res) {
		if (res=='success') {
			btn.attr('id', 'btn_before_wish');
			$("#wishsrc").attr("src","https://user-images.githubusercontent.com/65140754/86717485-2e547580-c05d-11ea-9dcf-27e47ad3f8e2.png");
			alert('위시리스트 삭제 성공');
		} else {
			alert('위시리스트 삭제 오류');
		}
	});
});
