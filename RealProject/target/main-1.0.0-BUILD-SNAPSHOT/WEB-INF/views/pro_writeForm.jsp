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
			h3{
				border-top:white;
				border-bottom:white;
				padding: 5px;
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
		<h3 style="text-align: center; color: #AAAAAA; margin-bottom: white; margin-top: white;">프로젝트 등록</h3>
		<form id="sendForm" method="post">
		<input type="hidden" name="name" id="name" value="${subject.user_name}"/>
		<table  class="board">
			<tr>
				<th >프로젝트이름</th>
				<td >
					<input type="text" name="subject" id="subject"/>
					<input id="overlays" type="button" value="중복확인" class="d6"/>
				</td>
				</tr>
				<tr>
				<th>시작날짜</th>
				<td ><input type="date" id="startday"/></td>
				</tr>
				<tr>
				<th>종료날짜</th>
				<td ><input type="date" id="endday"/></td>
				</tr>
		
			<tr>
				<th>팀이름</th>
				<td colspan="3"><input type="text" name="teamname" id="teamname"/></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td colspan="3">
					<input type="text" name="user_name" id="userId" 
						value="${sessionScope.loginId }" readonly/>
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td colspan="3">
					<div id="editable" contenteditable="true"></div><br/>
					<input id="content" type="hidden" name="content"/>
				</td>
			</tr>
			<tr>
				<th>파일첨부</th>
				<td colspan="3">
					<input type="button" onclick="fileUp()" value="파일 업로드" class="d6"/>
					<div id="files"></div>
				</td>
			</tr>
			<tr>
				<th colspan="4">
					<input id="pro_write" type="button" value="글 작성" class="d6"/>
					<input type="reset" value="취소" class="d6"/>
				</th>
			</tr>
		</table>
		</form>
	</body>
	<script>		
		var chkSum = 0;
		var url;
		var data;
		
		var msg = "${msg}";
		if(msg!=""){
			alert(msg);
		}
	
		function fileUp(){
			//새창 띄움
			var myWin = window.open("./uploadForm","파일업로드","width=400, height=100");
		}
		
		//중복 확인
		$("#overlays").click(function(){
			data ={};
			data.subject = $("#subject").val();
			ajaxCall("./rest/overlays",data);
		});
		//글작성
		$("#pro_write").click(function(){
			data={};
			data.name=$("#name").val();
			data.id=$("#userId").val();
			data.subject=$("#subject").val();
			data.teamname=$("#teamname").val();
			data.content=$("#editable").html();
			data.startday=$("#startday").val();
			data.endday=$("#endday").val();
			
			if(chkSum<1){
				alert("프로젝트명 확인을 해 주세요!");
			}else{
				ajaxCall("./rest/pro_write", data);
			}	
		});
		/* //글작성
		$("#save").click(function(){
			if(chkSum<1){
				alert("프로젝트이름과 중복확인을 확인해 주세요!");
				chkSum = 0;
			}		
		}); */
		function ajaxCall(reqUrl, reqData){
			$.ajax({
				url:reqUrl,
				type:'get',
				dataType:'json',
				data: reqData,
				success:function(d){
					console.log(d);
					if(reqUrl=="./rest/overlays"){
						if(d.use == "Y"){
							console.log(chkSum);
							alert("사용 가능한 프로젝트 이름입니다.");
							chkSum++;
						}else{
							alert("누군가가 사용 하고 있는 프로젝트 이름 입니다.");
							$("#subject").val("");
						}
					}else{
						if(d.success == 1){
							alert("프로젝트생성에 성공하셨습니다.");
							location.href="index";
						}else{
							alert("가입에 실패 하였습니다. 다시 입력 해 주세요!");
						}
					}
				},
				error:function(e){
					console.log(e);
				}				
			});			
		}
		/* function ajaxCall(reqUrl, reqData){
			$.ajax({
				url:reqUrl,
				type:'get',
				dataType:'json',
				data: reqData,
				success:function(d){
					console.log(d);
					if(reqUrl=="./rest/pro_overlay"){
						if(d.use == "Y"){
							chkSum ++;
							alert("사용 가능한 프로젝트 이름입니다.");
						}else{
							alert("누군가가 사용 하고 있는 프로젝트 이름입니다.");
							$("#subject").val("");
						}
					}
				},
				error:function(e){
					console.log(e);
				}				
			});			
		} */
	
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
	</script>
</html>