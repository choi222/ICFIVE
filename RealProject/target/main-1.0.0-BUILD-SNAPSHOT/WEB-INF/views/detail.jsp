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
				border-top:1px solid black;
				border-bottom:1px solid black;
				padding: 5px;
			}
		</style>
	</head>
	<body>
	<jsp:include page="header.jsp"/>
	<h3>프로젝트 상세보기</h3>
		<table class="board">
			<tr>
				<td>글번호</td>
				<td id="idx">${detail.idx}</td>
				<td>작성자</td>
				<td>${detail.user_name}</td>
				<td>조회수</td>
				<td>${detail.bHit}</td>
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
					<input type="button" onclick="location.href='./updateForm?idx=${detail.idx}'" value="수정하기"/>
				</td>
			</tr>
		</table>	
		
		<h3>이 글의 댓글</h3>
		<!-- 댓글 등록 폼 -->
		<table id="repleForm" class="board">
			<tr>
				<td class="user">${sessionScope.loginId}</td>
				<td class="data"><textarea id="content" rows="3"></textarea></td>
				<td class="btn"><button id="go">댓글달기</button></td>
			</tr>
		</table>
		<!-- 댓글 리스트 -->
		<table id="repleZone"></table>
	</body>
	<script>
	var fileMap={};
	var url="";
	var data={};	
	
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
				content += "	<a href='./download?file="+item+"'>"
				+"<img width='15px' src='resources/img/default.png'/> "
				+fileMap[item]+"</a>";
			}
		});
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
	function repleDel(repleIdx, idx){
		url="./rest/repleDel";
		data={};
		data.idx = idx
		data.repleIdx = repleIdx;
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
						alert("등록에 성공 했습니다.");
						$("#content").val("");
						repleList();
					}else{
						alert("등록에 실패 했습니다.");
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
			content +="<td>"+item.reple;
			if(item.replyer == "${sessionScope.loginId}"){
				content += "<a href='#' onclick='repleDel("+item.repleIdx+","+item.idx+")'> X</a>";
			}
			content +="</td></tr>";
		});
		
		$("#repleZone").append(content);		
	}
	
	</script>
</html>