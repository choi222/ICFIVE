<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <link rel="stylesheet" href="resources/css/alertify.core.css" />
        <link rel="stylesheet" href="resources/css/alertify.default.css" id="toggleCSS" />
        <script src="resources/js/alertify.min.js"></script>	
			<title>Insert title here</title>
		<style>
			body, div, dl, dt, dd, ul, ol, li, h1, h2, h3, h4, h5, h6, 
				pre, form, fieldset, input, textarea, p, blockquote, th, td { 
				  padding:0;
				  margin:0;}
				
				fieldset, img {border:0}
				
				
				body,
				input{
				  font-family: 'Open Sans', sans-serif;
				  font-size: 16px;
				  color: #4c4c4c;
				}
				
				p {
				  font-size: 12px;
				  width: 150px;
				  display: inline-block;
				  margin-left: 18px;
				}
				h1 {
				  font-size: 32px;
				  font-weight: 300;
				  color: #4c4c4c;
				  text-align: center;
				  padding-top: 10px;
				  margin-bottom: 10px;
				}
				
				html{
				  background-color: #ffffff;
				}
				
				.testbox {
				  margin: 20px auto;
				  width: 343px; 
				  height: 464px; 
				  -webkit-border-radius: 8px/7px; 
				  -moz-border-radius: 8px/7px; 
				  border-radius: 8px/7px; 
				  background-color: #ebebeb; 
				  -webkit-box-shadow: 1px 2px 5px rgba(0,0,0,.31); 
				  -moz-box-shadow: 1px 2px 5px rgba(0,0,0,.31); 
				  box-shadow: 1px 2px 5px rgba(0,0,0,.31); 
				  border: solid 1px #cbc9c9;
				}
				
				form{
				  margin: 0 30px;
				}
				
				hr{
				  color: #a9a9a9;
				  opacity: 0.3;
				}
				
				input[type=text],input[type=password]{
				  width: 200px; 
				  height: 39px; 
				  -webkit-border-radius: 0px 4px 4px 0px/5px 5px 4px 4px; 
				  -moz-border-radius: 0px 4px 4px 0px/0px 0px 4px 4px; 
				  border-radius: 0px 4px 4px 0px/5px 5px 4px 4px; 
				  background-color: #fff; 
				  -webkit-box-shadow: 1px 2px 5px rgba(0,0,0,.09); 
				  -moz-box-shadow: 1px 2px 5px rgba(0,0,0,.09); 
				  box-shadow: 1px 2px 5px rgba(0,0,0,.09); 
				  border: solid 1px #cbc9c9;
				  margin-left: 30px;
				  margin-top: 30px; 
				  padding-left: 10px;
				}
				#can{
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
				
				#can{
				  top: 3px;
				  background-color:#2e458b;
				  -webkit-box-shadow: none; 
				  -moz-box-shadow: none; 
				  box-shadow: none;
				  margin-top: 40px;
				  margin-left: 5px;
				  
				}
				#del{
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
				
				#del{
				  top: 3px;
				  background-color:#2e458b;
				  -webkit-box-shadow: none; 
				  -moz-box-shadow: none; 
				  box-shadow: none;
				  margin-top: 70px;
				  margin-left: 30px;
				  
				}
		</style>
	</head>
	<body>
	<jsp:include page="header.jsp"/>
		<div class="testbox">
			  <h1>회원 탈퇴</h1>
			
			  <form action="delete" method="post">
			  <hr>
			  <input type="text" value="${sessionScope.loginId}" name="userId" readonly/>
			  <input type="password" placeholder="비밀번호를 입력해주세요" name="userPw"/> 
			  <input type="submit" id="del" value="탈퇴"/>
			  <input type="button" id="can" value="취소" onclick="location.href='./detailForm?id=${sessionScope.loginId}'"/>
			  </form>
		</div>
	</body>
	<script>
		var msg = "${msg}";
		if(msg!=""){
			alertify.alert(msg);
		}
	</script>
</html>