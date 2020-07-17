<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="${cp }/resources/js/jquery-3.5.1.js"></script>

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
						<option value="num" <c:if test="${field == 'num'}">selected</c:if>>번호</option>
						<option value="name"
							<c:if test="${field == 'name'}">selected</c:if>>이름</option>
						<option value="pwd" <c:if test="${field == 'pwd'}">selected</c:if>>비밀번호</option>
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


		<div id="pagination">
			<ul class="pagination justify-content-center" style="margin: 20px 0">

				<li id="prev" class="page-item disabled"><a class="page-link"
					href="#">이전</a></li>

				<!-- 중간 숫자번호 -->
				<c:forEach var="i" begin="${pu.startPageNum}"
					end="${pu.endPageNum }">
					<li class="page-item1" name="aa"><a class="page-link">${i }</a></li>
				</c:forEach>


				<li id="next" class="page-item disabled"><a class="page-link"
					href="#">다음</a></li>

			</ul>
		</div>


		<input type="text" value="${pu.pageNum}" id="pageNum">

		<button id="next"
			style="border: none; outline: none; background: none">

			<i class="fas fa-forward"></i>

		</button>

	</div>
</div>

<script>
	$("li[name='aa']").click(function() {
		var pageNum = $(this).text();

		$("#tb").empty();
		$.getJSON({
			url : "${cp}/admin/payment2",
			data : {
				pageNum : pageNum
			},
			success : function(data) {
				$(data).each(function(i, arr) {
					var name = arr.name;
					var num = arr.num;
					var pwd = arr.pwd;

					$("#tb").append("<tr>");
					$("#tb").append("<td>" + num + "</td>");
					$("#tb").append("<td>" + name + "</td>");
					$("#tb").append("<td>" + pwd + "</td>");
					$("#tb").append("</tr>");
				});
			}
		});
	});

	

	$("#next").click(function() {
		var pageNum = $("li[name='aa']").text();//여기
		alert(pageNum);
		
		$("#pagination").empty();
		$("#pagination").append("<h1>씨발 </h1>");

		$.ajax({
			url : "${cp}/admin/payment2",
			dataType : "json",
			data : {pageNum : pageNum},
			success : function(data) {
				
				
				$(data).each(function(i, arr) {
					var name = arr.name;
					var num = arr.num;
					var pwd = arr.pwd;
					$("#tb").append("<tr>");
					$("#tb").append("<td>" + num + "</td>");
					$("#tb").append("<td>" + name + "</td>");
					$("#tb").append("<td>" + pwd + "</td>");
					$("#tb").append("</tr>");

				});
			}
		})
	});
	
	

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
</script>