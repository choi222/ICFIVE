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
			h3{
				border-top:white;
				border-bottom:white;
				padding: 5px;
			}
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
						margin-left: 13%;
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
	<h3 style="text-align: center; color: #AAAAAA; margin-bottom: white; margin-top: white;">산출물 상세보기</h3>
		<table class="board">
			<tr>
				<td>글번호</td>
				<td id="idx">${detail.seq}</td>
				<td>작성자</td>
				<td>${detail.user_id}</td>
				<td>조회수</td>
				<td>${detail.hit}</td>
			</tr>
			<tr>
				<td>제목</td>
				<td colspan="5">
					${detail.subject}
				</td>
			</tr>
			<tr>
				<td>내용</td>
				<td colspan="5">
					${detail.content}
				</td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td colspan="5" id="attach">
				
				</td>
			</tr>
			<tr>
				<td colspan="6">
					<input type="button" onclick="location.href='./outputboard'" value="목록보기"/>
					<c:if test="${sessionScope.loginId eq detail.user_id}">
						<input type="button" onclick="location.href='./outputupdateForm?idx=${detail.seq}'" value="수정하기"/>
					</c:if>
				</td>
			</tr>
		</table>	
		
		<h3 style="text-align: center; color: #AAAAAA; margin-bottom: white; margin-top: white;">이 글의 댓글</h3>
		<!-- 댓글 등록 폼 -->
		<table id="repleForm" class="board">
			<tr>
				<td class="user">${sessionScope.loginId}</td>
				<td class="data"><textarea id="content" rows="3"></textarea></td>
				<td class="btn"><input type="button" id="go" value="댓글달기"/></td>
			</tr>
		</table>
		<!-- 댓글 리스트 -->
		<table id="repleZone"></table>
	</body>
	<script>
	var fileName="${detail.fileName}";
	var newFileName="${detail.newFile}";
	var url="";
	var data={};
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
	
	repleList();
	
	//댓글 등록
	$("#go").click(function(){
		url="./rest/repleRegist";
		data={};
		data.idx = $("#idx").html();
		data.user = "${sessionScope.loginId}";
		data.content = $("#content").val();
		console.log(data);
		sendAjax(url,data);
	});
	
	//댓글 리스트 보기
	function repleList(){
		url="./rest/repleList";
		data={};
		data.idx = $("#idx").html(); 
		sendAjax(url,data);
	}
	
	//댓글 지우기
	function repleDel(idx, seq){
		url="./rest/repleDel";
		data={};
		data.seq = seq;
		data.idx = idx;
		sendAjax(url,data);
	}
	
	function sendAjax(reqUrl, reqData){
		console.log(reqUrl, reqData);
		$.ajax({
			url:reqUrl,
			type:"get",
			data:reqData,
			dataType:"json",
			success:function(d){				
				if(reqUrl=="./rest/repleRegist"){
					console.log(d.success);
					if(d.success == 1){
						$("#content").val("");
						repleList();
					}else{
					}
				}	
				if(reqUrl=="./rest/repleList"){
					printList(d.list);
				}
				if(reqUrl=="./rest/repleDel"){
					if(d.success == 1){
						alert("삭제에 성공 했습니다.");
						repleList();
					}else{
						alert("삭제에 실패 했습니다.");
					}
				}
			},
			error:function(e){
				console.log(e);
			}
		});
	}
	
	function printList(list){
		$("#repleZone").empty();
		var content = "";
		
		list.forEach(function(item){
			content +="<tr>";
			content +="<td class='user'>"+item.replyer+"</td>";
			content +="<td>"+item.re_content;
			if(item.replyer == "${sessionScope.loginId}"){
				content += "<a href='#' onclick='repleDel("+item.idx+","+item.seq+")'> X</a>";
			}
			content +="</td></tr>";
		});
		
		$("#repleZone").append(content);		
	}
	
	</script>
</html>