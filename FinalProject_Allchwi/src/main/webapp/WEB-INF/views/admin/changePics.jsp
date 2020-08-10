<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="${cp }/resources/js/jquery-3.5.1.js"></script>
<style>
.imgBorder {
	border: 5px solid red;
}
</style>


<div class="container-fluid">
	<div id="content-wrapper" class="d-flex flex-column">
		<h4>이미지추가(아래 버튼을 클릭하여 이미지를 추가하세요.)</h4>

		<p>
			<a class="btn btn-primary" data-toggle="collapse"
				href="#collapseExample" role="button" aria-expanded="false"
				aria-controls="collapseExample"> 사진추가하기 </a>
		</p>
		<div class="collapse" id="collapseExample">
			<div class="jumbotron">
				<form method="post" action="${cp }/admin/insertPics"
					enctype="multipart/form-data" onsubmit="return validate();">



					<div class="form-group" id="certi">
						<label for="exampleFormControlFile1">파일 업로드</label> <input
							type="file" name="file1" id="file1" class="form-control-file"
							id="exampleFormControlFile1">
					</div>


					<button type="button" class="btn btn-primary" onclick='add_imgs()'>사진
						추가 업로드</button>
					<br> <br>
					<button type="submit" class="btn btn-primary"
						style="float: right; width: 200px;">등록</button>

				</form>

			</div>
		</div>
		<br>
		<br>
			
		<h4>이미지 리스트(이미지를 클릭하여 선택)</h4>
		<div id="aa" style="width: 1208px;">
			<button type="button" id="prev" class="btn btn-outline-primary"
				disabled="disabled" onclick="prev()"
				style="float: left; height: 200px;"><<</button>
			<c:choose>
				<c:when test="${pu.totalRowCount > 5}">
					<button type="button" id="next" class="btn btn-outline-primary"
						onclick="next()" style="height: 200px; float: right">>></button>
				</c:when>
				<c:otherwise>
					<button type="button" id="next" class="btn btn-outline-primary"
						onclick="next()" disabled="disabled"
						style="height: 200px; float: right">>></button>
				</c:otherwise>
			</c:choose>
			<div id="pics" style="text-align: center;">
				<c:forEach var="vo" items="${list}" varStatus="status">
					<div style="display: inline-block;">
						<img style="width: 200px; height: 200px;"
							src="${cp }/resources/mainPicsUpload/${vo.save_filename }"
							onclick="selectPics('${vo.save_filename }')"
							id="${vo.save_filename }"	
						>
						<p style="text-align: center;">${vo.org_filename }</p>
					</div>
				</c:forEach>
			</div>
		</div>


		<input type="hidden" value="${pu.pageNum}" id="pageNum"> 
		<input type="hidden" value="${pu.totalPageCount}" id="totalPageCount">
		

		<br>
		<hr>
		<h4>선택된 이미지(더블클릭시 선택한 이미지 제거)</h4>
		<div id="imglist">
			<!--  <img id="img1" style="width: 150px; height: 150px;"> 
			<img id="img2" style="width: 150px; height: 150px;"> 
			<img id="img3" style="width: 150px; height: 150px;">
			--> 
		</div>

		<div id="confirmBtn"></div>
		

	</div>
</div>


<script>
	function test(img){
		img.remove();
	}
	
	var cnt = 0;
	var firstPic = null;
	var secondPic = null;
	var thirdPic = null;
	var imgList = document.getElementById("imgList");
	var arr = new Array(2); 
	
	function selectPics(save_filename) {
		++cnt;
		if (cnt == 1) {
			firstPic = save_filename;			
			arr[0] = firstPic;										//empty해도 테두리 남도록 설정하기 위해 배열에 담아 저장
			$("img[id='"+firstPic+"']").addClass("imgBorder");		// 테두리설정
			var img1 = $("<img id='img1' style='width: 150px; height: 150px;' onclick='test(this)'>").appendTo("#imglist"); 
			$(img1).prop("src","${cp}/resources/mainPicsUpload/" + firstPic );    	//선택된 이미지 칸에 추가
		}
		if (cnt == 2) {
			secondPic = save_filename;
			arr[1] = secondPic;
			$("img[id='"+secondPic+"']").addClass("imgBorder");		
			var img2 = $("<img id='img1' style='width: 150px; height: 150px;' onclick='test(this)'>").appendTo("#imglist"); 
			$(img2).prop("src","${cp}/resources/mainPicsUpload/" + secondPic );    	//선택된 이미지 칸에 추가
			//img2.src = "${cp}/resources/mainPicsUpload/" + secondPic;
		}
		if (cnt == 3) {
			thirdPic = save_filename;
			arr[2] = thirdPic;
			$("img[id='"+thirdPic+"']").addClass("imgBorder");
			var img3 = $("<img id='img1' style='width: 150px; height: 150px;' onclick='test(this)'>").appendTo("#imglist"); 
			$(img3).prop("src","${cp}/resources/mainPicsUpload/" + thirdPic );    	//선택된 이미지 칸에 추가
			//img3.src = "${cp}/resources/mainPicsUpload/" + thirdPic;
			
		}
		
		if($("#imglist").children().length==3){
			alert("세가지 그림을 모두 선택하셨습니다.");
			$("#confirmBtn")
					.append(
							"<br><br><button type='button' style='width:240px;' class='btn btn-success'"
									+ "onclick=\"location.href='${cp}/admin/confirmPics?firstPic="
									+ firstPic + "&secondPic=" + secondPic
									+ "&thirdPic=" + thirdPic
									+ "'\">배너변경하기</button>");
		}
	}
	
	

	var pageNum = Number(document.getElementById("pageNum").value);
	var totalPageCount = Number(document.getElementById("totalPageCount").value);

	function prev() {
		$.ajax({
			url : "${cp}/admin/changePics2",
			dataType : "json",
			data : {
				"pageNum" : pageNum - 1,
			},
			success : function(data) {
				content(data);
			}
		})
		pageNum--;
		$("#pageNum").val(pageNum);
		button(pageNum);
	}

	function next() {
		$.ajax({
			url : "${cp}/admin/changePics2",
			dataType : "json",
			data : {
				"pageNum" : pageNum + 1,
			},

			success : function(data) {
				content(data);
				
			}
		})
		pageNum++;
		$("#pageNum").val(pageNum);
		button(pageNum, totalPageCount);
	}

	function button(pageNum, totalPageCount) {
		if (pageNum == 1) {
			$("#prev").attr('disabled', true);
		} else {
			$("#prev").attr('disabled', false);
		}

		if (totalPageCount == pageNum) {
			$("#next").attr('disabled', true);
		} else {
			$("#next").attr('disabled', false);
		}
	}

	function content(data) {
		$("#pics").empty();
		$.each(data,function(i, pic) {
			var save_filename = pic.save_filename;
			var org_filename = pic.org_filename;

			var div = $("<div style='display:inline-block;'></div>").appendTo("#pics");
			$(div).append("<img style='width: 200px; height: 200px;' src='${cp }/resources/mainPicsUpload/"
							+ save_filename+ "' onclick=\"selectPics('"+ save_filename + "')\" id='"+save_filename+"'>");
			$(div).append("<p style='text-align: center;'>"+ org_filename + "</p>");
		});
		
		var firstPic= arr[0];
		var secondPic= arr[1];
		var thirdPic= arr[2];
		
		$("img[id='"+firstPic+"']").addClass("imgBorder"); 
		$("img[id='"+secondPic+"']").addClass("imgBorder"); 
		$("img[id='"+thirdPic+"']").addClass("imgBorder"); 
	}

	// 사진 추가 함수
	function add_imgs() {
		$('#certi')
				.append(
						"<label for='exampleFormControlFile1'>파일 업로드</label>"
								+ "<input type='file' name='file1' class='form-control-file'"+
						" id='exampleFormControlFile1'>");
	}

	function validate() {
		//alert(document.getElementsByName("file1").length+"배열 갯수");
		var file1 = document.getElementsByName("file1");

		for (var i = 0; i < file1.length; i++) {
			if (file1[i].value == null || file1[i].value == "") {
				alert("파일을 업로드 해주세요.");
				return false;
			}
		}
		return true;
	}

	
</script>


