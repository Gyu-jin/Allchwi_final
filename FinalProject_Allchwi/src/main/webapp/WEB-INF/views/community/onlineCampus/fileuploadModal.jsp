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
    totalUploaded += document.getElementById('files').files[filesUploaded].size;
    filesUploaded++;
    debug('complete ' + filesUploaded + " of " + fileCount);
    debug('totalUploaded: ' + totalUploaded);
    if (filesUploaded < fileCount) {
        uploadNext();
    } else {
        var bar = document.getElementById('bar');
        bar.style.width = '100%';
        bar.innerHTML = '100% complete';
        alert('Finished uploading file(s)');
    }
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
        var percentComplete = parseInt((e.loaded + totalUploaded) * 100 / totalFileLength);
        var bar = document.getElementById('bar');
        bar.style.width = percentComplete + '%';
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
    var xhr = new XMLHttpRequest();
    var fd = new FormData();
    var file = document.getElementById('files').files[filesUploaded];
    console.log('${cp}');
    fd.append("multipartFile", file);
     /*    xhr.upload.addEventListener("progress", onUploadProgress, false);
    xhr.addEventListener("load", onUploadComplete, false);
    xhr.addEventListener("error", onUploadFailed, false);
    xhr.open("POST", "${cp}/save-product");
    debug('uploading ' + file.name);
    xhr.send(fd); */
    $.ajax({
		type: 'POST',
		url: '${cp}/community/save-product',
		enctype: 'multipart/form-data',
		contentType: false,
		data: fd,
		dataType : 'text',
		processData: false,
		progress : onUploadProgress,
		load : onUploadComplete,
		error : onUploadFailed
	});
}

//Let's begin the upload process
function startUpload() {
    totalUploaded = filesUploaded = 0;
    alert("asd2");
    uploadNext();
}

//Event listeners for button clicks
$(function(){
	
	$('#files').change(onFileSelect);
	$('#uploadButton').click(startUpload);
	alert("asd1");
   // document.getElementById('files').addEventListener('change', onFileSelect, false);
   // document.getElementById('uploadButton').addEventListener('click', startUpload, false);
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
			<div class="form-group">
				<label for="online_title" class="control-label">강의 제목</label> <input
					type="text" class="form-control" id="stu_phone">
			</div>
			<div class="form-group">
				<label for="stu_msg" class="control-label">강의 줄거리</label>
				<textarea class="form-control" id="online_content" rows="3"
					style="resize: none"></textarea>
			</div>
			 <%-- <form action="${cp }/community/upload" method="post" enctype="multipart/form-data">
				<input type="file" value="파일 선택" name="file"/>
				<input type="submit" value="업로드"/>
			</form>
			 <div class="fileupload-content"> --%>
			 <div style="width:55%">  
		        <h1>HTML5 Ajax Multi-file Upload With Progress Bar</h1>
		        <div id='progressBar' style='height: 20px; border: 2px solid green; margin-bottom: 20px'>
		            <div id='bar' style='height: 100%; background: #33dd33; width: 0%'>
		            </div>
		        </div>
		        <form style="margin-bottom: 20px">
		            <input type="file" id="files" multiple style="margin-bottom: 20px"/><br/>
		            <output id="selectedFiles"></output>
		            <input id="uploadButton" type="button" value="Upload" style="margin-top: 20px"/>
		        </form>
		        <div id='debug' style='height: 100px; border: 2px solid #ccc; overflow: auto'></div>
    </div>
    <table class="files"></table>
  </div>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal">업로드</button>
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>