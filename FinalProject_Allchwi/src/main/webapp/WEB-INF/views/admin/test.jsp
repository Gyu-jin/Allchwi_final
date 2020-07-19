<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
.backcolor:hover {
	background-color: #3a3b45 !important;
}

label {
	width: 130px;
	text-align: left;
}
</style>

<div class="container" style="margin-top: 20px;">

	<h1 style="text-align: center;">회원정보</h1>

	<div style="float: right; margin-bottom: 10px;">

		<select name="field" class="form-control"
			style="width: 120px; display: inline-block;">

			<option value="id">아이디</option>

			<option value="email">이메일</option>

		</select> <input type="text" name="keyword" class="form-control form-control"
			style="width: 200px; display: inline-block;">

	</div>

	<table class="table table-striped">

		<tr>

			<th>회원번호</th>

			<th>아이디</th>

			<th>비밀번호</th>

			<th>이메일</th>

			<th>성별</th>

			<th>카카오아이디 여부</th>

		</tr>

		<c:forEach var="vo" items="${ Memberlist }">

			<tr class="backcolor" onclick="membermodified(this)">

				<td>${vo.menum }</td>

				<td>${vo.id}</td>

				<td>${vo.pwd}</td>

				<td>${vo.email}</td>

				<td>${vo.gender}</td>

				<c:choose>

					<c:when test="${vo.identi_kakao == 1}">

						<td>카카오아이디</td>

					</c:when>

					<c:otherwise>

						<td>일반아이디</td>

					</c:otherwise>

				</c:choose>

			</tr>

		</c:forEach>

	</table>

	<div style="text-align: center;">

		<button id="previous"
			style="border: none; outline: none; background: none">

			<i class="fas fa-backward"></i>

		</button>

		<div style="display: inline-block;" id="pagingborder">

			<c:forEach var="i" begin="${pu.startPageNum }"
				end="${pu.endPageNum }">

				<c:choose>

					<c:when test="${pu.pageNum == i }">

						<a href="/admin/member/list?pageNum=${i}"><span
							style="color: red;">[${i}]</span></a>

					</c:when>

					<c:otherwise>

						<a href="/admin/member/list?pageNum=${i}"><span>[${i}]</span></a>

					</c:otherwise>

				</c:choose>

			</c:forEach>

		</div>

		<input type="hidden" value="${pu.pageNum}" id="pageNum"> <input
			type="hidden" id="fieldcopy"> <input type="hidden"
			id="keywordcopy">

		<button id="next"
			style="border: none; outline: none; background: none">

			<i class="fas fa-forward"></i>

		</button>

	</div>

</div>



<div class="modal fade" id="membermodal" role="dialog">

	<div class="modal-dialog">

		<div class="modal-content">

			<div class="modal-header">

				<h3 class="modal-title">회원 정보 상세보기</h3>

				<button type="button" class="close" data-dismiss="modal"
					style="outline: none;">X</button>

			</div>

			<div class="modal-body">

				<form method="post" action="" style="margin: auto;">

					<div style="text-align: center;" id="modifieddata">

						<img src=""
							style="width: 150px; height: 150px; border-radius: 100%; margin-bottom: 20px;"><br>

						<input type="hidden" name="menum"> <label>아이디</label><input
							type="text" name="id"><br> <label>비밀번호</label><input
							type="text" name="pwd"><br> <label>주소</label><input
							type="text" name="addr"><br> <label>전화번호</label><input
							type="text" name="phone"><br> <label>성별</label><input
							type="text" name="gender"><br> <label>카카오톡
							아이디여부</label><input type="text" name="identi_user" readonly="readonly"><br>

						<label>관리자권한</label><input type="checkbox" name="identi_user"
							style="width: 170px;"><span id="toggle"></span>

					</div>

					<div style="text-align: center; margin: 20px;">

						<input type="submit" value="수정" style="width: 100px;"> <input
							type="button" value="취소" style="width: 100px;">

					</div>

				</form>

			</div>

		</div>

	</div>

</div>

<script>
	/* var memberimg=function(menum){

		$.ajax({

			url : "/memberimg",

			dataType : "json",

			data : {"menum" : menum}

		})

	} */

	/* 검색 확인 */

	var datasearch = function(keyword, field) {

		if (keyword === undefined) {

			keyword = '';

		}

		if (field === undefined) {

			field = '';

		}

	}

	/* 페이지 다시 출력  */

	var pagedata = function(key, value) {

		if (key == "Memberlist") {

			var kakaocheck;

			for (var i = 0; i < 10; i++) {

				$("tr").first().next().remove();

			}

			for (var i = 0; i < value.length; i++) {

				if (value[i].identi_kakao == 1) {

					kakaocheck = "카카오아이디";

				} else {

					kakaocheck = "일반아이디";

				}

				$("table").append(

						"<tr class='backcolor' onclick='membermodified(this)'><td>"
								+ value[i].menum + "</td><td>" + value[i].id

								+ "</td><td>" + value[i].pwd + "</td><td>"

								+ value[i].email + "</td><td>"

								+ value[i].gender + "</td><td>" + kakaocheck

								+ "</td></tr>")

			}
			;

		}

	}

	/* 페이징 숫자 */

	var pageNumber = function(key, value) {

		if (key == "pu") {

			$("#pagingborder").empty();

			for (var i = value.startPageNum; i <= value.endPageNum; i++) {

				if (value.pageNum == i) {

					if (i == value.startPageNum) {

						$("#pagingborder").append(
								"<a href='#'><span style='color : red;' onclick='pageclick("
										+ i + ")'>[" + i + "]</span></a>");

					} else {

						$("#pagingborder").append(
								"<a href='#'><span style='color : red; margin-left: 6px;' onclick='pageclick("
										+ i + ")'>[" + i + "]</span></a>");

					}

				} else {

					if (i == value.startPageNum) {

						$("#pagingborder").append(
								"<a href='#'><span onclick='pageclick(" + i
										+ ")'>[" + i + "]</span></a>");

					} else {

						$("#pagingborder").append(
								"<a href='#'><span style='margin-left: 6px;' onclick='pageclick("
										+ i + ")'>[" + i + "]</span></a>");

					}

				}

			}

			$("#pageNum").val(value.pageNum);

			paging(value.pageNum, value.totalPageCount);

		}

	}

	/* 다음,이전 버튼 설정 */

	var paging = function(pagenum, totalpage) {

		if (pagenum == 1) {

			$("#previous").attr('disabled', true);

		} else {

			$("#previous").attr('disabled', false);

		}
		;

		if (pagenum == totalpage) {

			$("#next").attr('disabled', true);

		} else {

			$("#next").attr('disabled', false);

		}
		;

	}

	function membermodified(data) {

		var menum = $(data).children().first().html();

		$.ajax({

			url : "/json/memberone",

			dataType : "json",

			data : {
				"menum" : menum
			},

			success : function(data) {

				/* memberimg(data.menum); */

				console.log("출력!!");

				var kakaoid;

				if (data.identi_kakao == 1) {

					kakaoid = "카카오 아이디";

				} else {

					kakaoid = "일반 아이디";

				}

				$("#modifieddata").children().eq(0).prop("src",
						"/memberimg?menum=" + data.menum);

				$("#modifieddata").children().eq(4).val(data.id);

				$("#modifieddata").children().eq(7).val(data.pwd);

				$("#modifieddata").children().eq(10).val(data.addr);

				$("#modifieddata").children().eq(13).val(data.phone);

				$("#modifieddata").children().eq(16).val(data.gender);

				$("#modifieddata").children().eq(19).val(kakaoid);

				$("#membermodal").modal();

			}

		})

	}

	paging('${pu.pageNum}', '${pu.totalPageCount}');

	/* 페이징 버튼 처리 */

	$("#previous").click(function(e) {
		e.preventDefault();
		var keyword = $("#keywordcopy").val();
		var field = $("#fieldcopy").val();
		datasearch(keyword, field);

		$.ajax({
			url : "/json/memberlistfind",
			dataType : "json",
			data : {
				"pageNum" : Number($("#pageNum").val()) - 1,
				"field" : field,
				"keyword" : keyword
			},

			success : function(data) {
				$.each(data, function(key, value) {
					pagedata(key, value);
					pageNumber(key, value);
				})
			}
		})
	});

	$("#next").click(function(e) {
		e.preventDefault();
		var keyword = $("#keywordcopy").val();
		var field = $("#fieldcopy").val();
		datasearch(keyword, field);

		$.ajax({
			url : "/json/memberlistfind",
			dataType : "json",
			data : {
				"pageNum" : Number($("#pageNum").val()) + 1,
				"field" : field,
				"keyword" : keyword
			},

			success : function(data) {
				$.each(data, function(key, value) {
					pagedata(key, value);
					pageNumber(key, value);

				})
			}
		})
	});

	/* 페이징 클릭 처리 */

	var pageclick = function(i) {

		var keyword = $("#keywordcopy").val();
		var field = $("#fieldcopy").val();

		datasearch(keyword, field);
		$.ajax({
			url : "/json/memberlistfind",
			dataType : "json",
			data : {
				"pageNum" : i,
				"field" : field,
				"keyword" : keyword
			},

			success : function(data) {
				$.each(data, function(key, value) {
					pagedata(key, value);
					pageNumber(key, value);

				})
			}
		})
	}

	/* 검색 ajax */

	$("input[name='keyword']").keyup(function() {

		var fielddata = $("select[name='field']").val();

		var keyworddata = $("input[name='keyword']").val();

		$("#fieldcopy").val(fielddata);

		$("#keywordcopy").val(keyworddata);

		$.ajax({

			url : "/json/memberlistfind",

			dataType : "json",

			data : {
				"keyword" : keyworddata,
				"field" : fielddata
			},

			success : function(data) {

				$.each(data, function(key, value) {

					pagedata(key, value);

					pageNumber(key, value);

				})

			}

		})

	})
</script>

