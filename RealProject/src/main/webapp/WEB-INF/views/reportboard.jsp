<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<script src="resources/twbsPagination.js"></script>
		<script src="resources/bootstrap.js"></script>
		<script src="resources/bootstrap.min.js"></script>
		<script src="resources/npm.js"></script>
		<link rel="icon" href="resources/img/icon.png">
		<link rel="stylesheet" href="resources/css/bootstrap-theme.css">
		<link rel="stylesheet" href="resources/css/bootstrap-theme.min.css">
		<link rel="stylesheet" href="resources/css/bootstrap.css">
		<link rel="stylesheet" href="resources/css/bootstrap.min.css">
		<link rel="stylesheet" href="css/style.css">
		
		<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
		<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script> 
		
		<title>Insert title here</title>
		<style>
		th{
			background-color: #dcdcdc; 
			}
		body {
	        margin: 0;
	      }
	      #fixed-menu {
	        width: 100%;
	        background-color: #ffffff;
	        position: fixed;
			top: 0px;
			left: 0px;
	      }
	      
	      #main-content {
	        width: 100%;
			margin-top: 50px;
	      }
	      #fixed-menu li {
	        display: inline-block;
	        margin-right: 30px;
	      }
	      img {
	        width: 100%;
	        height: 20%;
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
			h3{
				border-top:white;
				border-bottom:white;
				padding: 5px;
			}
			#comentdiv{
              border: 1px solid black;
              width: 1000px;
              height: 400px;
              overflow: auto;
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
	<h3 style="text-align: center; color: #AAAAAA; margin-bottom: white; margin-top: white;">일일/주간 보고 게시판</h3>
	<h style="text-align: center; color: #AAAAAA;">보여줄 게시물 수:</h>
	<select id="pagePerNum">
	<option value="10">10개</option>
		<option value="5">5개</option>
		<option value="15">15개</option>
		<option value="20">20개</option>
	</select>	
	
	<input type="date" id="day">
	~
	<input type="date" id="day1" >
	
	<input type="button" onclick="monday()" value="검색">
	<p></p>
	<table class="table table-hover">
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
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
			<span style="float:right">
			<form action="rptWriteForm">
				<input type="hidden" name="pro_name" value="${subject.subject}"/>
				<input type="hidden" name="idx" value="${subject.seq}"/>
				<input class="d6" type="submit" value="글쓰기"/>
			</form>
			</span>
			</td>
		</tr>
	</table>	
		<div id="comentdiv">
      	  <c:forEach items="${list}" var="item">
       	     ${item.user_id}:${item.content}
       	     	<c:if test="${sessionScope.loginId eq item.user_id}">
        	    	<a href="./commentdel?idx=${item.idx}&seq=${item.seq}">x</a><br/>
        	    </c:if>
     	   </c:forEach>
    	</div>
        <form action="comment">
            <input type="hidden" name="user_id" value="${sessionScope.loginId}"/>
            <input type="hidden" name="pro_name" value="${subject.subject}"/>
            <input type="hidden" name="idx" value="${subject.seq}"/>
            <input type="text" name="content"/>
            <input type="submit" value="작성"> 
        </form>
	
	</body>
	<script>
	var showPage = 1;
	var url;
	var data;
	
	var msg = "${msg}"; 
	if(msg !=""){
		alert(msg);
	}
	function back(){
		history.back();		
	};
	
	rptlistCall(showPage);
	
	$("#pagePerNum").change(function(){
		rptlistCall(showPage);
	});
	
	function monday(){
		url="./rest/monday"
		data={};
		data.day=$("#day").val();
		data.day1=$("#day1").val();
		data.proname="${subject.subject}";
		ajaxCall(url,data);
	}
	
	function rptlistCall(page){
		url="./rest/rptlistCall"
		data={};
		data.page = page;
		data.pagePerNum = $("#pagePerNum").val();
		//받아온 pro_name으로 리스트 뽑아낼 때 값 비교위해
		data.pro_name = "${subject.subject}";
		ajaxCall(url,data);
	}
	
	function rptdel(report_seq){
		url="./rest/rptdel";
		data={};
		data.report_seq = report_seq;
		data.id = "${sessionScope.loginId}";
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
				if(reqUrl=="./rest/rptlistCall"){
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
							rptlistCall(page);
						}
					});
				}else if(reqUrl=="./rest/rptdel"){
					console.log(d.success);
					if(d.success==1){
						alert("삭제 되었습니다.");
						rptlistCall(showPage);
					}else{
						alert("삭제에 실패 하였습니다.");
					}
				}else if(reqUrl=="./rest/monday"){
					$("#pagePerNum").css("display","none");
					$(".container").css("display","none");
					listPrint(d.list);
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
			content+="<td>"+list[i].report_seq+"</td>";
			content+="<td>";
			if(list[i].newfile != null){
				content +="<img width='15px' src='resources/img/default.png'/>";
			}
			content+="<a href='./rptdetail?report_seq="+list[i].report_seq+"'>"
					+list[i].subject+"</a> </td>";
			content+="<td>"+list[i].user_id+"</td>";
			content+="<td>"+list[i].reg_date+"</td>";	
			content+="<td><a href='#' onclick='rptdel("+list[i].report_seq+")'>삭제</a></td>";	
			content+="</tr>";
		}						
		$("#list").empty();
		$("#list").append(content);
	}
	
	</script>
</html>