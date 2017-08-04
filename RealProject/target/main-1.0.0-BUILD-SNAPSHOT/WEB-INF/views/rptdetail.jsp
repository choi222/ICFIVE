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
				h3{
					border-top:white;
					border-bottom:white;
					padding: 5px;
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
	<h3 style="text-align: center; color: #AAAAAA; margin-bottom: white; margin-top: white;">일일/주간 상세보기</h3>
		<table class="board">
			<tr>
				<td>글번호</td>
				<td id="report_seq">${list.report_seq}</td>
			</tr>
			<tr>
				<td>작성자</td>
				<td>${list.user_id}</td>
			</tr>
			<tr>
				<td>프로젝트 이름</td>
				<td>${list.pro_name}</td>
			</tr>
			<tr>
				<td>제목</td>
				<td colspan="5">
					${list.subject}
				</td>
			</tr>
			<tr>
				<td>내용</td>
				<td colspan="5">
					${list.content}
				</td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td colspan="5" id="attach">
				
				</td>
			</tr>
			<tr>
				<td colspan="6">
					<input type="button" onclick="location.href='./reportboard?idx=${list.seq}'" value="목록보기"/>
					<c:if test="${sessionScope.loginId eq list.user_id}">
						<input type="button" onclick="location.href='./rptupdateForm?report_seq=${list.report_seq}'" value="수정하기"/>
					</c:if>
				</td>
			</tr>
		</table>	
		
	</body>
	<script>
	var fileMap={};
	var url="";
	var data={};	
	
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
				content += "	<a href='./rpt_download?file="+item+" '>"
				+"<img width='15px' src='resources/img/default.png'/> "
				+fileMap[item]+"</a>";
			}
		});
		$("#attach").append(content);
	}
	function goBack(){
		history.back();
	}
	
	</script>
</html>