<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>	
			<title>Insert title here</title>
		<style></style>
	</head>
	<body>
		<div id=login></div>
	</body>
	<script>
		 var id="${sessionScope.loginId}";
		if(id == ""){
			location.href="main.jsp";
		}else{
			var content="<a href='./detailForm?id=${sessionScope.loginId}'>${nickname}</a>"+" 님  <a href='./logout'>로그아웃</a>";
			$("#login").html(content);
		}
		var name="${nickname}";
		console.log(name);
	</script>
</html>