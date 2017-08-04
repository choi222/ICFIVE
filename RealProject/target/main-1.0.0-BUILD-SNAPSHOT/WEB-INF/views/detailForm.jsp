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
			img,a{
				pointer-events: none;
				cursor: default;
			}
				 div,h4,input,p,th, td { 
				  padding:0;
				  margin:0;}
				
				fieldset, img {border:0}
				
				:focus {outline:none}
				
				body,
				input
				{
				  font-family: 'Open Sans', sans-serif;
				  font-size: 16px;
				  color: #4c4c4c;
				}
				
				h4 {
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
				  width: 358px; 
				  height: 650px; 
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
				
				input[type=text]{
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
				  margin-top: 13px; 
				  text-align: center;
				}
				
				#detail {
				  font-size: 14px;
				  font-weight: 600;
				  color: white;
				  padding: 0px 25px 0px 20px;
				  margin: 10px 8px 20px 0px;
				  display: inline-block;
				  text-decoration: none;
				  width: 95px; height: 27px; 
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
				  margin-left: 5px;
				}
				
				#detail {
				  top: 3px;
				  background-color:#2e458b;
				  -webkit-box-shadow: none; 
				  -moz-box-shadow: none; 
				  box-shadow: none;
				  
				}
				#detai {
				  font-size: 14px;
				  font-weight: 600;
				  color: white;
				  padding: 0px 25px 0px 20px;
				  margin: 10px 8px 20px 0px;
				  display: inline-block;
				  text-decoration: none;
				  width: 127px; height: 27px; 
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
				  margin-left: -5px;
				}
				
				#detai {
				  top: 3px;
				  background-color:#2e458b;
				  -webkit-box-shadow: none; 
				  -moz-box-shadow: none; 
				  box-shadow: none;
				  
				}
				#home {
				  font-size: 14px;
				  font-weight: 600;
				  color: white;
				  padding: 0px 25px 0px 20px;
				  margin: 10px 8px 20px 0px;
				  display: inline-block;
				  text-decoration: none;
				  width: 361px; height: 27px; 
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
				  margin-left: -2px;
				}
				
				#home {
				  top: 3px;
				  background-color:#2e458b;
				  -webkit-box-shadow: none; 
				  -moz-box-shadow: none; 
				  box-shadow: none;
				  
				}
				#attach{
					text-align: center;
				}
				div{
					margin-left: 10px;
				}
				#id{
					margin-left: 38px;
				}
				#name{
					margin-left: 12px;
				}
				#birth{
					margin-left: 21px;
				}
				#email{
					margin-left: 16px;
				}
				#phone{
					margin-left: 9px;
				}
				#join{
					margin-left: 26px;
				}
		</style>
	</head>
	<body>
	<jsp:include page="header.jsp"/>
	
		<div class="testbox">
			  <h4>My Page</h4>
			  <hr>
			  <div id="attach" class="attach"></div><br>
			  <div id="userId">ID : <input type="text" id="id" required readonly value="${sessionScope.loginId}"/></div>
			  <div id="user">Name : <input type="text"  id="name" required readonly="readonly" value="${list.user_name}"/></div>
			  <div id="user">Birth : <input type="text" id="birth" required readonly="readonly" value="${list.birth}"/></div>
			  <div id="user">Email : <input type="text" id="email" required readonly="readonly" value="${list.email}"/></div>
			  <div id="user">Phone : <input type="text" id="phone" required readonly="readonly" value="${list.phone}"/></div>
			  <div id="user">Join : <input type="text"  id="join" required readonly="readonly" value="${list.reg}"/></div>
			  <input type="button" id="detail" onclick="location.href='./alterForm?id=${sessionScope.loginId}'" value="수정하기"/>
			  <input type="button" id="detai" onclick="location.href='./pwmodify?id=${sessionScope.loginId}'"value="비밀번호 변경"/>
			  <input type="button" id="detail" onclick="location.href='./memberdelete?id=${sessionScope.loginId}'" value="회원탈퇴"/>
			  <input type="button" id="home" onclick="location.href='./index'" value="메인으로" >
		</div>
	</body>
	<script>
		var msg="${msg}";
		if(msg!=""){
			alertify.alert(msg);
		}
		
		var ms="${ms}";
		if(ms!=""){
			alertify.alert(ms);
		}
		
		var fileName="${list.filename}";
		var newFileName="${list.newfile}";
		console.log(fileName);
		console.log(newFileName);
		var url="";
		var data={};
		
		if(fileName == ""){
			$("#attach").html("<img style='width:150px; height:150px; border-radius:75px; -moz-border-radius:75px; -khtml-border-radius:75px; -webkit-border-radius:75px;' src='resources/img/profile.jpg'>");
		}else{
			var ext = newFileName.substring(newFileName.lastIndexOf(".")+1);
			 console.log(ext);
			if(ext=="jpg"||ext=="png"||ext=="gif"){
				var content ="<img style='width:150px; height:150px; border-radius:75px; -moz-border-radius:75px; -khtml-border-radius:75px; -webkit-border-radius:75px;'  src='resources/upload/"
					+newFileName+"'/>";
			}else{
				var content ="<img style='width:150px; height:150px; border-radius:75px; -moz-border-radius:75px; -khtml-border-radius:75px; -webkit-border-radius:75px;' src='resources/img/profile.jpg'/>";
			} 
			$("#attach").append(content);
		}
	</script>
</html>