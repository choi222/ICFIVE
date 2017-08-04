<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<title>Insert title here</title>
		<style></style>
	</head>
	<body>
		<form id="fileUpload" action="./fileUpload" method="post" enctype="multipart/form-data">
			<input type="file" name="file" onchange="fileView(this)"/>
			<input id="fileName" type="hidden" name="fileName"/>
		</form>	
	</body>
	<script>
		var filePath="${path}";	
		console.log(filePath);
		
		function fileView(elem){
			var fullPath = elem.value;
			var fileName = fullPath.substring(12);
			$("#fileName").val(fileName);
			$("#fileUpload").submit();
		}
		
		if(filePath !=""){
			
			var fileName = filePath.substring(17);
			var ext = fileName.substring(fileName.lastIndexOf(".")+1);
			var content = "";
			if(ext == "jpg" || ext =="png" || ext =="gif"){//이미지
				var elem = window.opener.document.getElementById("editable");
				content ="<a id='"+fileName+"' href='#' onclick='del(this)'>"
						+"<img width='1000' src='${path}'/>"									
						+" <b>X</b> </a><br/>";
				elem.innerHTML += content;
			}else{//이미지가 아닐 경우
				var elem = window.opener.document.getElementById("files");
				content ="<a id='"+fileName+"' href='#' onclick='del(this)'>"
					+"<img width='250' src='resources/img/default.png'/> "+fileName
					+"<b> X </b></a>"								
				elem.innerHTML += content;
			}			

			self.close();
		}
	
	</script>
</html>