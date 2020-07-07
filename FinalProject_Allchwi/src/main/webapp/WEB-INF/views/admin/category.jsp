<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="${cp }/resources/js/jquery-3.5.1.js"></script>
<style>
#searchbar {
	margin-left: 80px;
}

#table {
	margin-left: 80px;
}

.container {
	width: 100%;
	margin: auto;
}
</style>


<div id="wrapper" class="container">
	<div id="content-wrapper" class="d-flex flex-column">
		<div id="searchbar">
			<h1>카테고리</h1>

			<div class="row">

				<div class="input-group mb-1 col-5">
					<input type="text" name="bcategory_name" class="form-control"
						placeholder="대분류 입력해주세요." aria-label="Recipient's username"
						aria-describedby="button-addon2">
					<div class="input-group-append">
						<button class="btn btn-outline-secondary" type="button"
							id="bcate_btn">등록</button>
					</div>
				</div>
			</div>

			<br>


			<div class="row">
				&nbsp; &nbsp; <select name="cat" class="form-control col-2">
					<c:forEach var="vo" items="${bcate_list }">
						<option value="${vo.bcategory_num }">${vo.bcategory_name }</option>
					</c:forEach>
				</select>

				<div class="input-group mb-1 col-5">
					<input type="text" name="scategory_name" class="form-control"
						placeholder="소분류 입력 해주세요." aria-label="Recipient's username"
						aria-describedby="button-addon2">
					<div class="input-group-append">
						<button class="btn btn-outline-secondary" type="button"
							id="scate_btn">등록</button>
					</div>
				</div>
			</div>
		</div>
		<br> <br>
		<div id="table">
			<table class="table">
				<thead class="thead-dark">
					<tr>
						<th scope="col">큰카테고리 번호</th>
						<th scope="col">큰카테고리 이름</th>
						<th scope="col">작은 카테고리 이름</th>
						<th scope="col">삭제하기</th>
					</tr>
				</thead>
				<tbody id="tb">
					<c:forEach var="vo" items="${list }">
						<tr>
							<td id="bnum">${vo.bcategory_num }</td>
							<td>${vo.bcategory_name }</td>
							<td>${vo.scategory_name }</td>
							<td><button type="button" class="btn btn-outline-secondary del_btn" onclick="del(${vo.scategory_num},${vo.bcategory_num })"
										value="${vo.scategory_num}">삭제</button></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>

<script type="text/javascript">

		$("#bcate_btn").click(function(){
			var bcategory_name = $("input[name='bcategory_name']").val();
			$.getJSON({
				url:"${cp}/admin/big_category/insert",
				data: {bcategory_name:bcategory_name},
				success: function(data){
					//$("select[name=cat]").empty();
					$("#tb").empty();
					$(data).each(function(i,arr){
						var bcategory_num= arr.bcategory_num;
						var bcategory_name= arr.bcategory_name;
						var scategory_name = arr.scategory_name;	
						var scategory_num = arr.scategory_num;
						
						if(scategory_num ==null || scategory_num ==""){
							scategory_num=0;
						}
						
						
						$("#tb").append("<tr>");
							$("#tb").append("<td id=''>"+bcategory_num+"</td>");
							console.log(bcategory_num);
							$("#tb").append("<td>"+bcategory_name+"</td>");
							if(scategory_name==undefined){
								$("#tb").append("<td> </td>");
							}else{
								$("#tb").append("<td>"+scategory_name+"</td>");
							}
							$("#tb").append("<td><button type='button' class='btn btn-outline-secondary del_btn' onclick='del("+ scategory_num+","+ bcategory_num+")' value='"+bcategory_num+"'>삭제</button></td>");
							
						$("#tb").append("</tr>");
						
						$.getJSON({
							url:"${cp}/admin/big_category_list",
							success: function(data){
								$("select[name=cat]").empty();
								$(data).each(function(i,bcate){
									var bcategory_num = bcate.bcategory_num;						
									var bcategory_name = bcate.bcategory_name;
									
									$("select[name=cat]").append("<option value="+bcategory_num+">"+bcategory_name+"</option>");
								});
							}
						});
					});
				}
			});
		});
		
	

		$("#scate_btn").click(function(){
			var bcategory_num = $("select[name='cat']").val();
			var scategory_name = $("input[name='scategory_name']").val();
			$.ajax({
				url:"${cp}/admin/small_category",
				data: {bcategory_num:bcategory_num, scategory_name:scategory_name},
				dataType: "json",
				success: function(data){	//json배열이니 each구문을 쓸수잇음
					redundlist(data);
				}
			});
		});
		
		function del(scategory,bcategory){
			var scategory_num = scategory;
			console.log(scategory);
			if(scategory_num!=0){
				$.getJSON({
					url:"${cp}/admin/category/deleteScate",
					data: {scategory_num:scategory_num},
					success: function(data){	
						redundlist(data);
					}
				});	
			}else{
				var bcategory_num = bcategory;	
				console.log(bcategory_num);
				$.getJSON({
					url:"${cp}/admin/category/deleteBcate",
					data: {bcategory_num:bcategory_num},
					success: function(data){
						redundlist(data);
					}		
				});
			}
		}
		
		
		
		
		function redundlist(data){
			$("#tb").empty();
			$(data).each(function(i,arr){
				var bcategory_num= arr.bcategory_num;
				var bcategory_name= arr.bcategory_name;
				var scategory_name = arr.scategory_name;	
				$("#tb").append("<tr>");
					$("#tb").append("<td>"+bcategory_num+"</td>");
					$("#tb").append("<td>"+bcategory_name+"</td>");
					if(scategory_name==undefined){
						$("#tb").append("<td> </td>");
					}else{
						$("#tb").append("<td>"+scategory_name+"</td>");
					}
					$("#tb").append("<td><button type='button' class='btn btn-outline-secondary del_btn' onclick='del("+ scategory_num+","+ bcategory_num+")' value='"+bcategory_num+"'>삭제</button></td>");
				$("#tb").append("</tr>");
			});
	}
		
		
</script>
