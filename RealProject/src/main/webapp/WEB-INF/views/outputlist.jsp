<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		
		<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
		<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
		
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <link rel="stylesheet" href="resources/css/alertify.core.css" />
        <link rel="stylesheet" href="resources/css/alertify.default.css" id="toggleCSS" />
        <script src="resources/js/alertify.min.js"></script>
		<title>Insert title here</title>
		<style>
		h3{
				border-top:white;
				border-bottom:white;
				padding: 5px;
		}
			th{
			background-color: #dcdcdc; 
			}
			td,th{
				text-align: center;
			}
			/* ------------------------menu bar-------------------------------- */
			 ul ul {
				display: none;
			}
			
				 ul li:hover > ul {
					display: block;
				}
			
			
			 ul {
				background: #efefef; 
				background: linear-gradient(top, #efefef 0%, #bbbbbb 100%);  
				background: -moz-linear-gradient(top, #efefef 0%, #bbbbbb 100%); 
				background: -webkit-linear-gradient(top, #efefef 0%,#bbbbbb 100%); 
				box-shadow: 0px 0px 9px rgba(0,0,0,0.15);
				padding: 0 20px;
				border-radius: 10px;  
				list-style: none;
				position: relative;
				display: inline-table;
				margin-left: 15%;
			}
				 ul:after {
					content: ""; clear: both; display: block;
				}
			
				 ul li {
					float: left;
				}
					 ul li:hover {
						background: #4b545f;
						background: linear-gradient(top, #4f5964 0%, #5f6975 40%);
						background: -moz-linear-gradient(top, #4f5964 0%, #5f6975 40%);
						background: -webkit-linear-gradient(top, #4f5964 0%,#5f6975 40%);
					}
						 ul li:hover a {
							color: #fff;
						}
					
					 ul li a {
						display: block; padding: 25px 40px;
						color: #757575; text-decoration: none;
					}
						
					
				 ul ul {
					background: #5f6975; border-radius: 0px; padding: 0;
					position: absolute; top: 100%;
				}
					 ul ul li {
						float: none; 
						border-top: 1px solid #6b727c;
						border-bottom: 1px solid #575f6a; position: relative;
					}
						 ul ul li a {
							padding: 15px 40px;
							color: #fff;
						}	
							 ul ul li a:hover {
								background: #4b545f;
							}
					
				 ul ul ul {
					position: absolute; left: 100%; top:0;
				}
				#home {
				  font-size: 14px;
				  font-weight: 600;
				  color: white;
				  padding: 0px 25px 0px 20px;
				  display: inline-block;
				  text-decoration: none; 
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
				  background-color:#2e458b;
				  -webkit-box-shadow: none; 
				  -moz-box-shadow: none; 
				  box-shadow: none;
				  
				}
				input,th,td{
				background-color:#FFFFFF;
				background-position:left top;
				background-repeat:no-repeat;
				border:1px #AAAAAA solid;
				padding-top:5px;
				font-family:tahoma;
				font-size:12px;
				color:#777777;
			}
			#td-top{
				border-bottom: white;
				border-top: white; 
				border-right: white;
				
			}
			#td11{
				width: 100px;
				height: 
			}
			#tbl1{
				float: right;
			}
		</style>
	</head>
	<body>
	<jsp:include page="header.jsp"/><br>
		<ul>
			<li><a href="index">메인</a></li>
			<li><a href="./detailForm?id=${sessionScope.loginId}">내정보</a></li>
			<li><a href="/main/outputlist?userId=${sessionScope.loginId}">내 프로젝트</a></li>
			<li><a href="/main/outputboard">산출물게시판</a></li>
			<li><a href="/main/pro_writeForm?userId=${sessionScope.loginId}">프로젝트 등록</a></li>
			<li><a href="./calendar">달력 일정</a></li>
		</ul><br>
	<!-- ------------------------menu bar-------------------------------- -->
	
		
	<h3 style="text-align: center; color: #AAAAAA; margin-bottom: white; margin-top: white;">내 프로젝트 보기</h3>
	  
		<table class="table table-hover">
			<tr>
				<th>프로젝트 이름</th>
				<th>프로젝트만든이</th>
				<th>프로젝트 상태</th>
				<th>삭제/탈퇴</th>
			</tr>		
			<c:forEach items="${list}" var="item">
				<tr>
					<td>
						<a href="./detail?pro_name=${item.pro_name}">
							${item.pro_name}
						</a>
					</td>
					<td>
						${item.user_id}
					</td>
					<td id="tt">
						${item.finish}
					</td>
					<td>
						
					<c:if test="${sessionScope.loginId eq item.user_id}">
					<form action="pro_del">
						<input type="hidden" name="seq" value="${item.seq}"/>
						<input type="hidden" name="userId" value="${sessionScope.loginId}"/>
						<input type="submit" value="삭제하기" class="d6" id="home"/>
					</form>
					</c:if>
					
					<c:if test="${sessionScope.loginId ne item.user_id}">
					<form action="pro_teamdel">
						<input type="hidden" name="seq" value="${item.seq}"/>
						<input type="hidden" name="userId" value="${sessionScope.loginId}"/>
						<input type="submit" value="탈퇴하기" class="d6" id="home"/>
					</form>
					</c:if>
					
					</td>
				</tr>	
			</c:forEach>	
		</table>
	</body>
	<script>
	
		function back(){
			history.back();
		};
		
	</script>
</html>