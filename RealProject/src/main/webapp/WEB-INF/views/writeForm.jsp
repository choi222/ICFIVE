<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<link rel="icon" href="resources/img/icon.png">
		<title>Insert title here</title>
		<link rel="stylesheet" href="resources/css/common.css">
	</head>
	<body>
		${loginBox}
		<form id="sendForm" action="write" method="post" enctype="multipart/form-data">
		<table class="board">
			<tr>
				<th>제목</th>
				<td><input type="text" name="subject"/></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>
					<input type="text" name="user_name" 
						value="${sessionScope.loginId }" readonly/>
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<div id="editable" contenteditable="true"></div>
					<input id="content" type="hidden" name="content" value=""/>
				</td>
			</tr>
			<tr>
				<td>파일첨부</td>
				<td>
					<input type="file" name="file" onchange="fileView(this)"/>
					<input id="fileName" type="hidden" name="fileName"/>
				</td>
			</tr>
			<tr>
				<th colspan="2">
					<input id="save" type="button" value="글 작성"/>
					<input type="reset" value="취소"/>
					<input type="button" value="리스트" onclick="goBack()"/>
				</th>
			</tr>
		</table>
		</form>
	</body>
	<script>		
		var msg = "${msg}";
		if(msg!=""){
			alert(msg);
		}
	
		function goBack(){
			location.href="./outputboard";
		}
		
		function fileView(elem){
			var fullPath = elem.value;
			var fileName = fullPath.substring(12);
			console.log(fileName);
			$("#fileName").val(fileName);
		}
		
		function del(elem){
			console.log(elem.id);
			$.ajax({
				url:"./rest/fileDelete",
				type:"get",
				data:{"fileName":elem.id},
				dataType:"json",
				success:function(d){
					console.log(d);
					if(d.success == 1){
						//해당 요 소가 감싸고 있는 자식 요소를 삭제
						var element = document.getElementById(elem.id);
						element.parentNode.removeChild(element);
					}
				},
				error:function(e){
					console.log(e);					
				}
			});
		}
		
		$("#save").click(function(){
			$("#content").val($("#editable").html());
			$("#sendForm").submit();
		});
		
		
		
		
		
	</script>
</html>