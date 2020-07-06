<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<div id="wrapper" class="container">
	<div id="content-wrapper" class="d-flex flex-column">
	<div>
		<h1>카테고리</h1>
		<form action="${cp }/admin/big_category">
			큰카테고리 입력<input type="text" name="bcategory_name"> 
			<input type="submit" value="입력">
		</form>
		<br>

		<form action="${cp }/admin/small_category">
			참조하는 번호 <input type="text" name="bcategory_num"><br>
			작은 카테고리 입력<input type="text" name="scategory_name"> 
			<input type="submit" value="입력">
		</form>
	</div>
	<br>
	<br>

	<table class="table">
		<thead class="thead-dark">	<!-- class="thead-light" -->
			<tr>
				<th scope="col">큰카테고리  번호</th>
				<th scope="col">큰카테고리  이름</th>
				<th scope="col">참조하는 큰카테고리 번호</th>
				<th scope="col">작은 카테고리 이름</th>	
			</tr>
		</thead>
		<tbody>
			<c:forEach var="vo" items="${list }">
			<tr>
				<th scope="row">${vo.bcategory_num }</th>
				<td>${vo.bcategory_name }</td>
				<td>${vo.bcategory_num }</td>
				<td>${vo.scategory_name }</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>






	</div>
</div>
