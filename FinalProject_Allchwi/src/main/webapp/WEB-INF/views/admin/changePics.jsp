<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="${cp }/resources/js/jquery-3.5.1.js"></script>

<div class="container-fluid">
	<div id="content-wrapper" class="d-flex flex-column">

		<div>
			<h1>사진바꾸기</h1>
			<form method="post" action="${cp }/admin/insertPics"
				enctype="multipart/form-data">

				<div class="form-group">
					<label for="exampleFormControlFile1">파일 업로드</label> <input
						type="file" name="file1" class="form-control-file"
						id="exampleFormControlFile1">
				</div>

				<input type="submit" value="제출">
			</form>
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
		<!--
		<div>
			<ul class="pagination justify-content-center" style="margin: 20px 0">
				<c:choose>
					<c:when test="${pu.startPageNum>1 }">
						<li class="page-item"><a class="page-link"
							href="${cp }/admin/changePics?pageNum=${pu.startPageNum-1 }&field=${field}&keyword=${keyword}">이전</a></li>
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
								href="${cp }/admin/changePics?pageNum=${i }">${i }</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link"
								href="${cp }/admin/changePics?pageNum=${i }">${i }</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>

				<c:choose>
					<c:when test="${pu.totalPageCount>pu.endPageNum }">
						<li class="page-item"><a class="page-link"
							href="${cp }/admin/changePics?pageNum=${pu.endPageNum+1 }">다음</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item disabled"><a class="page-link" href="#">다음</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
		 -->


		<div id="imglist">
			<img id="img1" style="width:100px; height: 100px;">
			<img id="img2" style="width:100px; height: 100px;">
			<img id="img3" style="width:100px; height: 100px;">
		</div>


	</div>
</div>


<script>
	var cnt = 0;
	var firstPic = null;
	var secondPic = null;
	var thirdPic = null;
	var imgList=document.getElementById("imgList");
	
	
	function selectPics(save_filename) {
		++cnt;
		if (cnt == 1) {
			firstPic = save_filename;
			img1.src="${cp}/resources/mainPicsUpload/"+firstPic;
			
		}
		if (cnt == 2) {
			secondPic = save_filename;
			img2.src="${cp}/resources/mainPicsUpload/"+secondPic;
			
		}
		if (cnt == 3) {
			thirdPic = save_filename;
			img3.src="${cp}/resources/mainPicsUpload/"+thirdPic;
		}
		if (cnt >= 3) {
			alert("세가지 그림을 모두 선택하셨습니다.");
			location.href="${cp}/admin/confirmPics?firstPic="+firstPic+"&secondPic="+secondPic+"&thirdPic="+thirdPic;
		}
	}
	
	
	
</script>


