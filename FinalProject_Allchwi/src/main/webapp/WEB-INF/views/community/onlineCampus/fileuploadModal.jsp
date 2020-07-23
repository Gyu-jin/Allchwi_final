<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script src="${cp}/resources/jQuery-File-Upload/js/tmpl.js " > </script> 
<script src="${cp}/resources/jQuery-File-Upload/js/compile.js " > </script> 
<script src="${cp}/resources/jQuery-File-Upload/js/runtime.js " > </script> 
<style>
.bar {
    height: 18px;
    background: green;
}
</style>
<script>
$(function() {
	  /* activate the plugin */
		$('#fileupload').fileupload({submit: function (e, data) {
	        
	    	var $this = $(this);
	    	debugger;
	        $.getJSON('/rest/file/url?' + new Date().getTime(), function (result) {
	        	data.url = result.url;
	            $this.fileupload('send', data);
	        });
	        return false;
	    }
		});

	 
	});
</script>

<div class="modal" id="myModal">
  <div class="modal-dialog modal-lg ">
    <div class="modal-content">
 	<!-- Modal Header -->
      <div class="modal-header" style="background-color: #ff936f"> 
        <h4 class="modal-title" style="color: #fff; font-weight: bold;">강의 업로드</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
	  	<form method="POST">
			<div class="form-group">
				<label for="online_title" class="control-label">강의 제목</label> <input
					type="text" class="form-control" id="stu_phone">
			</div>
			<div class="form-group">
				<label for="stu_msg" class="control-label">강의 줄거리</label>
				<textarea class="form-control" id="online_content" rows="3"
					style="resize: none"></textarea>
			</div>
			 <form method="post" enctype="multipart/form-data">
			    <div class="fileupload-buttonbar">
			     <label class="fileinput-button">
			      <span>Upload</span>
			      <input type="file" name="files[]" multiple>
			     </label>
			    </div>
			 </form>
			 <div class="fileupload-content">
    <table class="files"></table>
  </div>
		</form>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal">업로드</button>
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>