<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
		
		<title>Insert title here</title>
		
		<style>
		body{
			border:1px solid #EEEEEE;
			
		}
			table,td,th{
				border:1px solid black;
				border-collapse:collapse;
				text-align:center;
				
			}
			td,th{
				padding:5px;
			}
			input[type='text']{
				background-color:#EEEEEE;
				width: 300px;
				text-align: center;
			}
			#book{
	
				width:100px;
				height:50px;
				text-align:center;
				display:none;
				
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
			h3{
				border-top:white;
				border-bottom:white;
				padding: 5px;
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
				#Anthony_chart_div{
					width: 100%;
				}
				#ai{
					width: 40%;
				}
				#bi{
					width: 5%;
				}
				#ci{
					width: 10%;
				}
				#di{
					width: 25%;
				}
				#de{
					margin-top: 10px;
				}
				#det{
					margin-top:13px;
				}
				#dett{
					margin-top:10px;
				}
				#ei{
					width: 10%;
				}
				#fi{
					width: 25%;
				}
				#gi{
					width: 40%;
				}
				#hi{
					width: 15%;
				}
				#ii{
					width: 25%;
				}
				#workname{
					margin-top: 3px;
				}
				#finish{
					margin-top: 7px;
				}
				#td-top{
					border-bottom: white;
					border-top: white; 
					border-right: white;
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
		</ul><br>
	<%-- <table>
		<tr>
			<td>접속자</td>
			<td>프로젝트명</td>
			<td></td>
		</tr>
		<tr>
			<td>${sessionScope.Name}님</br></td>
			<td>${list[0].pro_name}</br></td>
			<td id="td-top">
				<form action="logout">
					<input type="submit" value="로그아웃"/>
				</form>
			</td>
		</tr>
	</table> --%>
	   
	   <h3 style="text-align: center; color: #AAAAAA; margin-bottom: white; margin-top: white;">프로젝트 상세보기</h3>
	   	
		<div id="hang">
		<table>
			<tr>
				<td id="ai">항목이름 : <input type="text" id="workname"/>&nbsp</td>
				<td id="bi"><input type="button" onclick="add()" value="추가"/>
				<input type="hidden" name=idx value="${detail.seq}"/>
				</td>
				<td id="ci"><input type="button" onclick="chartReset()" value="차트초기화"/></td>
				<input type = "hidden" id="proname" value="${list[0].pro_name }"/>
				<!-- <div id="book"></div> -->
				<td id="di"><form action="pro_detail">
					<input type="hidden" name=idx value="${detail.seq}"/>
					<input type="submit" value="프로젝트 상세보기" id="de"/>
				</form>
				</td>
				<td id="ei">
					<form action="pro_inviteForm">
						<input type="hidden" name=subject value="${detail.subject}"/>
						<input type="button" id="det" value="초대하기" onclick="gopopup()"/>&nbsp
					</form>
				</td>
				<td id="fi">
					<form action="reportboard">
						<input type="hidden" name="idx" value="${detail.seq}"/>
						<input type="submit" value="일일 주간 보고게시판" id="dett"/>
					</form>
				</td>
				<td>
                    <form action="finish" name="myform">
                        <input type="hidden" name="idx" value="${detail.seq}"/>
                        <input type="hidden" name="id" value="${sessionScope.loginId}"/>
                        <input type="button"  value="프로젝트 종료" id="finish"/>
                    </form>
                </td>
			</tr>
		</table>
		</div>
		<br>
		<table>
		<thead>
			<tr>
				<td id="gi">항목이름 </td>
				<td id="hi">진행상황</td>
				<td id="ii">담당자</td>
				<td>시작일</td>
				<td>종료일</td>
				<td>삭제</td>
			</tr>		
		</thead>
		<tbody id="list">
		 
		</tbody>
			
		</table>
		<br>
		<table class="columns">
	    <tr>
	    	<th>프로젝트 기여도</th>
	    	<th>프로젝트 진행률</th>
	    </tr>
	    <tr>
	       <td id="tt"><div id="Sarah_chart_div" style="border: 1px solid #ccc"></div></td>
	    	<td><div id="Anthony_chart_div" style="border: 1px solid #ccc"></div></td>
	    </tr>
  	  </table>
	</body>
	<script>
	//ajax
	var url;
	var data={};
	//차트
	var all;
	var finish;
	var unfinish;
	var conrate = [];
	var row=[];

	$(document).ready(function(){
		data={};
		data.proname = $("#proname").val();
		ajaxCall("./rest/prolist",data);
		
		
		document.addEventListener("focusin",function(e){
			e.srcElement.style.backgroundColor="white";
			console.log(e);
		});
		
		document.addEventListener("focusout",function(e){
			e.srcElement.style.backgroundColor="#EEEEEE";
			var elem=e.srcElement;
			
			if(elem.defaultValue != elem.value){
				$('#book').css("display","block");
				$('#book').fadeOut('slow', function() {});
				data={};
				var cls = elem.className.split("_");
				
				console.log(cls);
				data.col = cls[1];
				data.val = elem.value;
				data.pro_idx = cls[0];
				if(e.target.id !="workname"){
					ajaxCall("./rest/save",data);
				}
			}
		});
	});
	
	function add(){
		data={};
		data.workname = $("#workname").val();
		data.seq =  $("#seq").val();
		data.teamname =  $("#teamname").val();
		console.log(data.teamname);
		data.pronames = $("#pronames").val();
		ajaxCall("./rest/add",data);
	}
	function del(idx){
		data={};
		data.pro_idx=idx;
		ajaxCall("./rest/delpro",data);
	}
	
	function ajaxCall(reqUrl,reqData){
		$.ajax({
			url:reqUrl,
			data:reqData,
			dataType:'json',
			success:function(d){
				console.log(d);
				if(reqUrl=="./rest/prolist"){
					listDraw(d.list);
					data.seq = $("#seq").val();
					ajaxCall("./rest/chart",data); 
					data.pronames = $("#pronames").val();
					ajaxCall("./rest/conchart",data); 
				}
				if(reqUrl=="./rest/add"){
					data.proname = $("#proname").val();
					ajaxCall("./rest/prolist",data);
					 window.location.reload();
				}
				if(reqUrl=="./rest/delpro"){
					data.proname = $("#proname").val();
					ajaxCall("./rest/prolist",data);
					window.location.reload();
				}
				if(reqUrl=="./rest/chart"){
					all = d.all;
					finish = d.finish;
					unfinish = all-finish;
					  // Draw the pie chart for Sarah's pizza when Charts is loaded.
				      google.charts.setOnLoadCallback(drawSarahChart);

				
				}
				if(reqUrl=="./rest/save"){
					data.seq = $("#seq").val();
					ajaxCall("./rest/chart",data); 
				}
				if(reqUrl=="./rest/conchart"){
					con(d.con);
				}
			},
			error:function(e){
				console.log(e)
			}
		});
	}
	
	$("#finish").click(function(){
        if (confirm("정말 완료하시겠습니까??") == true){
            document.myform.submit();
        }else{
            return false;
        }
    });
	
	function listDraw(list){
		$("#list").empty();
		var content="";
		list.forEach(function(item,index){
			content+="<tr>"
			+"<td>"
			+"<input type='text' class='"+item.pro_idx+"_workname' value='"+item.workname+"'/>"
			+"</td>"
			+"<td>"
			+"<select name='ing' class='"+item.pro_idx+"_ing'>"
		    +"<option value='완료' >완료</option>"
		    +"<option value='진행중'>진행중</option>"
		    +"<option value='준비중'>준비중</option>"
		    +"<option value='"+item.ing+"' selected='selected'>"+item.ing+"</option>"
		    +"</select>"
			+"</td>"
			+"<td>"
			+"<input type='text' id='name"+item.pro_idx+"' class='"+item.pro_idx+"_name' value='"+item.name+"'/>"
			+"</td>"
			+"<td>"
			+"<input type='date' class='"+item.pro_idx+"_daystart' value='"+item.daystart+"'/>"
			+"</td>"
			+"<td>"
			+"<input type='date' class='"+item.pro_idx+"_dayend'   value='"+item.dayend+"'/>"
			+"</td>"
			+"<td>"
			+"<input type='button' value='삭제' onclick='del("+item.pro_idx+")'>"
			+"</td>"
			+"<input type='hidden' id='end' value='"+item.dayend+"'/>"
			+"<input type='hidden' id='teamname'   value='"+item.teamname+"'/>"
			+"<input type='hidden' id='seq' value='"+item.seq+"'/>"
			+"<input type='hidden' id='pronames' value='"+item.pro_name+"'/>"
			+"</tr>"
		});
		$("#list").append(content);
	}
	function con(con){
		console.log(con);
		console.log(con.length+"길이");
		con.forEach(function(item){
			conrate = [];
			console.log(item.name+" : "+item.con);
			conrate.push(item.name);
			conrate.push(item.con);
			row.push(conrate);
			 // Draw the pie chart for the Anthony's pizza when Charts is loaded.
		      google.charts.setOnLoadCallback(drawAnthonyChart);
		});
		console.log("conrate = "+conrate);
	}
	
      // Load Charts and the corechart package.
      google.charts.load('current', {'packages':['corechart']});

      // Callback that draws the pie chart for Sarah's pizza.
      function drawSarahChart() {
		
        // Create the data table for Sarah's pizza.
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Topping');
        data.addColumn('number', 'Slices');
        data.addRows([
          ['완료', finish],
          ['미완료', unfinish],
        ]);

        // Set options for Sarah's pie chart.
        var options = {title:'프로젝트 진행률',
                       width:610,
                       height:300};

        // Instantiate and draw the chart for Sarah's pizza.
        var chart = new google.visualization.PieChart(document.getElementById('Sarah_chart_div'));
        chart.draw(data, options);
      }
	
      // Callback that draws the pie chart for Anthony's pizza.
      function drawAnthonyChart() {
    	  
    	 
        // Create the data table for Anthony's pizza.
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Topping');
        data.addColumn('number', 'Slices');
     	console.log("row"+row);
        data.addRows(row);
       
        var options = {title:'프로젝트 기여도',
                       width:610,
                       height:300};

        // Instantiate and draw the chart for Anthony's pizza.
        var chart = new google.visualization.PieChart(document.getElementById('Anthony_chart_div'));
        chart.draw(data, options);
      }
      function chartReset(){
    	  alert("차트초기화");
    	  window.location.reload();
    	  
      };
      function gopopup(){
    	  window.open("./pro_inviteForm?subject=${detail.subject}","초대하기","width=300,height=300,resizable=yes");
      }
    </script>
</html>