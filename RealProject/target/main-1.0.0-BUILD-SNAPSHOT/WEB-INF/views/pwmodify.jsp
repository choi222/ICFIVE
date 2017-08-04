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
			body, div, h1, h2, h3, h4, h5, h6, 
				pre,fieldset, input, textarea, p, blockquote, th, td { 
				  padding:0;
				  margin:0;}
				
				fieldset, img {border:0}
				
				
				
				input{
				  font-family: 'Open Sans', sans-serif;
				  font-size: 16px;
				  color: #4c4c4c;
				}
				
				h1 {
				  font-size: 32px;
				  font-weight: 300;
				  color: #4c4c4c;
				  text-align: center;
				  padding-top: 10px;
				  margin-bottom: 10px;
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
				  margin-top: 30px; 
				  padding-left: 10px;
				}
				
				#modify{
				  font-size: 14px;
				  font-weight: 600;
				  color: white;
				  padding: 0px 25px 0px 20px;
				  margin: 10px 8px 20px 0px;
				  display: inline-block;
				  text-decoration: none;
				  width: 100px; height: 27px; 
				  -webkit-border-radius: 5px; 
				  -moz-border-radius: 5px; 
				  border-radius: 5px; 
				  background-color: #3a57af; 
				  -webkit-box-shadow: 0 3px rgba(58,87,175,.75); 
				  -moz-box-shadow: 0 3px rgba(58,87,175,.75); 
				  box-shadow: 0 3px rgba(58,87,175,.75);
				  transition: all 0.1s linear 0s; 
				  top: 0px;
				  position: static;
				  margin-left: 28px;
				  margin-top: 40px;
				}
				
				#modify {
				  top: 3px;
				  background-color:#2e458b;
				  -webkit-box-shadow: none; 
				  -moz-box-shadow: none; 
				  box-shadow: none;
				  
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
				  position: static;
				}
				
				#can {
				  top: 3px;
				  background-color:#2e458b;
				  -webkit-box-shadow: none; 
				  -moz-box-shadow: none; 
				  box-shadow: none;
				  margin-top: 40px;
				  
				}
				#userId{
					margin-left: 30px;
					text-align: center;
				}
				#userPw{
					margin-left: 21px;
					text-align: center;
				}
				#usernPw{
					margin-left: 5px;
					text-align: center;
					width: 177px;
				}
				#usernPwchk{
					margin-left: 5px;
					text-align: center;
					width: 177px;
				}
		</style>
	</head>
	<body>
	<jsp:include page="header.jsp"/>
		<div class="testbox">
			  <h1>패스워드 변경</h1>
			
			  <form name="form" method="post" action="modify">
				  <hr>
				  <div id="use">ID : <input type="text" value="${sessionScope.loginId}" id="userId" name="userId"/></div>
				  <div id="use">PW : <input type="password" placeholder="현재 비밀번호" id="userPw" name="userPw"/></div>
				  <div id="use">New PW : <input type="password" placeholder="새 비밀번호" id="usernPw" name="usernPw"/></div>
				  <div id="use">New PW : <input type="password" placeholder="새 비밀번호 확인" id="usernPwchk" name="usernPwchk"/></div> 
				  <span id="matchMsg"></span>
				  <div><input type="button" value="변경" id="modify"/>
				  <input type="button" id="can" value="취소" onclick="location.href='./detailForm?id=${sessionScope.loginId}'"/></div>
			  </form>
		</div>
	</body>
	<script>
		var url;
		var data;
		
		//수정
		$("#modify").click(function(){
			if($("#usernPw").val() != $("#usernPwchk").val()){
				alertify.alert("새로운 비밀번호가 일치하지 않습니다.");
			}else if($("#usernPw").val() == "" || $("#usernPwchk").val() == ""){
				alertify.alert("정보를 모두 입력해 주세요.");
			}else{
			data={};
			data.id = $("#userId").val();
			data.pw=$("#userPw").val();
			data.newpw=$("#usernPw").val();
			data.newpwchk=$("#usernPwchk").val();
			ajaxCall("./rest/modify",data);
			}
		});
		
		
		//ajax 실행
		function ajaxCall(reqUrl, reqData){
			$.ajax({
				url:reqUrl,
				type:'get',
				dataType:'json',
				data: reqData,
				success:function(d){
					console.log(d);
					if(reqUrl == "./rest/modify"){
						if(d.success){
							alert("수정에 성공하였습니다.");
							location.href = "./detailForm?id=${sessionScope.loginId}";
						}else{
							alertify.alert("현재 비밀번호를 확인해 주세요.");
							$("#userPw").val("");
						}
					}
				},
				error:function(e){
					console.log(e);
				}				
			});			
		}

		
	</script>
</html>