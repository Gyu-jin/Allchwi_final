<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="${cp }/resources/js/jquery-3.5.1.js"></script>

<body>
	<div id="content-wrapper" class="d-flex flex-column">
		<div class="container-fluid">
			<div class="breadcrumb">
				<h2>
					<a href="${cp }/admin/payment">회원결제내역</a>
				</h2>
				<div style="margin-left: 65%;">
					<form action="${cp }/admin/payment" class="form-inline"
						style="display: inline-block">
						<select class="form-control col-2" name="field"
							style="display: inline-block; width: 700px;">
							<option value="num"
								<c:if test="${field == 'num'}">selected</c:if>>번호</option>
							<option value="name"
								<c:if test="${field == 'name'}">selected</c:if>>이름</option>
							<option value="pwd"
								<c:if test="${field == 'pwd'}">selected</c:if>>비밀번호</option>
						</select> <input class="form-control mr-sm-2" type="text" name="keyword" />
						<button class="btn btn-primary my-2 my-sm-0" type="submit">검색</button>
					</form>
				</div>
			</div>

			<table class="table table-hover">
				<thead class="thead-dark">
					<tr>
						<th>번호</th>
						<th>이름</th>
						<th>비밀번호</th>
					</tr>
				</thead>
				<tbody id="tb">
					<c:forEach var="vo" items="${list }">
						<tr>
							<td>${vo.num }</td>
							<td>${vo.name }</td>
							<td>${vo.pwd }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>




			<button type="button" id="prev" class="btn btn-outline-primary">이전</button>

			<div id="pagination" style="display: inline-block;">
				<ul class="pagination justify-content-center" style="margin: 20px 0">

					<c:forEach var="i" begin="${pu.startPageNum}"
						end="${pu.endPageNum }">
						<li class="page-items" id="pages" onclick="pageClick('${i }')"><a
							class="page-link">${i }</a></li>
					</c:forEach>


				</ul>
			</div>


			<button type="button" id="next" class="btn btn-outline-primary">다음</button>
			<input type="text" value="${pu.pageNum}" id="pageNum">


		</div>
	</div>
</body>

<script>
	function content(key, value) {
		if (key == "list") {
			for (var i = 0; i < value.length; i++) {
				var name = value[i].name;
				var num = value[i].num;
				var pwd = value[i].pwd;

				$("#tb").append("<tr>");
				$("#tb").append("<td>" + num + "</td>");
				$("#tb").append("<td>" + name + "</td>");
				$("#tb").append("<td>" + pwd + "</td>");
				$("#tb").append("</tr>");
			}
		}
	}

	function pageClick(pageNum) {
		$("#tb").empty();
		//$("#pagination").empty();
		$.getJSON({
			url : "${cp}/admin/payment2",
			data : {
				pageNum : pageNum
			},
			success : function(data) {
				$.each(data, function(key, value) {
					content(key, value);
				});
			}
		});
	}

	var pageNumber = function(key, value) {

		if (key == "pu") {

			$("#pagination").empty();
			var pageUl = $(
					"<ul class='pagination justify-content-center' style='margin: 20px 0'></ul>")
					.appendTo("#pagination");
			//$(pageUl).append("<li class='page-item'><a class='page-link' onclick='prev()' href='#'>이전</a></li>");
			for (var i = value.startPageNum; i <= value.endPageNum; i++) {
				if (value.pageNum == i) {
					$(pageUl).append(
							"<li class='page-item' onclick='pageClick(" + i
									+ ")'><a class='page-link'>" + i
									+ "</a></li>");

				} else {
					$(pageUl).append(
							"<li class='page-item' onclick='pageClick(" + i
									+ ")'><a class='page-link'>" + i
									+ "</a></li>");
				}
			}

			//$(pageUl).append("<li  class='page-item'><a class='page-link' href='#' >다음</a></li>");

			$("#pageNum").val(value.pageNum);
			paging(value.pageNum, value.totalPageCount, value.endPageNum);

		}

	}

	var paging = function(pagenum, totalpage, endPageNum) {

		if (pagenum == 1) {

			$("#prev").attr('disabled', true);

		} else {

			$("#prev").attr('disabled', false);

		}
		;

		if (totalpage > endPageNum) {

			$("#next").attr('disabled', false);

		} else {

			$("#next").attr('disabled', true);

		}
		;

	}

	$("#next").click(function() {
		$.ajax({
			url : "${cp}/admin/payment2",
			dataType : "json",
			data : {
				"pageNum" : Number($("#pageNum").val()) + 5,
			},

			success : function(data) {
				$("#tb").empty();
				$.each(data, function(key, value) {
					content(key, value);
					pageNumber(key, value);
				})
			}
		})
	});

	$("#prev").click(function() {
		$.ajax({
			url : "${cp}/admin/payment2",
			dataType : "json",
			data : {
				"pageNum" : Number($("#pageNum").val()) - 5,
			},

			success : function(data) {
				$("#tb").empty();
				$.each(data, function(key, value) {
					content(key, value);
					pageNumber(key, value);
				})
			}
		})
	});
</script>