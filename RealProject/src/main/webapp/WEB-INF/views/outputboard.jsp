<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<script src="resources/twbsPagination.js"></script>
		<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
		
    	<!-- <script src="http://code.jquery.com/jquery-2.0.3.min.js"></script> -->
		<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script> 
		
		<title>Insert title here</title>
		<style>
		h3{
				border-top:white;
				border-bottom:white;
				padding: 5px;
		}
		th{
			background-color: #dcdcdc; 
		}
/* 		#h1{
			font-size: 15px;
			text-align: left;
			color:black;
		}
 */		/* .container{
			float: left;
		}
		.dropdown {
		  display: inline-block;
		  position: relative;
		  overflow: hidden;
		  height: 28px;
		  width: 150px;
		  background: #dcdcdc;
		  border: 1px solid;
		  border-color: white #f7f7f7 #f5f5f5;
		  border-radius: 3px;
		  background-image: -webkit-linear-gradient(top, transparent, rgba(0, 0, 0, 0.06));
		  background-image: -moz-linear-gradient(top, transparent, rgba(0, 0, 0, 0.06));
		  background-image: -o-linear-gradient(top, transparent, rgba(0, 0, 0, 0.06));
		  background-image: linear-gradient(to bottom, transparent, rgba(0, 0, 0, 0.06));
		  -webkit-box-shadow: 0 1px 1px rgba(0, 0, 0, 0.08);
		  box-shadow: 0 1px 1px rgba(0, 0, 0, 0.08);
		}
		.dropdown:before, .dropdown:after {
		  content: '';
		  position: absolute;
		  z-index: 2;
		  top: 9px;
		  right: 10px;
		  width: 0;
		  height: 0;
		  border: 4px dashed;
		  border-color: #888 transparent;
		  pointer-events: none;
		}
		.dropdown:before {
		  border-bottom-style: solid;
		  border-top: none;
		}
		.dropdown:after {
		  margin-top: 7px;
		  border-top-style: solid;
		  border-bottom: none;
		}
		
		.dropdown-select {
		  position: relative;
		  width: 130%;
		  margin: 0;
		  padding: 6px 8px 6px 10px;
		  height: 28px;
		  line-height: 14px;
		  font-size: 12px;
		  color: #62717a;
		  text-shadow: 0 1px white;
		  /* Fallback for IE 8 */
		  background: #f2f2f2;
		  /* "transparent" doesn't work with Opera */
		  background: rgba(0, 0, 0, 0) !important;
		  border: 0;
		  border-radius: 0;
		  -webkit-appearance: none;
		}
		.dropdown-select:focus {
		  z-index: 3;
		  width: 100%;
		  color: #394349;
		  outline: 2px solid #49aff2;
		  outline: 2px solid -webkit-focus-ring-color;
		  outline-offset: -2px;
		}
		.dropdown-select > option {
		  margin: 3px;
		  padding: 6px 8px;
		  text-shadow: none;
		  background: #f2f2f2;
		  border-radius: 3px;
		  cursor: pointer;
		} */
		
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
			margin-left: 15%;
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
			input,th,td{
				background-color:#FFFFFF;
				background-position:left top;
				background-repeat:no-repeat;
				border:1px #AAAAAA solid;
				padding-top:5px;
				font-family:tahoma;
				font-size:12px;
				color:#777777;
			}
		</style>
	</head>
	<body>
		<jsp:include page="header.jsp"/><br>
	<ul>
		<li><a href="index">메인</a></li>
		<li><a href="./detailForm?id=${sessionScope.loginId}">내정보</a></li>
		<li><a href="/main/outputlist?userId=${sessionScope.loginId}">내 프로젝트</a></li>
		<li><a href="/main/outputboard">산출물게시판</a></li>
		<li><a href="/main/pro_writeForm?userId=${sessionScope.loginId}">프로젝트 등록</a></li>
		<li><a href="./calendar">달력 일정</a></li>
	</ul>
	<!-- ------------------------menu bar-------------------------------- -->
	<h3 style="text-align: center; color: #AAAAAA; margin-bottom: white; margin-top: white;">산출물 관리 게시판</h3>
			<h style="text-align: center; color: #AAAAAA;">보여줄 게시물 수 : </h>     
					<select id="pagePerNum">
						<option value="10">10개</option>
						<option value="5">5개</option>
						<option value="15">15개</option>
						<option value="20">20개</option>
					</select>
					<input type="text" id="keyword" class="d6"/>
					<input type="button" onclick="keyword()" value="프로젝트 검색" class="d6"/><br><br>
		
	<table class="table table-hover">
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody id="list">
			<!-- 리스트가 출력될 영역 -->
		</tbody>
		<tr>
			<td colspan="6">
			<div class="container">
			    <nav aria-label="Page navigation" style="text-align:center">
			        <ul class="pagination" id="pagination"></ul>
			    </nav>
			</div>
			<span style="float:right"><button onclick="location.href='writeForm'" class="d6">글쓰기</button></span>
			</td>
		</tr>
	</table>	
	</body>
	<script>
	var showPage = 1;
	var url;
	var data;
	
	var msg = "${msg}";
	if(msg !=""){
		alert(msg);
	}
	
	
	listCall(showPage);
	
	$("#pagePerNum").change(function(){
		listCall(showPage);
	});
	
	function listCall(page){
		url="./rest/listCall"
		data={};
		data.page = page;
		data.pagePerNum = $("#pagePerNum").val();
		ajaxCall(url,data);
	}
	
	function del(idx){
		url="./rest/del";
		data={};
		data.idx = idx;
		ajaxCall(url,data);
	}
	
	function keyword(){
		url="./rest/keyword";
		data={};
		data.keyword=$("#keyword").val();
		ajaxCall(url,data);
	}
	
	function ajaxCall(reqUrl, reqData){
		console.log(reqUrl, reqData);
		$.ajax({
			url:reqUrl,
			type:"post",
			data:reqData,
			dataType:"json",
			success:function(d){				
				if(reqUrl=="./rest/listCall"){
					console.log("총 보여줄 페이지 : "+d.range);
					showPage = d.currPage;
					listPrint(d.list);
					$('#pagination').twbsPagination({
						startPage: d.currPage,	//시작 페이지
						totalPages: d.range,	//총 페이지 갯수
						visiblePages: 5,	//보여줄 페이지 수
						onPageClick: function (event, page) {
							console.log(event);
							console.log(page);
							listCall(page);
						}
					});
				}else if(reqUrl=="./rest/del"){
					console.log(d.success);
					if(d.success==1){
						alert("삭제 되었습니다.");
						listCall(showPage);
					}else{
						alert("삭제에 실패 하였습니다.");
					}
				}
				if(reqUrl=="./rest/keyword"){
					listPrint(d.list);
					$("#pagePerNum").css("display","none");
					$(".container").css("display","none");
				}
			},
			error:function(e){
				console.log(e);
			}
		});
	}
	
	//리스트 그리기
	function listPrint(list){			
		var content="";					
		for(var i=0; i<list.length; i++){
			content+="<tr>";
			content+="<td>"+list[i].seq+"</td>";
			content+="<td>";
			if(list[i].fileName !=null){
				content +="<img width='15px' src='resources/img/default.png'/>";
			}
			content+="<a href='./outputdetail?idx="+list[i].seq+"'>"
					+list[i].subject+"</a> <b>["+list[i].reple+"]</b></td>";
			content+="<td>"+list[i].user_id+"</td>";
			content+="<td>"+list[i].reg_date+"</td>";
			content+="<td>"+list[i].hit+"</td>";	
			content+="<td><a href='#' onclick='del("+list[i].seq+")'>삭제</a></td>";	
			content+="</tr>";
			console.log("시퀀스 번호 : "+list[i].seq);
		}						
		
		$("#list").empty();
		$("#list").append(content);			
	}
	</script>
</html>