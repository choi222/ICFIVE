<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<title>Insert title here</title>
		<style>
			table, td{
				border: 1px solid black;
				border-collapse: collapse;
			}		
			td{
				padding: 5px;
			}
			table{
				width: 100%;
			}
			#div1{
				border: 1px solid black;
				padding: 1px;
				margin-bottom: 10px;
			}
		</style>
	</head>
	<body>
	    <div id=div1>반갑습니다. ${sessionScope.loginId}님<form action="logout"><input type="submit" value="로그아웃" class="d6"/></form></div>
		<table>
			<tr>
				<td>프로젝트 이름</td>
				<td>프로젝트만든이</td>
				<td></td>
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
					<td>
						
					<c:if test="${sessionScope.loginId eq item.user_id}">
					<form action="pro_del">
						<input type="hidden" name="seq" value="${item.seq}"/>
						<input type="hidden" name="userId" value="${sessionScope.loginId}"/>
						<input type="submit" value="삭제하기" class="d6"/>
					</form>
					</c:if>
					
					<c:if test="${sessionScope.loginId ne item.user_id}">
					<form action="pro_teamdel">
						<input type="hidden" name="seq" value="${item.seq}"/>
						<input type="hidden" name="userId" value="${sessionScope.loginId}"/>
						<input type="submit" value="탈퇴하기" class="d6"/>
					</form>
					</c:if>
					
					</td>
				</tr>	
			</c:forEach>	
		</table>
			<input type="button" value="메인으로" onclick="location.href='index'" class="d6"/>
			<input type="button" value="뒤로가기" onclick="back()" class="d6"/>
	</body>
	<script>
		function back(){
			history.back();
		};
	</script>
</html>