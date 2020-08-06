<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="${cp }/resources/js/jquery-3.5.1.js"></script>

<div class="container-fluid">
	<div id="content-wrapper" class="d-flex flex-column">
		<h1>사진바꾸기</h1>

		<p>
			<a class="btn btn-primary" data-toggle="collapse"
				href="#collapseExample" role="button" aria-expanded="false"
				aria-controls="collapseExample"> 사진추가하기 </a>
		</p>
		<div class="collapse" id="collapseExample">
			<div class="jumbotron">
				<form method="post" action="${cp }/admin/insertPics"
					enctype="multipart/form-data" onsubmit="return validate();">



					<div class="form-group" id="certi" >
						<label for="exampleFormControlFile1">파일 업로드</label>
						 <input type="file" name="file1" id="file1" 
							class="form-control-file" id="exampleFormControlFile1">
					</div>

			
					<button type="button" class="btn btn-primary" onclick='add_certificate()'>사진 추가 업로드</button>
					<br>
					<br>
					<button type="submit" class="btn btn-primary" style="float:right; width:200px;">등록</button>

				</form>

			</div>
		</div>




		<div>
			<c:forEach var="vo" items="${list}">
				<div style="float: left; margin-left: 20px;">
					<img style="width: 200px; height: 200px;"
						src="${cp }/resources/mainPicsUpload/${vo.save_filename }"
						onclick="selectPics('${vo.save_filename }')">
					<p>${vo.org_filename }</p>
				</div>
			</c:forEach>
		</div>



		<div id="imglist">
			<img id="img1" style="width: 100px; height: 100px;"> <img
				id="img2" style="width: 100px; height: 100px;"> <img id="img3"
				style="width: 100px; height: 100px;">
		</div>


	</div>
</div>


<script>
	
	var fileNum = 2;

	function add_certificate() {
		// 자격증 업로드 태그 생성.
		$('#certi').append("<label for='exampleFormControlFile1'>파일 업로드</label>"
							+ "<input type='file' name='file1' id='file"+fileNum+"' class='form-control-file'"+
						" id='exampleFormControlFile1'>");
		// 번호증가
		fileNum++;
	}

	function validate() {
		//alert(document.getElementsByName("file1").length+"배열 갯수");
		var file1 = document.getElementsByName("file1");
				
		for (var i = 0; i < file1.length; i++) {
			if (file1[i].value == null || file1[i].value=="") {
				alert("파일을 업로드 해주세요.");
				return false;
			}
		}
		return true;
	}

	var cnt = 0;
	var firstPic = null;
	var secondPic = null;
	var thirdPic = null;
	var imgList = document.getElementById("imgList");

	function selectPics(save_filename) {
		++cnt;
		if (cnt == 1) {
			firstPic = save_filename;
			alert(firstPic);
			img1.src = "${cp}/resources/mainPicsUpload/" + firstPic;

		}
		if (cnt == 2) {
			secondPic = save_filename;
			alert(secondPic);
			img2.src = "${cp}/resources/mainPicsUpload/" + secondPic;

		}
		if (cnt == 3) {
			thirdPic = save_filename;
			alert(thirdPic);
			img3.src = "${cp}/resources/mainPicsUpload/" + thirdPic;
		}
		if (cnt >= 3) {
			alert("세가지 그림을 모두 선택하셨습니다.");
			location.href = "${cp}/admin/confirmPics?firstPic=" + firstPic
					+ "&secondPic=" + secondPic + "&thirdPic=" + thirdPic;
		}
	}
</script>


