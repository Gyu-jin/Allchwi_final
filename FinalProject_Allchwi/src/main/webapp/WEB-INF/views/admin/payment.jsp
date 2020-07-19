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
		
		<!-- 
			<ul class="pagination justify-content-center" style="margin: 20px 0">

				<li id="prev" class="page-item disabled"><a class="page-link" href="#">이전</a></li>

				<c:forEach var="i" begin="${pu.startPageNum}" end="${pu.endPageNum }">
					<li class="page-item1" onclick="pagination('${i }')"><a class="page-link">${i }</a></li>
				</c:forEach>

				
				<li id="next" class="page-item disabled" onclick="next('${pu.endPageNum+1 }')"><a class="page-link" 
				href="#">다음</a></li>	
			</ul>
		 -->
		</div>
		
		<c:forEach var="i" begin="${pu.startPageNum}" end="${pu.endPageNum }">
			<p name="bb">${i }</p>
		</c:forEach>
		
		${pu.startPageNum}		<!-- 첫시작번호  1-->
		${pu.endPageNum}		<!-- 끝시작번호 5-->
		${pu.startRow}
		${pu.endRow}			
		${pu.pageBlockCount}
		${pu.rowBlockCount}
		${pu.totalPageCount}	<!-- 총페이지 8개 -->
		${pu.totalRowCount}		<!-- 총글수 36개 -->
		
		
	</div>
</div>
</body>

<script>
	$(function paging(){
		var aa= $("p").text();
		var bb= parseInt(aa.length)+1;
		
		var pageul = $("<ul class='pagination justify-content-center' style='margin: 20px 0'>").appendTo("#pagination");
		$(pageul).append("<li id='prev' class='page-item'><a class='page-link' href='#'>이전</a></li>");
		
		for (var i = 0; i < aa.length; i++) {
			$(pageul).append("<li class='page-item'><a class='page-link' onclick=pageNumbers('"+aa[i]+"')>"+aa[i]+"</a></li>");
		}
		$(pageul).append("<li id='next' class='page-item' onclick=next('"+bb+"','"+aa+"')><a class='page-link' href='#'>다음</a></li>");
	});
	
	
	function pageNumbers(pageNum){
		$("#tb").empty();
		//$("#pagination").empty();
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
	}

	
	function next(pageNum,aa) {
	
		alert(aa);
		
		for (var i = 0; i < aa.length; i++) {
			aa[i];
		}
		
		
		pageNumbers(pageNum);
		
		
		for (var i = 0; i < aa.length; i++) {
			$(pageul).append("<li class='page-item'><a class='page-link' onclick=pageNumbers('"+aa[i]+"')>"+aa[i]+"</a></li>");
		}
		
		
	}

	function prev(pageNum) {
		movePage(pageNum);
		$("#pagination").empty();
		var pageul = $("<ul class='pagination justify-content-center' style='margin: 20px 0'>").appendTo("#pagination");
		$(pageul).append("<li id='next' class='page-item' ><a class='page-link' href='#'>이전</a></li>");		
		$(pageul).append("<li class='page-item1'><a class='page-link'>"+pageNum+"</a></li>");
		$(pageul).append("<li id='next' class='page-item' ><a class='page-link' href='#'>다음</a></li>");
	}

	
	
</script>