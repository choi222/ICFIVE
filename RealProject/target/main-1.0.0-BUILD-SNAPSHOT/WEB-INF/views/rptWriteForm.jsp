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
		<style>
			input,th,td{
				background-color:#FFFFFF;
				background-image:url("/SRC2/_image/inputBG.gif");
				background-position:left top;
				background-repeat:no-repeat;
				border:1px #AAAAAA solid;
				padding-top:5px;
				font-family:tahoma;
				font-size:12px;
				color:black;
			}
		</style>
	</head>
	<body>
	<jsp:include page="header.jsp"/>
		<h2>일일/주간 보고 작성</h2>
		<form id="sendForm" action="rptWrite" method="post">
		<table class="board">
			<tr>
				<th>제목</th>
				<td><input type="text" name="subject"/></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>
					<input type="text" name="user_id" 
						value="${sessionScope.loginId }" readonly/>
				</td>
			</tr>
			<tr>
				<th>프로젝트 이름</th>
				<td>
					<input type="text" name="pro_name" 
						value="${prname}" readonly/>
				</td>
			</tr>
			<tr>
				<th>프로젝트 번호</th>
				<td>
					<input type="text" name="idx" 
						value="${idx}" readonly/>
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
				<th>파일첨부</th>
				<td>
					<input type="button" onclick="fileUp()" value="파일 업로드"/>
					<div id="files"></div>
				</td>
			</tr>
			<tr>
				<th colspan="2">
					<input id="save" type="submit" value="글 작성"/>
					<input type="reset" value="취소"/>
					<input type="button" value="리스트" onclick="goBack()"/>
				</th>
			</tr>
		</table>
		</form>
	</body>
	<script>		
		var msg = "";
		if(msg!=""){
			alert(msg);
		}
	
		function goBack(){
			history.back();
			/* location.href="./reportboard"; */
		}
		
		function fileUp(){
			//새창 띄움
			var myWin = window.open("./uploadForm","파일업로드","width=400, height=100");
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