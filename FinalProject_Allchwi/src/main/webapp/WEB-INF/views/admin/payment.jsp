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
				<form class="form-inline" style="display: inline-block">
					<select class="form-control col-2" name="field" style="display: inline-block; width: 700px;">
						<option value="id" selected="selected">아이디</option>
						<option value="class_title" >수업제목</option>
						<option value="ml_num">회원번호</option>
					</select> 
					<input class="form-control mr-sm-2" type="text" name="keywords"/>
					<button class="btn btn-primary my-2 my-sm-0" id="searchBtn">검색</button>
				</form>
			</div>
		</div>
		<div>
			<table class="table table-hover">
				<thead id="th" class="thead-dark">
					<tr>
						<th>회원번호</th>
						<th>회원 아이디</th>
						<th>결제날짜</th>
						<th>수업제목</th>
						<th>결제방법</th>
						<th>결제금액</th>
					</tr>
				</thead>
				<tbody id="tb">
					<c:forEach var="vo" items="${list }">
						<tr>
							<td>${vo.ml_num }</td>
							<td>${vo.id }</td>
							<td>${vo.pay_regdate }</td>
							<td>${vo.class_title }</td>
							<td>${vo.pay_way }</td>
							<td>${vo.final_price }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

		<div style="text-align: center">
			<c:choose>
				<c:when test="${pu.startPageNum>1 }">
					<button type="button" id="prev" class="btn btn-outline-primary" >이전</button>
				</c:when>
				<c:otherwise>
					<button type="button" id="prev" class="btn btn-outline-primary" disabled>이전</button>
				</c:otherwise>
			</c:choose>


			

			<div id="pagination" style="display: inline-block;">
				<ul class="pagination justify-content-center" style="margin: 20px 0">
					<c:forEach var="i" begin="${pu.startPageNum}" end="${pu.endPageNum }">
						<c:choose>
							<c:when test="${pu.pageNum==i}">
								<li class="page-item active" id="pages" onclick="pageClick('${i }')"><a class="page-link">${i }</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item" id="pages" onclick="pageClick('${i }')"><a class="page-link">${i }</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</ul>
			</div>

			<c:choose>
				<c:when test="${pu.totalPageCount>pu.endPageNum }">
					<button type="button" id="next" class="btn btn-outline-primary">다음</button>
				</c:when>
				<c:otherwise>
					<button type="button" id="next" class="btn btn-outline-primary" disabled>다음</button>
				</c:otherwise>
			
			</c:choose>
		</div>

			<input type="hidden" value="${pu.pageNum}" id="pageNum">
			<input type="hidden" id="fieldCopy">
			<input type="hidden" id="keywordCopy">
	
	
	</div>
		

</div>





<script>
	$("#searchBtn").click(function(e){
		e.preventDefault();
		var field= $("select[name='field']").val();
		var keywords= $("input[name='keywords']").val();
				
		$("#fieldCopy").val(field);
		$("#keywordCopy").val(keywords);
		
		$.ajax({
			url : "${cp}/admin/payment2",
			dataType : "json",
			data : {
				"keyword" : keywords,
				"field" : field
			},

			success : function(data) {
				$.each(data, function(key, value) {					
					content(key,value);
					pageNumber(key, value);
				})
			}
		})
	});





	function content(key, value) {
		$("#th").empty();
		$("#tb").empty();

		if (key == "list") {
			$("#th").append("<tr>");
			$("#th").append("<th>회원번호</th>");
			$("#th").append("<th>회원 아이디</th>");
			$("#th").append("<th>결제날짜</th>");
			$("#th").append("<th>수업제목</th>");
			$("#th").append("<th>결제방법</th>");
			$("#th").append("<th>결제금액</th>");
			$("#th").append("</tr>");

		
			for (var i = 0; i < value.length; i++) {
				var ml_num = value[i].ml_num;
				var id = value[i].id;
				var pay_regdate = value[i].pay_regdate;
				var class_title = value[i].class_title;
				var pay_way  = value[i].pay_way;
				var final_price  = value[i].final_price;

				$("#tb").append("<tr>");
				$("#tb").append("<td>" + ml_num + "</td>");
				$("#tb").append("<td>" + id + "</td>");
				$("#tb").append("<td>" + pay_regdate + "</td>");
				$("#tb").append("<td>" + class_title + "</td>");
				$("#tb").append("<td>" + pay_way + "</td>");
				$("#tb").append("<td>" + final_price + "</td>");
				$("#tb").append("</tr>");
			
			}
		}
	}

	function pageClick(pageNum,keyword,field) {
		//$("#pagination").empty();
		$.getJSON({
			url : "${cp}/admin/payment2",
			data : {
				pageNum : pageNum,
				keyword : $("#keywordCopy").val(),
				field : $("#fieldCopy").val()
			},
			success : function(data) {
				$.each(data, function(key, value) {
					content(key, value);
					if (key == "pu") {

						$("#pagination").empty();
						var pageUl = $(
								"<ul class='pagination justify-content-center' style='margin: 20px 0'></ul>")
								.appendTo("#pagination");
						//$(pageUl).append("<li class='page-item'><a class='page-link' onclick='prev()' href='#'>이전</a></li>");
						for (var i = value.startPageNum; i <= value.endPageNum; i++) {
							if (value.pageNum == i) {
								$(pageUl).append(
										"<li class='page-item active' onclick='pageClick(" + i
												+ ")'><a class='page-link'>" + i
												+ "</a></li>");

							} else {
								$(pageUl).append(
										"<li class='page-item' onclick='pageClick(" + i
												+ ")'><a class='page-link'>" + i
												+ "</a></li>");
							}
						}
					}
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
							"<li class='page-item active' onclick='pageClick(" + i
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

		if (totalpage > endPageNum) {
			$("#next").attr('disabled', false);
		}else{
			$("#next").attr('disabled', true);
		}
	}

	$("#next").click(function() {
		$.ajax({
			url : "${cp}/admin/payment2",
			dataType : "json",
			data : {
				"pageNum" : Number($("#pageNum").val()) + 5,
				keyword : $("#keywordCopy").val(),
				field : $("#fieldCopy").val()
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
				keyword : $("#keywordCopy").val(),
				field : $("#fieldCopy").val()
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