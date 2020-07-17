<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="${cp }/resources/js/jquery-3.5.1.js"></script>

<div class="container-fluid">
	<div class="breadcrumb">
		<h2>회원결제내역</h2>
		<div style="margin-left: 860px;">
			<select class="form-control col-2"
				style="display: inline-block; width: 550px;">
				<option>11</option>
				<option>22</option>
			</select>
			<form class="form-inline" style="display: inline-block">
				<input class="form-control mr-sm-2" type="text" />
				<button class="btn btn-primary my-2 my-sm-0" type="submit">
					Search</button>
			</form>
		</div>
	</div>

	<table class="table table-hover">
		<thead class="thead-dark">
			<tr>
				<th>Firstname</th>
				<th>Lastname</th>
				<th>Email</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="vo" items="${list }">
			<tr>
				<td>${vo.num }</td>
				<td>${vo.name }</td>
				<td>${vo.pwd }</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>

</div>

