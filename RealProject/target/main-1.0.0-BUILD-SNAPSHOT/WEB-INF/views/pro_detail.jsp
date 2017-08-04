<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
		<title>Insert title here</title>
		<link rel="icon" href="resources/img/icon.png">
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
						font-size:15px;
						color:#777777;
					}
			table{
				width:155px;
				
			}
			#table1{
				width: 100%;
			}
			#static,#titlediv{
				position: static;
				margin-left: 11%;
				border-bottom: #AAAAAA;
				border-top: #AAAAAA;
			}
			 #relative2{
				position:relative;
				width: 100%;
			} 
			#div1{
				position: relative;
				left:0px;
			}
			
			#titlediv{
				width: 727px;
				border-top:white;
				border-bottom:white;
				padding: 5px;
			}
			#teamname{
				padding: 5px;
			}
			#teamname2{
				width:100%;
				height:80px;
				overflow:auto;
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
				h3{
					width:100%;
					margin-bottom: white;
					margin-top: white;
				}
				#td1{
					width:100%;
				}
				#attach{
					height: 40px;
					width: 1000px;
					overflow: auto;
				}
				 #tbl1{
					width: 100%;
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
	<div id="div1">
	<div id="static"><h3 style="text-align: center; color: #AAAAAA;"><div id="titlediv">프로젝트 상세보기</div></h3></div>

	
		<table id="table1">
			<tr>
				<td>프로젝트번호</td>
				<td id="idx">${detail.seq}</td>
			</tr>
			<tr>
				<td>작성자</td>
				<td>${detail.user_id}</td>
			</tr>
			<tr>
				<td>프로젝트이름</td>
				<td colspan="5" id="pro_name">
					${detail.subject}
				</td>
			</tr>
			<tr>
				<td>팀이름</td>
				<td colspan="5">
					${detail.teamname}
				</td>
			</tr>
			<tr>
				<td>시작날짜</td>
				<td colspan="5">
					${detail.daystart}
				</td>
			</tr>
			<tr>
				<td>종료날짜</td>
				<td colspan="5">
					${detail.dayend}
				</td>
			</tr>
			</table>
			<br>
			<div id="relative2">
			<table style="width: 100%;">
				<tr>
					<td>초대받은 팀원 <input type="button" value="초대하기" onclick="gopopup()"/></td>
				</tr>
				<tr>
					<td>
						<div id="teamname2">
							<c:forEach items="${team}" var="item">
									<div id="teamname">
										<img src="resources/img/User-Role-Guest-icon.png" width="15px" height="15px"/>
									 	${item.name}  (${item.user_id})
									</div>	
							</c:forEach>
						</div>
					</td>
				</tr>
			</table>
			</div>
			<br>
			<table style="width: 100%;">
			
			<tr>
				<td id="attach">프로젝트 내용</td>
			<tr/>
			<tr>
				<td colspan="5" >
					${detail.content}
				</td>
			</tr>
			<tr>
				<td colspan="6">
					<input type="button" onclick="location.href='./detail?pro_name=${detail.subject}'" value="목록보기"/>
					
					<c:if test="${sessionScope.loginId eq detail.user_id}">
						<input type="button" onclick="location.href='./pro_updateForm?idx=${detail.seq}'" value="수정하기"/>
					</c:if>
				</td>
			</tr>
		</table><br>
			
		<table style="width: 100%;"><td id="td1">프로젝트 진행률</td></table>
		<div id="timeline" style="height: 100%; width: 100%;" ></div>
		</div>
	</body>
	<script>
	var fileMap={};
	var url="";
	var data={};	
	var gantrate = [];	
	var row=[];
	
	var today = new Date();
    var dd = today.getDate();
    var mm = today.getMonth()+1; //January is 0!
    var yyyy = today.getFullYear();
    if(dd<10) {
        dd='0'+dd
    } 
    if(mm<10) {
        mm='0'+mm
    } 
    today = yyyy+'-'+mm+'-'+dd;
	
	google.charts.load('current', {'packages':['timeline']});
	
	$(document).ready(function(){
		data={};
		data.proname = "${detail.subject}";
		sendAjax("./rest/gant",data);
	});
	
	
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
				content += "	<a href='./pro_download?file="+item+"'>"
				+"<img width='15px' src='resources/img/default.png'/> "
				+fileMap[item]+"</a>";
			}
		});
		$("#attach").append(content);
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
				}else if(reqUrl=="./rest/gant"){
					gant(d.gant);
				}
			},
			error:function(e){
				console.log(e);
			}
		});
	}
	function gant(gant){
        gantrate = [];
        gantrate.push('오늘날짜');
        gantrate.push(new Date(today));
        gantrate.push(new Date(today));
        row.push(gantrate);
        gant.forEach(function(item){
            gantrate = [];
            gantrate.push(item.workname);
            gantrate.push(new Date(item.daystart));
            gantrate.push(new Date(item.dayend));
            row.push(gantrate);
            google.charts.setOnLoadCallback(drawChart);
        });
    }
	
    
    function drawChart() {
      var container = document.getElementById('timeline');
      var chart = new google.visualization.Timeline(container);
      var dataTable = new google.visualization.DataTable();

      dataTable.addColumn({ type: 'string', id: 'President' });
      dataTable.addColumn({ type: 'date', id: 'Start' });
      dataTable.addColumn({ type: 'date', id: 'End' });
      dataTable.addRows(row);

      chart.draw(dataTable);
    }
    
    function gopopup(){
  	  window.open("./pro_inviteForm?subject=${detail.subject}","초대하기","width=300,height=300,resizable=yes");
    }
  
	</script>
</html>