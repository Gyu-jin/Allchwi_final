<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<script type="text/javascript" src="${cp }/resources/js/jquery-3.5.1.js"></script>
<style>
	#searchbar{
    	margin-left: 200px;
	}
	
	#table{
		margin-left: 200px;
	}
	.container{
		width:100%;
		margin: auto;
	}
</style>


<div id="wrapper" class="container">
	<div id="content-wrapper" class="d-flex flex-column">
	<div id="searchbar">
		<h1>카테고리</h1>
		
			
			<div class="input-group mb-3">
  				<input type="text" name="bcategory_name" class="form-control"  placeholder="대분류 입력해주세요." aria-label="Recipient's username" aria-describedby="button-addon2">
  				<div class="input-group-append">
   					 <button class="btn btn-outline-secondary" type="button" id="bcate_btn">등록</button>
  				</div>
			</div>	
		<br>
		
		
		<div class="row">
			<select name="cat" class="form-control col-3">
				<c:forEach var="vo" items="${bcate_list }">
					<option value="${vo.bcategory_num }" >${vo.bcategory_name }</option>
				</c:forEach>
			</select>
				
			<div class="input-group mb-3 col-9">
	  			<input type="text" name="scategory_name" class="form-control"  placeholder="소분류 입력 해주세요." aria-label="Recipient's username" aria-describedby="button-addon2">
	  			<div class="input-group-append">
	   				<button class="btn btn-outline-secondary" type="button" id="scate_btn">등록</button>
	  			</div>
			</div>	
		</div>
	</div>
		<br>
		<br>
		<div id="table">
			<table class="table">
				<thead class="thead-dark">	
					<tr>
						<th scope="col">큰카테고리  번호</th>
						<th scope="col">큰카테고리  이름</th>
						<th scope="col">작은 카테고리 이름</th>	
					</tr>
				</thead>
				<tbody id="tb">
					<c:forEach var="vo" items="${list }">
						<tr>
							<td>${vo.bcategory_num }</td>
							<td>${vo.bcategory_name }</td>
							<td>${vo.scategory_name }</td>
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
				url:"${cp}/admin/big_category",
				data: {bcategory_name:bcategory_name},
				success: function(data){
					//$("select[name=cat]").empty();
					$("#tb").empty();
					$(data).each(function(i,arr){
						var bcategory_num= arr.bcategory_num;
						var bcategory_name= arr.bcategory_name;
						var scategory_name = arr.scategory_name;	
																								
						$("#tb").append("<tr>");
							$("#tb").append("<td>"+bcategory_num+"</td>");
							$("#tb").append("<td>"+bcategory_name+"</td>");
							$("#tb").append("<td>"+scategory_name+"</td>");
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
					$("#tb").empty();
					$(data).each(function(i,arr){
						var bcategory_num= arr.bcategory_num;
						var bcategory_name= arr.bcategory_name;
						var scategory_name = arr.scategory_name;	
						$("#tb").append("<tr>");
							$("#tb").append("<td>"+bcategory_num+"</td>");
							$("#tb").append("<td>"+bcategory_name+"</td>");
							$("#tb").append("<td>"+scategory_name+"</td>");
						$("#tb").append("</tr>");
					});
				}
			});
		});
	
</script>
