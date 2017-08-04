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
				color:#777777;
			}
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
				margin-left: 12%;
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
		</style>
	</head>
	<body>
	<jsp:include page="header.jsp"/>
	<ul>
		<li><a href="index">메인</a></li>
		<li><a href="./detailForm?id=${sessionScope.loginId}">내정보</a></li>
		<li><a href="/main/outputlist?userId=${sessionScope.loginId}">내 프로젝트</a></li>
		<li><a href="/main/outputboard">산출물게시판</a></li>
		<li><a href="/main/pro_writeForm?userId=${sessionScope.loginId}">프로젝트 등록</a></li>
		<li><a href="./calendar">달력 일정</a></li>
	</ul>
	<!-- ------------------------menu bar-------------------------------- -->
		<form action="outputupdate" method="post" enctype="multipart/form-data">
		<table class="board">
			<tr>
				<td>글번호</td>
				<td>${detail.seq}</td>
				<td>작성자</td>
				<td>${detail.user_id}</td>
				<td>조회수</td>
				<td>${detail.hit}</td>
			</tr>
			<tr>
				<td>제목</td>
				<td colspan="5">
					<input type="text" name="subject" value="${detail.subject}"/>
				</td>
			</tr>
			<tr>
				<td>내용</td>
				<td colspan="5">
					<textarea name="content" rows="20">${detail.content}</textarea>
				</td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td colspan="5" id="attach">
					<input type="file" name="file" onchange="fileView(this)"/>
					<input type="hidden" name="delFileName" value="${detail.newFile}"/>
					<input id="fileName" type="hidden" name="fileName" value="nofile"/></br>
				</td>
			</tr>
			<tr>
			<td colspan="6">
				<input type="button" onclick="location.href='./outputboard'" value="목록보기"/>
				<input type="submit" value="저장하기"/>
			</td>
			</tr>
		</table>
		<input type="hidden" name="idx" value="${detail.seq}"/>
	</form>
</body>
<script>

	var msg= "${msg}";
	if(msg!=""){
		alert(msg);
	}
	var fileName="${detail.fileName}";
	var newFileName="${detail.newFile}";
	//파일명 추출
	function fileView(elem){
		var fullPath = elem.value;
		var fileName = fullPath.substring(12);
		console.log(fileName);
		$("#fileName").val(fileName);
	}
	
	//파일 및 사진 표시
	if(fileName==""){
		$("#attach").html("첨부된 파일이 없습니다.");
	}else{
		var name = fileName.substring(fileName.lastIndexOf(".")+1);
		if(name=="jpg"||name=="png"||name=="gif"){
			var content = "<img width='400px' src='/main/resources/upload/"+newFileName+"'/>";
		}else{
			var content = "<a href='./download?file="+newFileName+"'>"
					+"<img width='15px' src='resources/img/default.png'/>"
					+fileName+"</a>"
					
		}
		$("#attach").append(content);
	}
	
</script>
</html>