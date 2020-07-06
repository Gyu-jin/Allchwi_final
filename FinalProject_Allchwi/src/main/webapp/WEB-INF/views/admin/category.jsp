<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<script type="text/javascript" src="${cp }/resources/js/jquery-3.5.1.js"></script>
<div id="wrapper" class="container">
	<div id="content-wrapper" class="d-flex flex-column">
	<div>
		<h1>카테고리</h1>
		<form action="${cp }/admin/big_category">
			큰카테고리 입력<input type="text" name="bcategory_name"> 
			<input type="submit" value="입력">
		</form>
		<br>
		
		<select name="cat" class="form-control">
			
		</select>
		<form action="${cp }/admin/small_category">
			참조하는 번호 <input type="text" name="bcategory_num"><br>
			작은 카테고리 입력<input type="text" name="scategory_name"> 
			<input type="submit" value="입력" id="btn1">
		</form>
	</div>
	<br>
	<br>



	<table class="table">
		<thead class="thead-dark">	
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
	


	<div id="result"></div>

</div>
</div>
 
<script type="text/javascript">

		$("#btn1").click(function(e){
			e.preventDefault();
			var bcategory_num = $("input[name='bcategory_num']").val();
			var scategory_name = $("input[name='scategory_name']").val();
			$("#result").empty();
			$.ajax({
				url:"${cp}/admin/small_category",
				data: {bcategory_num:bcategory_num, scategory_name:scategory_name},
				dataType: "json",
				success: function(data){	//json배열이니 each구문을 쓸수잇음
					$(data).each(function(i,arr){
						var str= arr.bcategory_num+","+arr.bcategory_name+","+arr.bcategory_num+","+arr.scategory_name;
						
						
						
						
						
						
						$("#result").append("<div>"+str+"</div>");
					});
				}
			});
		});
	
	
			
		
	

</script>
