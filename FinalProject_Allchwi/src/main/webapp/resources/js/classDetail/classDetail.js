$(function(){
	qnaList();
});
function qnaList(){
	 var class_num = 4;
	 $.getJSON("/allchwi/classDetail/qnalist" + "?class_num=" + class_num, function(data){
	  var str = "";
	  
	  $(data).each(function(){
	   var qna_regdate = new Date(this.qna_regdate);
	   qna_regdate = qna_regdate.toLocaleDateString("ko-US")
	   var img = "//user-images.githubusercontent.com/65140754/87009744-92636f00-c200-11ea-88b2-252fb36f6fa3.png";
	   str += "<li>"
		 + "<input type='hidden' id='qna_ref' value='"+this.qna_ref+"'>"
	     + "<dl>"
	     + "<dt>"
	     + "<p class='profile_img' style='width: 50px; height: 50px; background-size: cover; background-position: center; background-image: url("+ img +")'>"
	     + "</p>"
	     + "<p class='name'>"+this.miv.mb_name+"</p>"
	     + "</dt>"
	     + "<dd>" + this.qna_content  + "</dd>"
	     + "<dd class='date'>" + qna_regdate + "</dd>"
	     + "</dl>"
	     + "</li>"
	     + "<a type='button' class='showreply' onclick='replyList("+this.qna_ref+")' data-toggle='collapse' data-target='#reply"+this.qna_ref +"'>"
		 + "<svg width='1em' height='1em' viewBox='0 0 16 16' class='bi bi-chevron-down'"
		 + "fill='currentColor' xmlns='http://www.w3.org/2000/svg'"
		 + "path fill-rule='evenodd' d='M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z'/>"
		 + "</svg>" +"댓글"+ "</a>"
		 +"<div class='reply_box collapse' id='reply"+this.qna_ref+"'>"
		 +"<table>"
		 +"<tr>"
		 +"<td>"
		 +"<form>"
		 +"<div class='form-group'>"
		 +"<textarea class='form-control' name='reply_content' cols='60' rows='3'></textarea>"
		 +"</form>"
		 +"</td>"
		 +"<td>"
		 +"<input type='submit' id='reply_send' onclick='sendReply("+this.qna_ref+")' class='btn btn-primary' value='등록'>"
		 +"</td>"
		 +"</tr>"
		 +"</table>"
		 +"</div>"
		 +"<div class='reply_list' id='reply"+this.qna_ref+"'>"
		 +"<ul>"
		 +"</ul>"
		 +"</div>"
		 +"</div>"
		 ;           
	  
	  });
	  $(".qna_list ul").html(str);
	 });
}
//qna 답변
function sendReply(qna_ref) {
	reply_content = document.getElementsByName('reply_content').value;
	id='test';
	class_num='4';
	ml_num='1';
	if (id!='test') {
		alert('로그인이 필요합니다');
	}else {
		$.post('/allchwi/classDetail/qnareply', {
			class_num: class_num,
			ml_num: ml_num,
			qna_content:reply_content,
			qna_lev: '1',
			qna_ref: qna_ref
		}, function (data,res) {
			if (res=='success') {
				alert('답변등록 성공');
				replyList();
				$("#reply_content").val("");
			} else {				
				alert('답변실패');
			}
		});
	}
}

//onclick으로
function replyList(qna_ref) {
	 var class_num = 4;
	 $.getJSON("/allchwi/classDetail/commlist" + "?class_num=" + class_num + "&qna_ref=" + qna_ref
			 , function(data){
	  var str = "";
	  var img = "//user-images.githubusercontent.com/65140754/87009744-92636f00-c200-11ea-88b2-252fb36f6fa3.png";
	  $(data).each(function(){
	   var qna_regdate = new Date(this.qna_regdate);
	   qna_regdate = qna_regdate.toLocaleDateString("ko-US")
	   str +="<li>"
		   	+"<dl>"
			+"<dt>"				
			+"<p class='profile_img' style='width:26px; height: 26px; background-size: cover; background-position: center;"					
			+ "background-image: url("+ img +")'>"
			+"<p class='name'>"+ this.miv.mb_name +"</p>"
			+"</dt>"					
			+"<dd>"+this.qna_content+"</dd>" +
			+"<dd class='date'>"+qna_regdate+"</dd>"
			+"</dl>"		
			+"</li>"  
			+"</ul>"
			+"</div>";
	  });
	  $("#reply"+qna_ref+" ul").html(str);
	 });
}