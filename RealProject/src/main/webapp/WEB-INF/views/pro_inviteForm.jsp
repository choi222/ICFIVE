<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<title>Insert title here</title>
		<style>
		/* 	 #static{
				position: static;
			}
			#relative2{
				position:absolute;
				top: 500px;
				left: 40%;
			}  */
			/* form{
				width:50%;
			} */
			#home {
				  font-size: 14px;
				  font-weight: 600;
				  color: white;
				  padding: 0px 25px 0px 20px;
				  margin: 10px 8px 20px 0px;
				  display: inline-block;
				  text-decoration: none;
				  height: 27px; 
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
		</style>
	</head>
	<body>
	<div id="static"><h3 style="text-align: center; color: #AAAAAA; margin-bottom: white; margin-top: white;">팀원 초대하기</h3></div>
	<div id="relative2">
		<form action="pro_invite">
			<input type="text" name="invite"/>
			<input type="hidden" name="seq" value="${subject.seq}"/>
			<input type="hidden" name="subject" value="${subject.subject}"/>
			<input type="submit" value="검색" id="home"/>
		</form>
		
		<c:forEach items="${list}" var="item">
			<form action="pro_invite2">
				Name : ${item.user_name}<br>
				ID : ${item.user_id}<br>
				<input type="submit" value="초대하기" id="home"/>
			<table>
				<tr>
					<td><input type="hidden" name="seq" value="${subject.seq}"/></td>
					<td><input type="hidden" name="subject" value="${subject.subject}"/></td>
				</tr>
			</table>	
			</form>
		</c:forEach>
		</div>
			
		
	</body>
	<script>
		var msg="${msg}";
		if(msg!=""){
			alert(msg);
		}
		
	</script>
</html>