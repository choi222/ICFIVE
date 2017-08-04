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
		<form id="sendForm" action="rptupdate" method="post">
		<table class="board" style="width: 100%;">
		
			<tr>
				<th>제목</th>
				<td><input type="text" name="subject" value="${list.subject}"/></td>
			</tr>
			
			<tr>
				<th>작성자</th>
				<td>
					<input type="text" name="user_name" 
						value="${sessionScope.loginId }" readonly/>
					<input type="hidden" name="report_seq" value="${list.report_seq}"/></td>
			</tr>
			
			<tr>
				<th>프로젝트 이름</th>
				<td><input type="text" name="pro_name" value="${list.pro_name}" readonly/></td>
			</tr>
			
			<tr>
				<th>내용</th>
				<td>
					<div id="editable" contenteditable="true">
						${list.content}
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
				<!-- <tr>
				<td>첨부파일</td>
				<td colspan="5" id="attach">
					<input type="file" name="file" onchange="fileView(this)"/>
					<input type="hidden" name="delFileName" value="${detail.newFile}"/>
					<input id="fileName" type="hidden" name="fileName" value="nofile"/></br>
				</td>
			</tr> -->
			</tr>
			<tr>
				<th colspan="2">
					<input id="save" type="button" value="수정"/>
					<input type="reset" value="리셋"/>
					<input type="button" value="리스트" onclick="location.href='./reportboard?idx=${list.seq}'"/>
				</th>
			</tr>
		</table>
		</form>
	</body>
	<script>		
		var msg = "${msg}";
		var fileMap={};
		
	<c:forEach items="${files}" var="list">
		fileMap["${list.newfile}"] = "${list.oldfile}";
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