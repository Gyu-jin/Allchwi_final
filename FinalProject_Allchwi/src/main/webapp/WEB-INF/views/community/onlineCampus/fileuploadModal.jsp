<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
var totalFileLength, totalUploaded, fileCount, filesUploaded;

//To log everything on console
function debug(s) {
    var debug = document.getElementById('debug');
    if (debug) {
        debug.innerHTML = debug.innerHTML + '<br/>' + s;
    }
}

//Will be called when upload is completed
function onUploadComplete(e) {
    totalUploaded += $('#files')[0].size;
    var bar =$('#progressBar');
    bar.width('100%');
    bar.innerHTML = '100% complete';
    alert('Finished uploading file(s)');
    
}

//Will be called when user select the files in file control
function onFileSelect(e) {
    var files = e.target.files; // FileList object
    var output = [];
    fileCount = files.length;
    totalFileLength = 0;
    for (var i = 0; i < fileCount; i++) {
        var file = files[i];
        output.push(file.name, ' (', file.size, ' bytes, ', file.lastModifiedDate.toLocaleDateString(), ')');
        output.push('<br/>');
        debug('add ' + file.size);
        totalFileLength += file.size;
    }
    document.getElementById('selectedFiles').innerHTML = output.join('');
    debug('totalFileLength:' + totalFileLength);
}

//This will continueously update the progress bar
function onUploadProgress(e) {
    if (e.lengthComputable) {
		console.log("load");
        var percentComplete = Math.round((e.loaded / e.total) * 100);
        var bar = $('#progressBar');
        bar.css('width',percentComplete + '%');
        bar.innerHTML = percentComplete + ' % complete';
        
    } else {
        debug('unable to compute');
    }
}

//the Ouchhh !! moments will be captured here
function onUploadFailed(e) {
    alert("Error uploading file");
}

//Pick the next file in queue and upload it to remote server
function uploadNext() {
    var fd = new FormData($('#frm')[0]);
  
    $.ajax({
		type: 'POST',
		url: '${cp}/community/save-product',
		enctype: 'multipart/form-data',
		contentType: false,
		data: fd,
		processData: false,
		xhr: function()
		  {
		    var xhr = new window.XMLHttpRequest();
		    //Upload progress
		    xhr.upload.addEventListener("progress", onUploadProgress, false),
		    xhr.addEventListener("load", onUploadComplete, false);
		    xhr.addEventListener("error", onUploadFailed, false);
		    return xhr;
		  },
		  success:function(){
			  alert("완료!!");
		  }
	});
}

//Let's begin the upload process
function startUpload() {
    totalUploaded = filesUploaded = 0;
    uploadNext();
}

//Event listeners for button clicks
$(function(){
	
	$('#files').change(onFileSelect);
	$('#uploadButton').submit(startUpload);
});

</script>

<div class="modal" id="myModal">
  <div class="modal-dialog modal-lg ">
		<div class="modal-content">
			<!-- Modal Header -->
			<div class="modal-header" style="background-color: #ff936f">
				<h4 class="modal-title" style="color: #fff; font-weight: bold;">강의
					업로드</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>

			<!-- Modal body -->
			<div class="modal-body">
				<div class="form-group">
					<label for="online_title" class="control-label">강의 제목</label> <input
						type="text" class="form-control" id="stu_phone">
				</div>
				<div class="form-group">
					<label for="stu_msg" class="control-label">강의 줄거리</label>
					<textarea class="form-control" id="online_content" rows="3"
						style="resize: none"></textarea>
				</div>
				<form id="frm" style="margin-bottom: 20px">
						<input type="file" id="files" name="files" style="margin-bottom: 20px" /><br />
						<output id="selectedFiles"></output>
						<input id="uploadButton" type="submit" value="Upload" style="margin-top: 20px" />
				</form>
				<div class="progress" style=" margin-bottom: 20px">
					<div id="progressBar" class="progress-bar progress-bar-success"
						role="progressbar" aria-valuenow="0" aria-valuemin="0"
						aria-valuemax="100" style="width: 0%;">0%</div>
				</div>
				<div id='debug' style='height: 100px; border: 2px solid #ccc; overflow: auto'></div>
			</div>
	
			<!-- Modal footer -->
	      <div class="modal-footer">
	        <button type="button" class="btn btn-primary" data-dismiss="modal">업로드</button>
	        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
	      </div>
		</div>
    </div>
 </div>
