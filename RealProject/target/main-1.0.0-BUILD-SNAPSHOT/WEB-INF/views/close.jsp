<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>	
			<title>Insert title here</title>
		<style>
			#home{
				  font-size: 14px;
				  font-weight: 600;
				  color: white;
				  padding: 0px 25px 0px 20px;
				  margin: 10px 8px 20px 0px;
				  display: inline-block;
				  text-decoration: none;
				  width: 90px; height: 27px; 
				  -webkit-border-radius: 5px; 
				  -moz-border-radius: 5px; 
				  border-radius: 5px; 
				  background-color: #3a57af; 
				  -webkit-box-shadow: 0 3px rgba(58,87,175,.75); 
				  -moz-box-shadow: 0 3px rgba(58,87,175,.75); 
				  box-shadow: 0 3px rgba(58,87,175,.75);
				  transition: all 0.1s linear 0s; 
				  top: 0px;
				  position: relative;
				}
				
				#home{
				  top: 3px;
				  background-color:#2e458b;
				  -webkit-box-shadow: none; 
				  -moz-box-shadow: none; 
				  box-shadow: none;
				  
				}
		</style>
	</head>
	<body>
		<h2>탈퇴가 완료되었습니다.</h2>
		<input type="button" id="home" onclick="win()" value="닫기"/>
	</body>
	<script>
		function win(){
			opener.parent.location="./";
			window.close();
		}
	</script>
</html>