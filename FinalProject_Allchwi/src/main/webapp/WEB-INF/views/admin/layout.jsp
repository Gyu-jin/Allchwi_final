<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

  <!-- Bootstrap core JavaScript-->
  <script src="${cp}/resources/vendor/jquery/jquery.min.js"></script>
  <script src="${cp}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="${cp}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="${cp}/resources/js/sb-admin-2.min.js"></script>
  <!-- 부트스트랩 기본 js -->
  <script type="text/javascript" src="${cp}/resources/js/bootstrap.js"></script>
</head>
<body>
	<h1>멤메메메메</h1>
	<div id="wrap">
		<div id="sidebar">
			<tiles:insertAttribute name="sidebar"/>
		</div>
		<div id="main">
			<tiles:insertAttribute name="main"/>
		</div>
	</div>	
</div>
	
	
</body>
</html>