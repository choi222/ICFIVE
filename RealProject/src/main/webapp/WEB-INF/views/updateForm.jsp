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
		<form id="sendForm" action="update" method="post">
		<table class="board">
		
			<tr>
				<th>제목</th>
				<td><input type="text" name="subject" value="${detail.subject}"/></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>
					<input type="text" name="user_name" 
						value="${sessionScope.loginId }" readonly/>
					<input type="hidden" name="idx" value="${detail.idx}"/></td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<div id="editable" contenteditable="true">
						${detail.content}
					</div>
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
					<input id="save" type="button" value="수정"/>
					<input type="reset" value="취소"/>
					<input type="button" value="리스트" onclick="goBack()"/>
				</th>
			</tr>
		</table>
		</form>
	</body>
	<script>		
		var msg = "${msg}";
		var fileMap={};
		
	<c:forEach items="${files}" var="list">
		fileMap["${list.newFile}"] = "${list.oldFile}";
	</c:forEach>
		
		console.log(fileMap);
		
		if(fileMap.length < 1){
			$("#attach").html("첨부된 파일이 없습니다.");
		}else{
			//object 에서 키만 뽑아 내는 과정
			var ext;
			var content="";
			Object.keys(fileMap).forEach(function(item){
				console.log(item);
				ext = item.substring(item.lastIndexOf(".")+1);
				console.log(ext);
				if(ext!="jpg" && ext!="png" && ext!="gif"){
					content += "<a id='"+item+"' href='#' onclick='del(this)'>"
					+"<img width='15' src='resources/img/default.png'/> "+fileMap[item]
					+"<b> X </b></a>";						
				}
			});
			$("#files").append(content);
		}
		
		if(msg!=""){
			alert(msg);
		}
	
		function goBack(){
			location.href="./outputboard";
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